Name: [@]pkg[@]
Summary: [@]pkgdescription[@]
Version: [@]pkgversion[@]
License: [@]pkglicense[@]
URL: [@]pkghomepage[@]
Source0: %{name}-%{version}.tar.bz2
Release: 1%{?dist}
Group: Applications/Text

%if 0%{?ideal}
Requires: sed
Requires: bash
Requires: gawk
Requires: perl
Requires: coreutils
Requires: util-linux
Requires: curl
Requires: wget
Requires: lynx
Requires: libxml2
Requires: xmlstarlet
Requires: aspell
Requires: hunspell
Requires: mythes
Requires: beep
Requires: espeak
Requires: festival
Requires: vorbis-tools
Requires: ImageMagick
Requires: fortune-mod
Requires: figlet
Requires: cowsay
Requires: boxes
Requires: mlocate

BuildRequires: sed
BuildRequires: bash
BuildRequires: gawk
BuildRequires: perl
BuildRequires: coreutils
BuildRequires: util-linux
BuildRequires: curl
BuildRequires: wget
BuildRequires: lynx
BuildRequires: libxml2
BuildRequires: xmlstarlet
BuildRequires: aspell
BuildRequires: hunspell-devel
BuildRequires: beep
BuildRequires: espeak
BuildRequires: festival
BuildRequires: vorbis-tools
BuildRequires: ImageMagick
BuildRequires: fortune-mod
BuildRequires: figlet
BuildRequires: cowsay
BuildRequires: boxes
BuildRequires: mlocate
%endif

Requires: sed
Requires: bash
Requires: gawk
Requires: perl
Requires: coreutils
Requires: util-linux
Requires: curl
Requires: wget
Requires: lynx
Requires: libxml2
Requires: aspell
Requires: hunspell
Requires: mythes
Requires: festival
Requires: vorbis-tools
Requires: ImageMagick
Requires: mlocate

BuildRequires: gcc-c++
BuildRequires: sed
BuildRequires: bash
BuildRequires: gawk
BuildRequires: perl
BuildRequires: coreutils
BuildRequires: util-linux
BuildRequires: curl
BuildRequires: wget
BuildRequires: lynx
BuildRequires: libxml2
BuildRequires: aspell
%if ! 0%{?rhel_version} == 505
BuildRequires: hunspell-devel
%endif
BuildRequires: festival
BuildRequires: vorbis-tools
BuildRequires: ImageMagick
BuildRequires: mlocate

%description
[@]pkgexplanation[@]

%prep
%setup -q

%build
%configure --docdir %{_docdir}/%{name}-%{version}
make %{?_smp_mflags}

%install
make install DESTDIR="$RPM_BUILD_ROOT"

%files
%{_bindir}/*
%{_datadir}/%{name}
%{_docdir}/%{name}-%{version}
%{_mandir}/man1/*.1.*

%changelog
* [@]pkglogstamp[@] [@]pkgauthor[@] <[@]pkgemail[@]> - [@]pkgversion[@]-1
- In Sync With Project ChangeLog 
