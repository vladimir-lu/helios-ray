EAPI="5"

inherit versionator

MY_PN="sublime_text"
MY_PBUILD="$(get_version_component_range 3)"
MY_PV="$(get_major_version)_build_${MY_PBUILD:3}"
MY_P="${MY_PN}_${MY_PV}"

DESCRIPTION="Sublime Text is a sophisticated text editor for code, markup and prose"
HOMEPAGE="http://www.sublimetext.com/"
SRC_URI="http://c758482.r82.cf2.rackcdn.com/${MY_P}_x64.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_PN}_$(get_major_version)"

src_install() {
	insinto /opt/sublime_text
	doins -r *
    
	exeinto /opt/sublime_text
	doexe sublime_text crash_reporter plugin_host

	dodir /usr/bin
	dosym /opt/sublime_text/sublime_text /usr/bin/sublime_text

	domenu sublime_text.desktop
	doicon -s 16 Icon/16x16/sublime-text.png
	doicon -s 32 Icon/32x32/sublime-text.png
	doicon -s 48 Icon/48x48/sublime-text.png
	doicon -s 128 Icon/128x128/sublime-text.png
	doicon -s 256 Icon/256x256/sublime-text.png
}
