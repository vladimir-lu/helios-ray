EAPI="5"

inherit eutils

MY_PN="pycharm"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Pycharm is a Python IDE by JetBrains"
HOMEPAGE="https://www.jetbrains.com/pycharm"
SRC_URI="https://download.jetbrains.com/python/${P}.tar.gz"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	virtual/jdk
"


S="${WORKDIR}/${MY_P}"

src_install() {
    insinto /opt/${MY_P}
    doins -r *
    
    exeinto /opt/${MY_P}/bin
    doexe bin/{pycharm.sh,inspect.sh,fsnotifier64}

	doicon -s 128 bin/pycharm.png
}
