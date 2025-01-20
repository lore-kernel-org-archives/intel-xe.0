Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8E9C02181
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 13:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0113210E415;
	Mon, 20 Jan 2025 13:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cehlO2AM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6963D10E415
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737380335; x=1768916335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u4Ibu6AkScNnfNFiMif3gVfiA44P4NmYibFVmmOL7Qs=;
 b=cehlO2AMZsMSY95i9l/d3n6fE17WcgMlV5IqWG2KJemlSKqNAtliLTCF
 HxEEGnuP8w9wdCEOTA/LcScwJXLxja0GOS0D9sRuVWyjnZbUUd0IVcKEX
 otlpyssarFbbPIht2xDeVegZ5hoRxk5CnvSXDRXvSu+rlgzhEdx5yJ1pi
 dhKcWMYGOKdcXsbzKqVMh3SQ85u0y3uGdJYxcwscZTGPCWnZl526HLPL0
 8LG5ABz4L9Nz6GxzEAPPgOfVe4Rbp2zV5NXxqTvdGBFCCVqSahx7sKNRN
 iTvoWSu/VWSR30Ba+Y5E2dCrFQmJjiLNYW+9+1v/LZBHhfH9FV5gCrPgA g==;
X-CSE-ConnectionGUID: FDmbFor9TdyJYYkbgmqM1A==
X-CSE-MsgGUID: Vi0v4qPXTPO6obmPGMGH9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41533749"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="41533749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:38:54 -0800
X-CSE-ConnectionGUID: dAoA1vYRRhKFRyc/8icZwg==
X-CSE-MsgGUID: eUepuToNT6muEpwF3ka+OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="106644179"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 05:38:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 05:38:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 05:38:53 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 05:38:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYyLUYlnb5zPi2Z+6mR4qOy7yAUtWdAcRgcuYnJ0ZS0zEIkNTriP6950g23TaKiqE6dynpUzADjoxRyOV/OHtTryGv44dVDEn4yCZhe/1N0gJdhIlgbENBMQdzf6mr/iajuIjMXhsT8frSx+BAgLik4GZRW9rV3z58E63Nbi2uPVhSSVtQstyDyZjTrH5UBzfs93rVS9K1CjI0NUg+pWy8hIlaHbcSK0biSX6y/lx/sSm3xknOIvyttsXlXWUbFjQKQOr+G8PeoTfx7iDW9VboSJEaFQ7IE7IRqCJO7qP+zePLSVnbArjGXagPgm6J5tpZixDEAt3d5JZG+pKEAyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHT/jwQXV4ECeWCzuNkNyQAZVRsHtW2GFhd+kEyEnlA=;
 b=xgrqZOG/WbcKkridjfbReRoR/9GcNuwWfuiXH4uZ1Q0tPE6zdatFgb2G2DgN2Wq84aRyU42+RmiYS0yaLz9KI4dw26x/9rFED3BGzv7wO4hvKKuQs2bXWsy8+H/3YLQa9VieaR4d+qyeIEiUvPWtocG3HsC7OrG+ULF7cEasvSf8Nq1GL7LJWwIu5nD9kU0tXh6AkVM4w40VbgdKGJHYBn/JH4yfiHBZ/Ec15nXC5Htab8DTjkP31NWNCDR78hc52cMpXTVOhuCJXD+h8VjHMAk1KCJMppKPR5U2wJl1/CldVywhB9zcoQQkgZINVyWrijT//JwDhJQIzkKFimycGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Mon, 20 Jan
 2025 13:38:50 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 13:38:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Siddiqui, Ayaz A"
 <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH v3 2/2] drm/xe/oa: Refactor WAs to use XE_WA() macro
Thread-Topic: [PATCH v3 2/2] drm/xe/oa: Refactor WAs to use XE_WA() macro
Thread-Index: AQHbawHNg68MHklcYEOod5qLCrc6e7Mfqt+g
Date: Mon, 20 Jan 2025 13:38:50 +0000
Message-ID: <SJ1PR11MB62048C72AF30889B13B37C4681E72@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250120060916.778406-1-aradhya.bhatia@intel.com>
 <20250120060916.778406-3-aradhya.bhatia@intel.com>
