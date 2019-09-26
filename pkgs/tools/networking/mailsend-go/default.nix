{ buildGoModule
, lib
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "mailsend-go";
  version = "1.0.10";
  rev = "v${version}";

  src = fetchFromGitHub {
    inherit rev;

    owner = "muquit";
    repo = "mailsend-go";
    sha256 = "1x47cw3qjgb7n7i4rncnpjmz0sbj3sw54n2m5jyp11hlp35hvjni";
  };

  vendorSha256 = "065vb5mpmfk91nv7qx10n50hbz2jkclkz3bpb39nmdfhrdw819k3";

  subPackages = [ "." ];

  meta = with lib; {
    description = "Command line tool to send mail via SMTP protocol.";
    homepage = https://github.com/muquit/mailsend-go;
    license = licenses.bsd3;
    maintainers = with maintainers; [ szczyp ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
