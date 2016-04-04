# Tai Sakuma <sakuma@fnal.gov>

##__________________________________________________________________||
trunkdir=$*
# e.g. ~/work/tdr2/papers/SUS-15-005/trunk/

tdrdir=$trunkdir
while [ ! -x ${tdrdir}/notes/tdr ] && [ ! -x ${tdrdir}/papers/tdr ] && [ "$tdrdir" != "/" ] ; do
    tdrdir=`dirname $tdrdir`
done

if [ "$tdrdir" = "/" ]; then
   echo "not in tdr: ${trunkdir}"
   return
fi
# e.g. tdrdir=~/work/tdr2

trunkdir=${trunkdir#${tdrdir}/}
# e.g. papers/SUS-15-005/trunk/

tdrinit=${trunkdir%%/*}/tdr
# e.g. papers/tdr

##__________________________________________________________________||
command="cd $tdrdir"
echo + $command >&2
$command

##__________________________________________________________________||
command="eval `${tdrinit} runtime -sh`"
echo + $command >&2
$command

##__________________________________________________________________||
command="cd $trunkdir"
echo + $command >&2
$command

##__________________________________________________________________||
