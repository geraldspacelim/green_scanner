//import 'package:mysql1/mysql1.dart';
import 'package:sqljocky5/auth/auth_handler.dart';
import 'package:sqljocky5/auth/character_set.dart';
import 'package:sqljocky5/auth/handshake_handler.dart';
import 'package:sqljocky5/auth/ssl_handler.dart';
import 'package:sqljocky5/common/logging.dart';
import 'package:sqljocky5/comm/buffered_socket.dart';
import 'package:sqljocky5/comm/comm.dart';
import 'package:sqljocky5/comm/common.dart';
import 'package:sqljocky5/comm/receiver.dart';
import 'package:sqljocky5/comm/sender.dart';
import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/connection/impl.dart';
import 'package:sqljocky5/connection/settings.dart';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/exceptions/client_error.dart';
import 'package:sqljocky5/exceptions/exceptions.dart';
import 'package:sqljocky5/exceptions/mysql_exception.dart';
import 'package:sqljocky5/exceptions/protocol_error.dart';
import 'package:sqljocky5/handlers/debug_handler.dart';
import 'package:sqljocky5/handlers/handler.dart';
import 'package:sqljocky5/handlers/ok_packet.dart';
import 'package:sqljocky5/handlers/parameter_packet.dart';
import 'package:sqljocky5/handlers/ping_handler.dart';
import 'package:sqljocky5/handlers/quit_handler.dart';
import 'package:sqljocky5/handlers/use_db_handler.dart';
import 'package:sqljocky5/prepared_statements/close_statement_handler.dart';
import 'package:sqljocky5/prepared_statements/execute_query_handler.dart';
import 'package:sqljocky5/prepared_statements/prepared_query.dart';
import 'package:sqljocky5/prepared_statements/prepare_handler.dart';
import 'package:sqljocky5/prepared_statements/prepare_ok_packet.dart';
import 'package:sqljocky5/query/query_stream_handler.dart';
import 'package:sqljocky5/query/result_set_header_packet.dart';
import 'package:sqljocky5/results/binary_data_packet.dart';
import 'package:sqljocky5/results/blob.dart';
import 'package:sqljocky5/results/field.dart';
import 'package:sqljocky5/results/results.dart';
import 'package:sqljocky5/results/row.dart';
import 'package:sqljocky5/results/standard_data_packet.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils/buffer.dart';

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
      await conn.execute('CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)'); 
      await conn.close();

    } catch (e) {
      print(e);
    }
  }
}