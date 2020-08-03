# Check if log.csv exists

if(file.exists("log.csv")) {
  
  # Read in current log and assign to `log`
  
  log <- read.csv("log.csv")
  
  # Capture the time
  
  last_run <- Sys.time()
  
  # Add a row to our one-column dataframe
  # Assign it the value held in `last_run`
  
  log[nrow(log) + 1, 1] <- last_run
  
  
} else {
  
  # This is case where "log.csv" doesn't exist
  # So, we're starting a new log
  
  # Capture the time the script runs
  
  last_run <- Sys.time()
  
  # To write to a CSV file, we need a dataframe
  
  log <- data.frame(last_run)
  
  # Write to CSV file "log.csv"
  
  write.csv(log, file = "log.csv", row.names = FALSE)
  
}






