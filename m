Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97D5C54FDF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 06:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8C810EDCD;
	Thu, 30 Jul 2026 06:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4+g5+9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599A710EDCD
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 06:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785394664; x=1816930664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jr3SDDMu/KzTi3YWiHxrWhqkMohfbus55p/Iec+y4EA=;
 b=Z4+g5+9Mt6Lszstgkp7HNMZC9Gm8WkNSUI22wor8hKJsHud1fN7+lbCJ
 DjNlCPa4fwSx/NgVpoxwUDNeBo2Pwg3Q0x5NsfLmzuu0Qv6FXdsyWMBgo
 vnShA/gwnRDmtV/o4pIPFAfjDZzZi4RPysYf+az/6WLeBhnv2A69DUqa0
 iE0Cp0OVHpsncDCKvYjyL/Zb9W4z2ez9nbDNeOAahIZzbA9DIoETVNGgY
 3INUFHdhUtOIpeF8xfN/M7huTyNDh1icwleQmjdQ54iCJVSt+rgHyjROc
 k5O90rhmSDPy4P4j3nDjqIXzdkmDSi1HKfUS4GtkQZZX+EIF5TDOn2j86 w==;
X-CSE-ConnectionGUID: lkg+SaNeRPWZw6i4RnhMKg==
X-CSE-MsgGUID: 7pLyP61CTwG/s0BL4dOUNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86084801"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86084801"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 23:57:43 -0700
X-CSE-ConnectionGUID: sorE34KrQeG17F8z4nJN9A==
X-CSE-MsgGUID: 0veOU6XtQFmcoY4ocVfyoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265275672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 23:57:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 23:57:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 23:57:42 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 23:57:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOf2a4OCAyoxTiVqLFGVMy+tiC0p26/pxwXcpkidytSMuEEIODUJv0Tk225rIdgQk221yDrU0LoMa3dgDa2UdkDHYriyWfKXxPKDYCS+kuN42ZFpcFus4fYeiV0O305zTttGT9YKkv25tugnnnGkZu87XHh66tI+8bQowaymzRzKmQZ+9sFKw9+aF+mxAAKYcWC+/7cE+mb6dP2lznIZhRbT+Ka88A8FhnS9VxdfKStTKLTZLlNTdEK0DcKysk2XJFkPHam2AcNJXL1OS5JKEPRXCOfyXAX6pGFhCCcCxlXoIQ+x1risBdFhlaIlJOkKKqlX0+64GLz74OGtnMfgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJoYs/qf4f9xGyXt14qIUIqUPQJPm5NFjX0IXAFtueE=;
 b=PxFxs2UsPBgJQ/D9VGo9mexE1u7zgBba2wzmtTCbflVgnyCDf9fup9QQhFvopPPvWi6OYsnknIuY+VLe8AFm0Xppb5+nwjazQ9RcrxHjRfsC5ougnei74jNZ6OEPsAIvsUp1qvUIo4IEu3ukbfyhWHZ9UMkEp1rQPO8g3wxT+Dan3X9Hxj1n97ppKZAtTxB5qFAhZ+NNGFXUSnJ1/zbJ9cVoCycPV9ZFYRqNwgSoHiny1L1DHmOZTRnGq1dHKDzai7OleQ5RaVNdDpx4uClE9dcCSomMVu7kKDAOjq4Sb6YzEqhn0q2O+n4M0lv+QxOhErc9wg2XlItXcdyrOn4vbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 06:57:39 +0000
