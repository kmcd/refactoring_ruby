LogFile.setLog("file.log")
LogFile.log(:info, "some message")
Logfile.log(:error, "another message")

LogFacility.setOutput('file2.log')
@logger = LogFacility.makeLog('id')
@logger.informational('yet another message')
# all forms take optional exception
@logger.warning('msg', exception)
@logger.fatal('fatal message')

# 1. Write a wrapper to Ruby 1.8 Logger
# 2. Delegate LogFile#log, LogFacility.informational etc to wrapper
# 3. Optionally, replace LogFile & LogFacility objects with Ruby 1.8 logger
