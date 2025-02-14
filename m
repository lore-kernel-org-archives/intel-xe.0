Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5184C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 09:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBC510E273;
	Fri, 14 Feb 2025 09:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3Y/7tiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB210E273
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739526869; x=1771062869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TAY4cmFi+/R5OWuT0eBBJPkcQ5yHYsHXr4M/3Vl/vns=;
 b=n3Y/7tiWLeJiSTRSHubv69Rtpkslc1LokgArV+RG5vOFgkvDwMencx3X
 V+zi7VZ785hwLmqMCGsL5ZelWrFt+wlcwVv8QNeD9Gi6IQZICyxV3vLxT
 MzsO47zQarpZqTFptQSkz1oTU31i9O7t65TVvJF1HqqUqldcPEck+li/b
 Vb7wPlzZLadchBWXXyWjX+jO5yC6clleQnx9RvBPlsmxDg/rA1iFk53Lv
 NihkRKI+C8V7m4BvlbSuvNmrzGSVZZ+5OLGlZldrxhf+Oflj5kyY3YTUq
 s/IradEM1HCnZ2p/96K34v//plHIKa+7lyVubY7XGkD1vJ6NwX3zrxBCa g==;
X-CSE-ConnectionGUID: Vd+UgqY0RiKueSnK1cL5zQ==
X-CSE-MsgGUID: 9LHIkFRvQae5/nuP4AkgQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51244819"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="51244819"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:54:29 -0800
X-CSE-ConnectionGUID: 3aOzAuAQTZ2GqYQ/EByk1g==
X-CSE-MsgGUID: V0elKrl3S6elEUxxGN5Avg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118345758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 01:54:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 01:54:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 01:54:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:54:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5XkMv9YGKkL/LpH8kdNVIvLabqQdY8TYXAlVdtYLNOUoT5wLVo/IocWJ3j/T9vGJvQV7fPlh5XPU3hsPGCW7VU+AYtpukQaSitlCxdU4IgId1h/4PTW8AB1YxD9TQM1I/d2khbvf4otkNgb3CxpTo/kdpkgH2tWpkafNeYA72WW62aW9DVLdpbp7lWtQs7qVhMjbstX3tXzzXzzQCw7zh7TyTRlUxjGv/sOTDIsBb1yntQ+YPdtcyzdzqMR03pdX8Mcd36w4VUDVAAQx/4xH/ByxQO4Y3n4vgyw3MRwN/IhbKfHh//+E7vpJ7TAgqcirnCGkvg2oQY3TEMyTaTHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcm609B8Tz7zfnXSAm+djRbPy9YGjzqag9RRS8i0YPU=;
 b=CntuEQ5gaWXt0Gmg8Sidh0tsHKzDk30lUyCGiAFEAAiyikTLhnL0Ldvf7ASeG0MuOKdwr+F2h1ivB2LhzpZ6yJGUSwpquS40/ionPVs78cYRzhSjc9n3hOAYBRZQ39rq83Oz9G3hO79nlF3ApNqBC1tp0jUD6qRS9TVwgK7Zn0YgYfN0RJLI8NCbvfw9Ml0bdXK0ySBH7IWhMEuBGIoa9fEp+T3NpoF0ja9OjJzIKc9ROLGwFmbhZOS6SqScVNtovhDh+83ZamTJH8WqP6cmIzLBi7Bl5MKT3x10YV4RP+LiubhWWlT0PnwBuMF/N6vHgAg190FGHP5G9Ucw7Z0pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Fri, 14 Feb
 2025 09:54:19 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 09:54:19 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
