{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "wlr-layout-ui";
  version = "1.6.15";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fdev31";
    repo = "wlr-layout-ui";
    tag = version;
    hash = "sha256-9dGwqh4uq7Hc8OjD8mxAnwesoOSCXHjYIWBPylznxu4=";
  };

  nativeBuildInputs = [
    python3.pkgs.poetry-core
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pyglet
    tomli
    tomli-w
  ];

  postInstall = ''
    install -Dm644 files/wlr-layout-ui.desktop $out/share/applications/wlr-layout-ui.desktop
  '';

  meta = with lib; {
    description = "Simple GUI to setup the screens layout on wlroots based systems";
    homepage = "https://github.com/fdev31/wlr-layout-ui/";
    maintainers = with maintainers; [ bnlrnz ];
    license = licenses.mit;
    mainProgram = "wlrlui";
    platforms = subtractLists platforms.darwin platforms.unix;
  };
}
