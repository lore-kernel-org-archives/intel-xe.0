Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA20C49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 14:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19C10E396;
	Tue,  6 Aug 2024 14:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0C2mh4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552210E396
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722955135; x=1754491135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ffVNp5AmoWMm9K7Q1vk7RTj38FhNj7YuPAxPCOgmaRA=;
 b=f0C2mh4mb1mKZhrxwfsJWYHsIqH5UXuI/vkaB4YiY3+KBZSGya2yxm5q
 n/hMeOamf6mZQi1WHos5nA2R10XRwBRyQZfrjE1IO0mlK/uddPBcNIidd
 DAUomk0Zs6iruHKMvtis7hl25LJX/Ts/7M26xMb1mwjWYSPuxuMosc5eH
 IwGt9S3lPktWEgcsc31Ck9H+4JbzZ+OY4nW0RGoSkQC8m34CU3Qr+pbaU
 77ajT9nfxNwSF7kKvjnU+0JER5zoSh+Hb2qZ9FQ64VOEEbwxHwAG19FCT
 TXFDWZtWTzvfs7YEtC1ZcdsVBU6Kagptx7C4kfXwifaXjQgjLfTzUOvf2 g==;
X-CSE-ConnectionGUID: y6TuckBRS4GiwM2bclUqXQ==
X-CSE-MsgGUID: bwUG6GgYQe+mkgmM3n8nKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21099262"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="21099262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:38:54 -0700
X-CSE-ConnectionGUID: 4WVourIJROeykyeNDM3CAw==
X-CSE-MsgGUID: N+MUeB3aSvKciPacVC/HGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="94090478"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 07:38:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 07:38:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 07:38:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 07:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCklrBixNuM9E+xkbncV+kVUzlhd2pK9jUQe0NW/+W6U6jZ2LkpTR6OTjdQJKm+Weq3Vtu6CpkNXJFPPgLlwyYnT0jsy3heuIgp8N0P8f+D/FJA6c5Bk8tkpxjzOlbi/1yANA/J5u+MbQEt0BxLv24yo6611iFDcehknnEVkp5wdoOBRdGK8ru1HjpOYblbGCFen2761Xhh5EIwtBfhqDnUywgerElOurELP5nNF1VHwtweOkpxydS9dEbAdfXjVW4FhNAfzLagMA2I4RmidHKW/Ugd0R32G8t4TtoFVNV0/z3eMdx6ve8akVmqhlh0OoJOK1Phza+xLEvNkeznohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP2ivfxHVYKmaGSVW8PZKQRDsGR60fYDPjK8xBtIW34=;
 b=JjrB6iQS2D64319LO2nS18x2GhSyE7gGVHZHpQVaJP8GYJ8evhSCkyU0NYliaVUoCkeZ34Ic+nN2TfvcN0CSYfA4fK5+6AL/CH/cGzVl1MsWt/ex3I8LbPMZn0oEhFyugpTkfcSFU40WvJcY6fgJ5MYfkdlmFWzTNL2+cbG+7fI479k3VHWackOmINhDQ/EKJYe20ScFbQdjS7UcCGnj4kPg65oYQYB35ZmTMzogWdreEiuDrtoNBe6Qb6rlbLIKnzHA+7VbiCCzjYsi6KbUMHK1T3l/P8W3DylGYS6bP3Y875Obkdhu5YKAiTezIDyNtYfgRxrYzmjjLrqZjjt6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Tue, 6 Aug
 2024 14:38:47 +0000
Received: from CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923]) by CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923%6]) with mapi id 15.20.7807.026; Tue, 6 Aug 2024
 14:38:47 +0000
