#!/usr/bin/env bash
set -euo pipefail
archive="$RUNNER_TEMP/maven.zip"
curl --fail --silent --show-error --location --retry 3 https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.16/apache-maven-3.9.16-bin.zip -o "$archive"
printf '%s  %s\n' ed41650d42485cfc243fad22158caf9cbb5dc408ce7a09ddb94dd42a019de929ca43065bfa450612cf12bf78b5cafa3884b96c090de326ff590448c933454af3 "$archive" | sha512sum --check
unzip -q "$archive" -d "$RUNNER_TEMP/maven"
chmod +x "$RUNNER_TEMP/maven/apache-maven-3.9.16/bin/mvn"
echo "$RUNNER_TEMP/maven/apache-maven-3.9.16/bin" >> "$GITHUB_PATH"
