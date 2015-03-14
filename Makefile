# Created by: Neal Nelson <ports@nicandneal.net>
# $FreeBSD: head/lang/nimrod/Makefile 351413 2014-04-16 19:12:50Z tijl $

PORTNAME=	nim
PORTVERSION=	0.10.2
PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	http://nim-lang.org/download/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@nicandneal.net
COMMENT=	The Nimrod programming language

LICENSE=	MIT

OPTIONS_DEFINE=	DOCS

MAKE_JOBS_UNSAFE=	yes
USES=		compiler zip
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>

post-patch:
.if ${COMPILER_TYPE} == clang
	@${REINPLACE_CMD} -e '/cc =/s/gcc/clang/' ${WRKSRC}/config/nim.cfg
.endif

do-build:
	cd ${WRKSRC} && ${SETENV} CC="${CC}" LINKER="${CC}" \
		COMP_FLAGS="${CPPFLAGS} ${CFLAGS}" LINK_FLAGS="${LDFLAGS}" \
		${SH} build.sh
	cd ${WRKSRC} && bin/nim c --parallelBuild=${MAKE_JOBS_NUMBER} koch
	cd ${WRKSRC} && ./koch boot --parallelBuild=${MAKE_JOBS_NUMBER} \
		-d:release

do-install:
	cd ${WRKSRC} && ${SH} install.sh ${STAGEDIR}${PREFIX}

.include <bsd.port.post.mk>
