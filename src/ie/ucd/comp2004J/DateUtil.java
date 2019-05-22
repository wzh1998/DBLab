package ie.ucd.comp2004J;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
 
/**
 * 日期格式化工具类
 * @author Shixf
 * @date 2018年5月4日
 */
public class DateUtil {
	
	/**
	 * 将Date转换成String
	 * @param date
	 * @return
	 */
	public String date2String(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdf.format(date);
		return dateStr;
	}
	
	/**
	 * 将Timestamp转换成String
	 * 用于数据库中字段类型为datetime
	 * @param timestamp
	 * @return
	 */
	public String time2String(Timestamp timestamp) {
		Date date = new Date(timestamp.getTime());
		String dateStr = date2String(date);
		return dateStr;
	}
 
}