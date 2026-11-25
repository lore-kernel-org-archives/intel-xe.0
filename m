Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5486606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eA1UKnOu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kFARBiaN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A954E10E1C3;
	Wed, 25 Nov 2026 06:11:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BD610E1C3;
 Wed, 25 Nov 2026 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795587076; x=1827123076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ehJ+E6GywTMVDQndTwx+NZlcAda1QqhtygaY/nR+nGQ=;
 b=eA1UKnOuRn6QocHMNNDlvCYvd07wB7+wF7uQ5GCPQ4PBFscCUn0LVuay
 5BF+QWKODZcxmUpfeGoi+xuYYPO0BK4h5GB64tvL0U6jBv9gIhueJ4ycL
 /y91vXXFNgp7Ic7hxroBxxpDYx9VgAyq4Jk5UPiv53TzaSslKb34Kekmk
 1pTrEc5zMHHsCNk5t20XheXOXetFzIu3O+ChF9S9+k3fDbxd/uJ+tqpkj
 W7NYRzcDRLRjHRygX+TaO5YtCJPQQje+v2pyaIWtBZNQ7AnPuIaKhnhJ2
 1xHi0y9RAgGVHvZ3QFjGK4SRX/ttsfSQyIVsdIX9Ae0sUFFMqu7WMjmzK Q==;
X-CSE-ConnectionGUID: zI5cPAvmS2WUUe0TLh7ziQ==
X-CSE-MsgGUID: DjyBzABqTIi8khsePG9sQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4508969"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4508969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:09:47 -0800
X-CSE-ConnectionGUID: ctPTTB/DTlq4us6HqyM2Ew==
X-CSE-MsgGUID: HssUBy8ZTAimH97tqAFScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11655733"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:09:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:09:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:09:46 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:09:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB89pCDjtVxkmsWSS4okaA0HpY6pxLBNFdrSTYevLZsrRp7jPnJCUi1LYtAEqVjAby/ZhqCZHPD4fsXa/rdmQ2IrsecoJIkM7h99rmtkNCbq4pfUopFHk3jSOa4UuGqgAzP5OmQgQnG2xpA7HW2RhBxLnPEeWU5hGUB2Wlwgu0EXk+LiZctu3Kz5eoNPYZkAvTY6uWdzu62Ox1ILLiCShAS9/LIVANyPAd5bXpvlPsQv/7OBY8Pon5KxRHWGudpgVr5BquD/6nPWO0T6GmPe8r/EBEw9p8FMKoW1AU6gG0oYL41Zo+JpuxJVn7VOo2TCNP6XBExAWiDEcmDUbPXpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzqM2Xl3NPZIBG449wyi4B4dJ/n0sUGSzqVItzsu0uM=;
 b=pG9XwUpx7F4mxrxpeHYWDOS9UXsD0V+5gsd0EXHjFfPchW8MyEebo+Jl/ll5iwj4LNBeS+fL1+zyj3bEg7vBC37Dszpu36l4bHn+u8tbtVdBVcxvpmOPdnHWvyWQtcaG4NnLFZ+TkyxEAU2qGPQFdD14LzaTzn7wxeLZnCnYptb8R6HNBzcEdAabBcY7jOpiN17Knb8+FYzShPE990QJ66zUMuf90ZtJexSRSuBZ97mpJPhzFtEwAOE+1dnnJZ/zuWYhvdqZzIoajG9oJsRxQAJGg3pUgMRjySAGenvaVlsby8fCs8/ad+sYrBwFpn92PnaUVQvcLlGz+ddP63sa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzqM2Xl3NPZIBG449wyi4B4dJ/n0sUGSzqVItzsu0uM=;
 b=kFARBiaNTFNZQl0KDClMoL9xEE/zdMr0YThhyxoGl5zCEpW9oyLz5k+PgncN+qya/6/GekXP/s5rawZJusH3kR9Sqx4VWDINaGslHnR3+ds6OAdjwIUuCW4JDMXBcNohU5dO5w6eTMWd3SYPFYDxPI0JrygH+7tLKo/ZX38Jc18=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH0PR11MB5281.namprd11.prod.outlook.com
 (2603:10b6:610:bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 06:09:42 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:09:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH] drm/i915/backlight: move struct intel_panel_bl_funcs to
 intel_backlight.h
