
# making the individual concentration plot
adpc_ind <- adpc %>% 
  filter(SAFFL=="Y" & PARAMCD=='XAN' & ANL02FL=="Y" &!is.na(AVAL) & TRT01P=="Xanomeline Low Dose")

dev.off()
pdf(file = "/Users/laurenrackley/Desktop/R Guru/Outputs/Individual PK Linear Scale for Xanomeline.pdf")

# get unique list of SUBJID to loop over
SUBJIDs <- sort(unique(adpc_ind$SUBJID))

# loop over each subject
for (i in 1:length(SUBJIDs)) {
  cSUBJID <- SUBJIDs[i]
  
  # Subset data for the current subject
  dat <- adpc_ind[adpc_ind$SUBJID == cSUBJID, ]
  
  # Create the plot
  p <- ggplot(dat, aes(x = NFRLT, y = AVAL)) +
    geom_line() +
    geom_point() +
    ggtitle(paste("Subject ID=", cSUBJID)) +
    xlab("Time (h)") +
    ylab("Concentration (ug/ml)") +
    theme(plot.title = element_text(hjust = 0.5)) # centering the title
  print(p)
}

# Close the PDF device
dev.off()
