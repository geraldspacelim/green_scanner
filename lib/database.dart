<<<<<<< HEAD
import 'package:dart_mssql/dart_mssql.dart';

class DatabaseService {
  
  Future startDb() async {
    // var connection = new PostgreSQLConnection("greenserver1.postgres.database.azure.com", 5432, "greendatabase", username: "theway2co@greenserver1", password: "P@ssw0rd!");
    // await connection.open();
    // await connection.query("INSERT INTO greentable (name) VALUES ('nicole')");
    // //await connection.close();
    SqlConnection connection = SqlConnection(host:"greenscannerserver.database.windows.net", db:"mssqlgreenscanner", user:"theway2co", password:"P@ssw0rd!");
    String cmd = "INSERT INTO greentable (FirstName) VALUES ('Nicole')";
    connection.execute(cmd);
  }
}
=======
//// import 'package:postgres/postgres.dart';
//import 'package:dart_mssql/dart_mssql.dart';
//
//class DatabaseService {
//
//  Future startDb() async {
//    // var connection = new PostgreSQLConnection("greenserver1.postgres.database.azure.com", 5432, "greendatabase", username: "theway2co@greenserver1", password: "P@ssw0rd!");
//    // await connection.open();
//    // await connection.query("INSERT INTO greentable (name) VALUES ('nicole')");
//    // //await connection.close();
//    SqlConnection connection = SqlConnection(host:"greenscannerserver.database.windows.net", db:"mssqlgreenscanner", user:"theway2co", password:"P@ssw0rd!");
//    String cmd = "INSERT INTO greentable (FirstName) VALUES ('Nicole')";
//    connection.execute(cmd);
//  }
//}
>>>>>>> 675cac5e1f321eb73638cc87543e1d9e6f202ace
