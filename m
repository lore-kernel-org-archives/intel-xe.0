Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C0606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDZ3YNge
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D484410E77D;
	Thu, 29 Oct 2026 06:13:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1020610E1E7;
 Thu, 29 Oct 2026 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793254427; x=1824790427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mAKQMg2VgAd/5nfBUEQxhwKf7gc6NJbJ0krxfjujDgs=;
 b=aDZ3YNget6UHTNRAuOyYgysUHTgerQdHfJgY2rBuR+nOrc3/NL/PHC3X
 OCAMyPTynB7RA+cvKQibgxLjUIXa1IkqVdx5OV23V0ykUg8BPlVdYSQNs
 McmSGXj+LXVNF3E5a2Skyko4YI4cGMjjyGSUSxSAMq8eI+AeTBIGMAQxP
 fgacYX+LkdRhCmv52/i6FmbRd/GQ2GD6fjw/jmtto60w4hgV7Z/Cugz/S
 Dlvf0OZrlr2Ry3EV98RayBsgjAUTV7LVepgUml8+5c9lSqdU4Y7kh7pco
 dnep4b86w6FxKOf5drOKtma2nX3/Q2IcM+WmFRhWjmwc3xVZOXJfVfrq4 w==;
X-CSE-ConnectionGUID: P8aDtevJTzW6iRqGG4FLCg==
X-CSE-MsgGUID: LpvgNDxuT9Szeuo8RX5/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1876987"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1876987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:13:47 -0700
X-CSE-ConnectionGUID: H7LC8gAwSJG+NsZlk3nWKA==
X-CSE-MsgGUID: V7wArgYpQwyvQlGt5Y6XWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5168006"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:13:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:13:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 23:13:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmbjFe+9Rs1X8YOxy1mmPxKKRyCiX2X3XFFBqHj71H7rFC+w7wLYfDsitB+0Y/u2WCoBHbvD0rtN3X5r+tY/qIL07qcVaJpF8xO7zT42aavCBLn+ueu9ooqwWLacOGSFJqlzYA1Gvh6AAzLhsmsv9lQZLA5ygDTb0Pvt1rt53drSUlwjRbePOdgkdBlcOB9ZSXzyupvzQXmJUmTCfeZKBFDyBa9Tfl3AgLf+ZKsqyUrA+LfpgXXvCNfnfrHeIJNfsyyFZkmOeZXIJdEX4+OxeNaIT1YJ46T4smZ9HqMiZrxEGnnWZOo92NFviRT19a8yEyEtC4Cu4rzU0vNRIMeBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8g7neeELTnwa8CYc8jx6nlMHtqlk22PLCMJhAOEdus=;
 b=rbWBZlQ/dmXcW6d8qWrTahb6mqyKLU9rvfR1cfakGejU6LeR+gpG5TwIoSLuI3m+qam+jLuJwxGDWpn6HNNVn4LnaFdzbvDGgWmd+6prYNTrFv6S2tY6PylvM3PATCtPUATGBTFJQDalXh1gUpV4R4D+lRRrBtoMHJ8le0PzUFa8fD6eu0y4vWxuIaYSErrjFio8rAwjMUQPd3zZfizlN9n93QVJL/lyPswbY42ZeaPSe/XAvqsawMpEbtPjsdqdyHVb0UEPBIokdFMnAmeJLMwNIVipC/kNPLPm3xolTcvyomWUtENHrJtyzNEMMIcRMRimc2WPIXAfYV2wSiZjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by DS4PR11MB9601.namprd11.prod.outlook.com (2603:10b6:8:34a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:13:44 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:13:43 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v2 5/6] drm/i915/display: Program and enable the DP symbol
 based timing generator
Thread-Topic: [PATCH v2 5/6] drm/i915/display: Program and enable the DP
 symbol based timing generator
Thread-Index: AQHdZphV/9a/gTfFIUepcodrMebVTbcSp8sAgAFjnrA=
Date: Thu, 29 Oct 2026 06:13:43 +0000
Message-ID: <SJ0PR11MB50395015473F171753A17457BA6E2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
 <20261028-vlk-64036-dp-symbol-tg-v2-5-43849c325d32@intel.com>
 <351c0256b6ac29c7b1c5d2fb5f1167525e171143@intel.com>
