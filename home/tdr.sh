# Tai Sakuma <sakuma@fnal.gov>

##____________________________________________________________________________||
trunkdir=$*
tdrdir=$trunkdir
while [ ! -x ${tdrdir}/notes/tdr ] && [ "$tdrdir" != "/" ] ; do
    tdrdir=`dirname $tdrdir`
done
trunkdir=${trunkdir#${tdrdir}/}

##____________________________________________________________________________||
command="cd $tdrdir"
echo + $command >&2
$command

##____________________________________________________________________________||
command="eval `notes/tdr runtime -sh`"
echo + $command >&2
$command

##____________________________________________________________________________||
command="cd $trunkdir"
echo + $command >&2
$command

##____________________________________________________________________________||
