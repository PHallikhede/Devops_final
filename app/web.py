from flask import Flask, render_template, request, redirect, url_for
from database import db, Employee
from sqlalchemy import or_

app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///employees.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db.init_app(app)

with app.app_context():
    db.create_all()

@app.route("/")
def home():
    search = request.args.get("search")

    if search:
        employees = Employee.query.filter(
            or_(
                Employee.name.contains(search),
                Employee.department.contains(search)
            )
        ).all()
    else:
        employees = Employee.query.all()

    return render_template("index.html", employees=employees)

@app.route("/add", methods=["GET", "POST"])
def add_employee():
    if request.method == "POST":
        employee = Employee(
            name=request.form["name"],
            email=request.form["email"],
            department=request.form["department"],
            salary=float(request.form["salary"])
        )

        db.session.add(employee)
        db.session.commit()

        return redirect(url_for("home"))

    return render_template("add_employee.html")
@app.route("/edit/<int:id>", methods=["GET", "POST"])
def edit_employee(id):

    employee = Employee.query.get_or_404(id)

    if request.method == "POST":

        employee.name = request.form["name"]
        employee.email = request.form["email"]
        employee.department = request.form["department"]
        employee.salary = float(request.form["salary"])

        db.session.commit()

        return redirect(url_for("home"))

    return render_template("edit_employee.html", employee=employee)
@app.route("/delete/<int:id>")
def delete_employee(id):

    employee = Employee.query.get_or_404(id)

    db.session.delete(employee)

    db.session.commit()

    return redirect(url_for("home"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)