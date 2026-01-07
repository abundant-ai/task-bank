#!/bin/bash

cd /app/src

# Set environment variables for tests
export CI=true

# Copy HEAD test files from /tests (overwrites BASE state)
mkdir -p "packages/zod/src/v3/tests"
cp "/tests/packages/zod/src/v3/tests/string.test.ts" "packages/zod/src/v3/tests/string.test.ts"
mkdir -p "packages/zod/src/v4/classic/tests"
cp "/tests/packages/zod/src/v4/classic/tests/string.test.ts" "packages/zod/src/v4/classic/tests/string.test.ts"

# Run only the specific test files using Vitest
npx vitest run packages/zod/src/v3/tests/string.test.ts packages/zod/src/v4/classic/tests/string.test.ts --coverage.enabled=false
test_status=$?

if [ $test_status -eq 0 ]; then
  echo 1 > /logs/verifier/reward.txt
else
  echo 0 > /logs/verifier/reward.txt
fi
exit "$test_status"
