#!/bin/bash

Xvfb $DISPLAY &
/opt/pathway-tools/pathway-tools -python-local-only-non-strict