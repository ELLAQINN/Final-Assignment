<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Final_Assignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
using System;
using System.Data.Entity;
using StudentConsoleApp.Data;
using StudentConsoleApp.Models;

namespace StudentConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Database.SetInitializer(new StudentInitializer());

            using (var context = new StudentContext())
            {
                // Ensure database is created and seeded
                context.Database.Initialize(force: true);

                // Add a new student
                var student = new Student
                {
                    FirstName = "Jane",
                    LastName = "Smith",
                    DateOfBirth = new DateTime(1999, 5, 20)
                };

                context.Students.Add(student);
                context.SaveChanges();

                Console.WriteLine("Student added successfully!");

                // Display all students
                var students = context.Students;
                foreach (var s in students)
                {
                    Console.WriteLine($"ID: {s.StudentId}, Name: {s.FirstName} {s.LastName}, DOB: {s.DateOfBirth.ToShortDateString()}");
                }
            }

            Console.ReadLine();
        }
    }
}