Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451D8C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 02:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0220010E2B2;
	Thu, 16 Jul 2026 02:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Of+RENEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B081710E2B2;
 Thu, 16 Jul 2026 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784169619; x=1815705619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6TiMtXaWHiZxoJzJvqcTGjSH9uMylueHUziGIiikpMo=;
 b=Of+RENELnYn6iInong2++VbbnaKlDsEi5iWWWwfMfb/V7Uxj5g1JNYa3
 X6H4SRqxSzi1Ump3DueYuOMJI4IbiRDF/k9SXNiUmzleQuFIH2AYzMDgn
 VGSaa2tJbc2dKYP5v3AP0UchbcLAGG5UgNgt8EGfZFzzGImwtbW+K9yv7
 e0KGMHKr74ZdnGt2XzaoivuLQQO0CWIgre+ZZ3i0AIc2+8FXkNDZbPqyq
 1MB6S544NygKNHNFShkiVXiWsenRciSBGkYCAVN3rbMR+/3wJRC+CCrcY
 0XM8EiRoqlA7ykrF1fp7SsLo25kGz7C7dCOfUqO2W3qoMGrwxToxNY5f4 w==;
X-CSE-ConnectionGUID: epRpenXHRemW3p7Wq7h9Hw==
X-CSE-MsgGUID: U2jQcwm/QEa5wLGFihv9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84703722"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84703722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:40:19 -0700
X-CSE-ConnectionGUID: 0pDqwOi0TWii84RMGBj8pw==
X-CSE-MsgGUID: PpU47pkRRyGnDYMg4KgNcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="252954362"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:40:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:40:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 19:40:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGApyBzHELmpjJF4MCVaHqR1gEJVHEeGKaowAJyZizrTvYVudRRbgs1F4lqAUTXKSNDf2ukUAz0ta3dty+R+z6QusXL8IGU+X6A6omB4LkMQBilsI0ceMupTjE3tMmwKM0+NdOsZJvqzLpMjVssfuUVs9S3VoXkgpyUhmSXR3aPCP0T2I7ucrhtjNFcLfIazR7Y93L1hZIPZLNnBYXx5yolpCrgRraJ/vLVPhMs52Tf934DbC9eQX5xxEyMddr04WWoRdQo96A8d2cHOe+lqDkSZjfoetQt4A9NYErI08OflIxyFoRmJsQmiXY3CXQ6Txws9AWDQE2Bi1S1JDObvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DT+QL4C/SX9FqPGMErXVmHfx2gmQVUcAT8BM2qS3os=;
 b=nvhRxiHUcENtIAkbcBHJlWNlA8T+2mh0hqdalVHjfU/aShTLoDQgwrfX0uovVNMl/qbO6U2YcY8uCVwMVn9WRkx0i3ObJftl8UdVYkFMuOpR3K1zc0Esdo1sjktwxKdd1BjCeqyo/219Kj+88Pv1ejItS+AvfaBxoyCeDjfpqMkf1gQ5OzmJSptPu68G7b0V3HjLYVQF6e7JRjRubxTRrQ2trlPyd9dYkvesZGNTHiTq6Ycazcqyl6OtqagiNKDyUB0HTakG3sLJc0qgoTr8YUzEwwB9p4EVy9TpwHj+5hQ/mYddc6YlG3PSIH8+pnLhOWe3LzPFFkLjRxucgGpMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB8094.namprd11.prod.outlook.com
 (2603:10b6:610:156::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 02:40:16 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 02:40:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: RE: [v3 1/2] drm/i915/xe3p/dram: Interpret 0xF populated-channel
 count as 16
Thread-Topic: [v3 1/2] drm/i915/xe3p/dram: Interpret 0xF populated-channel
 count as 16
Thread-Index: AQHdFGQqeG3dd3n2gUGZeg6Wlo2kgbZvb2Ig
Date: Thu, 16 Jul 2026 02:40:15 +0000
Message-ID: <DS4PPFE901A304FEC0196A9B0E7311B1EE2E3C72@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260715143243.4141208-1-uma.shankar@intel.com>
 <20260715143243.4141208-2-uma.shankar@intel.com>
In-Reply-To: <20260715143243.4141208-2-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB8094:EE_
x-ms-office365-filtering-correlation-id: 22bcecf8-6375-4a81-73da-08dee2e391a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: aPOjERIuASIGy16qJJWGZ0atjw9fCNHyLkf/Vob4aDy1RMLI9sdg1NE6n2Oep/KCVHltLriFjxX2kkuNX8s3ttxMBMnXztEQ4hckg62652j9DHcn2EfTMVA9NUShSxcFYjZmjT1o4j3l1tc8kVNUR2KwYfjFx1K1W1YV1+B5PE8RaNFYse96wndp28TtRVz0KJKBH/Ve0x6CKHeo8zyym+2/XhL1wroF5Q2PA1m1TfwX1ZFuH1bQM7rAM3zqJsywFBqtA2uKmcT6dSiX+pWLV7hi8Labnkxcq+4C5aG/WAlOTNrR5Xvhvo5OIXlK2tMiyEsl+R4IdH5g4HISo12aAssIm31sxN0/azNwBq8XQK6aRLfJEN2+QtIa831Uv8WK4q/SpZ+FJo0m258/BEYZ8xLzJJAS4tqPXqASSlS7yy27rLn8lEREB48qnURpJTEaeztOObaX5YNY4EH+XIOszARNCHmhTEuqj4nfhXxHS8LOHFTYjAQR+mCD+ZP1hzxdXRmsLkcmh2DahSkbh3+VPrAjF+Gc0qGERV0A5Ep3EOnj6GJldKUWVM0OEv+s+yY+a/q2J9JIghnCIviAPe8bGmTBA0gp0J4lkRCUXbk7fLLhDS8+29zlPsHWmk6FxdQZ0M1Bemk0b1cC4AUM/mP0k739e99CwIFy1T7mOJtyfMt+LE8CvWtJsUGKjIiYWwB5vM5xSd8Eeh9W7YkI5gbtQoMEGeMr1XG+AaaJceu54eU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DJLPI9KVGJgS955Gx4dlZmqPNUvpfwGw7tiAT5mJlo2jm+VAcSvGo3/4UyzK?=
 =?us-ascii?Q?M3E8HpiJwl5yeAcr2EAZnICXbxKTYxwRIYt68bogkAiL4og4nzCTW4sO2Dt1?=
 =?us-ascii?Q?BQD1qWcM23p4UN+wtqxXSuSk202zjx5iJpfYI+VDQdywDefgKh4mMAnaMUqD?=
 =?us-ascii?Q?S69vfdXPUeGu7tMvApx7uwOa8SRez/GPRkW7r0wfvkxz36VuO8GUUVqfj0ae?=
 =?us-ascii?Q?m7kXBI56u1FmX9CNQrVBfQZh2cQV3xIC9lJ9506muL71oqLnokJgLLaLw7XC?=
 =?us-ascii?Q?xwVKRTzKIcyu648Q1+IA86e4tqFwK7uKBfbZtGqtdgUYY8NZGZo2sxfI0HKx?=
 =?us-ascii?Q?2+HPsJZpnO1K6P8ntstfdfg4lN9FcIH8TFbRZ55YoVJWodSulsr/P8fo5ol3?=
 =?us-ascii?Q?9KdiqSAWyd8ZWCdaBcBsjyoeTk5MrYPnRXKU2U3H66fjNGUjfvr4eD1xhmxj?=
 =?us-ascii?Q?cC2DAdjwmsPS5ZvmwQH3XdKtSp3RiLHT7/kc0Q2qP9J8wSBPjTRaPjMly+zD?=
 =?us-ascii?Q?nxCcqZbv9UsXWovfTVoYQZLUOqF4YIgYFjF9WQ1SaFoq0NLgGlXwNKexMfq9?=
 =?us-ascii?Q?0FwyutQvHv2TcBUuCrK311INn1VU+vWOxgomMpOAdjt08AR+28Ttlx7Fye4r?=
 =?us-ascii?Q?/cTW5xZFqBb97ZLfQL3Y4YmgZQnimAuF7jB761nbN96vwR50xQa6lw98cLd0?=
 =?us-ascii?Q?xAUIXxeXwOBM9gwqsTpbsWxCGhEjkvM8nDi7aJxPablB6Gt+GAsBIRDCtdYD?=
 =?us-ascii?Q?TYuxjHpZz6gy7s6IczdznJCqYNVFJKgKKo588iOrjYtLTeaIyWDBEXTQ4/qt?=
 =?us-ascii?Q?yclV34qLLiwT6cLKVR8PbhQCek5eZLnTA9fN9AenKdZV/zpdQRY5+hxZbNO4?=
 =?us-ascii?Q?4/CoSTCqigFEQpIBiFKY7AldAkcPGdtsrdo0JvDGRKlWCKfdAnLTNKYZmIxA?=
 =?us-ascii?Q?Yf9EpV+YCNt9zEGhkCjPjLL9g5E6suop+0HdkDvRBFG9hxI2ULwVtcNgjYQY?=
 =?us-ascii?Q?U0eBVgR+WR5zI5aG+oDDQ0fekmpxKfLGQgf+UV4OTmWzKCd02NEJsqaPbfXs?=
 =?us-ascii?Q?4bWBTqqgaiVK7HTFwKyAiR7y5N9fTsFASAdZDzExdkKqDqvpqSDZA3eQBWwY?=
 =?us-ascii?Q?swxKHowuhCjeilEaZmCevvVpC6ZNXMoyb46X6cbmae1YZ3uPvDRCrh6kigUs?=
 =?us-ascii?Q?2EWymCBHXzq6/NpWUZXlAVdclWoK7pkJ7S2v41bnQUCtHlbWG38PQrNalbBV?=
 =?us-ascii?Q?hSxM3vHTUOO7BXqPEGv1IiieqaBvde3WG+yZKi59p5SRKnpdZw3HrVdgAQFY?=
 =?us-ascii?Q?wLUcs3A4bd7zVVx3EqghaWqR4EzN8J7Xs0ytjJD64WgUnoAL20uhMcTzCBxp?=
 =?us-ascii?Q?FLIgrlW+X8lZ+3aYcxjy4C6l1loSCVZuuTXwSoQpjNhKan0FNXwoxIZMbM2e?=
 =?us-ascii?Q?jAifJg663ykieLbJ9AXYuQQRJGpzMmbkGWMXNijVrBw/JHi9+SY59KuWqQm+?=
 =?us-ascii?Q?5SYdou1s38JVBJw2lRXcnCetrInLHOHfbrNz6qXGSf/fazzVi6TL7Ih1ODI9?=
 =?us-ascii?Q?Qx5k18cAzRsx2ozePMrmURVFkGNi5QMaJ97NkKsigiLmn3C85haJAcHbIz+I?=
 =?us-ascii?Q?quySTBAJ+QCPeZ2RCMcYOzcSLu+hm8d9QhT6SW4gTZp3pWwh/XBqmAAaYdS7?=
 =?us-ascii?Q?e2XzRMXKudHYBAaO9kKfnRoAR43k2sRtCmc7pq15Cn+xbUtBbWkYavgJeAd4?=
 =?us-ascii?Q?dWt6DBY8lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o15YtZwkl1hvGUrW/KCK6KTdrwvPaevW6cnjYWCRiQmlHv+qF2bPMFViWEMhymzuNJUpf/d+Q08uFAbgSvqLXjJysTcvlQGcP00xKCaAhXyCTqwk9RaOMU9c5Fn7DISYwkqAnUWSjUKtF7WbFWvcWU85SA2+Det2aO5GnJ7gjJNrxzzlECeOkivSZR8PLspct7XH1GBMQp/c+t3i+lLj5lxR/eORUPePVVAZBz8Zq0lZt/58QkZXjeONY6ErHhwDqbewZqG9wca7UaMbqaGF3Rd7roxmAfrHtALlu51KZCU7eCA2IkS+l2gCyP3afXeXTTy2lcrdntfQWkdknq4vKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bcecf8-6375-4a81-73da-08dee2e391a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 02:40:16.1193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtlwziXmYZCaL7BBQlCIIcUmnqKYlGu5PHpCgGNkxyBwayS4aemLPUUkGTokBPDjk3xZSkYJNR3m4HfaLH01BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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

> Subject: [v3 1/2] drm/i915/xe3p/dram: Interpret 0xF populated-channel cou=
nt
> as 16

Nit: No need to mention xe3p
Just
"drm/i915/dram:"
Can be fixed while merging
>=20
> Wa_16030862157:
> Interpret 0xF populated-channel count as 16 The register
> MEM_SS_INFO_GLOBAL [Number of populated channels] field definition is
> updated with an encoding for 16 channels.
>=20
> For 16-channel configuration, program 1111b. A programmed value of 1111b
> must be interpreted as 16 channels for memory bandwidth calculations.
>=20
> The MEM_SS_INFO_GLOBAL populated-channel field is only 4 bits and cannot
> encode 16, so on Xe3p the BIOS programs the saturated field value (0xf) t=
o
> indicate the fully-populated 16-channel config (4 memory controllers x 4
> channels). Interpret it as 16 and let the bandwidth math handle the large=
r
> channel count.
>=20
> v2: Limit the WA only till NVL (Suraj)
>     Logical separation of WA (Vinod)
>=20
> WA: 16030862157, 16030875223
> Bspec: 69131, 79482
>=20

No need for this empty line

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_wa.c |  2 ++
> drivers/gpu/drm/i915/display/intel_display_wa.h |  1 +
>  drivers/gpu/drm/i915/display/intel_dram.c       | 14 +++++++++++++-
>  3 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index b4c49816f7eb..3662e0f17c69 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -140,6 +140,8 @@ bool __intel_display_wa(struct intel_display *display=
,
> enum intel_display_wa wa,
>  						STEP_A0, STEP_B0);
>  	case INTEL_DISPLAY_WA_16029024088:
>  		return DISPLAY_VER(display) >=3D 35;
> +	case INTEL_DISPLAY_WA_16030862157:
> +		return DISPLAY_VER(display) =3D=3D 35;
>  	case INTEL_DISPLAY_WA_18034343758:
>  		return DISPLAY_VER(display) =3D=3D 20 ||
>  			(display->platform.pantherlake &&
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 92b3980bea84..338b32e4162d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -54,6 +54,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_16025573575,
>  	INTEL_DISPLAY_WA_16025596647,
>  	INTEL_DISPLAY_WA_16029024088,
> +	INTEL_DISPLAY_WA_16030862157,
>  	INTEL_DISPLAY_WA_18034343758,
>  	INTEL_DISPLAY_WA_22010178259,
>  	INTEL_DISPLAY_WA_22010947358,
> diff --git a/drivers/gpu/drm/i915/display/intel_dram.c
> b/drivers/gpu/drm/i915/display/intel_dram.c
> index f103f7cba018..0763d0bfd98e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dram.c
> +++ b/drivers/gpu/drm/i915/display/intel_dram.c
> @@ -13,6 +13,7 @@
>  #include "intel_display_core.h"
>  #include "intel_display_utils.h"
>  #include "intel_display_regs.h"
> +#include "intel_display_wa.h"
>  #include "intel_dram.h"
>  #include "intel_mchbar.h"
>  #include "intel_parent.h"
> @@ -794,7 +795,18 @@ static int xelpdp_get_dram_info(struct intel_display
> *display, struct dram_info
>=20
>  	dram_info->num_channels =3D
> REG_FIELD_GET(MTL_N_OF_POPULATED_CH_MASK, val);
>  	dram_info->num_qgv_points =3D
> REG_FIELD_GET(MTL_N_OF_ENABLED_QGV_POINTS_MASK, val);
> -	/* PSF GV points not supported in D14+ */
> +
> +	/*
> +	 * Wa_16030862157
> +	 * MEM_SS_INFO_GLOBAL populated-channel field is only 4 bits and
> +	 * cannot encode 16, so on Xe3p the BIOS programs the saturated field
> +	 * value (0xf) to indicate the fully-populated 16-channel config (4
> +	 * memory controllers x 4 channels). Interpret it as 16.
> +	 */
> +
> +	if (intel_display_wa(display, INTEL_DISPLAY_WA_16030862157) &&
> +	    dram_info->num_channels =3D=3D
> REG_FIELD_MAX(MTL_N_OF_POPULATED_CH_MASK))
> +		dram_info->num_channels =3D 16;
>=20
>  	if (DISPLAY_VER(display) >=3D 35)
>  		dram_info->ecc_impacting_de_bw =3D
> REG_FIELD_GET(XE3P_ECC_IMPACTING_DE, val);
> --
> 2.50.1