From: "Singh, Apoorva" <apoorva.singh@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: lkp <lkp@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Fix access_ok check in user_fence_create
Thread-Topic: [PATCH] drm/xe: Fix access_ok check in user_fence_create
Thread-Index: AQHa5/MoJ4XmxIlzBEO+DBPCQaBPyLIaTH6w
Date: Tue, 6 Aug 2024 14:38:47 +0000
Message-ID: <CY8PR11MB68684EBEAA09FC5B3773DA8AEEBF2@CY8PR11MB6868.namprd11.prod.outlook.com>
References: <20240806110722.28661-1-nirmoy.das@intel.com>
In-Reply-To: <20240806110722.28661-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6868:EE_|SJ0PR11MB5054:EE_
x-ms-office365-filtering-correlation-id: d1c1fbcb-b4fe-41c1-3a2c-08dcb6257b28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2UFq4d69vZQHFmdDaJIjlTHBJsKxk+XO8HYwxAOHaIrpPLsiV2rwYmitj+2W?=
 =?us-ascii?Q?groCmdWOY3Vv0gBt/N0UU2C7lOZ8wdwWA/1lUY39SdcuK4w8qtzwMx8JTcwe?=
 =?us-ascii?Q?CGSF5fGRkFR1ybgD/u6h7SSAJE61ux+Ty3hZOL7N2clZwgG3+7Fodf9vfVdx?=
 =?us-ascii?Q?eUZQzkVhAp5Gl1N+jjEeCanHU0jOVrBuKpONP2pPjjt9MKRtOHBjKsHKIBxM?=
 =?us-ascii?Q?BoJyctV8JHoSrRca+VCoalsU6RdQinfCmAuacYZ5wL9H06bh6L4ze+xu6Vkq?=
 =?us-ascii?Q?c5/mx0AD7ZRLJhuJSG6z022byTgE4oCKBGro86Ao7eOaVRSzsfcN7bx8mE77?=
 =?us-ascii?Q?PGbDFcN0SdqkFnjXI5+IBhnSfjIT+2KJafl/degEz5VmKAONgQt+IO4jBGk8?=
 =?us-ascii?Q?bZvw/+0ff2LHi/A0L7cJplWXTCltabcJTTp5YunX/wPZ5RDUaK7KDkLUATFc?=
 =?us-ascii?Q?bQXe8qo7Wj1PQTH4nOWXpTaD/1SFoKBxxGDwz/9oF2Kv6hEAOIMNGeCpYy5h?=
 =?us-ascii?Q?wmVga5JttK+JQ1+oEKOD9LR4yiWTL8wkSm8Y5tE5ZlhekNRow9/6N/2t4k/H?=
 =?us-ascii?Q?O3D30YfdvgYicx2rGNHAgfRgPZckTtbn34HfEcrRkEnPtGQ1RZ/UrINhhCBM?=
 =?us-ascii?Q?OOQbHNYEFONSRAGqW9KD2tBHQ0ECe06i+iCp0dVDNA9eaTwinXHfb0wHktaE?=
 =?us-ascii?Q?lVsZ/i0K9XVAEE7rUEBEX05qL3EktyySDISVmpLrzRsd+cxmqWj6Tu22L1zd?=
 =?us-ascii?Q?c6FIv2Gh9BBUW2cPmvH4txW74ZADtJgi96L7xyZfMFvIM7j4SJFRgYWrLRgZ?=
 =?us-ascii?Q?/toTUtVvkoL0b2kkRJQ+L+5j2zABk9KnMEKpwNsd5VGRebnHCFP4f/9ywL+9?=
 =?us-ascii?Q?JQh0QIGRgOUPUs17KQcjd7/2sIqAyKaC1fVQr0o2jstSCBjRYZVVKP4iz3Xs?=
 =?us-ascii?Q?4BTaMDN6qjPfL5/gNfVRoWz6Vg0rj0u0eUuLTRoSGe63C9HUP7aAgYwxx+dW?=
 =?us-ascii?Q?7AT4/6Qb80tvWoi1WprnPyaa2xkN2Y0yBLYbAzIbrZ7qZIIX8Adkh0LbHl43?=
 =?us-ascii?Q?BNPWQkYPZp9MjJNcjrpJRwDlLyOYPAUJo3nKCYR4YTqPGsc5Dy4dF22ZWhh9?=
 =?us-ascii?Q?hH3P6fxmfODVemyuxJv4/+Kjiu+7heHXUq+6PfbTUsqd9T9X7Xgr0U0Dp1N+?=
 =?us-ascii?Q?vIndHPoookQU51XXprbkM24HOrf8+DGqLEuu2c4ddNnd1bVwdivolvOel8gR?=
 =?us-ascii?Q?l9DD9Sz0gsLDs+pj6RrXa6tCHCXWxjR/eQjEJEDq/4Mv2AQQm6wigumQeP1g?=
 =?us-ascii?Q?XUDy08V/rQASwSsFdFGF+Yz626D2g8tP+9sDE32SVH4RrMhwiW2FuDAzaQ/T?=
 =?us-ascii?Q?0+0h5XE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6868.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?miKP58lwnmS1HVQX34bn1m173Ti5Iv3ljYLOy8m/dd+Ksyt3LA9CVXY/R1cN?=
 =?us-ascii?Q?t+DhtNOryxeM8noYIuV924kUcxMmK9IwMXFiLeSjR+quIjvjh2TiXBprjmKV?=
 =?us-ascii?Q?foXdu2v9doLilr6Mucem0WmTd7evacASvcVMbJQHeg+k/6hnC+ffid/mPnuo?=
 =?us-ascii?Q?/exQfDCGmFSy2SECpYA6X6aPxbgkiDejym5uWyJ0HhYYjAFMbHLtt2/pNG9f?=
 =?us-ascii?Q?SLApQFc04MoErG1UOo7G319h5OA0SlXRAmoHfB0GT+vei9tS6J8fc4ibGghp?=
 =?us-ascii?Q?SlpbzyNN7NM9Iz2Tigpepn0sK5DAHF2C0gcOKdZ+yw+kE0uGHMm6zMVDbj6P?=
 =?us-ascii?Q?IKQn9otdIlvGOoQwBWtr+H/KzJBTwkjDE5E3nV05GTRk1XMd12Q4KSaqwXbU?=
 =?us-ascii?Q?X8UjpDCfTtys49xqoOJosX3Qu8qCiXa3MQ1+uX1cIHzb/ViuIZQpYp2UG9j+?=
 =?us-ascii?Q?NIZa8eu5hybvepnZnJCuSy75RK2PhI5akNqeLRX1Rr/lV3OHaCySUN3ZxWS9?=
 =?us-ascii?Q?jlMi7ylIHfhXjgoWHe53IFDDOud7PjRelEzhg4l9s7ykA6+ucZTDQnfvi2mY?=
 =?us-ascii?Q?k6DCnVYVkKHCHutYKIf3tP17NlbcSYNGXLAemH/SfXea3XmAr6SZPFx+t637?=
 =?us-ascii?Q?ZeS4G/FWAOKlMUTkMNoKlgyYoZiz+qNA5GxqkZGuIJadUaK6/qCslfuShBE4?=
 =?us-ascii?Q?vZZqsa1HYQrreImujkMcFC9gzGX8j3KgMojYJEVzyc6BfL6D7AUhljkqQoz1?=
 =?us-ascii?Q?8tbo/z/ijjcBY8uUCf0PRTfhO+QPAt1777EtVOXcolf1Lrvfdb88A89KJGT7?=
 =?us-ascii?Q?aYKARMJug/Zn2q4H4enBLzVfm4hDzt8jQFTgE6TvFej3suXhLd4uNVaYuhD5?=
 =?us-ascii?Q?nBulVhuFH0lCT4P/opfNao2kTCjejNCbdgWPClr66x1GvvAOuNgoiD4wolsb?=
 =?us-ascii?Q?rojMVhOGGEU1w2ZCzpDYpV7INWX6Hq4unAf0Hudxy/+MISda8tKbW/tZnn8O?=
 =?us-ascii?Q?fbJJI8xHiIjkbZaVwuCcTE4yMivMVdNIpsovzaSeXZ/PI0BAvrBF2uelqSch?=
 =?us-ascii?Q?OTZw2ph5920vory5DJa453QN8lxyyBXb7B8jGZCfu0+JE16QxlA8gOOQ3uE2?=
 =?us-ascii?Q?9ZucG4lS1i9mzwZ5km4CoYTWZ8Lch5VFyPn6f3ebyuaXdmgamV2RETY7AMlo?=
 =?us-ascii?Q?DSOkURKcfnzuXWxrvycY9/GbwBxB+/u6thdbBZxWuYHdgLCbntTOTZJmFj8S?=
 =?us-ascii?Q?65b4IF5DPA8AzrvdyNGKzgXw3jUqw2mFwm6B1ipmzyuhRRTOJdl6BeDm4f8u?=
 =?us-ascii?Q?pd0GbmFfNQ0lswy2nIUX1HmrNnsTHCRYgJza/gx5OC10BRhon2bQr18YTbZy?=
 =?us-ascii?Q?sCwH5Qj/1VfpcDUSe+ckPRHNvpxoC/nILU286xgXtz5rLFy0uOZ8CWrIQI4t?=
 =?us-ascii?Q?MRtqlhs+acrwz5iOc4ONmEQkUVywwUTKnKbhOhySUbUn00I/oITX6+Uv0sIi?=
 =?us-ascii?Q?3wqO5gq/KRjP0DrFbaFoxN+6U0sJb3D7mcJP0rxnq1xdbN4dV8tgChNXly0+?=
 =?us-ascii?Q?2lDa7yBeEla+bNlrBeJUxjGP0ezYoFZdD/Zzd1ZX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6868.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c1fbcb-b4fe-41c1-3a2c-08dcb6257b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 14:38:47.5826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53j1dC5ity8nYdWmCg5FlQugHvnBpcQgk+Bj3Pno24SaCSMPbt3II8ARW3McbMA0ucSU0rZnGIzF8KssSAa0Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirm=
oy
> Das
> Sent: Tuesday, August 6, 2024 4:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; lkp <lkp@intel.com>; Auld,
> Matthew <matthew.auld@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Fix access_ok check in user_fence_create
>=20
> Check size of the data not size of the pointer.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407300421.IBkAja96-
> lkp@intel.com/
> Fixes: 0fde907da2d5 ("drm/xe: Validate user fence during creation")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 3aa6270e5dd7..ca826aeb41ea 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -55,7 +55,7 @@ static struct xe_user_fence *user_fence_create(struct
> xe_device *xe, u64 addr,
>  	struct xe_user_fence *ufence;
>  	u64 __user *ptr =3D u64_to_user_ptr(addr);
>=20
> -	if (!access_ok(ptr, sizeof(ptr)))
> +	if (!access_ok(ptr, sizeof(*ptr)))
>  		return ERR_PTR(-EFAULT);
>=20
>  	ufence =3D kmalloc(sizeof(*ufence), GFP_KERNEL);
> --
> 2.42.0
Reviewed-by: Apoorva Singh <apoorva.singh@intel.com>

