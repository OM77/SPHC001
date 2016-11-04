options(stringsAsFactors=FALSE)

g.sp <- data.frame()
g.sp <- rbind(g.sp, data.frame(code="OF", name="Outright Forward", ratio=FALSE, barrier=FALSE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="PF", name="Participating Forward", ratio=FALSE, barrier=FALSE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="FE", name="Forward Extra", ratio=FALSE, barrier=TRUE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="KOF", name="Knock-Out Forward", ratio=FALSE, barrier=TRUE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="SFE", name="Spread Forward Extra", ratio=FALSE, barrier=TRUE, reduction=TRUE))
g.sp <- rbind(g.sp, data.frame(code="RF", name="Ratio Forward", ratio=TRUE, barrier=FALSE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="RFE", name="Ratio Forward Extra", ratio=TRUE, barrier=TRUE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="RSF", name="Ratio Spread Forward", ratio=TRUE, barrier=FALSE, reduction=TRUE))
g.sp <- rbind(g.sp, data.frame(code="RKOF", name="Ratio Knock-Out Forward", ratio=TRUE, barrier=TRUE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="RKIKOF", name="Ratio KIKO Forward", ratio=TRUE, barrier=TRUE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="RAF", name="Ratio Accelerator Forward", ratio=TRUE, barrier=TRUE, reduction=FALSE))
g.sp <- rbind(g.sp, data.frame(code="RSC", name="Ratio Spread Collar", ratio=TRUE, barrier=FALSE, reduction=TRUE))
g.sp <- rbind(g.sp, data.frame(code="RSFE", name="Ratio Spread Forward Extra", ratio=TRUE, barrier=TRUE, reduction=TRUE))



g.ccy <- data.frame()
g.ccy <- rbind(g.ccy, data.frame(base="GBP", quote="USD", bname="£", qname="$", trade=TRUE, slip=0.0010, digits=5, s.digits=5, b.digits=4, low=0.75, high=2.50))
g.ccy <- rbind(g.ccy, data.frame(base="GBP", quote="EUR", bname="£", qname="€", trade=FALSE, slip=0.0010, digits=5, s.digits=5, b.digits=4, low=0.75, high=2.00))
g.ccy <- rbind(g.ccy, data.frame(base="EUR", quote="USD", bname="€", qname="$", trade=TRUE, slip=0.0008, digits=5, s.digits=5, b.digits=4, low=0.60, high=1.60))
g.ccy <- rbind(g.ccy, data.frame(base="EUR", quote="GBP", bname="€", qname="£", trade=TRUE, slip=0.0007, digits=5, s.digits=5, b.digits=4, low=0.60, high=1.60))
g.ccy$name <- paste(g.ccy$base, g.ccy$quote, sep="/")
g.ccy$sname <- paste(g.ccy$base, g.ccy$quote, sep="")
               

