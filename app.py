from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# --- MySQL Configuration ---
db_config = {
    'host': 'localhost',
    'user': 'root',      
    'password': 'root',
    'database': 'college'  
}

@app.route('/', methods=['GET', 'POST'])
def index():
    result = None
    error = None
    columns = []

    if request.method == 'POST':
        query = request.form['query']

        try:
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor()
            cursor.execute(query)

            if query.strip().lower().startswith('select'):
                columns = [col[0] for col in cursor.description]
                result = cursor.fetchall()
            else:
                conn.commit()
                result = [["Query executed successfully."]]

        except mysql.connector.Error as err:
            error = str(err)
        finally:
            if conn.is_connected():
                cursor.close()
                conn.close()

    return render_template("index.html", result=result, columns=columns, error=error)

if __name__ == '__main__':
    app.run(debug=True)
