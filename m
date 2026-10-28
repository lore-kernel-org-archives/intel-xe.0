Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1B606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HjrM4Ogf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951E210E608;
	Wed, 28 Oct 2026 13:37:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782D610E608
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793194616; x=1824730616;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8OrDE4LUc794JGm162NzIHkk2uRNbaaiJaxQApj/8so=;
 b=HjrM4OgfWBSdfZCEkSKJbvXqKZIvIMLejqJsulMoRzOgEtYiONAvLc7t
 zqpeLGHAu0a6XI8/WyoQZYKor3+/ddWMJD2pFmaqzc4BCCraJrNZyirmA
 fVN9GTvYV9fl+JXVRuLQZz3AAyI0mSxPV5wBCdsnrOKbfM6RXqEvCwzS/
 LYy6cjHpglZzn1nMagBxlVP+MUT5lHe4LfOtU/AuiJvFW3Zq/Kdk0lcWE
 fd0Itttem4jsq38NEgc5oxG3bFcNlZoeJBTr1k6IccpnZ3fz3rUvMuqvi
 eNkJtQL8xA8WPfuoGOEJ5hasD3GOulnltA7NLail2766OODImM+GFLk03 w==;
X-CSE-ConnectionGUID: LU2aCK4rQxe6nJF6eO/h6A==
X-CSE-MsgGUID: /djehdqTRtymAKuYBk8ZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1800321"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1800321"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:36:56 -0700
X-CSE-ConnectionGUID: oN1FxJTTQMWCBidtqn2vow==
X-CSE-MsgGUID: jl/AAEUKSWWKd+GndHvvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4853489"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:36:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 06:36:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 06:36:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 06:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7x5iUjRHdRnSc7+j3mufjih8IAOyd/Xw1Jm1k9H0pN+cFf+JqfWVjvKYolHVC4Xxip2cFBIAx0PQt7BmfxWMBWhpRj5j3rksxEbzb9niVEefRXqMvcxnA0g3HGo86oaOHfliYohBo931eZLV+j8swqKipO2rTtQ5hm0Lw8fSH2iGw9vdQSVwu1rJKgPHM3vZc6+WsSfsy4pHvKILAXiEOT+nV0ierGxonojBLc7Y7EWXI0n+wfhp+lyiUI9lcdlJPhbNv4PGfB2ok7nENfMeGePW8hmsMt/SBnvV+Z6wqGDzYW5lABmWWGIgq2Pa5HWYGxtAfK2GHyCAafrdmEx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGm2eoSpz0r7enHCNXFOGYB24jirqjeDrwzPSa+m0fw=;
 b=MC9LIL5VS7BSEwuBwfPHKA1hE0i+lm6jloaUt2kEa8+dVfxdiltzLdiw8HBEkIrdRg7SPq12wdn8Cy9uuh8r8IT4HlbEIOJFVNP0Aal/wNPirf7tKni3NVN7q+J4rG14OllRhJ2ZSEYJh5AzAxv8HY/vXJx1oWFWhV+N0Vr/aBYge16Apv29HgVZoS/nYWj4/PUawI3l+Rx+Yiu0E8CgzHGgwDClyg8rmcbjmsZvz4vm55HMjNoySg8Rh7Tdh0n0ARV5T6lYdcuNagKIFvJjriAg9naZeq46DguGgH/ZoIGIT4rE5uHuqxq3lZR5fS3zfN6kzhXgcDn6s1A74AANMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:36:50 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:36:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Thread-Topic: [PATCH v6 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
Thread-Index: AQHdZdHfiYLgYSZTM0OLsLPcT3ZfpbcS9usg
Date: Wed, 28 Oct 2026 13:36:49 +0000
Message-ID: <DS0PR11MB87181288AFAAC0B190B5E09E816F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
 <20261027051024.465587-5-naresh.kumar.g@intel.com>
In-Reply-To: <20261027051024.465587-5-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SN7PR11MB6826:EE_
x-ms-office365-filtering-correlation-id: 299098d0-186f-436f-aa79-08df34f88517
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|261026140227099003|11063799006|4143699003|56012099006|261021123027099003|261021135927099003|261009223027099003|261022075727099003|261009221727099003|261021121427099003|261009221227099003|261009223327099003|261009220027099003|10067099003|261022105027099003|3023799007|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: NB42KJYJYTrqScXfFvHtC1VslFRY/YOOiPbPPMAej90Dj0mg0OeWHVZlN6kyRGrvhdlt9bDGGkieCmLl2ya6yF1CFjbyuf8EM9I650fqCX6j7KjV3Q28p7yZ2Knna29+5VriaxHhxwndUrBeYYsOSt07FewcIzx63r7pGCOU8xwCb5LBkkHQZiWJax+qqV7RM44NdqaMxaa+y3nmou/wKX9489GDLcumkwuxr+CCfvjquM+6QwxORWoFGp6YF9b92m0c9+v9jzEVCApEUvVZmJkKVsE8CxxJH0+Da58cRoxCtMWoNU+fdJnLFOVszl82nLEDaQ3K9IXno/shUvFzQgSbYaGbW3nBhV1S0B4uds70R+wmI5akwYt8gH4WU2m0Vf66ddKhMJOnClXpjI8JgFEFAsgiuq6Vh/SsoR7j63YoNa7WbeNt3wrqUPANB+7gC9ztkXJ0qhTvgc9TrusVlHvLG3Qj1LOZS3Hxythtzkh9jYjPj+ncawZDvqrVGkFvg7sCsyPogkgC0BzDcw9C//+4E0F1gwMQq2KlQUlIeU/ujQJbtJi5A4EgAhFrEFn/StOGYPCkGKNlnY0ZlDxVehMtv3vikDkd40QmHqWQAcggpAjhQDXmy7JB+eedqnMGgHhYxzGRoIOCSlY8GqHbgdaUc9uQVoyxt2nFoxiJV6AWXuUMcE26GZpcJHLTPiYUal26U/NLH04gfDzl64f6F4DbPf2/zHFWGFkKzBoib7g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(261026140227099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021135927099003)(261009223027099003)(261022075727099003)(261009221727099003)(261021121427099003)(261009221227099003)(261009223327099003)(261009220027099003)(10067099003)(261022105027099003)(3023799007)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4Kpko38TN3+9/v4d/YMfF2wzD/olNVMSpRtnp+CwwXkE2tMXtge4dsv1OKyd?=
 =?us-ascii?Q?xTiQmkI5QYIqOJUMJtkN+U1xKyRuw8QldSGENZcgprxyq2mGWg2CMicVRwNg?=
 =?us-ascii?Q?01GIo5q6ZPu1ZGeCkGmK9S4JXfMZBFHIgikRJPvvz82cL4GdO8knA6jo/muu?=
 =?us-ascii?Q?+m8qomrdZvDdc7mnHoPFg82zOtRhxZ+SfphTVP6nMwPSHD1Gpst4/+11vCfo?=
 =?us-ascii?Q?AzsBpPM0ihkyuT2V8s+E3eu/pvXgb1uKJD8aOIqrAlMGmyLxOvkVrZSKTB0J?=
 =?us-ascii?Q?uIgHNbOJySO2obmrJvU7vpTPQfYIaQeqWvih79k987fkrTA7ksbSdk7ZkDaW?=
 =?us-ascii?Q?ukiZewJ7zDtUmCKGh0E41UUT/r2cbEzplcGR6GZrjrJ9HxH9Xs68amlh1WJ6?=
 =?us-ascii?Q?TGuh0iUH8ufj4rwyWXseRM6SpL8v0er6fhZMxpwuI1P4cn5w/0nid9jgNUDV?=
 =?us-ascii?Q?C3ru9LkUQ6makkksC4y8wTLYpd8qJU5lYtfwEbejA85+LTGMhhpi4pp1OgkK?=
 =?us-ascii?Q?VMUnHwSl3E7ltOdTS40M+hZNNSrXtkNCcLU5Nh9iI2SYSGQFxRrKcz26d8Ag?=
 =?us-ascii?Q?kGT97PfIkUZGWFhte/PbrNaEAshf9ygqgUiu1xsCHiQwS+4jPUtb3j3UrNEw?=
 =?us-ascii?Q?sneKBtDaDZx8RGN/7ubRIs8h8csV+fdudKecveNGRfT+tix6+XiTsCCShhJ7?=
 =?us-ascii?Q?VC02tNwyvRXn8k2DrAlt4DZtqIOgFu4ZK3KFu+9Dd/Mm4/1JJQ6SngeFBl1z?=
 =?us-ascii?Q?+MYc63Jnd93k9ICtsfIvUztfjSX/buuTHQIv+ls1mBZOQrrMxXj2epieRx6p?=
 =?us-ascii?Q?Jo4GZvG/j1aBazek0aRVFTcaUp4K7b6VfsSdzcfFfoQ0KJxszwWGXaDNwZM0?=
 =?us-ascii?Q?DusYEEkKJTzNpmxeCn8McgggN5mkvuqAxFHJO3omWDo6B+BI8+e4Tex3UeB1?=
 =?us-ascii?Q?T4pNRNWpIjqLWunl1EpEpiMDDelxNuFV/5JQ4I7kTz/uhgYq4CcNoKyl+8D6?=
 =?us-ascii?Q?trxrABHWrEOrj19Zp+HXc7TOUyr95LmlT+jx50fi/Eaxg2maEnnCuDeaAVgV?=
 =?us-ascii?Q?INtr2y0d3YuMTiDsAyS8/GjKVgAITECZZ0IN06cwmcfHcbbIsnNGJxHRzqWg?=
 =?us-ascii?Q?DKoZwoRdPiyUuyXebOW2stKCchsdtH2JHBvePIavbrbWusQrmNyuhvon2jHE?=
 =?us-ascii?Q?dRdYhz9Y9SI3gOwcBmYXug6L2iR8Wt6ADSjKVf+P1R2NjGsAlCsRgolKsgZ5?=
 =?us-ascii?Q?vPZOz7sHBl8pAzlYpP2k0q3elF4hlbbYbatRjJtAURh/su206Oc/c3SIjcqB?=
 =?us-ascii?Q?KZswSQqb2jMBLfHquvw2/SPT0v32OAxQIFd6lCFe9IJkE84xbm+QF1Ow9X8g?=
 =?us-ascii?Q?h28nTwb69aLdu6sXT3juBAOY9Pzs0JkFe7MEaZ8RC3ARbkwbarFZofRmTQan?=
 =?us-ascii?Q?/yWpj3sPnq5g77XowI/EIjNyJRgbGlGUkUf1t8Bds7+qnbzDEg8xNsLiUry1?=
 =?us-ascii?Q?5VY4jHxZnehQpYalsCAC8y3G+yn/gzMNYNqTqSMPE5zrwtLqnXiUpMDeGNp5?=
 =?us-ascii?Q?BaajiSZoDRXsHh9OMTP+/yesyWidY9+dtE2LmMShzYMFbYUiTkLJYN3w3CuU?=
 =?us-ascii?Q?JMK8Ii3lik92GoITqFxkOStuoJ+IGiDneZ231rSjyHIBtvWpzhVpmicXXq/k?=
 =?us-ascii?Q?YqoHYdemaoNA0kNI9nrKVWb3B2z8Fu/niFzV7kPuBKLdXPQoS1ffLs+H7x03?=
 =?us-ascii?Q?x3ZzLzamFQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YsSew/lG9fO0IfV/95b1GWe1MqYTB+VhAeNMGvcFIaHYhSi9yTgpdkZwSo13yTk+fCSUa2lZf7CUvVeub+hnNt8RJs37xsaVmmm6pCRmHV3H9fzf4tamLungHpI9ux/JQBOH/88WW9fzYHWTG+OWSs/zvYXAohhL7mgsqHRqK6ovKkI6CuViVRJZor9WKbSmLCvq+AnDRk1aa3Y7stwQEa0+QqJMXvgDVIVI4CkDgkjhoRDGqIcLz4VObIvcohdwGDghXx8GGrJjIryq9QaRTfiSZBN6ksQQb1ZjqrkoPwEyOZsND9obUvgTo8fPMQTSM7pHMb8+xGYE2aOSFBuL2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299098d0-186f-436f-aa79-08df34f88517
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 13:36:49.9139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdaTszLpl8lV/emKXaf+w5jN542fSYhEKgWaskcEb0KI1/b3gXE9au3Va0AqONZteBSd67fm0PmkZwrOCRfZBuKqO9RkuT52vyBBv72MJE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
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



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 27 October 2026 10:40
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v6 4/7] drm/xe: dump GAM page fault report registers in
> devcoredump
>=20
> Add PAGE_FLTRPTQ_HEAD_GAMCTRL and PAGE_FLTRPTQ_TAIL_GAMCTRL to
> the Xe register definitions and capture them as part of the devcoredump
> snapshot.
>=20
> Include the register dump in the devcoredump output and release the
> snapshot during cleanup so page fault report state is available for post-
> mortem debugging.
>=20
> v2:
> - As design change made for previous patches. refactored this patch
>   as well to accommodate those changes.
> - Add PF occurred print when the two register values are not equal
>=20
> v4:
> Refactored as per the patch1 change(Tejas)
>=20
> v5:
> Refactored as per patch1 changes
>=20
> v6:(Tejas)
> - Changed GAM Pagefault regs from reg to mcr reg infra
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 48
> ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h | 12 +++++-
>  3 files changed, 59 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 220f0968f9db8..ad8aa6e10e361 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -530,6 +530,9 @@
>  #define   LMEM_EN				REG_BIT(31)
>  #define   LMTT_DIR_PTR				REG_GENMASK(30,
> 0) /* in multiples of 64KB */
>=20
> +#define PAGE_FLTRPTQ_HEAD			XE_REG_MCR(0xcf90)
> +#define PAGE_FLTRPTQ_TAIL			XE_REG_MCR(0xcf94)

