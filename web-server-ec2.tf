
  
  resource "aws_instance" "ec2-1" {
  ami           = "ami-0614680123427b75e" 
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id     = aws_subnet.private_1.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
             user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3 mysql

              
              echo '
              import pymysql

            
              host = "${aws_db_instance.RDSdb.endpoint}"
              user = "admin"
              password = "password123"
              database = "mydatabase"

              print("Hello Sir Mustafa from Omer")

              # Connect to RDS
              try:
                  connection = pymysql.connect(
                      host=project_database,
                      user=omerdb1234,
                      password=omer123456,
                      database=database
                  )
                  print("Successfully connected to RDS!")
              except Exception as e:
                  print(f"Failed to connect to RDS: {e}")
              finally:
                  if connection:
                      connection.close()
              ' > /home/ec2-user/app.py
              python3 /home/ec2-user/app.py
              EOF
}


resource "aws_instance" "ec2-2" {
  ami           = "ami-0614680123427b75e" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_2.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.ec2_sg.id]

  user_data =<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3 mysql

              
              echo '
              import pymysql

            
              host = "${aws_db_instance.RDSdb.endpoint}"
              user = "admin"
              password = "password123"
              database = "mydatabase"

              print("Hello Sir Mustafa from Omer")

              # Connect to RDS
              try:
                  connection = pymysql.connect(
                      host=project_database,
                      user=omerdb1234,
                      password=omer123456,
                      database=database
                  )
                  print("Successfully connected to RDS!")
              except Exception as e:
                  print(f"Failed to connect to RDS: {e}")
              finally:
                  if connection:
                      connection.close()
              ' > /home/ec2-user/app.py
              python3 /home/ec2-user/app.py
              EOF
}