In-Reply-To: <351c0256b6ac29c7b1c5d2fb5f1167525e171143@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|DS4PR11MB9601:EE_
x-ms-office365-filtering-correlation-id: 150e19c0-5c71-45a8-d427-08df3583c8ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|260925021911599003|260925021311599003|38070700021|260925022911599003|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261021123027099003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: doO2d6KnhzgRqJJMg2HrrmQ6WepnSq3/ySwCZuD5DOhfceaBAgTcBniNQK01R9l14a+tE17N+ObtdyAxbWL5XYl+VdMRTNHulXiQO1jqBi+M8EcNkUn78GrK65FpQUFRcd9uvtsOLwEN9nwMV/wcC7NUu04Uh/jPuGWaKQrCf4nJj3bwvkoPPHJfJUZ0qtNIYXh87h/7GSUiOlXrw1sTb72BNPUjl5pYiOktw6+PE3+SnYJTvtJH8HHIO1Qa1JdNab4grks75oo99FoYg8q57xg8wh7w75itdRx6+uO4l7a8/r100PhtA1CaQ6axqb90RXfy+nbIOJrbfm6Ghd6dmvjjGbf9WAp/XRMU5O8qaXqe/BKYhRMskyibvgVXFp6TMDXEs4KlGN/Db+m2ucKAi3wkMYFixPnynn3FK8J4l0r+Qll0827890ctI3cnQ7R76FUqPVlkSoSaJ9NgL13cuiAbuBnusiiyGJSFymyDMp1a7DyQt71J6n0RXYOH7Ld+9s15R4F82ZrmnDb9QsLC9vTrbZovytKJ2a6h1+Kp27wwJwnMzfebnWpDDC1a0y3jxiGYRJCfwcpqCK2vmZxqc1JkuakRzubzbSbfHkkjFewVAGCxHEaPwUMLa4zsChoxkMFCjtObqG7XT/owsS9zWZrKL4rTIVpHzEI3cELgyaUSJg3UfTP6uCjrNc2CQod6DYGs0qOi5EZCRWiAq+WKIrWgw23XZLDphG6n82YurPg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(260925021911599003)(260925021311599003)(38070700021)(260925022911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261021123027099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dze2NquMdjttu29m+llSw55gcxrNAAD0feukWCje9mGztslaxfMDcnAqv5EV?=
 =?us-ascii?Q?h1/5jwFpef2Zf7yhanJCQJHDwGXsJhZr2dlqGYoVApo59tQVXurlSUPyvH3Z?=
 =?us-ascii?Q?LWjyZiCYOaZhE+xTMTFXBAD/2NysNMGw74P0yfE6bd7RbnZjE3yRtfEJyTd/?=
 =?us-ascii?Q?SOdxH8xNKq4vH1O2NcDs/EG3zTDgAVxJWpyCGb2Z2qkoRcE7xy8Y+P9c76VC?=
 =?us-ascii?Q?QUGmUAYLAkjrQrpfo167kT6JHrUQWJ7+iTwI5Nr7EE1YaX9vNoyOAX9J6MR7?=
 =?us-ascii?Q?tHb0say0EUqBgegefq5cYHQGVgkcwEdUC/vKKjAHC18lz+7HLTwWpAJd/pgm?=
 =?us-ascii?Q?5ECle3Wwj04w1V5HTiC9Ay3kozwXor1EAtX7eYUmXNrncQXqDS36Udw0qvwu?=
 =?us-ascii?Q?76c3PB83MZTySi2EzFr7zX0gfL6zKHTTFoZxPkkBRFEK4dEPSPP2Yt74uN8R?=
 =?us-ascii?Q?dGScCVZdaZP9TXdKiJLO3V3ere+AQDnxfVGmIqSltihljNH6KTxUntRVYmZ3?=
 =?us-ascii?Q?5K5ezwYas6+Wwzyjqx7S+hGiFOVho16MR9p+6Y28nXCoxS1YrW7ZKsukVnzi?=
 =?us-ascii?Q?Iwj0N6FmnmfUTFfD+PiBek71NDqGjV1R75bNWj6wDr/ahnq7S18cAoZGS3nH?=
 =?us-ascii?Q?y40F+azLC0i0ZvNwBIvK7BulWZ/fxwuVnVpgYk3Hx5QOeK/XIUWMTo2aoLId?=
 =?us-ascii?Q?AWE0XSrMXtw2Pa+R8gWj3U6K6vimj5TA2tcRENEHfhsSxYsBZuREMENu9BJE?=
 =?us-ascii?Q?k04dHujHWoA8PorhFt01zozqmluD3+zdRURXOnTyx2z6+zSgy0SDamyR334N?=
 =?us-ascii?Q?rSexGuh1COnvCsM8RoNT+uRAWFuFWwcZEPslBcOwdB7xABwoOJxpAPjwvEw0?=
 =?us-ascii?Q?qJOF4HNTEj8FxiY+Emafr48Rbu8qk314QMXMR9BT5HjOC+1RG49yOgZjygMI?=
 =?us-ascii?Q?wdrSykOtTSYzlNxNkub/bb9vByMEBZOH/MqIHiq4eZRWc8fXQ2GBG92GvuCB?=
 =?us-ascii?Q?Ge1tBGG4TlECgXICG4MXamfoY4AIOajiorVKay85aWmASYhwLkXh7tuDCW4f?=
 =?us-ascii?Q?RTwxC7YRyAPBjUeAMbYo2Vy88IUcPxARM95dLraGbjuymFe/EGwVqvs7Vwg0?=
 =?us-ascii?Q?hjVxZN6FSy6qY3axbBx7HTVsZhcaJj6PtAk90ksaAMBcOZgSKrJKjMCaOx1J?=
 =?us-ascii?Q?cIv/OojSmhBTYYyvv07py2WjFwABP54OsbuKgfEjhdeor5oplKQT3YG9064Z?=
 =?us-ascii?Q?kzj+Be1LaVzyzv52IIF4LLanTbxeojdwQMenRzLc2gJke85IXV9ky3A5z0fj?=
 =?us-ascii?Q?bwnsy2gGJj/01EIFQsDKw5q/2Sr3MHwOzf1Z4xLjjQhEdkWCKoMKDaOnpqBu?=
 =?us-ascii?Q?3cMQPG8YY6Pdz64czSNqUdOm7zjlNSyQuT0CzPdjkpXtrhocVZL2Ul0+hsuU?=
 =?us-ascii?Q?BGPyCsCyKcN84CfsxUI1cOE4s3dlj+xWcw9Hel7OG6eoJyZ1dUS+qobV1J8C?=
 =?us-ascii?Q?FqSVKnTCpTmHojOac492H3uhqVDtSjWm+WtUgvcUGEFQXcdMOX/sLDTInjPi?=
 =?us-ascii?Q?42VW88J7//OF2KUjzMFBReGQJ9PW980r+Iq5bbjMXU/Xj6TtiNhRMQW34Dbh?=
 =?us-ascii?Q?ujJx63cUCLN4aJipi7vE6DQ34FjyBgnO968q+d//+FVAMfneCAY5JzXxEOqu?=
 =?us-ascii?Q?jKQgrogzQ07NPGPT3Qt6HqyvwsilWeSP6SeQ3CEs5hoSM1m0c4xo7awSYQtZ?=
 =?us-ascii?Q?xkilQSKReQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eoKN/2Qfm3zSBEDZxRFOU7Icbo5CqX8VkHcQtYQ62TbgvqoUweSudmkS3itn10hbNfh/1eNWZwSd5lUiLet7wnBdApD9vL/IyI2zFGob++87bWgY8wUGXlEvsn25Yujss5nZzdtaGO/xyNOTlFFCtWiuPBA7/Lu9AjWoWZ+sJBlnxLvHLO3mzitAH4q150urtgcEhKw6xGXxw7/TCSeDLVyzUb2R35GctNEwBEA1d91yGR2mzLqkTl8YImigOqG53QbBp7QJcb5xpOHr3MAjM/Xn4Vk/ZumnKYlGXDEPhRlUlAOT0RuCbqhmIQCLbnWZtTilvTWm+2Qrk28a+Dpy9w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150e19c0-5c71-45a8-d427-08df3583c8ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 06:13:43.7662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmaftJS8/Jjqrx1nmfRh1n/XfIeEQqK8JLbLat7Pij6iwCAlhouC8clj7kcpTFdKo1t1GJ/mK4bY2YnfNdVb6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9601
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, October 28, 2026 2:28 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-gfx@lists.freedesktop=
.org;
> intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Shankar,
> Uma <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH v2 5/6] drm/i915/display: Program and enable the DP
> symbol based timing generator
>=20
> On Wed, 28 Oct 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > Program the 128 bit LL symbol Data M/N before the LINK_N write which
> > arms the double buffered update, the LL symbol HACT/HTOTAL/CHUNK_SIZE
> > along with the other transcoder timings, and enable the timing
> > generator via TRANSCONF.DP_Symbol_TG_Enable before the transcoder is
> > enabled.
> >
> > Bspec: 68849, 68922, 69961
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 100
> > ++++++++++++++++++++++++++-
> >  1 file changed, 97 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index
> >
> afe70e9ce34739b67e4d87754f9c361ff77f37a6..0698fb2b7b66ef4216d0ae237
> 227
> > 713bce3cb7e5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -521,9 +521,14 @@ void intel_enable_transcoder(const struct
> intel_crtc_state *new_crtc_state)
> >  		return;
> >  	}
> >
> > -	/* Wa_1409098942:adlp+ */
> > -	if (DISPLAY_VER(display) >=3D 13 &&
> > -	    new_crtc_state->dsc.compression_enable) {
> > +	/* The early pixel count is in symbols with the DP symbol TG, no scal=
ing
> */
> > +	if (HAS_DP_SYMBOL_TG(display) &&
> > +new_crtc_state->dp_symbol_tg.enable) {
>=20
> The HAS_DP_SYMBOL_TG() check is redundant everywhere you also check for
> your dp_symbol_tg.enable, assuming you only ever set set
> dp_symbol_tg.enable if HAS_DP_SYMBOL_TG().
>=20
Agree, will remove the redundant HAS_SP_SYMBOL_TG() in places where its not=
 required.

> > +		val &=3D ~TRANSCONF_PIXEL_COUNT_SCALING_MASK;
> > +		val |=3D
> REG_FIELD_PREP(TRANSCONF_PIXEL_COUNT_SCALING_MASK,
> > +				      TRANSCONF_PIXEL_COUNT_SCALING_X1);
> > +	} else if (DISPLAY_VER(display) >=3D 13 &&
> > +		   new_crtc_state->dsc.compression_enable) {
> > +		/* Wa_1409098942:adlp+ */
> >  		val &=3D ~TRANSCONF_PIXEL_COUNT_SCALING_MASK;
> >  		val |=3D
> REG_FIELD_PREP(TRANSCONF_PIXEL_COUNT_SCALING_MASK,
> >  				      TRANSCONF_PIXEL_COUNT_SCALING_X4);
> > @@ -588,6 +593,14 @@ void intel_disable_transcoder(const struct
> > intel_crtc_state *old_crtc_state)
> >
> >  	if ((val & TRANSCONF_ENABLE) =3D=3D 0)
> >  		intel_wait_for_pipe_off(old_crtc_state);
> > +
> > +	/* Disable the DP symbol based timing generator */
> > +	if (HAS_DP_SYMBOL_TG(display) && old_crtc_state-
> >dp_symbol_tg.enable) {
> > +		intel_de_rmw(display, TRANSCONF(display, cpu_transcoder),
> > +			     TRANSCONF_DP_SYMBOL_TG_ENABLE, 0);
> > +		intel_de_write(display, TRANS_LLSYM_HACT(cpu_transcoder),
> 0);
> > +		intel_de_write(display,
> TRANS_LLSYM_HTOTAL(cpu_transcoder), 0);
> > +	}
> >  }
> >
> >  u32 intel_plane_fb_max_stride(struct intel_display *display, @@
> > -1683,6 +1696,43 @@ static void hsw_set_frame_start_delay(const struct
> intel_crtc_state *crtc_state)
> >  		     HSW_FRAME_START_DELAY(crtc_state->framestart_delay -
> 1));  }
> >
> > +static void intel_dp_symbol_tg_set_m_n(const struct intel_crtc_state
> > +*crtc_state) {
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> > +	enum transcoder transcoder =3D crtc_state->cpu_transcoder;
> > +	const struct intel_dp_symbol_tg *tg =3D &crtc_state->dp_symbol_tg;
> > +
> > +	if (!tg->enable)
> > +		return;
> > +
> > +	/*
> > +	 * These are double buffered, updated by the LINK_N write in
> > +	 * intel_set_m_n(), so must be written before that.
> > +	 */
> > +	intel_de_write(display, DP_LLSYM_DATAM(transcoder, 0),
> lower_32_bits(tg->data_m[0]));
> > +	intel_de_write(display, DP_LLSYM_DATAM(transcoder, 1),
> upper_32_bits(tg->data_m[0]));
> > +	intel_de_write(display, DP_LLSYM_DATAM_EXT(transcoder, 0),
> lower_32_bits(tg->data_m[1]));
> > +	intel_de_write(display, DP_LLSYM_DATAM_EXT(transcoder, 1),
> upper_32_bits(tg->data_m[1]));
> > +	intel_de_write(display, DP_LLSYM_DATAN(transcoder, 0),
> lower_32_bits(tg->data_n[0]));
> > +	intel_de_write(display, DP_LLSYM_DATAN(transcoder, 1),
> upper_32_bits(tg->data_n[0]));
> > +	intel_de_write(display, DP_LLSYM_DATAN_EXT(transcoder, 0),
> lower_32_bits(tg->data_n[1]));
> > +	intel_de_write(display, DP_LLSYM_DATAN_EXT(transcoder, 1),
> > +upper_32_bits(tg->data_n[1])); }
> > +
> > +static void intel_dp_symbol_tg_get_m_n(struct intel_display *display,
> > +				       enum transcoder transcoder,
> > +				       struct intel_dp_symbol_tg *tg) {
> > +	tg->data_m[0] =3D intel_de_read(display, DP_LLSYM_DATAM(transcoder,
> 0)) |
> > +		(u64)intel_de_read(display, DP_LLSYM_DATAM(transcoder, 1))
> << 32;
> > +	tg->data_m[1] =3D intel_de_read(display,
> DP_LLSYM_DATAM_EXT(transcoder, 0)) |
> > +		(u64)intel_de_read(display, DP_LLSYM_DATAM_EXT(transcoder,
> 1)) << 32;
> > +	tg->data_n[0] =3D intel_de_read(display, DP_LLSYM_DATAN(transcoder,
> 0)) |
> > +		(u64)intel_de_read(display, DP_LLSYM_DATAN(transcoder, 1))
> << 32;
> > +	tg->data_n[1] =3D intel_de_read(display,
> DP_LLSYM_DATAN_EXT(transcoder, 0)) |
> > +		(u64)intel_de_read(display, DP_LLSYM_DATAN_EXT(transcoder,
> 1)) <<
> > +32;
>=20
> intel_de_read64_2x32() maybe?
Didn't notice this API, will make use of it.

>=20
> > +}
> > +
> >  static void hsw_configure_cpu_transcoder(const struct
> > intel_crtc_state *crtc_state)  {
> >  	struct intel_display *display =3D to_intel_display(crtc_state); @@
> > -1693,6 +1743,7 @@ static void hsw_configure_cpu_transcoder(const struc=
t
> intel_crtc_state *crtc_sta
> >  		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
> >  					       &crtc_state->fdi_m_n);
> >  	} else if (intel_crtc_has_dp_encoder(crtc_state)) {
> > +		intel_dp_symbol_tg_set_m_n(crtc_state);
> >  		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
> >  					       &crtc_state->dp_m_n);
> >  		intel_cpu_transcoder_set_m2_n2(crtc, cpu_transcoder, @@ -
> 2929,6
> > +2980,17 @@ void intel_set_transcoder_timings(const struct intel_crtc_s=
tate
> *crtc_state,
> >  		intel_de_write(display, DP_MIN_HBLANK_CTL(transcoder),
> >  			       crtc_state->min_hblank);
> >  	}
> > +
> > +	if (HAS_DP_SYMBOL_TG(display) && crtc_state->dp_symbol_tg.enable)
> {
> > +		const struct intel_dp_symbol_tg *tg =3D &crtc_state-
> >dp_symbol_tg;
> > +
> > +		intel_de_write(display, TRANS_LLSYM_HACT(transcoder),
> > +			       TRANS_LLSYM_HACT_VAL(tg->hactive - 1));
> > +		intel_de_write(display, TRANS_LLSYM_HTOTAL(transcoder),
> > +			       TRANS_LLSYM_HTOTAL_VAL(tg->htotal - 1));
> > +		intel_de_write(display,
> TRANS_LLSYM_CHUNK_SIZE(transcoder),
> > +			       TRANS_LLSYM_CHUNK_SIZE_VAL(tg->chunk_size));
> > +	}
> >  }
> >
> >  void intel_set_transcoder_timings_lrr(const struct intel_crtc_state
> > *crtc_state, @@ -3095,6 +3157,23 @@ static void
> intel_get_transcoder_timings(struct intel_crtc *crtc,
> >  	if (DISPLAY_VER(display) >=3D 30)
> >  		pipe_config->min_hblank =3D intel_de_read(display,
> >
> 	DP_MIN_HBLANK_CTL(cpu_transcoder));
> > +
> > +	if (HAS_DP_SYMBOL_TG(display) &&
> > +	    intel_de_read(display, TRANSCONF(display, cpu_transcoder)) &
> > +	    TRANSCONF_DP_SYMBOL_TG_ENABLE) {
>=20
> Please don't combine reads into complex conditions like this.
Will move the reg read above the if condition.

Thanks and Regards,
Arun R Murthy
--------------------
>=20
> > +		struct intel_dp_symbol_tg *tg =3D &pipe_config->dp_symbol_tg;
> > +		u32 hact, htotal, chunk_size;
> > +
> > +		hact =3D intel_de_read(display,
> TRANS_LLSYM_HACT(cpu_transcoder));
> > +		htotal =3D intel_de_read(display,
> TRANS_LLSYM_HTOTAL(cpu_transcoder));
> > +		chunk_size =3D intel_de_read(display,
> > +TRANS_LLSYM_CHUNK_SIZE(cpu_transcoder));
> > +
> > +		tg->enable =3D true;
> > +		tg->hactive =3D REG_FIELD_GET(TRANS_LLSYM_HACT_MASK,
> hact) + 1;
> > +		tg->htotal =3D REG_FIELD_GET(TRANS_LLSYM_HTOTAL_MASK,
> htotal) + 1;
> > +		tg->chunk_size =3D
> REG_FIELD_GET(TRANS_LLSYM_CHUNK_SIZE_MASK, chunk_size);
> > +		intel_dp_symbol_tg_get_m_n(display, cpu_transcoder, tg);
> > +	}
> >  }
> >
> >  static void intel_joiner_adjust_pipe_src(struct intel_crtc_state
> > *crtc_state) @@ -3419,6 +3498,10 @@ static void hsw_set_transconf(const
> struct intel_crtc_state *crtc_state)
> >  	    crtc_state->output_format !=3D INTEL_OUTPUT_FORMAT_RGB)
> >  		val |=3D TRANSCONF_OUTPUT_COLORSPACE_YUV_HSW;
> >
> > +	/* Must be set before the transcoder is enabled, so only on modeset *=
/
> > +	if (HAS_DP_SYMBOL_TG(display) && crtc_state->dp_symbol_tg.enable)
> > +		val |=3D TRANSCONF_DP_SYMBOL_TG_ENABLE;
> > +
> >  	intel_de_write(display, TRANSCONF(display, cpu_transcoder), val);
> >  	intel_de_posting_read(display, TRANSCONF(display, cpu_transcoder));
> > } @@ -5515,6 +5598,17 @@ intel_pipe_config_compare(const struct
> > intel_crtc_state *current_config,
> >
> >  	PIPE_CONF_CHECK_I(min_hblank);
> >
> > +	PIPE_CONF_CHECK_BOOL(dp_symbol_tg.enable);
> > +	if (pipe_config->dp_symbol_tg.enable) {
> > +		PIPE_CONF_CHECK_I(dp_symbol_tg.hactive);
> > +		PIPE_CONF_CHECK_I(dp_symbol_tg.htotal);
> > +		PIPE_CONF_CHECK_I(dp_symbol_tg.chunk_size);
> > +		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_m[0]);
> > +		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_m[1]);
> > +		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_n[0]);
> > +		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_n[1]);
> > +	}
> > +
> >  	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
> >  		if (!fastset || !pipe_config->update_m_n)
> >  			PIPE_CONF_CHECK_M_N(dp_m_n);
>=20
> --
> Jani Nikula, Intel
