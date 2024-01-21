#!/bin/bash

cppcheck --enable=all --output-file=output.xml --xml  .
cppcheck-htmlreport --file=output.xml --report-dir=report
