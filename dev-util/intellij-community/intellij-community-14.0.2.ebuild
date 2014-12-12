EAPI="5"

inherit eutils

MY_PN="ideaIC"
MY_P="${MY_PN}-${PV}"

BUILD_NUM="139.659.2"
DIRNAME="idea-IC-${BUILD_NUM}"

DESCRIPTION="IntelliJ IDEA is a Java IDE by JetBrains"
HOMEPAGE="https://www.jetbrains.com/idea"
SRC_URI="https://download.jetbrains.com/idea/${MY_P}.tar.gz"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	virtual/jdk

"


S="${WORKDIR}/${DIRNAME}"

src_install() {
    insinto /opt/${MY_P}
    doins -r *
    
    exeinto /opt/${MY_P}/bin
    doexe bin/{idea.sh,inspect.sh,fsnotifier64,libbreakgen64.so}
	
	exeinto /opt/${MY_P}/lib/libpty/linux/x86_64
	doexe lib/libpty/linux/x86_64/libpty.so

	doicon -s 128 bin/idea.png
}
