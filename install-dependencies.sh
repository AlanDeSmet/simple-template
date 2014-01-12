#! /bin/sh

DST_DIR=lib

DIR_TEXT_TEMPLATE=Text-Template-1.46
TGZ_TEXT_TEMPLATE=$DIR_TEXT_TEMPLATE.tar.gz
URL_TEXT_TEMPLATE=http://search.cpan.org/CPAN/authors/id/M/MJ/MJD/$TGZ_TEXT_TEMPLATE

WGET=wget
TAR=tar
PERL=perl
MAKE=make

DIR_SCRATCH=scratch
START=`pwd`

mkdir $DIR_SCRATCH || exit 1

$WGET $URL_TEXT_TEMPLATE -O $DIR_SCRATCH/$TGZ_TEXT_TEMPLATE || exit 2

$TAR -x -z -C $DIR_SCRATCH -f $DIR_SCRATCH/$TGZ_TEXT_TEMPLATE || exit 3

cd $DIR_SCRATCH/$DIR_TEXT_TEMPLATE || exit 4

$PERL Makefile.PL PREFIX=$START/$DIR_SCRATCH/install || exit 5

$MAKE install || exit 6

cd $START || exit 8

mkdir $DST_DIR || exit 7

mv $DIR_SCRATCH/install/share/perl/*/* $DST_DIR || exit 8

echo "You can now remove the scratch directory."
