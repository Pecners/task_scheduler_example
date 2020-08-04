## NB: This script uses assumes files are in
## Current working directory -- so, you must
## set the "Start in (optional)" field in
## Task Scheduler or use absolute file paths.

# Check if log.rds exists

if(file.exists("log.rds")) {
  
  # Read in current log and assign to `log`
  
  log <- readRDS("log.rds")
  
  # Capture the time
  
  last_run <- Sys.time()
  
  # Add a row to our one-column dataframe
  # Assign it the value held in `last_run`
  
  log[nrow(log) + 1, 1] <- last_run
  
  saveRDS(log, file = "log.rds")
  
  
} else {
  
  # This is case where "log.csv" doesn't exist
  # So, we're starting a new log
  
  # Capture the time the script runs
  
  last_run <- Sys.time()
  
  # To write to a CSV file, we need a dataframe
  
  log <- data.frame(last_run)
  
  # Write to CSV file "log.csv"
  
  saveRDS(log, file =  "log.rds")
  
}
