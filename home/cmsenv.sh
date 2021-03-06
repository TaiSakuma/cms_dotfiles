# Tai Sakuma <sakuma@fnal.gov>

##________________________________________________________________  CRAB 3  __||
command="source /cvmfs/cms.cern.ch/crab3/crab.sh"
echo + $command >&2
$command

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
