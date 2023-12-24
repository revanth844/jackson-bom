#!/bin/bash

# # Get the latest Git tag
# latest_tag=$(git describe --tags --abbrev=0)
# 
# # Replace the placeholder in README.md with the latest Git tag
# sed -i "s|<!-- LATEST_GIT_TAG -->|$latest_tag|" README.md
# sed -i "s|2.14.2|$latest_tag|" README.md
# sed -i "s|$currentVersion|$latest_tag|" README.md

groupId=`cat pom.xml | grep "<groupId>" | head -2 | tail -1 |  grep -o -P '(?<=<groupId>).*(?=</groupId>)'`
echo "groupId: $groupId"
buildNum=`cat pom.xml | grep "<version>" | head -2 | tail -1 |  grep -o -P '(?<=<version>).*(?=</version>)'`
echo "buildNum: $buildNum"
buildName=`cat pom.xml | grep "<artifactId>" | head -2 | tail -1 |  grep -o -P '(?<=<artifactId>).*(?=</artifactId>)'`
echo "buildName: $buildName"
buildArtifact=$buildName-$buildNum.jar
echo "buildArtifact: $buildArtifact"

# sed -i "s|$currentVersion|$groupId|" README.md

currentVersion=`cat README.md | grep "<version>" | head -1`
echo "currentVersion: $currentVersion"
newVersion="    <version>$buildNum</version>"
echo "newVersion: $newVersion"
sed -i "s|$currentVersion|$newVersion|" README.md

currentVersion=`cat README.md | grep "<version>" | head -2 | tail -1`
echo "currentVersion: $currentVersion"
newVersion="      <version>$buildNum</version>"
echo "newVersion: $newVersion"
sed -i "s|$currentVersion|$newVersion|" README.md
