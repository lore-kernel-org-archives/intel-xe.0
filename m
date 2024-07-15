Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B249FC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 20:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851F410E0ED;
	Mon, 15 Jul 2024 20:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FT85IwiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0979910E0ED
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721076754; x=1752612754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YWDjBiTIobuR3vW00D4nJE2nAj5/Nro3++ryi5Q+7w8=;
 b=FT85IwiFmuZWksKt4jRNhY6dFoYhMMZumdRIj+XtqoOfI/OMq3dP3z58
 bhxHqAqckGeCmN50AaD6TVrTq44AT40RCGF9nxk60jFOD3lRpS9BaiqqG
 OIOx/JFXbG7KHKrkXjwzLWO4k7lfUFpCDWc7xJLTyaoDg8Ll8cokTnMTh
 HZAsgJIlVmi/F8ymE07BopthYd1XCzPoCojcO+CBSaPw0y1s+cgjRxL9J
 6g8A06AYh2B0gWe9TPKWF3p509/ZJZX2DNbacrluZtE5nLnBtJ1Cn+pYf
 ATmNB8Ldf6P322KmykC4bJEXKVVkXvF2dIUSqyWYX12bbN/F7XwVNAVMl g==;
X-CSE-ConnectionGUID: 4vtsJfeiRriQfEDlNpCnug==
X-CSE-MsgGUID: E/I0OPxkSS2gmXSgfeyK7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29158839"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29158839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 13:52:33 -0700
X-CSE-ConnectionGUID: T8nnDKaTTrOuRaAzZtVpMA==
X-CSE-MsgGUID: jgjIkgZUROiHWStaGhW+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49495500"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 13:52:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 13:52:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 13:52:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 13:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbwDjzGWS0HkLGBjrxw7xqMS/qwSBdlfy+Gvbx/zI61VCE/61HoV2nQd/edEg9hsKXlrEV1dCO9UcEQXE43P7NfBbxJ5GOU6cGq48z9DsvqNarlgpBijoH0vCv89FTtswb2CZqxFZRDQHP809ynd3k3+SJuPUK5G9/g6UivJWS7WEJgwm1yHYYX5ZaQhtv1AvHXOYGyrNduDmlN1HC3l2vUVfFG5h+soY9o3c5D4ooUOfDRw9aQ7X1CCv/DNKHmRMzTrBLkH2FeGtddLGOBGb9Ohik/OeBqR7pZiDGPDaIKO6mOee/xof6cOJb46gFb+hzAoC/VQYbPf2H5pfzCM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbq2Z4TEZTjw4LyoxiljYXP8Lm+TNxzn064dnNX23/s=;
 b=SfVudrQZukkLd6H8f7MJBuu0RmVEUGPiph7oguMlBPW+nKr+i8lhdsJDqIwPcc4fGgw44TxIu6zLBZ74/48SkoxVc7pjKaI/XXU7FJ1h3bKS6DojbQnTC+XCXdnuFxODERre+zJqa3UT3xYAZN/I2mnnSsa1xzHYsQG7O5Ymo+oVuMc/xe+p0OfHXXrUqWfNiPev1NUtt7WzjNuM6hzQXQgX6GC2U9xn8V+hVYZBbflCwJqM6Fccp4yc62x/Wlh69s7OYzM3H9htldSKpCmu6pUqYszmnwZ0rDCBDLXcQ57FvTmKDKNPn0yk1GyFXL5r9gFTxDkqsq82CF5z+YYcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 20:52:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 20:52:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Add NEEDS_2M BO flag
Thread-Topic: [PATCH 2/2] drm/xe: Add NEEDS_2M BO flag
Thread-Index: AQHa1uG4+OZDJwHFKkq6OuOa2E3bIrH4Qk6Q
Date: Mon, 15 Jul 2024 20:52:27 +0000
Message-ID: <CH0PR11MB54442721583614129A3D5B60E5A12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240715180538.1418-1-michal.wajdeczko@intel.com>
 <20240715180538.1418-3-michal.wajdeczko@intel.com>
