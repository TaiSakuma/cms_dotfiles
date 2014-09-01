# Tai Sakuma <sakuma@fnal.gov>

##____________________________________________________________________________||
command="cd $*"
echo + $command >&2
$command


##____________________________________________________________  SCRAM_ARCH  __||
dir=`/bin/pwd`
while [ ! -d ${dir}/.SCRAM ] && [ "$dir" != "/" ] ; do
  dir=`dirname $dir`
done
command="export SCRAM_ARCH=$(find $dir/.SCRAM -name slc\* | xargs basename)"
echo + $command >&2
$command

##____________________________________________________________________________||
echo + eval \`scramv1 runtime -sh\` >&2
eval `scramv1 runtime -sh`
 
##____________________________________________________________________________||
command="source /afs/cern.ch/cms/ccs/wm/scripts/Crab/crab.sh"
echo + $command >&2
$command

##____________________________________________________________________________||
