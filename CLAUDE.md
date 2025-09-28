# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Language Policy
- **Thinking / Reasoning**: English
- **Conversation with user**: Japanese
- **Deliverables (code, documents, templates, configs, etc.)**: Japanese

This ensures clarity in internal reasoning while keeping communication natural for the user, and producing standardized, professional outputs.

## Environment Setup

**Python Version**: 3.10.13 (specified in `.python-version`)

**Virtual Environment Setup**:
```bash
make venv          # Create virtual environment
make install-dev   # Install all dependencies (production + development)
make install       # Install production dependencies only
```

**Docker Development**:
```bash
docker-compose up  # Start development environment with all dependencies
```

## Development Commands

**Code Quality**:
```bash
make fmt      # Format code with black and isort
make lint     # Check code with ruff and flake8
make type     # Type checking with mypy
```

**Testing**:
```bash
make test     # Run tests with pytest (quick, fail-fast)
make cov      # Run tests with coverage report
```

**Notebook Management**:
```bash
make nbstrip  # Strip notebook outputs and install git hooks
```

**Cleanup**:
```bash
make clean    # Remove cache directories and temporary files
```

## Project Architecture

**Source Structure**:
- `src/` - Main Python package
  - `src/data/` - Data loading and preprocessing utilities
- `config/default.yaml` - Configuration file with model parameters, data paths, and experiment settings
- `requirements.txt` - Production dependencies (ML/data science stack)
- `requirements-dev.txt` - Development tools

**Configuration System**:
The project uses YAML-based configuration in `config/default.yaml` for:
- Random seed and experiment naming
- Data file paths and train/validation splits
- Model selection and hyperparameters

**Key Dependencies**:
- **Data & ML**: pandas, numpy, scikit-learn, lightgbm, xgboost
- **Visualization**: matplotlib, seaborn, plotly
- **ML Ops**: mlflow, optuna
- **Development**: black, ruff, pytest, mypy, jupyter

## Data Structure
Based on `.gitignore` and config, the project expects:
- `data/raw/` - Raw data files (gitignored)
- `models/` - Saved model files (gitignored)
- `notebooks/` - Jupyter notebooks (outputs stripped)

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.  
