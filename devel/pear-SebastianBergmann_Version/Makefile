# Created by: Gasol Wu <gasol.wu@gmail.com>
# $FreeBSD$

PORTNAME=	Version
PORTVERSION=	1.0.1
CATEGORIES=	devel pear
MASTER_SITES=	http://pear.phpunit.de/get/
PKGNAMEPREFIX=	pear-SebastianBergmann_

MAINTAINER=	joneum@FreeBSD.org
COMMENT=	Managing the version number of Git-hosted PHP projects

LICENSE=	BSD3CLAUSE

BUILD_DEPENDS=	${PEARDIR}/.channels/pear.phpunit.de.reg:devel/pear-channel-phpunit
RUN_DEPENDS=	${PEARDIR}/.channels/pear.phpunit.de.reg:devel/pear-channel-phpunit

BROKEN=		unfetchable, redirects to https://phpunit.de/

PEAR_CHANNEL=	phpunit
USES=	pear

.include <bsd.port.mk>
