# Created by: Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
# $FreeBSD$

PORTNAME=	flexget
PORTVERSION=	2.10.83
PORTEPOCH=	1
CATEGORIES=	www python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Program to automate downloading from different sources

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlalchemy10>=1.0.13:databases/py-sqlalchemy10 \
		${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2 \
		${PYTHON_PKGNAMEPREFIX}rpyc>0:devel/py-RPyC \
		${PYTHON_PKGNAMEPREFIX}apscheduler>=3.2.0:devel/py-apscheduler \
		${PYTHON_PKGNAMEPREFIX}dateutil>=2.5.3:devel/py-dateutil \
		${PYTHON_PKGNAMEPREFIX}future>=0.15.2:devel/py-future \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=2.0:devel/py-jsonschema \
		${PYTHON_PKGNAMEPREFIX}path.py>=8.1.1:devel/py-path.py \
		${PYTHON_PKGNAMEPREFIX}pathlib>=1.0:devel/py-pathlib \
		${PYTHON_PKGNAMEPREFIX}pyparsing>=2.0.3:devel/py-pyparsing \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml \
		${PYTHON_PKGNAMEPREFIX}progressbar>0:misc/py-progressbar \
		${PYTHON_PKGNAMEPREFIX}guessit>=2.1.0:multimedia/py-guessit \
		${PYTHON_PKGNAMEPREFIX}pynzb>0:news/py-pynzb \
		${PYTHON_PKGNAMEPREFIX}zxcvbn-python>0:security/py-zxcvbn-python \
		${PYTHON_PKGNAMEPREFIX}plumbum>=1.2:sysutils/py-plumbum \
		${PYTHON_PKGNAMEPREFIX}colorclass>=2.2.0:textproc/py-colorclass \
		${PYTHON_PKGNAMEPREFIX}feedparser>=5.2.1:textproc/py-feedparser \
		${PYTHON_PKGNAMEPREFIX}rss2gen>0:textproc/py-rss2gen \
		${PYTHON_PKGNAMEPREFIX}terminaltables>=3.1.0:textproc/py-terminaltables \
		${PYTHON_PKGNAMEPREFIX}beautifulsoup>=4.5:www/py-beautifulsoup \
		${PYTHON_PKGNAMEPREFIX}cherrypy>=3.7.0:www/py-cherrypy \
		${PYTHON_PKGNAMEPREFIX}Flask>=0.7:www/py-flask \
		${PYTHON_PKGNAMEPREFIX}Flask-Compress>=1.2.1:www/py-flask-compress \
		${PYTHON_PKGNAMEPREFIX}Flask-Cors>=2.1.2:www/py-flask-cors \
		${PYTHON_PKGNAMEPREFIX}Flask-Login>=0.4.0:www/py-flask-login \
		${PYTHON_PKGNAMEPREFIX}Flask-RESTful>=0.3.3:www/py-flask-restful \
		${PYTHON_PKGNAMEPREFIX}flask-restplus>=0.10.1:www/py-flask-restplus \
		${PYTHON_PKGNAMEPREFIX}html5lib>=0.11:www/py-html5lib \
		${PYTHON_PKGNAMEPREFIX}requests>=2.8.0:www/py-requests
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest \
		${PYTHON_PKGNAMEPREFIX}pytest-capturelog>0:devel/py-pytest-capturelog \
		${PYTHON_PKGNAMEPREFIX}boto3>0:www/py-boto3 \
		${PYTHON_PKGNAMEPREFIX}vcrpy>0:devel/py-vcrpy

USE_GITHUB=	yes
GH_PROJECT=	Flexget

NO_ARCH=	yes
USES=		python:2.7+
USE_PYTHON=	autoplist distutils

post-extract:
# Unlock dependencies' versions
	@${MV} ${WRKSRC}/requirements.in ${WRKSRC}/requirements.txt

do-test:
	@(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest)

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3300
TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}mock>0:devel/py-mock
.endif

.include <bsd.port.post.mk>