Received: from DM4PR11MB5246.namprd11.prod.outlook.com
 ([fe80::c7a1:819c:9333:9ba8]) by DM4PR11MB5246.namprd11.prod.outlook.com
 ([fe80::c7a1:819c:9333:9ba8%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 06:57:39 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH] drm/xe/ras: Split RAS init into xe_ras_init_early and
 xe_ras_init
Thread-Topic: [PATCH] drm/xe/ras: Split RAS init into xe_ras_init_early and
 xe_ras_init
Thread-Index: AQHdH/Bk2SOc8eLhAUOZUY3HcJd5abaFoSOQ
Date: Thu, 30 Jul 2026 06:57:39 +0000
Message-ID: <DM4PR11MB524648FA751A8801C063887F95C92@DM4PR11MB5246.namprd11.prod.outlook.com>
References: <20260730065430.902562-2-mallesh.koujalagi@intel.com>
In-Reply-To: <20260730065430.902562-2-mallesh.koujalagi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5246:EE_|BN9PR11MB5292:EE_
x-ms-office365-filtering-correlation-id: 1a2ce932-d92b-4ef0-9292-08deee07d842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|56012099006|10067099003|18002099003|22082099003|6133799003|11063799006;
x-microsoft-antispam-message-info: ie8hx90tZoPBf3G8vdHzCYfs4x9nt0RrVbri+cOR1Se6gCJJliAVJcL1oDWg6bPv4zkpJc0XiBdDkTIRvrANWn3/WDDcA9QcKT5oixVvrhYI+Hj1u+mpIHZ83vWVC6FSyFY/MYbGiEtac+GusdPlSVF4zcKSi7jfMkSGuHwLpdNFpTAXvneDSPFpwyVnKSUDQt03YkayvS+jWSHAdradGAn3OHB32NDE15LZjgOtTQCSOM8iBtGFQNnfThvg2EPRNT/4JwD5fZN/uQMgYZo+yhU+Y0hvPHrPmzDi4jRVs5dQ2Ljd9Zx7NKTx/KwU7SoyuAtqbqKOI0FdDXeQerVEo/xDCXrwrd2OagNtvPfpABNCajCz9aYQY98fip6REL0GN4M4YQlCL76ldqTbiXSHtGkxRezl6bGP2sPqztfshwS4gOCAf5LG+fk+B4wOihhpVfUufrP7IDyzHJ0npH7GB0WKCw3j9cOtnGwDGdxhAiMeAU22aQMjBNs114Q7dNGi08pGS//WZL9e3bN/B+TWNYhTJZvxgVRbK/Mhzm51fKzjjZjBr3dD73fCXSaoQa5ZikQtF8tcFL6+6dtrwCYhb+4actTV0qZVTnu7hYILIBr3qR/ZhSML6LVmBMrv+4qyfyPM8QjrfU3mqrZWPFTurM5xe5Ghaxi0dA8Y7CSc6L+/wbO/l/hiXz4cHtH6ERR0uIHSPjZAFk84nnK2hhEfk1eFJb2vNES0y5FJ2akZkAw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5246.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fZzYDfUU5loQGfuRenNu2G+Dj78USRUGzRjHo1A8Y0Z3DTyZTtMBWwVs+4Wh?=
 =?us-ascii?Q?N9aisCOoTIXVfV6eegqa8yjSrJ6vzTO6zeiYiuULXnWjmogTQWFXO5qy7Zao?=
 =?us-ascii?Q?9FSsHt24aGTLRlNqSHaA/tTmDSclJYRT7jWtCV8mboYAoMv6udiA+TehIQkQ?=
 =?us-ascii?Q?wI8r4uZGu0u5RynIV7g5DdqDm91JsN7p3haK1kJoQuu9U2gDWq+FmDVX0n0H?=
 =?us-ascii?Q?I8ItecEck6qfcAjUseY0zBTndBHp72qNQ4VJwFhrYE4dy42ULVEZ8K83dtcN?=
 =?us-ascii?Q?aqiVL0V823CX2TrAtuUnNNsBrGQ6R40W1G8n/HxMP2O3hpJX/FrBModXNOmV?=
 =?us-ascii?Q?l57H1Q1Xue01NPav6FuRcZpYzfBDdzXWJ5jbUuW4/h1/YfggtdRCZ0ecQZ93?=
 =?us-ascii?Q?f+5o+KPtbgCq+3U7KPKToQ8/+KWr+4G5QYjcBhAfgW43qkEmbbTc+Gf3thFO?=
 =?us-ascii?Q?Ko7SyTeHf3lyVRjMTHU3xG3pH11FXktwbNsOfQYYe0WP9AwyOnjQQVmJGizN?=
 =?us-ascii?Q?DM+HG4wx8blllXit0i14qqUgeWo6zZIjxRs2+0yM+9VXjHca0NMRn6HTwULh?=
 =?us-ascii?Q?aKudo/eNR5VTZGNcTl7uLAMHeQ0N1Bf4ZjfTLC3dvcG8rECLpP/lr40IcphL?=
 =?us-ascii?Q?O0XJXtI1ovtooz7v3yl6W6wW+7ABunfuSjJZJ32svnoQhIDtvMfSapEhMwhp?=
 =?us-ascii?Q?tm+PGtgpjmPtq6k9QCVX+ZkRjBxxXgYKw59l67Qq5txD1VggLSAFigPJzxhh?=
 =?us-ascii?Q?u9yzsz7fa224MopB7Z/Rs24ZlgBZpLH5MJvmHXoMY0SzjHenALdXDgH7Ljc5?=
 =?us-ascii?Q?dAC07LGCcxmYReNjaJJbfS6EuukMaoyRHhhOJuCpKgC4/899LQOqPdJOn6qo?=
 =?us-ascii?Q?u/yDmmjio9C6AfNTdkOOSC5todhAgL1WdwjcbdL1KuvYTy/CJR/f7ivHYanc?=
 =?us-ascii?Q?HVNBffkcYQRe7kR7buasp7wQ1ZFLysNjFbcVFP0h6lRCVKOmGPLJpirirWO9?=
 =?us-ascii?Q?cwbllGH+gfdSWSfUd2RErmIudy1faSmG/QUXTLR98N1uzeRLW4lHSDe1RK8y?=
 =?us-ascii?Q?0BT7gSS+tHAi4mj9JJomlSm4Pg9dyo69WJOFXhXf0d3ecJ4Cjz8AizAybIRI?=
 =?us-ascii?Q?ssp5l+r4rWIOwlK5lFnt2xuUPP/sCUcrUmAbYT09E3ql4EZ0rtcETaXFmFu8?=
 =?us-ascii?Q?rpioxc0Yh+BBAoxTzOje9Bho1cael8/WKstp7TnJVr368L6NUoaDPFAoZQQr?=
 =?us-ascii?Q?QAsTyGMpis1BKwWDKPxF3BBF1lPic+Xf0Rwh1w0Lj07WO4I+MLHE7hAbu38j?=
 =?us-ascii?Q?ROQc+Kbno/Vxn/GhTlVbK0ikyhT1Y0dx6t3grzTMbXKHjr5fzvWzNv1ffQ0R?=
 =?us-ascii?Q?QXWXIea3eoROYvPtF2D8El3KkH6Fj3dvHwH+i+or2N/YwyIAKzVie/EOilkY?=
 =?us-ascii?Q?jcMbTOwPDLBkmz0DkMvcr26PdzycejsLhHtiwZNcPdowRcs6sPb/se1V0V93?=
 =?us-ascii?Q?WuPTLSjBbuBsINlSLLz2PRkQWJ6ramJVaWwFxf4EDBKfu9+6DPH5ibm3JaR0?=
 =?us-ascii?Q?LK/DVf6x6EFFRTU3LpWUUAkXi6KPiM9CbyygrnzkVsrXgewq4NfRFQb+Kf/4?=
 =?us-ascii?Q?2axxwPI7+Sov+6oT6aji5RjOCJbLKHoaQ+8UW9Yyr2LUY+Gqr6ZkWa5Va37f?=
 =?us-ascii?Q?BzkLjja+c5mURHCwE8Ax20+T0vWr92DU7opsEcwDGZ2Ji9iCjaD9eTAXdsOg?=
 =?us-ascii?Q?IdeIwDFsIw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CdqEiDiQn3RPfxa3U60b2PMp7c8BAByuldA8B5a2YZv8C6/i1CfiHCrL25iBYJViqRXYod/J37hGsv91JBeVlViZZJVeNeF2MAXYff1lJGY8qi1N5cUMUsU5Zn2L9JS0C1DXV12cF+t+n7+NA0yLbqV5hLcC1Yiqa77r82fn/NtLUiFcUHv5XrUIsuTLOLIT0oyfOT1jQyVCUz1Ua6aHuPTT2TWoUkC4GzxoWWEEybd8/uTLiTOfESYUeVRFgnTfFILkNvpx5Wi72EgfnTtnZ3WhvOF1t0HLChV0irXORlOTbDbF5Fa33nN6f4b3u0NiFp/fNHHMDqvGZyLiRo71tw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5246.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2ce932-d92b-4ef0-9292-08deee07d842
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 06:57:39.2984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTGA0nW55petU16bctdzbBfK71opUkGKquOUlxLDDvFDLiaZ3RAa1oXZb8VCK3v5h3gHBlgkA9EWlAoBNubhsoZ1PD4njas2P8pTnMbp3Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Koujalagi, Mallesh <mallesh.koujalagi@intel.com>
> Sent: Thursday, July 30, 2026 12:25 PM
> To: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>;
> Brost, Matthew <matthew.brost@intel.com>
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
> Poosa, Karthik <karthik.poosa@intel.com>; Anirban, Sk
> <sk.anirban@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Koujalagi,
> Mallesh <mallesh.koujalagi@intel.com>
> Subject: [PATCH] drm/xe/ras: Split RAS init into xe_ras_init_early and
> xe_ras_init
>=20
> xe_ras_init() was doing two unrelated things: setting up internal bookkee=
ping
> needed before interrupts start, and querying firmware errors that can onl=
y be
> done safely after the device is registered.
>=20
> Split it into two functions with clear responsibilities:
>=20
> - xe_ras_init_early(): runs early, before interrupts are enabled.
>=20
> - xe_ras_init(): runs after the device is registered.
I think should send this patch with your Punit handler patch series.
Thanks,
Anshuman
>=20
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  4 +++-
>  drivers/gpu/drm/xe/xe_ras.c    | 38 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_ras.h    |  1 +
>  3 files changed, 33 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c index 4eed9a251e65..a264f2dd662e
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1007,7 +1007,7 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20
> -	xe_ras_init(xe);
> +	xe_ras_init_early(xe);
>=20
>  	/*
>  	 * Now that GT is initialized (TTM in particular), @@ -1093,6 +1093,8
> @@ int xe_device_probe(struct xe_device *xe)
>=20
>  	xe_debugfs_register(xe);
>=20
> +	xe_ras_init(xe);
> +
>  	err =3D xe_hwmon_register(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> a31e06b8aa67..acf713aaf79f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -672,15 +672,17 @@ static const struct attribute_group
> gpu_health_group =3D {  };
>=20
>  /**
> - * xe_ras_init - Initialize Xe RAS
> + * xe_ras_init_early - Early RAS initialization, before interrupts are
> + enabled
>   * @xe: xe device instance
>   *
> - * Initialize Xe RAS
> + * Sets up the RAS error-counter bookkeeping and PCIe error reporting
> + * before interrupts are enabled. This must happen early because the
> + * interrupt handler reads the error counters set up here; skipping it
> + * would cause boot-time hardware errors to be cleared silently with no
> + * log or count.
>   */
> -void xe_ras_init(struct xe_device *xe)
> +void xe_ras_init_early(struct xe_device *xe)
>  {
> -	int ret;
> -
>  	if (!xe->info.has_drm_ras)
>  		return;
>=20
> @@ -692,11 +694,29 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>=20
> -	/*
> -	 * During probe, process and log any errors detected by firmware
> while the driver was not
> -	 * loaded. Critical errors such as Punit and CSC are reported through
> Pcode init failure,
> -	 * causing the driver to enter survivability mode.
> +	/* TODO: Build the page offline list/queue from early boot errors so
> +	 * faulty pages are excluded before kernel objects are allocated.
>  	 */
> +}
> +
> +/**
> + * xe_ras_init - RAS initialization, after device registration
> + * @xe: xe device instance
> + *
> + * Queries firmware for any hardware errors that occurred before the
> +driver
> + * loaded and creates the gpu_health sysfs entry. Must run after the
> +device
> + * is registered so that kernel events and sysfs paths work correctly.
> + *
> + * By the time this runs, critical boot failures (Punit, CSC) have
> +already
> + * been caught and handled via the survivability mode path.
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_drm_ras || !xe->info.has_sysctrl)
> +		return;
> +
>  	xe_ras_process_errors(xe);
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h in=
dex
> 618364734043..c28711470861 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -16,6 +16,7 @@ void xe_ras_counter_threshold_crossed(struct
> xe_device *xe,
>  				      struct xe_sysctrl_event_response
> *response);  int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8
> component, u32 *value);  int xe_ras_clear_counter(struct xe_device *xe, u=
8
> severity, u8 component);
> +void xe_ras_init_early(struct xe_device *xe);
>  void xe_ras_init(struct xe_device *xe);  enum xe_ras_recovery_action
> xe_ras_process_errors(struct xe_device *xe);
>=20
> --
> 2.48.1