Thread-Topic: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
Thread-Index: AQHbfmAGSIawuFQ92Umujcx4xF9GdbNGjtIA
Date: Fri, 14 Feb 2025 09:54:19 +0000
Message-ID: <LV3PR11MB86959FA32C69826118242F65F9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: 1d4884c8-3734-4338-a54c-08dd4cdd8cd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kfD2jv8AnkJO4mV+iUabkeThYOyCOC7YXNYYcGRgR6zOJJkhbzCztlfewiGp?=
 =?us-ascii?Q?/IzfJFlz0YVy4WbvvCTQjBtRwYC//bS+5iHm2WtUiGVaTEc9tpa8AaoqLGco?=
 =?us-ascii?Q?+35KLKmj1CR2DLeADZvrkaNmcA3/OPYgXEOByu8/+laz3JUjcIBL9EmLom1W?=
 =?us-ascii?Q?RpIXaSUrKZScJgMiHjU/njrqh0HIs8GGhJrz8z96r1IW9UcHNX9ClbRjitt6?=
 =?us-ascii?Q?TmA0Ak0rl5Z0t5RQm2NdEqJ5V4a9509DgDIv+ue6lBgsAjFY5T8rRJ0pQ/XL?=
 =?us-ascii?Q?bev4s8N1g9OgF6OFRTnQ2qeSe9j/lZ5duOQ0skYQy/ztb0NJ+OPoQdNG6+1A?=
 =?us-ascii?Q?q9vAPBZCKGB0Elnh0vxR+TiDoDB4Ye7q+3z1LCUlL6g70Nue17KA8OJ/mHXi?=
 =?us-ascii?Q?iIiqCs3OuLTK3Wg2AsetzKzScpvKhTtR+Ky7W1VJ7tyVL2JlF6dZWzL3P3Kt?=
 =?us-ascii?Q?JDDarRC8iM+taT412i9E2QP3WZW+mwQAQQwPJhS4l+9mQ7A3kFRfDY4mGx0/?=
 =?us-ascii?Q?s8VQrOKq0sY82FdLOc/OhmYT52xFKPhWC3TjJlozMTueW1uWWOCVEi/vdJJD?=
 =?us-ascii?Q?GwmJSCBSkWQXo1ioZQnT+wKWkd0Ty2668ptDQkDtfW6cJtcQo5rAml6cQ8Mv?=
 =?us-ascii?Q?GZMUNK28fhWKEdcASn3GjWwg5toIM26BNQKNqexOXTJmFNik14zAHs2Z+kDs?=
 =?us-ascii?Q?7INXu35li9nuljes9wSB8mpKzD84yRIxK5NvC7mL1qUYoC5N4dfL1IX62aL+?=
 =?us-ascii?Q?tyQ8efoxiWXJzVq64AmRL6GrblwNU/Umlpo+vUOH8p+h6bnrQN0PsDiBY9Vv?=
 =?us-ascii?Q?XzrtI6M7/6dXwuqyhE0FBKxj6OC9cHFqZMt5h5vioTv92BHpPkDwlW4RSzGh?=
 =?us-ascii?Q?QlxoAZdd4X73ftWIxY2Etg9it1eIUZRB99GMGljk3nG/RP9oVOiF+SvQ+fAQ?=
 =?us-ascii?Q?27WoN0RhJsV/E9KHgHGMZExTdTVeWpKpWkDsxQVqoBdprj3fKHOHj/Ioa8V+?=
 =?us-ascii?Q?MEwifaAoSM96zTkOqHAkaGNtuyEMgmBt5LT7v6gvUolvovOdRG5QUcxwXk2u?=
 =?us-ascii?Q?42TtN6Cs7FzEnitjSAx9t1nxJapywQMyZW5MDLJEZFrCo1dBue18ub6MLQ1N?=
 =?us-ascii?Q?Qpv7/xVuybkL0npT+FWNTD/26TwV5NN2eA1cn2gk4ltR14oTz+TGotBhWm1y?=
 =?us-ascii?Q?JgqZVZm1fZ+gEgV7eE0ydisWOVlTdJkrmPIDZ4T9XmIhrQwquRJYrbrPNagE?=
 =?us-ascii?Q?qi99aDikn6QfXkryQkisg6BK0QSTXA0MipF2iaIX2wa8wdSjv8GvQt+X7fwT?=
 =?us-ascii?Q?RCjkPQ2jpsjk6/gWl95gb0qKxfHhUzg2o0Ki8dEv3p3XTqn2svTfAqxD4cjW?=
 =?us-ascii?Q?lDXirUDOCyNpXbe9/csvRip18e9xPezcB9I3ogcutvYFvIqWzr7mGJTecKCU?=
 =?us-ascii?Q?ZPC8gDm7g5KF79yjEYRZYPhdPJJug5Yf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JkQqTbOmLfW0KCtMfygtGNpxC6we0lII2Wv6c3r3DH18tRDHkbgFtg5xOfAD?=
 =?us-ascii?Q?2q2m1B4+7Svw1GWWGvUa/VMuSUbQGO/uEpU3VkbslU+BCQvLAQLNtZ94AHel?=
 =?us-ascii?Q?xGjarLI12E5JRtZTm4f7HXrR05p5OpyPYxC9IjIdSSbpvpPmQUweOFrM1sT/?=
 =?us-ascii?Q?jDdLVtFel2+xwwS9jetERG/wC6Pe37Ib5PHuRKAm0ZclvIrA/uf+q0CCXAnV?=
 =?us-ascii?Q?3ol2lROS1PB8zv/U8hteVDExz4ncFCAbHnOAe4V9lJ1Gc0iqeeHeztglHemg?=
 =?us-ascii?Q?tpOR3FWzTaC8ZdrjNXo/CyTrp32O8DYr2MD5k16XnznWVJjrOowh+QmDY3TU?=
 =?us-ascii?Q?PxS0/W6S/xtAal8+57OLBqwZ2f5g2yRyNM9x7v1v0ci7i36Ubs+AEATAGVSC?=
 =?us-ascii?Q?yb5ET3/2eXHULOiCGWN/+Exx2g0ovDUkj93t52HjEZovPEq5PsLuvBUGOUXf?=
 =?us-ascii?Q?uG10PmWedOQMmeC8fTPWc888euhZReLJ0QgOEPkGFP5C7Q1goml9gNrgxv7t?=
 =?us-ascii?Q?CYjBUzAyraY/4JC11FZ2K1tDsLHpbVMsV4n8GSIsvh92lVa9miRXaJQs7Byl?=
 =?us-ascii?Q?9WdlHSwlkKJJa/SH3HAt+tcQ6Lu8ttTlxueShEpbQz+++8431yBsd8KaLav4?=
 =?us-ascii?Q?yua+xSan+NyAAccgIQJ22TuhBbed0Gss+y13PYByLyjXItA9ZxnUfE7DYqrB?=
 =?us-ascii?Q?oTf19ml3wB3oQHQHszPWCpRFY7ZlFxe2nhmN1niI12y78c4nvNUygsInRuwi?=
 =?us-ascii?Q?oSLH419VPqj8HsOqPqel6mb7W66tLZFcXxyTlWfwV0pVBeGWFcyQ5/4/phOK?=
 =?us-ascii?Q?M2KQR7YV0k+KLDpBjbAwKp+ogvWUgEHsz2H09MH27LIqEorILmrpc5Y8jQhw?=
 =?us-ascii?Q?AycvEnDNr4EAhayjHw/INOCfZRUWT6x/g3X14d+z1zc44QL+6SLIVq/R2ZcX?=
 =?us-ascii?Q?CAEb0eU/UvwvJ6z+MH0h0VxPwSMv+4Swb8t0k6OeA1PkdvkAs3XB7hwQU8m+?=
 =?us-ascii?Q?D/QYNP/AISOOJgl8LGGSZ5DQ1xD1srpfpIfELPdiTwFQjkqorobc+nQOYeem?=
 =?us-ascii?Q?P0JEJHtpAq5bsA5Sj+ja7gI9RlZlr+85a4bUv+fj7ZAXCZj2yIO7NlEZfetH?=
 =?us-ascii?Q?TAg/yylGrJ1oV06vqfmkx1FTm9kNR82dAXKL+HwXkk2NLqOqgVrbKTshBJPs?=
 =?us-ascii?Q?oT47Q8KRj+heDD/AYXWXLvsd0sK8K4KTqTMYHtxbn3tSF91oBcdSP+ruthzM?=
 =?us-ascii?Q?7P2FkmBKkh/vvKzXATYHIGweYoSwhovrdM85/oyVJUEv5aeGYB6WEoUMl9QN?=
 =?us-ascii?Q?rPpP6saoArHAlyt3+1/tqxXbeh8vZUPQSKP7YEcCZwpH/RoRaPeE+Tygz+YY?=
 =?us-ascii?Q?HZmIdFScFTA5R1nAa9yknGX9xLbxR7tcBU2eYZbaiFEbIZyIS5/5PDepKzTw?=
 =?us-ascii?Q?VQHN0JdFDmX+C8P1cH043j3rBf04OUhLys7DlJCyMA94t+kyQ8UGNy9RLpdr?=
 =?us-ascii?Q?kIcl/czfx7MtLqDizaaYFpiervTnb5Ls6EakepYgZD5/LCWMRnUktXlQZv1P?=
 =?us-ascii?Q?WxEy04k4ai9V4vBfUTOjiJemuAwbtVAloWRGUhwJG+5qNo82Uq50LXRM4nUf?=
 =?us-ascii?Q?VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4884c8-3734-4338-a54c-08dd4cdd8cd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:54:19.0387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgmDdoowMAFBxzjsFHl2UxoVVmWp/jVEj3kMMKL5ksZEONToEGE+71qrei8bnvsP+Tx6587nd18ulcpInY6uiQIXZCgJkNfP9GpP7SM4ymg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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

