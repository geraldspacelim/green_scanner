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
      var conn = await MySqlConnection.connect(settings);
      await conn.query("SELECT * FROM greentable"); 
      await conn.close();
    } catch (e) {
      print(e);
    }
  }
}