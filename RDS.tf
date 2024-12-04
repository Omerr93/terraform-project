resource "aws_db_instance" "RDSdb" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
    db_name          = "project_database"

  username             = "omerdb1234"
  password             = "omer123456" 
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.main.id
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  
}

resource "aws_db_subnet_group" "main" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  tags = {
    Name = "RDS subnet group"
  }
}
