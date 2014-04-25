package util;

//import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class MessageLog {
	Logger logger = null;
	FileHandler fh = null;

	public MessageLog() {
		try {
			logger = Logger.getLogger("MyLog");
			fh = new FileHandler("./MyLogFile.log", true);
			logger.addHandler(fh);
			logger.setLevel(Level.ALL);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void log(String messages) {

		try {

			logger.log(Level.INFO, messages);

		} catch (SecurityException e) {
			e.printStackTrace();

		}

	}
}
