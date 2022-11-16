from flask import Flask, render_template, request, flash
from flask_mysqldb import MySQL
import random, datetime

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'admin'
app.config['MYSQL_DB'] = 'x_db'
 
mysql = MySQL(app)

# set as part of the config
SECRET_KEY = 'many random bytes'

# or set directly on the app
app.secret_key = 'many random bytes'


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/parts', methods=['GET', 'POST'])
def parts():
    try:
        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM x_db.x_parts207''')
        tuple_data_x = cur.fetchall()
        cur.close()

        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM y_db.y_parts207''')
        tuple_data_y = cur.fetchall()
        cur.close()        

        #Remove duplicate parts and only show the parts with lower price (brute force solution, can be optimized)
        data_x = list(tuple_data_x)
        data_y = list(tuple_data_y)
        for row_x in data_x:
            for row_y in data_y:
                #Check if there is any duplicate part, index 0 is part number
                if row_x[0] == row_y[0]:
                    data_y.remove(row_y)

        data = data_x + data_y

        return render_template("parts.html", data=data)
    except Exception as e:
        return str(e)

@app.route('/po', methods=['GET', 'POST'])
def po():
    #SELECT list of clients
    cur = mysql.connection.cursor()
    cur.execute('''SELECT clientId207 FROM z_db.z_clients207''')
    clientIDList = cur.fetchall()
    print(clientIDList)
    cur.close()

    #SELECT list of part numbers
    cur = mysql.connection.cursor()
    cur.execute('''SELECT partNo007 FROM x_db.x_parts207''')
    partNoList_x = cur.fetchall()
    cur.close()

    cur = mysql.connection.cursor()
    cur.execute('''SELECT partNo007 FROM y_db.y_parts207''')
    partNoList_y = cur.fetchall()
    cur.close()


    if request.method == 'POST':
        compID = request.form['compID']
        clientID = request.form['clientID']
        partNo = request.form['partNo']
        qty = request.form['qty']
        status = 'Pending'
        poNo = 0
        date = datetime.date.today()

        #Check if clientID entered matches the ones in the system
        clientIDCheck = False
        for i in clientIDList:
            for j in i:
                if int(clientID) == int(j):
                    clientIDCheck = True 
        #Check if the partNo entered matches the ones in database X
        partNoCheck_x = False
        for i in partNoList_x:
            for j in i:
                if partNo == j:
                    partNoCheck_x = True

         #Check if the partNo entered matches the ones in database y
        partNoCheck_y = False
        for i in partNoList_y:
            for j in i:
                if partNo == j:
                    partNoCheck_y = True

        #Query to find qoh of part in X
        cur = mysql.connection.cursor()
        qohQuery = '''SELECT qoh207 FROM x_db.x_parts207 WHERE partNo007 = %s'''
        cur.execute(qohQuery, [partNo])
        qohList_x = cur.fetchall()
        cur.close()

        #Query to find qoh of part in Y
        cur = mysql.connection.cursor()
        qohQuery = '''SELECT qoh207 FROM x_db.x_parts207 WHERE partNo007 = %s'''
        cur.execute(qohQuery, [partNo])
        qohList_y = cur.fetchall()
        cur.close()

        #Check if qoh is less than quantity ordered or no in x database
        qohCheck_x = False
        for i in qohList_x:
            for j in i:
                if int(qty) < int(j):
                    qohCheck_x = True
        
        #Check if qoh is less than quantity ordered or no in y database
        qohCheck_y = False
        for i in qohList_y:
            for j in i:
                if int(qty) < int(j):
                    qohCheck_y = True


        #Function check if input is correct
        def checkPoValid(client_ID, qoh, partNo):
            if client_ID == True:
                if qoh == True and partNo == True:
                    return True
        
        #Set company value to send a PO to
        if checkPoValid(clientIDCheck, qohCheck_x, partNoCheck_x):
            company = "X"
        if checkPoValid(clientIDCheck, qohCheck_y, partNoCheck_y):
            company = "Y"
        
        #if both company X and Y has provides the same part with sufficent qoh
        if checkPoValid(clientIDCheck, qohCheck_x, partNoCheck_x) and checkPoValid(clientIDCheck, qohCheck_y, partNoCheck_y):
            #Query to find price of entered part in x database
            cur = mysql.connection.cursor()
            priceQuery = '''SELECT currentPrice207 FROM x_db.x_parts207 WHERE partNo007 = %s'''
            cur.execute(priceQuery, [partNo])
            priceList_x = cur.fetchall()
            cur.close()

            price_x = 0
            for i in priceList_x:
                for j in i:
                    price_x = j

            ##Query to find price of entered part in y database
            cur = mysql.connection.cursor()
            priceQuery = '''SELECT currentPrice207 FROM y_db.y_parts207 WHERE partNo007 = %s'''
            cur.execute(priceQuery, [partNo])
            priceList_y = cur.fetchall()
            cur.close()

            price_y = 0
            for i in priceList_y:
                for j in i:
                    price_y = j

            #Lower price is used        
            price = min(price_x, price_y)

            #Company value to insert in "lines" table
            if price_x <= price_y:
                company = "X"
            else:
                company = "Y"

        if checkPoValid(clientIDCheck, qohCheck_x, partNoCheck_x) or checkPoValid(clientIDCheck, qohCheck_y, partNoCheck_y):
            #Insert PO to Z database
            poQuery ="""INSERT INTO z_db.z_pos207 (clientCompID207, dataOfPO207, status207, Clients207_clientId207)
                    VALUES ( %s, %s, %s, %s)"""
            poValues = ( compID, date, status, clientID)
            cur = mysql.connection.cursor()
            cur.execute(poQuery, poValues)
            mysql.connection.commit()
            cur.close()

            #Find poNo of the line
            cur = mysql.connection.cursor()
            findPoNo = '''SELECT poNo207 FROM z_db.z_pos207 WHERE clientCompID207 = %s AND Clients207_clientId207 = %s'''
            findPoNoValues = (compID, clientID)
            cur.execute(findPoNo, findPoNoValues)
            poNoList = cur.fetchall()
            poNo = poNoList[0]


            #Insert line
            lineQuery ="""INSERT INTO z_db.z_lines207 (POs207_poNo207, Parts207_partNo007, qty207, priceOrdered207, company_207)
                    VALUES ( %s, %s, %s, %s, %s)"""
            lineValues = (poNo, partNo, qty, price, company)
            cur = mysql.connection.cursor()
            cur.execute(lineQuery, lineValues)
            mysql.connection.commit()
            cur.close()
            return render_template('successPoSubmit.html')
        else:   
            return render_template('inputError.html')


    return render_template('po.html')

@app.route('/poList', methods=['GET', 'POST'])
def poList():
    globalData = ''
    if request.method == "POST":
        clientID = request.form.get('clientID')
        cur = mysql.connection.cursor()
        query = """SELECT * FROM z_db.z_pos207 WHERE Clients207_clientId207 = %s"""
        cur.execute(query, [clientID])
        data = cur.fetchall()
        globalData = data
        cur.close()
        
    return render_template('poList.html', data=globalData) 

@app.route('/line', methods=['GET', 'POST'])
def line():
    globalData = ''
    if request.method == "POST":
        poNo = request.form.get('poNum')
        cur = mysql.connection.cursor()
        query = """SELECT * FROM z_db.z_lines207 WHERE POs207_poNo207 = %s"""
        cur.execute(query, [poNo])
        data = cur.fetchall()
        globalData = data
        cur.close()

    return render_template('line.html', data=globalData)

if __name__ == "__main__":
    app.run(debug=True)