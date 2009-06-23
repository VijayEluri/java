#!/bin/sh
#
# $Id: pictures.sh,v 1.4 2005/05/16 18:57:16 klaus Exp $

# Default path for picture directory
PICS=/local/digicam/pictures

if [ "$1" != "" ]
then
	PICS=$1
fi

DELIMITER=":"
FORMS=../lib/forms_rt.jar
PICTURES=../bin
# set output directory for maked pictures
OUTDIR="/tmp/pics_out"
#DEBUG="true"

if [ `uname` = "CYGWIN_NT-5.1" ]
then
	DELIMITER=";"
	PICS=`cygpath -w $PICS`
	FORMS=`cygpath -w $FORMS`
	PICTURES=`cygpath -w $PICTURES`
fi

#echo "java -DOUTDIR=${OUTDIR} -classpath \"${FORMS}${DELIMITER}${PICTURES}\" com.danet.ulrich.pictures.MainFrame $PICS"
cmd="java -DDEBUG=${DEBUG} -DOUTDIR=${OUTDIR} -classpath ${FORMS}${DELIMITER}${PICTURES} com.danet.ulrich.pictures.MainFrame $PICS"
echo $cmd
$cmd