Hi.
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dani=
ele
> Ceraolo Spurio
> Sent: Friday, February 14, 2025 3:11 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, =
John
> C <john.c.harrison@intel.com>
> Subject: [PATCH] drm/xe/guc: Stop reading masks from device memory when
> populating the ADS
>=20
> If the device memory is corrupted during the suspend/resume flow, the
> masks might end up being random values and using them might lead us to
> trying to set values for engines that do not exist, which in turns might
> lead to invalid memory accesses.
>=20
> Given that the driver does know which engines are available, we can just
> calculate the masks instead of reading them out of memory.
>=20
Let us log an error if there is a mismatch between what is read from memory=
 and the info available with driver.
This information will be useful to debug issues (if any) with corrupted dev=
ice memory.

- Satya.

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 36 ++++++++++++---------------------
>  1 file changed, 13 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c
> index fab259adc380..10e2ab5791b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -129,9 +129,6 @@ struct __guc_ads_blob {
>  #define info_map_write(xe_, map_, field_, val_) \
>  	xe_map_wr_field(xe_, map_, 0, struct guc_gt_system_info, field_,
> val_)
>=20
> -#define info_map_read(xe_, map_, field_) \
> -	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
> -
>  static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe =3D ads_to_xe(ads);
> @@ -493,13 +490,12 @@ static void fill_engine_enable_masks(struct xe_gt
> *gt,
>  static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe =3D ads_to_xe(ads);
> -	struct iosys_map info_map =3D
> IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> -			offsetof(struct __guc_ads_blob, system_info));
> -	u8 guc_class;
> +	u8 class;
>=20
> -	for (guc_class =3D 0; guc_class <=3D GUC_MAX_ENGINE_CLASSES;
> ++guc_class) {
> -		if (!info_map_read(xe, &info_map,
> -				   engine_enabled_masks[guc_class]))
> +	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		u8 guc_class =3D xe_engine_class_to_guc_class(class);
> +
> +		if (!engine_enable_mask(ads_to_gt(ads), class))
>  			continue;
>=20
>  		ads_blob_write(ads, ads.eng_state_size[guc_class],
> @@ -546,25 +542,24 @@ static void guc_mapping_table_init(struct xe_gt
> *gt,
>  static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_ma=
p
> *info_map,
>  				       enum guc_capture_list_class_type
> capture_class)
>  {
> -	struct xe_device *xe =3D gt_to_xe(gt);
>  	u32 mask;
>=20
>  	switch (capture_class) {
>  	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
> -		mask =3D info_map_read(xe, info_map,
> engine_enabled_masks[GUC_RENDER_CLASS]);
> -		mask |=3D info_map_read(xe, info_map,
> engine_enabled_masks[GUC_COMPUTE_CLASS]);
> +		mask =3D engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER);
> +		mask |=3D engine_enable_mask(gt,
> XE_ENGINE_CLASS_COMPUTE);
>  		break;
>  	case GUC_CAPTURE_LIST_CLASS_VIDEO:
> -		mask =3D info_map_read(xe, info_map,
> engine_enabled_masks[GUC_VIDEO_CLASS]);
> +		mask =3D engine_enable_mask(gt,
> XE_ENGINE_CLASS_VIDEO_DECODE);
>  		break;
>  	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
> -		mask =3D info_map_read(xe, info_map,
> engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
> +		mask =3D engine_enable_mask(gt,
> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>  		break;
>  	case GUC_CAPTURE_LIST_CLASS_BLITTER:
> -		mask =3D info_map_read(xe, info_map,
> engine_enabled_masks[GUC_BLITTER_CLASS]);
> +		mask =3D engine_enable_mask(gt, XE_ENGINE_CLASS_COPY);
>  		break;
>  	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
> -		mask =3D info_map_read(xe, info_map,
> engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
> +		mask =3D engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER);
>  		break;
>  	default:
>  		mask =3D 0;
> @@ -907,8 +902,6 @@ static void guc_populate_golden_lrc(struct
> xe_guc_ads *ads)
>  {
>  	struct xe_device *xe =3D ads_to_xe(ads);
>  	struct xe_gt *gt =3D ads_to_gt(ads);
> -	struct iosys_map info_map =3D
> IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> -			offsetof(struct __guc_ads_blob, system_info));
>  	size_t total_size =3D 0, alloc_size, real_size;
>  	u32 addr_ggtt, offset;
>  	int class;
> @@ -917,12 +910,9 @@ static void guc_populate_golden_lrc(struct
> xe_guc_ads *ads)
>  	addr_ggtt =3D xe_bo_ggtt_addr(ads->bo) + offset;
>=20
>  	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		u8 guc_class;
> +		u8 guc_class =3D xe_engine_class_to_guc_class(class);
>=20
> -		guc_class =3D xe_engine_class_to_guc_class(class);
> -
> -		if (!info_map_read(xe, &info_map,
> -				   engine_enabled_masks[guc_class]))
> +		if (!engine_enable_mask(gt, class))
>  			continue;
>=20
>  		xe_gt_assert(gt, gt->default_lrc[class]);
> --
> 2.43.0

