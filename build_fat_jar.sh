#/bin/bash

function msg() {
printf "
==========================================================
`date`: \t$1
==========================================================
"
}

set -e

if [ -e build ];
then
    msg "CLEAN"
    ant clean
fi

mkdir -p fat
rm -f fat/GenomeAnalysisTK.jar

msg "BUILD"
ant -Dcompile.scala=false -Dinclude.external=true gatk.jar

msg "PATCH"
pushd build/java/classes/; find . -iname '*.class' | xargs jar -uvf /group/bioi1/simons/gatk/dist/GenomeAnalysisTK.jar ; popd

msg "FATTEN"
cd dist/
mkdir -p tmp
cd tmp
for i in ../*.jar; do echo $i; jar -xf $i; done
jar -xvf ../GenomeAnalysisTK.jar 
zip -r ../../fat/GenomeAnalysisTK.jar *

msg "DONE"
