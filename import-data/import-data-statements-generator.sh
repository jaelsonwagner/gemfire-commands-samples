#!/bin/bash
SOURCE_DIR='./exported_regions/'
DUMP_PREFIX='dump-'
DUMP_EXTENSION='.gfsh'
OUTPUT_DIR='output'
SOURCE_FILE=regions.txt

if [ ! -d "$OUTPUT_DIR" ]; then
  $(mkdir $OUTPUT_DIR);
fi

OUTPUT_FILE="$OUTPUT_DIR/gemfire_import_data_statements.txt"

echo "gfsh -e 'connect localhost[9980]'" > $OUTPUT_FILE

while read REGION_NAME
do           
	echo "gfsh -e 'import data --region=/$REGION --file=$SOURCE_DIR$DUMP_PREFIX$REGION_NAME$DUMP_EXTENSION'" >> $OUTPUT_FILE
done < $SOURCE_FILE
