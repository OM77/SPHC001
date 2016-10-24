options(stringsAsFactors=FALSE)

g.sp <- data.frame()
g.sp <- rbind(g.sp, data.frame(code="FE", name="Forward Extra"))
g.sp <- rbind(g.sp, data.frame(code="RFE", name="Ratio Forward Extra"))
g.sp <- rbind(g.sp, data.frame(code="PSFE", name="Put Spread Forward Extra"))
g.sp <- rbind(g.sp, data.frame(code="CSFE", name="Call Spread Forward Extra"))
g.sp <- rbind(g.sp, data.frame(code="PSRFE", name="Put Spread Ratio Forward Extra"))
g.sp <- rbind(g.sp, data.frame(code="CSRFE", name="Call Spread Ratio Forward Extra"))

g.ccy <- data.frame()
g.ccy <- rbind(g.ccy, data.frame(base="GBP", quote="USD", bname="£", qname="$", trade=TRUE, digits=5, s.digits=5, b.digits=4))
g.ccy <- rbind(g.ccy, data.frame(base="GBP", quote="EUR", bname="£", qname="€", trade=FALSE, digits=5, s.digits=5, b.digits=4))
g.ccy <- rbind(g.ccy, data.frame(base="EUR", quote="USD", bname="€", qname="$", trade=TRUE, digits=5, s.digits=5, b.digits=4))
g.ccy <- rbind(g.ccy, data.frame(base="EUR", quote="GBP", bname="€", qname="£", trade=TRUE, digits=5, s.digits=5, b.digits=4))
g.ccy$name <- paste(g.ccy$base, g.ccy$quote, sep="/")
g.ccy$sname <- paste(g.ccy$base, g.ccy$quote, sep="")
               

