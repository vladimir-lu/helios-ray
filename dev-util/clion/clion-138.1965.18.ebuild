EAPI="5"

inherit eutils

DESCRIPTION="Pycharm is a Python IDE by JetBrains"
HOMEPAGE="http://www.jetbrains.com/pycharm"
SRC_URI="http://download.jetbrains.com/cpp/${P}.tar.gz"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
    virtual/jdk
    >=dev-util/cmake-2.8
    >=sys-devel/gdb-7.8
"
src_install() {
    insinto /opt/${P}
    doins -r *
    
    exeinto /opt/${P}/bin
    doexe bin/{clion.sh,inspect.sh,fsnotifier64}

    doicon -s scalable bin/clion.svg
}
