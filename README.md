# Task Bank

Community-contributed [Harbor](https://github.com/laude-institute/harbor) tasks for LLM training and evaluation.

## How It Works

1. **OSS repos** install the [Harbor Task Checker](https://github.com/abundant-ai/taskgen/tree/main/action) GitHub Action
2. **PRs are validated** automatically to check if they can become Harbor tasks
3. **Contributors click "Submit"** in the CI Job Summary to open a submission issue here
4. **Workflows import** the task and create a PR for review
5. **Maintainers review** and merge quality tasks

## Submitting a Task

You don't submit tasks directly here. Instead:

1. Add the Harbor Task Checker to your repo ([instructions](https://github.com/abundant-ai/taskgen/tree/main/action))
2. Open a PR that passes validation
3. Click the **"Submit to Task Bank"** button in the Job Summary