Have a look WARN comment from Sashiko, LGTM :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> +
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188,
> XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index cd2c641111d68..90e16c89dd963 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -15,6 +15,7 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_capture.h"
> @@ -73,6 +74,7 @@
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>=20
>  #define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
> +#define XE_REG_DESC_MCR(_reg, _name)   { .mcr_reg =3D (_reg), .name =3D
> (_name) }
>=20
>  static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] =3D {
>  	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
> @@ -114,6 +116,11 @@ static const struct xe_reg_desc
> xe_dbg_media_gt_rpm_reglist[] =3D {
>  	XE_REG_DESC(MIRROR_PM_DEBUG, "MIRROR_PM_DEBUG"),  };
>=20
> +static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] =3D {
> +	XE_REG_DESC_MCR(PAGE_FLTRPTQ_HEAD, "PAGE_FLTRPTQ_HEAD"),
> +	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"), };
> +
>  /**
>   * struct xe_gt_regset - Struct for register descriptor list for GT
>   *
> @@ -133,12 +140,14 @@ struct xe_gt_regset {
>   * @XE_DBG_REGSET_FUSE: Fuse register set
>   * @XE_DBG_REGSET_RPM: RPM register set
>   * @XE_DBG_REGSET_GUC: GUC register set
> + * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
>   * @XE_DBG_REGSET_MAX: Number of debug register set types
>   */
>  enum xe_dbg_regset_type {
>  	XE_DBG_REGSET_FUSE,
>  	XE_DBG_REGSET_RPM,
>  	XE_DBG_REGSET_GUC,
> +	XE_DBG_REGSET_GAM_PF,
>  	XE_DBG_REGSET_MAX,
>  };
>=20
> @@ -161,6 +170,10 @@ static const struct xe_gt_regset
> xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
>  		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_gt_guc_reglist,
>  					  ARRAY_SIZE(xe_dbg_gt_guc_reglist)
> },
>  	},
> +	[XE_DBG_REGSET_GAM_PF] =3D {
> +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_gam_pf_reglist,
> +					ARRAY_SIZE(xe_dbg_gam_pf_reglist)
> },
> +	},
>  };
>=20
>  static void xe_dbg_reg_snapshot_print(struct drm_printer *p, @@ -202,6
> +215,23 @@ static const u32 *xe_dbg_find_value(const struct
> xe_dbg_reg_snapshot *snap,
>  	return NULL;
>  }
>=20
> +static void xe_gam_pf_snapshot_print(struct drm_printer *p,
> +				     const char *title,
> +				     const struct xe_dbg_reg_snapshot *snap) {
> +	const u32 *val1, *val2;
> +
> +	xe_dbg_reg_snapshot_print(p, title, snap);
> +
> +	if (!snap)
> +		return;
> +
> +	val1 =3D xe_dbg_find_value(snap, PAGE_FLTRPTQ_HEAD.__reg);
> +	val2 =3D xe_dbg_find_value(snap, PAGE_FLTRPTQ_TAIL.__reg);
> +	if ((val1 && val2) && (*val1 !=3D *val2))
> +		drm_printf(p, "PF occurred, refer to dmesg log for PF info\n");
> }
> +
>  static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
>  				     const char *title,
>  				     const struct xe_dbg_reg_snapshot *snap)
> @@ -234,8 +264,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt
> *gt,
>=20
>  	snap->desc	=3D reglist;
>  	snap->num_regs =3D reglist->num_regs;
> -	for (i =3D 0; i < reglist->num_regs; i++)
> -		snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist-
> >regs[i].reg);
> +	for (i =3D 0; i < reglist->num_regs; i++) {
> +		if (reglist->regs[i].reg.mcr)
> +			snap->values[i] =3D xe_gt_mcr_unicast_read_any(gt,
> +								     reglist-
> >regs[i].mcr_reg);
> +		else
> +			snap->values[i] =3D xe_mmio_read32(&gt->mmio,
> reglist->regs[i].reg);
> +	}
>=20
>  	return snap;
>  }
> @@ -315,6 +350,8 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>  	drm_puts(&p, "\n**** GuC CT ****\n");
>  	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>=20
> +	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss-
> >gam_pf_report);
> +
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>=20
> @@ -369,6 +406,9 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>  	ss->matched_node =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
> +	ss->gam_pf_report =3D NULL;
> +
>  	xe_guc_exec_queue_snapshot_free(ss->ge);
>  	ss->ge =3D NULL;
>=20
> @@ -565,6 +605,10 @@ static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
>  							  other_gt,
>=20
> XE_DBG_REGSET_GUC,
>=20
> XE_GT_TYPE_MEDIA);
> +	ss->gam_pf_report =3D xe_dbg_gt_snapshot_capture(gt,
> +						       other_gt,
> +
> XE_DBG_REGSET_GAM_PF,
> +						       XE_GT_TYPE_MAIN);
>  }
>=20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump, diff -
> -git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 52db64640f89e..fba3d23040b9e 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/ktime.h>
>  #include <linux/mutex.h>
>=20
> +#include "regs/xe_reg_defs.h"
>  #include "xe_hw_engine_types.h"
>=20
>  struct xe_device;
> @@ -21,8 +22,12 @@ struct xe_gt;
>   * of the register to dump its value during coredump for debug purpose.
>   */
>  struct xe_reg_desc {
> -	/** @reg: The register */
> -	struct xe_reg reg;
> +	union {
> +		/** @reg: The register */
> +		struct xe_reg reg;
> +		/** @mcr_reg: The mcr register */
> +		struct xe_reg_mcr mcr_reg;
> +	};
>  	/** @name: Name of the register */
>  	const char *name;
>  };
> @@ -103,6 +108,9 @@ struct xe_devcoredump_snapshot {
>  		struct xe_guc_log_snapshot *log;
>  	} guc;
>=20
> +	/** @gam_pf_report: GAM PF report snapshot */
> +	struct xe_dbg_reg_snapshot *gam_pf_report;
> +
>  	/** @ge: GuC Submission Engine snapshot */
>  	struct xe_guc_submit_exec_queue_snapshot *ge;
>=20
> --
> 2.43.0