Thread-Topic: [PATCH] drm/i915/backlight: move struct intel_panel_bl_funcs to
 intel_backlight.h
Thread-Index: AQHdfDTZo1IWRgEYnUaxl5cpkF43nbc+TpLQ
Date: Wed, 25 Nov 2026 06:09:42 +0000
Message-ID: <DS4PPFE901A304FB3162BEFE91E07A9D347E3432@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261124154955.1573704-1-jani.nikula@intel.com>
In-Reply-To: <20261124154955.1573704-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH0PR11MB5281:EE_
x-ms-office365-filtering-correlation-id: 91e5694c-2182-4f95-2a20-08df4abab207
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|261022075727099003|261021135927099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: bs82iSR/0ZSgoRfSfNQxPh54GiVadJIFj/CYow5+7YrN+IVcIgFeTGTL4c1smIecmUGrMvzJExy+eU3jfIjDdJarPr5KxMkbnGlzU0Du1xxNiR6jRX0pS13lUxUtfDGW3t9RxjntPXr6xnuz+Axki7QrC8MC4H4B8aDZ/pDCuaQqwO7KXAasuMbUAvBIP2PbZnx8f5fiGem8LGIIvT3nokVmN+7wgNw+yOtpnqYZU6ayHgQ193zcrH73AjJQPZFBowUYh8aT7DOY7qxQOcbjAgQr53cFY2ahhO3Yxg1x9L5bOALWqc3PFgBEwZDye7lI82tyIXWsGL71+gEdUwkgm7aAvEwVl5vmyO/pKkIzU0p1QRpGr143q7tOQgYETboaDyp+hh2uHflcB/rgiMP8fMVxA6KCb3P+RPgfTZny1G0mN2HitR5xUCydFjyIT1MVIhDbuEfji5qFYt7plLF3az4gD/Y22H5TzgSuqLuHYSvsAaTcm9Lr0/1zJiZSYadThJOwM8AR/30O9iQoFX6+a7m8U2KbGCmWI/8TaqYgULVJGZ+O8oBR2h0TvwA1yJZkD/TXvGaiF1F90cJjSeArzMJ6QWGaEMAgQNQ8jtE5bYbXWHtvIqf7PcAL2KaVHWwuzEn2FxdtmGvR3K9ZbGABsC1S9mzmeGWUed5+HcSzAcA1Qvcdac6sKNBq/hPpV67TFJtldSrMYroGSNN2EQKf6c1HGwi76vxXJWIUc8fGh2M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021135927099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G7JhtvCOcMiOQeDsAg4cnoaZtQE1t4V+34m9DUFmmOEX7xPMJzNyUPIWTwLS?=
 =?us-ascii?Q?Dav/J0bYbjlPxogE8Wyn0shD/+RwDVmEdnsGVgrk52JWBEkUtIsoblE2EcrD?=
 =?us-ascii?Q?VejXDcAOibcW98XqVRh7KMoYZ87evEUjSQnAF3IWuFvjtBn7P7sIDU/6VPPX?=
 =?us-ascii?Q?Fw8UjFu8j8DG6j7kjckqmPtDpVyhaL2pSf91hbm6crWqDL7G2aQmmdCeOuR0?=
 =?us-ascii?Q?l5BehCHJSUx4+1SSc9DNoHisN0/MoMqgM3E4+hgcihGHT3fruSzrvS4+x+up?=
 =?us-ascii?Q?/QGBRc0aDHddkHvJB5/C0efgNuan1Hk6+w2/dbt6kVn8pY00pcgGdG80kOO8?=
 =?us-ascii?Q?fK0YRpzqUqFkbsSnFoqgdUyof+6ZiO5u3ZGh6rTe6AD+31DQ0suOcNbEA8Y0?=
 =?us-ascii?Q?9mJDjaP2sY5rApNgiNQ2MRNzbEvrn+P1Ue0C5Tg6RDpcEdn5xRWprub6WhvV?=
 =?us-ascii?Q?VlOmTajsFGpTj2xFEtR+QaJyb+xP7VfNYYhQJCBl1hRHLxS88G43RPS2LWCF?=
 =?us-ascii?Q?BgF2uaHFA0WzaQKTXWHS56/W6nHfBodWQGG4voWePuV3BVwwIkfxC/BhNuzh?=
 =?us-ascii?Q?NPNr275lvNIkEVTx5QQivhFDLUjyF3nSuCewS4zUthOOi5BnOs/WmGe3Te3v?=
 =?us-ascii?Q?MNfzCPz2S3X4Svg6gBIi0NFMHNxbwJMhjugr4TJiWKODhofkdHusFfHpkJS/?=
 =?us-ascii?Q?5vKCwRpTgEqU/Pv0uyiP1dQcgHjaUlWWezcHBbh+2qQ9ZyGfe4XrJWS9IbnD?=
 =?us-ascii?Q?8c1iQuqVUpsHXfXsqUxVIjkJ1qfYthI1yDOQLXQW3dHteIxYpBoLXlGynPiI?=
 =?us-ascii?Q?VUn0YD/xJM1xMQMIaElki+oUCfJTgZ9UcI+kZjHVlM/EcbtGiLBVzWUSML/O?=
 =?us-ascii?Q?VGoGd8YvC/Q9HbZVxmjHM8oSI1rca9qJT77aQPwFlIZnXAlW1s5TViuzkSEA?=
 =?us-ascii?Q?k9lyQLpoo1or/NzF7+FFPpa7EjjuNiDIb0QkodVzQkLmBFG0mpJMZcJKUbZl?=
 =?us-ascii?Q?cy47R6OlBItPO8Yk4OAbrGHyGbImWmxtnUJwjb9vve6/SpicUBDfobUblbFM?=
 =?us-ascii?Q?YuiFURJvVHIdPRiebkw+PHaGgLFPfyYiw+bxE9+HjQqESxUbRlyN3zOu2820?=
 =?us-ascii?Q?9fAgCz7n4Bnm/NtxREO+ZyTDkkLH6gbZAJIXodaBOjsIGC5Ra70XLwVe2VGA?=
 =?us-ascii?Q?C7WI2UPgQ2gm/ZAziW97On2LyX91pul7iQY1QRUQA9XfPHmfTuDy4krUoYzq?=
 =?us-ascii?Q?UAgfO8Yy5NvKIbD4Ku7bSgAF4saqff15vhh0PPJ43mfwYXxEgek02pi2TLMx?=
 =?us-ascii?Q?P72SFtPEAw1rinddEBOHj9SarCgo7vYyVuhPfF2jLcB6Ujeo9CV6ZnFRRmaS?=
 =?us-ascii?Q?YpOcVsC1CIq96RP8LPTxzMT2wi5HfiA9xNfEltxgNAzG2RLyBBNiXwBMGetQ?=
 =?us-ascii?Q?DuZGzIshmGMFd4HofUXh+JCF8j+4q+Ms1nwBDNrQUZtg7zZsAE/tH24FCzMS?=
 =?us-ascii?Q?Lfvrf/+ynSdyeAUK/8X0vx1QNs17dNRsfSCyExWpYwZDlanmFegleYyK1Dl7?=
 =?us-ascii?Q?vcO3YBKoWdjKWLazYpz2ls5cxvdSxBe3D+WXolEvr+OLZOzEj5xiOWHjG9kO?=
 =?us-ascii?Q?wVF1duzyTdTF8dW5wtjQzy30yywaSsxTupLDQK0cdPlC5C3jBQDjSpEhBKp4?=
 =?us-ascii?Q?RM79iulNTFVpsW8GZvooJy7LHa3GM4f4TkKeUPHFrz5ShFR+W7IhFlJr9cEW?=
 =?us-ascii?Q?R98O7on4KA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ky9Kown8EH6vJaMDaO5CV02gRpoSeta0T11Qu7zqe+93UtqHLnDSoSUF1eEKr28LYjgCfMo5AKbG/CaVG4WLpQUmgNZ13rJ+b4Pu7QTfW4eH+KvJqEhah2DXd5UYu5fdBJYCt3qCp+KNFrhQIIlP1Uvt4D7ChKA09AcI2cRq+T50qsH1B3k40KtSp3H+D2tgY+1ZlMPIJKwqtu6TxruR4alYQEbVeRsE5owI7ibCjcyZw/lqqtTyOAC5NBXBulnHJSn1WSO39coYtvkJEGBxKp1MgjkBltx6DnwME48bPnp8+vhygDUZWQH/fER67sjst3O6H/VdSfB8/U/+Y9YjHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e5694c-2182-4f95-2a20-08df4abab207
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:09:42.0595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsBk9DgiJ0wcjzDDAqc+DSIh7BG3gD6OVVvLJ+SCizyCjktMXIY877XPfm+sdxT8kjC1wyW5qRi9KeqCONqMVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Subject: [PATCH] drm/i915/backlight: move struct intel_panel_bl_funcs to
> intel_backlight.h
>=20
> struct intel_panel_bl_funcs is only needed in a handful of files. Move it=
 away
