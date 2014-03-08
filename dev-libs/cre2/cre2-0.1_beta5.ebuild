# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils flag-o-matic

MY_PV="${PV%%_beta*}b${PV##*_beta}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="A C language wrapper for the RE2 regular expression library"
HOMEPAGE="https://github.com/marcomaggi/cre2/"
SRC_URI="https://github.com/marcomaggi/${PN}/archive/${MY_PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="static-libs"

RDEPEND="
	dev-libs/re2
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	eautoreconf
}

src_configure() {
	# maintainer mode because version.texi is not provided in the tarball
	econf \
		--enable-maintainer-mode \
		$(use_enable static-libs static)
}

