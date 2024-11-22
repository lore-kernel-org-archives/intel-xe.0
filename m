Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B13AE65D19
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 03:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA88C10E058;
	Fri, 22 Nov 2024 03:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ip7/24uH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3B710E058
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732245866; x=1763781866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sRD9Jp8e+TRK74xU7jpy2fgTq2AeXHwa6iknGagPy94=;
 b=Ip7/24uHRipgWsAHYMBBARbJpsBWe4e/+I3C7TD4oFyDxZbRPL9uDn35
 sn4VbFQ0jrVf6imhsU2278l0dNyTcn12JbnLp/V0ou7F2toA7V/2ZFjt3
 EDArkRcNTm9DovAcvdxn5P/hdq+sogskL/9RhNA9ZIq5TmTo1HxUhwLju
 576Gk+P5FNSEVNiGMFnvr494Cqd+SQWnkxvAj9L02lgWHCpaoCQnOVs15
 XJ4gAAhlDDfB6uyMmgwxRhMvVRcMZIxwkZVLUanOnszChH0+IMtQCqsMm
 YdMHtozOIfLRg7mMIrbEAt7VDLMMWoDih9iy/OoRBgqWm/LdjIJYS4AIe g==;
X-CSE-ConnectionGUID: xd0MkB3PSrKS34CduHz+8w==
X-CSE-MsgGUID: zGejmvgGTHiaGOjQHXctqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36295961"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="36295961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 19:24:26 -0800
X-CSE-ConnectionGUID: TpaSoeHHRkyKfVWTiJU9+w==
X-CSE-MsgGUID: r/71V+3sTWSt98FyKjbnyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90431795"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 19:24:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 19:24:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 19:24:25 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 19:24:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+XjlBJZISXnMo+Kw/8GATe4Xto5OiXDCrzd6ZWDEyeIIr3W1pMcCMnHcGIgtk2Vz1fwuNnw09zThz70tzde6h8nuZnxfyJo78KWFx7qm84b8GPvRuBnHcopTf+ku/Ly8jwcl2xIGeKK1j6K/P/Xuh5zAsUHHUbZrBwWTo/CHc2pFNzSIiHhKw/hxTsUG2RcJpR0S9XeLuzhLW4wQlaPPdsvIkPpDje+FMXBaZOFjbfwubad/3ZlhltT2BNEgqrT9NXTUM56bsRA0t7sD444iZJzU+bn6Z5xcNqTDUYgdsdj5rmkQ6VrOrKftyHpnZJv33WzGRJ+xXPF3IaSzlBsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6G1jtl/lfnD96MDtGcmqh8J9jGsp2DK/VEyaJ9fFKc=;
 b=OxXy1hpJHhKhhPaKggKvhd2a5FOL12LJPp7sNIjGdA07QG5FMpLViYCMRtgdvAobmYrLVJtc6heSzDz5Ru/XHmB6W46ZCXptfjM2uMUc3L3YW2BCMjgRgi5WgQMTjNz5YKgk9yP4Et4ZQLb0ac8PLcu4vfhGRZX43Gki3reAJL/xDyzJjxTaKf+0mPerYHmCM5JOGZ5cA36Ay7p+ZUycoUhzwAJ4gvLU0e7Wxi2UdATK5sT2g/PvGY3rr5yqpPs6EdVQso78DGFV16UQGVAMt376qmzmu2sPLlzViIktxF4o/DpBIkuRTRvC87uqvFsPYiiyMcUw/5mW4SkVJfe5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Fri, 22 Nov
 2024 03:24:17 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 03:24:17 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