> from the big intel_display_types.h header.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_backlight.h       | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_display_types.h   | 12 +-----------
>  .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c   |  1 +
>  3 files changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.h
> b/drivers/gpu/drm/i915/display/intel_backlight.h
> index 339643f63897..2cf9c2a99d06 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.h
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.h
> @@ -16,6 +16,17 @@ struct intel_encoder;  struct intel_panel;  enum pipe;
>=20
> +struct intel_panel_bl_funcs {
> +	/* Connector and platform specific backlight functions */
> +	int (*setup)(struct intel_connector *connector, enum pipe pipe);
> +	u32 (*get)(struct intel_connector *connector, enum pipe pipe);
> +	void (*set)(const struct drm_connector_state *conn_state, u32 level);
> +	void (*disable)(const struct drm_connector_state *conn_state, u32
> level);
> +	void (*enable)(const struct intel_crtc_state *crtc_state,
> +		       const struct drm_connector_state *conn_state, u32 level);
> +	u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz); };
> +
>  void intel_backlight_init_funcs(struct intel_panel *panel);  int
> intel_backlight_setup(struct intel_connector *connector, enum pipe pipe);
> void intel_backlight_destroy(struct intel_panel *panel); diff --git
> a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 90a5d29169c6..514ca067e139 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -63,6 +63,7 @@ struct intel_dp_link_training;  struct intel_fbc;  stru=
ct
> intel_global_objs_state;  struct intel_hdcp_shim;
> +struct intel_panel_bl_funcs;
>  struct intel_panic;
>  struct intel_tc_port;
>=20
> @@ -305,17 +306,6 @@ struct intel_encoder {
>  	const struct intel_bios_encoder_data *devdata;  };
>=20
> -struct intel_panel_bl_funcs {
> -	/* Connector and platform specific backlight functions */
> -	int (*setup)(struct intel_connector *connector, enum pipe pipe);
> -	u32 (*get)(struct intel_connector *connector, enum pipe pipe);
> -	void (*set)(const struct drm_connector_state *conn_state, u32 level);
> -	void (*disable)(const struct drm_connector_state *conn_state, u32
> level);
> -	void (*enable)(const struct intel_crtc_state *crtc_state,
> -		       const struct drm_connector_state *conn_state, u32 level);
> -	u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz);
> -};
> -
>  /* in 100us units */
>  struct intel_pps_delays {
>  	u16 power_up;      /* eDP: T1+T3,   LVDS: T1+T2 */
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> index b3c453bf7d5c..14fefd77cecd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_print.h>
>  #include <video/mipi_display.h>
>=20
> +#include "intel_backlight.h"
>  #include "intel_display_core.h"
>  #include "intel_display_types.h"
>  #include "intel_dsi.h"
> --
> 2.47.3

