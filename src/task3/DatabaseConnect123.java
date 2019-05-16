// DatabaseConnect123.java
package task3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 这是一个通过Microsoft JDBC for SQL Server连接数据库的封装类
 * 
 * @author Legend_1949
 * @date 2019/04/17
 */
public class DatabaseConnect123 {
    /**
     * 数据库链接
     */
    private String connectURL = null;
    /**
     * 数据库连接对象
     */
    private Connection connection = null;
    /**
     * 结果集对象
     */
    private ResultSet resultSet = null;

    /**
     * 构造函数，预置连接配置文件
     */
    public DatabaseConnect123() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connectURL = "jdbc:sqlserver://localhost:1433;";
            connectURL += "database=emp123;";
            connectURL += "user=sa;";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 执行精确查询
     * 
     * @param _SQL
     *            需要执行的SQL语句
     * @return 查询结果集
     */
    public ResultSet executeSelect(String _SQL) {
        try {
            // 登陆数据库
            connection = DriverManager.getConnection(connectURL);
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(_SQL);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    /**
     * 执行模糊查询
     * 
     * @param _SQL
     *            需要执行的SQL语句
     * @return 查询结果集
     */
    public ResultSet executeInsensitiveSelect(String _SQL) {
        try {
            connection = DriverManager.getConnection(connectURL);
            Statement statement =
                connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery(_SQL);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    /**
     * 执行数据更新
     * 
     * @param _SQL
     *            需要执行的SQL语句
     * @return 数据更新影响的行数
     */
    public int executeModify(String _SQL) {
        int result = 0;
        try {
            connection = DriverManager.getConnection(connectURL);
            Statement statement = connection.createStatement();
            result = statement.executeUpdate(_SQL);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
