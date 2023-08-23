# Custom python/ bash pre-commit-hooks for Git repositories
Pre-commit hooks are a powerful way to automate checks and actions before each commit in your Git repository. This README guides you through the process of setting up and using custom pre-commit hooks using the `pre-commit` framework.

## Prerequisites
Before you start, ensure you have the required dependencies installed:
```bash
pip install -r requirements.txt
```

## Usage 

1. Create a file named `.pre-commit-config.yaml` in the repo where you want the pre-commit hooks to run:
```yaml
repos:
-   repo: https://github.com/ph1zix/pre-commit-hooks
    rev: v1.0.0
    hooks:
        -   id: pyflakes
        -   id: double-quote-string-fixer
```
Replace the `rev` value with the specific commit hash you want to use. You can find the `id` values for the hooks in the `.pre-commit-hooks.yaml` file.

2. Install the pre-commit hook into your local `.git/hooks/` directory:
```bash
pre-commit install
```

3. Test if the hooks work by making a commit:
```
git commit -a
```

## Contribution

Expand this repository by adding your own bash or python scripts into the `pre_commit_hooks` directory and update the `.pre-commit-hooks.yaml` file to tell `pre-commit` about it. You can choose at which git stage the hooks should run. You may need to extend `setup.cfg` as well for the hook's entry point. If you make changes and push them to the master branch, get the current commit hash using:
```bash
git rev-parse HEAD
```
Replace the `rev` value in your `.pre-commit.config.yaml` file with the hash and don't forget to install the hook again. 

## Links

Official website: https://pre-commit.com/
Local development of a hook: https://pre-commit.com/#developing-hooks-interactively
Some out of the box hooks: https://github.com/pre-commit/pre-commit-hooks/tree/main/pre_commit_hooks

Feel free to improve this README.md to help others better understand the setup process.