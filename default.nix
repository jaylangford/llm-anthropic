{ lib
, buildPythonPackage
, fetchFromGitHub
, python312Packages
}:

buildPythonPackage rec {
  pname = "llm-anthropic";
  version = "0.15.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "llm-anthropic";
    rev = version;
    hash = "sha256-8bVs3MJteOTCiw7n/4pMf+oXMhsQbCSzUFVQqm2ezcE="; # Replace with actual hash after first build attempt
  };

  propagatedBuildInputs = [
    python312Packages.llm
    python312Packages.anthropic
  ];

  doCheck = false;

  pythonImportsCheck = [ "llm_anthropic" ];

  meta = with lib; {
    description = "LLM access to models by Anthropic, including the Claude series";
    homepage = "https://github.com/simonw/llm-anthropic";
  };
}
