ppi <- 300

poly=1
hist=0

# graph writes by 3 user loads
# for each user load graph the different blocksizes

testname="write"
  for (users in c(1,4,16) ){
    file <- paste(testtype,testname,"users",users,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_users=users,i_title=paste(testtype,testname,"users=",users),i_hist=hist,i_poly=poly)
    dev.off()
  }
  for (bs in c("1K","8K","128K","1M") ){
    file <- paste(testtype,testname,"bs",bs,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_bs=bs,i_title=paste(testtype,testname,"bs=",bs),i_hist=hist,i_poly=poly)
    dev.off()
  }

testname="read"
  for (users in c(1,8,16,32,64) ){
    file <- paste(testtype,testname,"users",users,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_users=users,i_title=paste(testtype,testname,"users=",users),i_hist=hist,i_poly=poly)
    dev.off()
  }
  for (bs in c("256K","1M","4M") ){
    file <- paste(testtype,testname,"bs",bs,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_bs=bs,i_title=paste(testtype,testname,"bs=",bs),i_hist=hist,i_poly=poly)
    dev.off()
  }

testname="randread"
  file <- paste(testtype,testname,"bs_8K",sep="_")
  file <- paste(dir,file,".png",sep="")
  cat("file=",file,"\n")
  png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
  graphit(m, i_name=testname, i_bs="8K",i_title=paste("randread",testname,"bs=8K"),i_hist=hist,i_poly=poly)
  dev.off()

testname="randrw"
  file <- paste(testtype,testname,"bs_8K",sep="_")
  file <- paste(dir,file,".png",sep="")
  cat("file=",file,"\n")
  png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
  graphit(m, i_name=testname, i_bs="8K",i_title=paste("randread",testname,"bs=8K"),i_hist=hist,i_poly=poly)
  dev.off()

dir <- hist_dir

poly=0
hist=1

# graph writes by 3 user loads
# for each user load graph the different blocksizes

testname="write"
  for (users in c(1,4,16) ){
    file <- paste(testtype,testname,"users",users,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_users=users,i_title=paste(testtype,testname,"users=",users),i_hist=hist,i_poly=poly)
    dev.off()
  }
  for (bs in c("1K","8K","128K") ){
    file <- paste(testtype,testname,"bs",bs,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_bs=bs,i_title=paste(testtype,testname,"bs=",bs),i_hist=hist,i_poly=poly)
    dev.off()
  }

testname="read"
  for (users in c(1,8,16,32,64) ){
    file <- paste(testtype,testname,"users",users,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_users=users,i_title=paste(testtype,testname,"users=",users),i_hist=hist,i_poly=poly)
    dev.off()
  }
  for (bs in c("256K","1M","4M") ){
    file <- paste(testtype,testname,"bs",bs,sep="_")
    file <- paste(dir,file,".png",sep="")
    cat("file=",file,"\n")
    png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
    graphit(m, i_name=testname, i_bs=bs,i_title=paste(testtype,testname,"bs=",bs),i_hist=hist,i_poly=poly)
    dev.off()
  }

testname="randread"
  file <- paste(testtype,testname,"bs_8K",sep="_")
  file <- paste(dir,file,".png",sep="")
  cat("file=",file,"\n")
  png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
  graphit(m, i_name=testname, i_bs="8K",i_title=paste("randread",testname,"bs=8K"),i_hist=hist,i_poly=poly)
  dev.off()

testname="randrw"
  file <- paste(testtype,testname,"bs_8K",sep="_")
  file <- paste(dir,file,".png",sep="")
  cat("file=",file,"\n")
  png(filename=file, width=6*ppi, height=6*ppi, res=ppi )
  graphit(m, i_name=testname, i_bs="8K",i_title=paste("randread",testname,"bs=8K"),i_hist=hist,i_poly=poly)
  dev.off()