Thread-Topic: [PATCH] drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
Thread-Index: AQHbPD75851sYqV65kq0EpOIwEjx+rLCoxBg
Date: Fri, 22 Nov 2024 03:24:16 +0000
Message-ID: <LV3PR11MB869535C849110ED855DB020EF9232@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20241121175754.302-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241121175754.302-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH7PR11MB7498:EE_
x-ms-office365-filtering-correlation-id: a719d297-ef18-41a7-6f12-08dd0aa52567
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mYXpYmr738GWp9WDANvq7utp8j363Ib1XQ3Gdno98rymSkTTTYZyg0hRfGSg?=
 =?us-ascii?Q?UWp4rRbjEr6RIdUc1HNqg10e81rXH1QEysGbSQZwv66rz6ujf5IQTR5W5Mb7?=
 =?us-ascii?Q?gU1vsYAMRJLZyRnAkol0gB0E/bThzXMLhJJ2LzMw2moI3JQWDcix6KbWy59l?=
 =?us-ascii?Q?O3sz8jAdyIYyjFfY9dLkpsDGRoRkapPHG6/QR/5XhXI4EVuZ10YNgVyJZvNC?=
 =?us-ascii?Q?woh4QzujeQEvigYbO/Q2r8RrkZW9zSDy9LkP8QwgMYAt4x6o+iSZgyON6rfD?=
 =?us-ascii?Q?Ut/QgNBx3ddokr525TUlhDn4NIkb8J2cSflS29n2O6OqGZYPtUZ+BYYgND7e?=
 =?us-ascii?Q?zoYAMEQnS+YJ5oEJp8Dt0MYNsCxtKY4WMRYTyC9GFz/8BxpsJY1PyMcJ4Khl?=
 =?us-ascii?Q?4LoJ+Ts868EvxZngOxQZv0y3Am4aZ5zf73wdSHqgg3KSTIUCaRY3x362Zh/k?=
 =?us-ascii?Q?fsk0l9aWEZNLBhwtSOmJ1qpmcbm840vEOPtf2tujCFLrtJAbfSiSW9zOx5xh?=
 =?us-ascii?Q?HfecTf32bRkdYpuDg5jMZGVBJlOGR6HwqsHQH/Dr0IkkiG+HiDRzwgEo1j2W?=
 =?us-ascii?Q?ryjS+5CtAu+obGFzjKlHnmEeLNLr17WGJRYgf7biQY02b3CtjbC3tfm1W58D?=
 =?us-ascii?Q?IAMIG9ngMWp7CsPafh7UwYd/gN1MP5Bdriifeoknu2Ak7FSN+x7bB7YAG+kf?=
 =?us-ascii?Q?sf03aLG+P2vPOq4G4Ixd0fAINzSSon4GLpUUg9jM/Fq9HtO8TccgmF/IpK+6?=
 =?us-ascii?Q?fX0c6L+B49fLXuOaxK332attFT3oPs4gYL2hjbEVHKADNBSOU0i5Oh7mG5Rh?=
 =?us-ascii?Q?4FfzgdvxdQ+oUX1jCBfFvw3j4eIqFezrSjrGWmYU6heE6e+GfY+/bi04xvNP?=
 =?us-ascii?Q?BzlEdWOefImJxHhzXzhV/jayivRNaYnjW14eXjT93SbNYbH5ZdtPaxEpw7Dr?=
 =?us-ascii?Q?t4uuwtdWGAPzWmxEXow5A6YnTehMoK156kFcP7WA1uVXgUq+GWOSa42P8mq0?=
 =?us-ascii?Q?w+Cuhc0lmVqppyeoQdqqqTC6bbOS5+1m/MP61X24siwtSaGQEABaUYJ4myIT?=
 =?us-ascii?Q?1ubyGm2gDRb4ez5EDj6ub6brMDKk2WBZOxCb4Hqu399XUE9x6FwNGm4l9rH9?=
 =?us-ascii?Q?oVWecwd4SCOd6l8yFUbqfB86CGjHhDvXFeiity9d2JogR7yhWn7S8q8alfjc?=
 =?us-ascii?Q?31//cCEyIX/lh8X5uSLQbjBB+h59FKNBQCwfxjFA4eqZk0X4jocZL5lgPLTY?=
 =?us-ascii?Q?niIxWh/zaCFii7MDntSEsjhs8JHdA+aCEDWtSnhNFkSG00bntT/F72OVTjIK?=
 =?us-ascii?Q?pFtCwKFEd0ADWlt5/CbPHDwHISr6530EuNIelvmAX4t2XcSVJ2DA0QYqd/NT?=
 =?us-ascii?Q?kHRj6sg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JfTmu8/nuaRA/CpWa79o5Vxr5aZwc2oDFbYBVk7gvuhLUtJccy68YxMK5sb5?=
 =?us-ascii?Q?tWytg9uSAZaVj/rE28svru/AZYNIHcKTTPUQVkm9ECyJ6ZLlHUtsyDk5NyeF?=
 =?us-ascii?Q?6W6TNZpxtzgCoQk00gfCDBYXW01qjgI3bEfI6+XyaPOQ5EN+WYJW1FIRkKN/?=
 =?us-ascii?Q?mSXPDhwXrAxX35wYdE9AZgz+mQwngJMOifn6x6VpFclSZutR9b6Qj+l6LXak?=
 =?us-ascii?Q?BjA/TcN0u0KTi6F4WBIAEabrxdMtfhBIqOROnoOc82WrG6GIMRm68iQR2KLU?=
 =?us-ascii?Q?FNIOLutHUOJMaalUukL7knZNW+NqnYHaImv+QVwebMZoQShDCd3XGZOouCr3?=
 =?us-ascii?Q?0vtZBs/k/Dl7Tom+u84rHxcxMu0q42CrumcFBtUyOEpSUVF+0OMsgPu06Ylh?=
 =?us-ascii?Q?gH0D4I16A68AlsYCeS3/BPBp0LTZ0YVSuoekdnG88KNisnKMCFZyq7TU7tyq?=
 =?us-ascii?Q?IraIopo3ihSmFgVPHgeTz2x6PIALr3anTRNSz9HrdfWCYOeLan0G1k5xI8Fj?=
 =?us-ascii?Q?ipqdp7/RvBEi0hNR0LvuhGRvQ1S36VK+vxlntWU9RMQ/iHEHRxbxfeCdq7TQ?=
 =?us-ascii?Q?rtE1urJwpKtrCTBPx/gx0UBaHBFuKIt+g/zBfHyFKyjXHgHf63zuFxtzOH3h?=
 =?us-ascii?Q?hOWZvgccOP78tzoGiAKS8b+i/5iwts+8fkEZ1ul10EZy/dy0q7OmXybvwHjo?=
 =?us-ascii?Q?k5JPNprDAbbPJ87T5WCfZIIS8D6tkJqmF5dG8UHz/iAkgDNR2AQuJXGJiDci?=
 =?us-ascii?Q?XiyscZOq64In9osV4tfcdx789WY8qDsQEbkO7GA+vhAI253Okl94bEG5VFu6?=
 =?us-ascii?Q?P1dAENDVWQtTTBXWhjuqPfAf/F8/r3hgSiknVhq56zNnwtLedzLiFzv3aqCO?=
 =?us-ascii?Q?2Al2VbV6GOKKeJVGzQk852edaN6/70/jqHnkQRl6cIgKzc+hf6nKDt1ARAoM?=
 =?us-ascii?Q?O+XtwiLeTn47zkxHWZxycJQsSiSHxfDZMIZGs9DVTpxk88aBU7SP1yfDajyk?=
 =?us-ascii?Q?8jD7iQxyd87XYMCHi0T3Mtl4nHlhCWG8LkVkFm6LAvPspm5vUFeDM6qWUzkx?=
 =?us-ascii?Q?R8ZZB7DJq5AHXxlCz+KHRi9N817JFjMRr36xAlIWXt8RXgr1XWmQb1YZQPtA?=
 =?us-ascii?Q?ybt9Im9IvUw+BE3oo4IsJkXWS+o/kkxkRIA6ehVtDId6q1tmgg4+SIcFbZ4H?=
 =?us-ascii?Q?A7ovF8qeBakypRJ5CuPCQXAZokqUKk+UYHZZMvnRr21/lIymGXAI9CX+1v9w?=
 =?us-ascii?Q?2EgpukD1nIFNHFajyL9IKUr78tdLBRTpMGyhgWxQYNDZFXKlbGS1URfnajm7?=
 =?us-ascii?Q?uaP6B+3fuYFsJV/YNlZu6lhl6xL63US6g+n65SrnmhRRCuBCHS5NjdoopuA9?=
 =?us-ascii?Q?cxoYlXIoVDz4M8hrO0yNIsiKSV9KrFlU9YXt1B/gHiTzhcoJ25l6+fHHPTH7?=
 =?us-ascii?Q?Q/PNnPKqtlneZP6fiUY+VVwrzz54PRw/1+s901Ngv2O9u+Nq8pz3mbmFCfS2?=
 =?us-ascii?Q?MHLHKL5Akwk6ortj/1DmO9x2yP0r9eV6Kj08T4hY3Fg8ILEy55uHsC0E8v8H?=
 =?us-ascii?Q?a2pwKQ23SYHedop54PVdeMAcw4cDbJdqeIIwPNTyH+bpeJZolDuP58YtL83m?=
 =?us-ascii?Q?zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a719d297-ef18-41a7-6f12-08dd0aa52567
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 03:24:16.9494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2ZfJJs8dZ1XZkl5gVcODoeVmTPQ3/YV/eDXBYQuxadIrv9pXwtAvRxWGByXwWfNxYPp2JOBuIlpcEK2Tnx4c9N2D6fdEZpudqkUJdN4NXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
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
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Sent: Thursday, November 21, 2024 11:28 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH] drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
>=20
> Since commit 678ccbf98796 ("drm/xe/vram: drop 2G block
> restriction") we are able to provision VFs with more than 2GiB.
> Drop our temporary limit of maximum fair LMEM size that was added
> just to avoid hitting -EINVAL from auto-provisioning.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
LGTM.
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 8d84d2a9ab1e..65082f12f1a8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1545,8 +1545,6 @@ static u64 pf_query_max_lmem(struct xe_gt *gt)
>=20
>  #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
>  #define MAX_FAIR_LMEM	SZ_128M	/* XXX: make it small for the
> driver bringup */
> -#else
> -#define MAX_FAIR_LMEM	SZ_2G	/* XXX: known issue with allocating
> BO over 2GiB */
>  #endif
>=20
>  static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
> --
> 2.43.0

