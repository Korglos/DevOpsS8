#!/bin/bash

# Extract current version from pom.xml
current_version=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='version']/text()" Docker/TP1/API/simple-api-student-main/pom.xml)

# Increment version
IFS='.' read -r -a version_parts <<< "$current_version"
version_parts[2]=$((version_parts[2] + 1))
new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}-SNAPSHOT"

# Update pom.xml with new version
xmlstarlet ed -L -u "//*[local-name()='project']/*[local-name()='version']" -v "$new_version" Docker/TP1/API/simple-api-student-main/pom.xml

echo "Version updated to $new_version"
echo "new_version=$new_version" >> $GITHUB_ENV