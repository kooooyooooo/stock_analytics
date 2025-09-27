PYTHON?=python
PIP?=pip
VENV=.venv

.PHONY: venv install install-dev fmt lint type test cov clean nbstrip

venv:
	$(PYTHON) -m venv $(VENV)
	. $(VENV)/bin/activate && $(PIP) install -U pip

install:
	. $(VENV)/bin/activate && $(PIP) install -r requirements.txt

install-dev: venv
	. $(VENV)/bin/activate && $(PIP) install -r requirements.txt -r requirements-dev.txt

fmt:
	. $(VENV)/bin/activate && black . && isort .

lint:
	. $(VENV)/bin/activate && ruff check . && flake8

type:
	. $(VENV)/bin/activate && mypy src

test:
	. $(VENV)/bin/activate && pytest -q --maxfail=1 --disable-warnings

cov:
	. $(VENV)/bin/activate && pytest --cov=src --cov-report=term-missing

nbstrip:
	. $(VENV)/bin/activate && nbstripout --install --attributes .gitattributes && find notebooks -name '*.ipynb' -print0 | xargs -0 -I {} nbstripout {}

clean:
	rm -rf .pytest_cache .mypy_cache htmlcov .ruff_cache
	find . -type d -name '__pycache__' -exec rm -rf {} +