In-Reply-To: <20250120060916.778406-3-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CYYPR11MB8431:EE_
x-ms-office365-filtering-correlation-id: cb27a759-b1fb-45b4-3a2b-08dd3957c633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6HR5J3E5VgmJo6e29c0kQT8mXl+MuanDb99axO+mkmz+Lgt7v3+ASmXnM9SN?=
 =?us-ascii?Q?xgfEKqk55J/Rt24x8wFsSAHYJy7dzE26SMsUwL2g7XARHyQ0sf7zAqF26RPU?=
 =?us-ascii?Q?6CxvZafjqoGWFPuO2Eo8sEoQuJRg44luOt7AL2iIt0RLT8SWLp901mPGD6VI?=
 =?us-ascii?Q?thRpN3UablOIkodRHWtTwkXD7nWViCtfHtI9eM4MY51r4hYzHAveIKx/4zWU?=
 =?us-ascii?Q?nO/1v2LYiMlE6U1eluzEDhI/akkQeZnLhvVHlvI80ZcaY9VetXIfPX9HGozN?=
 =?us-ascii?Q?xjHgXd+shLIDypZkgDtHrzO4cQpghdEWVpu/DHXZAjrj/lAkOxwCMR6yUMhh?=
 =?us-ascii?Q?N0sDS/OvfQCYo9hF+MddQftg3Xwd/xUOa9EI9YOlBm+DAlnJsoFApkcn3nTS?=
 =?us-ascii?Q?6tmmfbVuMqoQjATQHbgp2kRefgHZw/qU5j3Gj+vpY6a1e3SNTrduvoIx2w4w?=
 =?us-ascii?Q?vNalx/l+uhFGS5fETP79XjLxQLXI2AeOnBvNaDrGWdQLlMgrxldM2LaSCq2D?=
 =?us-ascii?Q?FIFggCBf5U4g8nSa+JFHrDCJA62WmtzVb1+aQ+HW7kdPLWlE3xiZ9kxFQPbG?=
 =?us-ascii?Q?QEzVyaeLHlzdTkazYnw6d6iYritrUxv5lDnAH7vkVuBBCp5+OHZ+WzjAckNn?=
 =?us-ascii?Q?8UZWCWLFUzBhRMko9LotBhdwXeHYqWxDSFvxaQ5AgDE1AhGwKf86z+/d6zJ7?=
 =?us-ascii?Q?6FwODhSF8+WrVZOh4D0z6Ks1qcb6QnynroqNXeM1m2WzA/Mtwdjm6QxASbV8?=
 =?us-ascii?Q?fFvP0bsa+7IJKh3K28GOU/ANUnR5ZOQu7jv3d3PUbobgGNt+lxkBZgQesWhZ?=
 =?us-ascii?Q?8bUdKSEpxxUOaThJTJv+ZscSYdSHevGtQ+4hFeiSfsCJ51xOuj0HLY8IkEfm?=
 =?us-ascii?Q?sSnG2k6N17+1s0+XltX2CVzpgRb/vRyIFK1rLJl4DU9u+YIE6q0sa4Vd773X?=
 =?us-ascii?Q?5Tv4uZlVEEoNGJPqAS61bONDoYOp/Cs/qxlH/66mr1gU/SkfSLzO+XSkbqGq?=
 =?us-ascii?Q?2YRZkewb3MGjiYskYDLNzATam1WOjHiCPbJCVK+F1O5Alp2IiIzNt8HsxN4y?=
 =?us-ascii?Q?17s4mEjE7ktECX35tzXzb+XUGUlHSkyxXHgg80sfpws+NslBZbq/YcTZgYlX?=
 =?us-ascii?Q?5eGbiY1qt6w2du2/jqHCEYSrBShiW7gksb7dLT/hWu+GEemfI5+kaFJNhyoN?=
 =?us-ascii?Q?AJ8fgSiJCMPl1hsR0B4csL6AMPg9zw6Rl6np6CuXeOv0VIIqCrS/L0Y2MFfq?=
 =?us-ascii?Q?3vP148FY27uJfMnuc5NsD/LVe4CPZSBIkFwi4XjAoab1tFJ7o7JqjHHFijXr?=
 =?us-ascii?Q?M0EwyTrwcqzR3Lae82v+//Laf7jY79Lb3m1+kYscOXcve6WqYrH1MLC+OzoG?=
 =?us-ascii?Q?94liMv41OwDobFlTm5Txd9tM+gta5D/tkPZVw4vg87SCZ3hQpOOBE5D1f2Zc?=
 =?us-ascii?Q?93Z1MGeoHQaUpHLMLcuBrWNCc8KDm+Su?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FKo3Y4STMl1AJVUIhjte50HhymtpvFZxUKE00EIgspehk2T+jDWGc7+qvIx5?=
 =?us-ascii?Q?+ZRZzRoBMeaH3SoQ8jRy+x3tc6eQMmyPo/wJIB5fOHZkzKmV5U2kT2BA6Glg?=
 =?us-ascii?Q?luMkQL1UyRgohgm9i5blONPiLIjdcSkc7oNdxCjF3QBrc1SzxHNm+i6b8gqy?=
 =?us-ascii?Q?LUZG4JDLsjlht67iBKuKhZAAKmHVa6OVr11YTMg9wDAhuoME/XKd4zK1ES7Q?=
 =?us-ascii?Q?s98z1KPLKT2AOo6GAKmdopIRiEQN5s7BpACYo5yIjjjSO/p8SIk+827Yb1ct?=
 =?us-ascii?Q?f+gsu09LOraUBXEeVo/msFAvQpDUwRalbTfUlRpsTqDOM6hZR2sC6nwFoueK?=
 =?us-ascii?Q?quSrRcSz1jPBJgrDp/D+g4Msp5e4DD4UvmSDHc4p6wMm7vsedhVeqPcNqUA6?=
 =?us-ascii?Q?8J7EpUEXyDck5fT4aFQxopijPR057qsuyeB6qO8UrFfWXd1r6xtajn0PCwNF?=
 =?us-ascii?Q?FVotNQdig3QqHp8mkqB2b6RET6Ppab2j/4/NQmkVNa8qI60Z0hMO5cf+SYxI?=
 =?us-ascii?Q?t4kG7OExKiiZcNILcic5ZX3ZZxmxYeJgneZGGPNRIoZc9ZNfbZGAwIYb1rx8?=
 =?us-ascii?Q?rCBd4xDCThOPLiiVBLmSeeaT3BaLePq9nXpUzIEmm9HvRht1147gJO5FRhA1?=
 =?us-ascii?Q?MeORA3qKIp/9Awb1V2herOLZQQEa4AXWsvUuEdOl5jqoLfMN5M35j1frCdLW?=
 =?us-ascii?Q?q2sRXuA0OkWvatx+FZ1Pvi6jb/RdZizZCvUnijAa7Dfz4Pyg8uyWxjgg2+0D?=
 =?us-ascii?Q?LA0T9fC41CIPeMLQPxAluU84sGJR+QcDb0g7b9VXijQqBT8QiwuEteUxU+Ng?=
 =?us-ascii?Q?sHvNpo2/6kgk0loXngR3U7mxDamrlPAuYw7fzPfiM01aByiZHHlB1ILm6yVk?=
 =?us-ascii?Q?LhBdw0JZ90aoqxG92WzmvKtfplq2d7nDOGVGbZAU00LjR7kKF/aITlyYZmkV?=
 =?us-ascii?Q?9OT1nHakCc84m6mGKwlBdNgmvL2VtVdVvcEwNwLCehM4BMQ9gx4uLfANclzo?=
 =?us-ascii?Q?RaVIgW49AdOh4LUgaI43PPIWm7gSz3Dok8QtDOMgFSccY6h1T7XMLn2MlOKR?=
 =?us-ascii?Q?b0s2ChoRlkke2YMLvjZ1GUV64ZBWdoxOkW6fCq2nV2/HgCG8zk+0iXfeDkYi?=
 =?us-ascii?Q?NVULsCjotYxaElTdZQiM2F9LEc6NssHGwRs7COngLGFXBrdQ6Co4oo4op3dq?=
 =?us-ascii?Q?fmBpNLgq2cmOUUErZT1kujiX55p0VvMOU/q5nEoXxayVX372FSnKQ4DIhBgM?=
 =?us-ascii?Q?0GYIy3UMsmWPJBRFDdM2MthWSMgHhK9ej8xsCS7Jzobx3kTQVWKbAalXs7+P?=
 =?us-ascii?Q?OfF0EYqSJ3akjkofpr6PxPQfd5zla4CJBdWMuLyla2YmKgkJfxBf7aNfnXiK?=
 =?us-ascii?Q?CBVu3FabRiyuaapmwZp83Yi76RaycwAEvuURtbxgrDbH+rQ1Ghe++IgbgrDG?=
 =?us-ascii?Q?z5bQkabWC+wdn0RCDDaZ249z4sU9AMBd7bBb+k3ncZjQr/jRc8E/28BccIXS?=
 =?us-ascii?Q?PeFPHEIQy+xnw14RP8CRdixGZaIuyreG/mhVQEciZGh7IZKNRMVmd4syNa8G?=
 =?us-ascii?Q?IkLiPsjXY48C3rqCTgrjUZyHTKg2AwNMb2ZtS4Tp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb27a759-b1fb-45b4-3a2b-08dd3957c633
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 13:38:50.6262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LpbWN2kODuHu6iYcwhqR+4gVg9mwbBTbG8EF2nH8dxJwgL8bJ/7Sx5ZHjL1icyGZzmzaEv3AIHVYBSVGNPqxjUDqPPOzE7ZEQXICxhRCocU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Monday, January 20, 2025 11:39 AM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Siddiqui, Ayaz =
A
> <ayaz.siddiqui@intel.com>; Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Subject: [PATCH v3 2/2] drm/xe/oa: Refactor WAs to use XE_WA() macro
>=20
> Refactor Wa_18013179988, Wa_14015568240, Wa_1508761755, and
> Wa_1509372804, to use the proper workaround-check implementation for
> out-of-band workarounds, XE_WA(), and drop the use of the platform based
> WA selection.
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c         | 30 +++++++++---------------------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
>  2 files changed, 14 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c inde=
x
> eeb96b5f49e2..493b48a399d5 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -12,6 +12,8 @@
>  #include <drm/drm_managed.h>
>  #include <uapi/drm/xe_drm.h>
>=20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_engine_regs.h"
> @@ -35,6 +37,7 @@
>  #include "xe_sched_job.h"
>  #include "xe_sriov.h"
>  #include "xe_sync.h"
> +#include "xe_wa.h"
>=20
>  #define DEFAULT_POLL_FREQUENCY_HZ 200
>  #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC /
> DEFAULT_POLL_FREQUENCY_HZ) @@ -808,11 +811,8 @@ static void
> xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>  	struct xe_mmio *mmio =3D &stream->gt->mmio;
>  	u32 sqcnt1;
>=20
> -	/*
> -	 * Wa_1508761755:xehpsdv, dg2
> -	 * Enable thread stall DOP gating and EU DOP gating.
> -	 */
> -	if (stream->oa->xe->info.platform =3D=3D XE_DG2) {
> +	/* Enable thread stall DOP gating and EU DOP gating. */
> +	if (XE_WA(stream->gt, 1508761755)) {
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
>=20
> _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2, @@
> -1061,11 +1061,10 @@ static int xe_oa_enable_metric_set(struct
> xe_oa_stream *stream)
>  	int ret;
>=20
>  	/*
> -	 * Wa_1508761755:xehpsdv, dg2
>  	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
>  	 * Disable thread stall DOP gating and EU DOP gating.
>  	 */
> -	if (stream->oa->xe->info.platform =3D=3D XE_DG2) {
> +	if (XE_WA(stream->gt, 1508761755)) {
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
>=20
> _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2, @@
> -1716,12 +1715,10 @@ static int xe_oa_stream_init(struct xe_oa_stream
> *stream,
>  	}
>=20
>  	/*
> -	 * Wa_1509372804:pvc
> -	 *
>  	 * GuC reset of engines causes OA to lose configuration
>  	 * state. Prevent this by overriding GUCRC mode.
>  	 */
> -	if (stream->oa->xe->info.platform =3D=3D XE_PVC) {
> +	if (XE_WA(stream->gt, 1509372804)) {
>  		ret =3D xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
>=20
> SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>  		if (ret)
> @@ -1853,23 +1850,14 @@ u32 xe_oa_timestamp_frequency(struct xe_gt
> *gt)  {
>  	u32 reg, shift;
>=20
> -	/*
> -	 * Wa_18013179988:dg2
> -	 * Wa_14015568240:pvc
> -	 * Wa_14015846243:mtl
> -	 */
> -	switch (gt_to_xe(gt)->info.platform) {
> -	case XE_DG2:
> -	case XE_PVC:
> -	case XE_METEORLAKE:
> +	if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {

Though there is no mention for WA 14015846243 for mtl, its covered by anoth=
er lineage. Looks ok to me,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  		xe_pm_runtime_get(gt_to_xe(gt));
>  		reg =3D xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  		xe_pm_runtime_put(gt_to_xe(gt));
>=20
>  		shift =3D
> REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>  		return gt->info.reference_clock << (3 - shift);
> -
> -	default:
> +	} else {
>  		return gt->info.reference_clock;
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index d7f7d617d490..5537b674ab53 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -46,3 +46,8 @@ no_media_l3	MEDIA_VERSION(3000)
>  		MEDIA_VERSION(1300)
>  14016712196	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
> +14015568240	GRAPHICS_VERSION_RANGE(1255, 1260)
> +18013179988	GRAPHICS_VERSION(1255)
> +		GRAPHICS_VERSION_RANGE(1270, 1274)
> +1508761755	GRAPHICS_VERSION(1255)
> +		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> --
> 2.34.1