In-Reply-To: <20240715180538.1418-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6693:EE_
x-ms-office365-filtering-correlation-id: ef76bf3b-877a-484c-ea24-08dca51009af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QXdG/absfFbQ5PpuhTZeeiAejpeVEK1BAPWpJpC8Hc0l939Uoa95YiVRYt3x?=
 =?us-ascii?Q?x9iCYZN2HQt4Eera9yptZcS94+dqYzbOoawZU/9uf6PzgfZTyY967bES1bhd?=
 =?us-ascii?Q?RR4fqgOctnYXDKOoHoV7E+ikfCPiR4IaeiH39qy7n3mTJcRggKqsGGTbzc4e?=
 =?us-ascii?Q?3A4OGnDUCgDZZJEd4yLPFuI0H+REMxgZPOmNyntLN+frMra+cf6kdvcs+goj?=
 =?us-ascii?Q?OSmtPEV32FfsoHje317BLPs7hrR6PNXBNuV0z2FrRGfkJQ0BOaPxxdxWtyfV?=
 =?us-ascii?Q?TWzTWoZGKWDCVgfrRvqorF6hrYowWjHu9EFpWeBnMB9gEwHW55xcDO67vARE?=
 =?us-ascii?Q?MB0JuffiSBr6a6hzgXOYwxI05c9YDK4QWGmVT5/ywKhOikewEC4s3sfGhpuv?=
 =?us-ascii?Q?XtJckvUDvVlFO8VJHlZuYbu1g+/zeido0X+5Emr/HB4kova9bAvUVyKjPQfV?=
 =?us-ascii?Q?A/WgHuuy3kYqRZ+upWlXy/KKoIpJ+MwUDKZNmeKMEYGmO3HtpdM0bwWa+xsq?=
 =?us-ascii?Q?uKcA3CqhTBV72Sw11lLVnf+24qvnECDb17lNf0x3lCBieXwgRnKQjD2IJ0WU?=
 =?us-ascii?Q?m7iGQawgSATiwev6QT+UgskOMFlU7kDvPZGNhwwudRvw6f2tQUovvE+UbLKy?=
 =?us-ascii?Q?ecpvOLa24r9eZaANoIKub56hgtzjifOgebX5eva+adsusnccCjTgvP2f1MQH?=
 =?us-ascii?Q?I6M6BaEBIu+c2Eyud3ZXyrjtLvFtG6H/ERKxZt5WMQzC+BLho/pQWb5NT7xE?=
 =?us-ascii?Q?DYbcyWehKb2TmfJX04boxJoGxhTv2T+rxnQ26yGBqcyc9vUZ1U7AECexPl9L?=
 =?us-ascii?Q?28ztt/bDjTlLahUPoPsXMP+estTb7davd2DsK7dNjqHxZKGBkvI4WlsnNuEO?=
 =?us-ascii?Q?BOiHZ/iVxdoLj4Vmsg83dxwCKYaLaNNPrHy9/mPusqQWV+29g7eHhXovN3O8?=
 =?us-ascii?Q?/pO1+H8wWXmyjWrxfRqyczBL2aEiRqi08z5XXM+/fvDMvccvv+4aRwivBCh7?=
 =?us-ascii?Q?IFi0RrPSmpSf9AsCeno17f34HEid6+t7o1dj2iAqsP3LAz68qA8uVP5Tx1nl?=
 =?us-ascii?Q?fWVYunw3ZgyTuYc3SjCHzDf7VcC8NTFmEJmBiyQZfvwJ+6LUjoCR3cKI3pt4?=
 =?us-ascii?Q?BBQGcxG2iOjoC/J7TS7+MKgyKkjDyNEncF7cTuBtQjO7bTEd6H/vjIkJFWpH?=
 =?us-ascii?Q?k4DMPAK/++KFqwl7BZbPtO5EwPNzY/5M+7VNBC8PkygYyb26uEon0qITdto+?=
 =?us-ascii?Q?apuP1sqwB0Xy/DJZlNpuNBtUCYUpSJCEX6eqManZVSU+AgSTRdthp5QBqV3O?=
 =?us-ascii?Q?xyN13y/2cUq9X1K1A1YlVqITpX+m/ebeUg4p2P8jkJyZ8t+SyshfB4J+ggVr?=
 =?us-ascii?Q?aQoA1oBEQOVW8+FQ+oroFfsRT+BFE2jBAT/Tgtf81rC12eVDtA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6X40Rdk4xFhZq389Pjjkqs6VM0qjZoqGY0pqyOQ+VA41RASWrIYzwnwfcZKR?=
 =?us-ascii?Q?CPRKtq9/WEl6wexM8nodQorovxw6a/v830HQIeZRgbo+PVcPj2J7+9cOq891?=
 =?us-ascii?Q?4foTT9CNEMSxLpKECbmJOT0ikq61Zy0/sXyavC4NvUCNc3d+B8dLKsDgv22c?=
 =?us-ascii?Q?NyCpMp+KYHNAxmmdiZxfVBoz04hwmXfU0+0jgjXbxi2mh4+flyYE/C1n8rKt?=
 =?us-ascii?Q?txZ0vtTO65kJT9KU0NLbrT3ILfIyvBqFgBzk6VSRoDJ7J/U2iEZBLguWlc1r?=
 =?us-ascii?Q?IZz/QVs1xlSz/LAWtH4hiDX+OkLO5mGml1grmiI6hnIbBVMtYaxOrwzAlMzA?=
 =?us-ascii?Q?5IrB/eEcB2m1DyKAZEABgjPpO8FkymJpVkvMbGLl2lF8lN/Ox7oZM9mKV5Wo?=
 =?us-ascii?Q?HAHJPDNjt7Dp3HDKsOMHbSVcVFHwOihRN3qpGr2kNe7wsKs2dp+vVlYArFAH?=
 =?us-ascii?Q?CgMR1GYULccBEx5d1nDa12dJCJXDYnEZS0+UfJTyYo/ifMy28tlq7x3oOKfZ?=
 =?us-ascii?Q?MGP//bdYtRgsoH71mK5O0tGt8uRjsf7rDPo3GROCP5rHABkUoCQ8wIcJLzjJ?=
 =?us-ascii?Q?eGVy9qjC0d/HtGf5pX+dG31pYjbv6B4QKxp92OIplw2nF+9Z4OKaJEjeWLuG?=
 =?us-ascii?Q?+Noo5DYsKr6HhQ+BzTLMH+eofIXL510wuCCUs4ZulP2jiHuwRE/gQCETnsM4?=
 =?us-ascii?Q?U++B7+baAkZfD7W+FQJwdNCRJiVY32MvwMeGU3cXhpxiBMd9oVpxGVf6YG+6?=
 =?us-ascii?Q?XAAOCvN28l8TysvumobyFsGeYzqORiq6SFvLLEDt83ymXifQaSpMq5YU9S5h?=
 =?us-ascii?Q?xT+lU/aM57yxiVUxHYD6UPEXGZkVdaB6/SQ6c2+dQNuUzdxVMKmbyOKoTUFO?=
 =?us-ascii?Q?e/a9JGKcYHFnu7lXi+cggpZ9F+4Dgzs+A3ORFG+TKdv7+LLqoKd8LcBcnKqz?=
 =?us-ascii?Q?2MDOM7scJY1EHS9WTIwpMkCqlqOh8yehzaBmieRnart5aW8kFmWDOTH+DBUU?=
 =?us-ascii?Q?LGoztSoDT3XahUJt1BlqR+Ey8/8q+SL5MYHRTKG6S9ecnhPo8Z/AIjLdjNVy?=
 =?us-ascii?Q?gczXH1tPPUPV/N5IfCGNDv3Mr/jTo61XJ/tfd0TEyJNBkGF471yB+giAPVV1?=
 =?us-ascii?Q?zOjMPdcRyI6BbDLeQA5xY+yQSUIYpVy41hpeVJ2qpuwkUXKmqMuNkA9r/0NP?=
 =?us-ascii?Q?0Oy08Su8L+IHpv7ewHEKzlOYyX9s0D+1VqPHAfFp3pQOcAK4DG6BPkfoLaNU?=
 =?us-ascii?Q?JKROlFS4RspUkIuvMnMQ+CVFeoqi3hkNlW9ZNWAWWJFP65SnkD8cJpg3eJwn?=
 =?us-ascii?Q?ozBBRiEtqlgzPNP49/2Pggsj5hUHJtzPPfbCODse5BUYTvd3egCQbKwsk7ES?=
 =?us-ascii?Q?QFqnQboekXvgL6Av/KKOU8/tpDNsg8PgylL1UD/DFfzK85dbSGKja46Pnp26?=
 =?us-ascii?Q?33u/q45abEDcT2lLFaaDgBQFPR2kehkgs790O9gLStf95XmzsrbqBBwZNlHb?=
 =?us-ascii?Q?RwadRtpSFhpRUQ7wKdgzJgIu4QIdvHoR3vsSmfEOngr8S5GVEZ2NsAN4FwkY?=
 =?us-ascii?Q?dgstD0zFn6dMPXXS1kwaDpywjHc/4JZsmk4o9gnF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef76bf3b-877a-484c-ea24-08dca51009af
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 20:52:27.9814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TZCFqQMz8J4UXpv2wZP5j/Amp4EHWV0St/zzASks6dQxlYFh55kH3ByMIT5dTfQqe+V88YJr67hsjwDGB02dD3TvfNFBCGZrC9kWmUKhlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Monday, July 15, 2024 11:06 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Add NEEDS_2M BO flag
>=20
> In addition of NEEDS_64K BO flag, add similar one to force 2 MiB
> alignment of the buffer objects. Explicitly use this flag during
> VF LMEM provisioning as LMTT uses 2 MiB pages and one day we may
> drop requirement of allocating pinned objects as contiguous.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Read through it.  Initially felt like suggesting that a separate flag be us=
ed
to denote "any" alignment was necessary, then storing the necessary
alignment separately, but I can see in xe_gt_sriov_pf_config.c that such
a change would not work.  No other notes:

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_bo.c                 | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_bo.h                 |  3 ++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  1 +
>  3 files changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index da35b4a21739..3295bc92d7aa 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1264,13 +1264,14 @@ struct xe_bo *___xe_bo_create_locked(struct xe_de=
vice *xe, struct xe_bo *bo,
>  	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
>  	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
>  	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
> -	     (flags & XE_BO_FLAG_NEEDS_64K))) {
> -		aligned_size =3D ALIGN(size, SZ_64K);
> +	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
> +		size_t align =3D flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
> +
> +		aligned_size =3D ALIGN(size, align);
>  		if (type !=3D ttm_bo_type_device)
> -			size =3D ALIGN(size, SZ_64K);
> +			size =3D ALIGN(size, align);
>  		flags |=3D XE_BO_FLAG_INTERNAL_64K;
> -		alignment =3D SZ_64K >> PAGE_SHIFT;
> -
> +		alignment =3D align >> PAGE_SHIFT;
>  	} else {
>  		aligned_size =3D ALIGN(size, SZ_4K);
>  		flags &=3D ~XE_BO_FLAG_INTERNAL_64K;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 2afc50132c2b..1c9dc8adaaa3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -37,7 +37,8 @@
>  #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
>  #define XE_BO_FLAG_NEEDS_UC		BIT(14)
>  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
> -#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(16)
> +#define XE_BO_FLAG_NEEDS_2M		BIT(16)
> +#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index 4699b7836001..52c7277d243d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1401,6 +1401,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, u=
nsigned int vfid, u64 size)
>  				  ALIGN(size, PAGE_SIZE),
>  				  ttm_bo_type_kernel,
>  				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				  XE_BO_FLAG_NEEDS_2M |
>  				  XE_BO_FLAG_PINNED);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> --=20
> 2.43.0
>=20
>=20
