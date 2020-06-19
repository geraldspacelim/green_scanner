import 'package:mysql1/mysql1.dart';


class DatabaseService {
  
  Future startDb() async {
    var settings = new ConnectionSettings(
      host: 'green-saver.mysql.database.azure.com', 
      port: 3306,
      user: 'greensaver@green-saver',
      password: 'P@ssw0rd!',
      db: 'database'
    );
    try {
      print('test');
      var conn = await MySqlConnection.connect(settings);
      print('connected');
      await conn.query('CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)'); 
      await conn.close();

    } catch (e) {
      print(e);
    }
  }
}