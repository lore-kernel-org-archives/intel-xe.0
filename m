Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C82D65C63
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 09:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE5C10E7C9;
	Thu, 14 Nov 2024 09:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfyMSdoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A310E7BF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731576460; x=1763112460;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xl2u48BF3oItjk+oXg5ZQL1sBTKPvPqoBs+xlY2lctI=;
 b=XfyMSdoQee+ioTc1eqmT63/DbccFSJ2foor5V66WUiKasH44SOYrlDxw
 w+MLRbnBQ77BO49kRmhDr3S6/LLLeVG8cBt0vGaj7IegkM6ad3/02anUP
 kUyWeWfQ+6B69dHAoyKgGb+B3M0vnH44KOcqKEj4ALywKytMhM4nS9OlJ
 5F2eu9KXHA15HanAsONY7GS3G8JGLaBxqkTni7jzNhim9uU9H2S2GFIZE
 UhOcX8O76hS0PRal1gZbLS4wVVvRoWOjMUtZ9vXoN4c5alng1HtXDyCWp
 Ieu18QjQkGVt0yC/n04jaNyphJU6QXPlwKUqJ0E2ch3RiSJf1F1yT0cb4 A==;
X-CSE-ConnectionGUID: E470ImVGRUm+geu2PFX6aw==
X-CSE-MsgGUID: /i7bSu0ERcCdIZ3X2pVm9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31743796"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31743796"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 01:27:39 -0800
X-CSE-ConnectionGUID: N2EFOmoHTAWqQfCrvg1rig==
X-CSE-MsgGUID: t32JFzBnSI+xnEGqzrjo/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88035023"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 01:27:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 01:27:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 01:27:39 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 01:27:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSLmJa5SmEw59CMTfjQFf8PdUmFFr17FTVESo59dc5ZU1b7wDfzHS5Xc5vd/QMvX2DDfyxBYC+8atGQv/xYdSZx8MwqlWK2cElTwPVUqtZjXZqXjwr8uV4EaQTfZV/UVjUOvKcmRXo/MExhIHiuEldLq7Gmni5jq86n7KxjJhk0UhoTdV+/8tuh0ve/FB4MA0D9xmUWte+elPa/hzfFFXdPoMLFRo30wnZZNjKo1E8LDpId4ZJiA4tDJ1gojW3wSzmR1a7P+yPgHlqQddPNDIvKLF4nUP/vIL/4SXsgiHaeEcQBoU4aK0s41oap3fz2t0C9E4Q9zJ0nWTBA3Dkrr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH+ZViT9TzFd12LY++bPRkQ3OC7FwBiYRMblHLVbsag=;
 b=A26nG8+3FdLwYA7a/0Y1Zhy+kjbmVljCCAFDBPPigJ1tKUyUMCvOofb4UI3hoBDt7qUuAgkcALQO37XAEf9kE1C2Q88S6goNspFUmKRYKOF/pyOO3r/XPud+tUmFJsXL/rs+/pknWwC0A2mZNaIA7YljKj3Mf7QM/ThH3Agv8aBtvFjD+d3LXT4H6z0ajHasF6Hn0oLPBEUbe4zoweDYoldqqfaClK2bQDjd2JXtt4SMFSkzxxvKsQEVn4WUO+/5UGNk7qRGyzLxMkbCrxgG+Ql693WAPP7AZYPu+TK2V6gPm71KKGpQZ9pM/mwXyjY0hfVodqbbOGg22ghF4XqcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.31; Thu, 14 Nov
 2024 09:27:36 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 09:27:36 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/vram: drop 2G block restriction
Thread-Topic: [PATCH] drm/xe/vram: drop 2G block restriction
Thread-Index: AQHbNfDdg/SsfMi3u0WPQAEa/cVXhbK2grFQ
Date: Thu, 14 Nov 2024 09:27:36 +0000
Message-ID: <LV3PR11MB8695417484475B4A79ED48C9F95B2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20241113172346.256165-2-matthew.auld@intel.com>
In-Reply-To: <20241113172346.256165-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 83410078-b9f6-4be0-d2a4-08dd048e9366
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OXA7NmQ6WEbbbBLlb0r6sV9uAx0BzRkWqYkbO2RbKFUqTUfwZtcRlrURGiJl?=
 =?us-ascii?Q?udInOPx8yDo534cDT0UtJ4VQLoOMmRaE88+bHpIm+JhTRsixM/W8QeW6PQ2e?=
 =?us-ascii?Q?KKhhAeg/6ov4I1IZMVdkI/pwQuzg7Blv6sh6SBn0+rRd/iJdPuwd4C13TD2L?=
 =?us-ascii?Q?/vzZG2UC/z0kq4OX+Tkouni5H6gUjXfMeC+l3Gn3kIM9WLwTeBWcbq3hT86J?=
 =?us-ascii?Q?KYA4xnziAIkZehUe1jVNpd7tCo2Z21+i7PgmHL1IzcgJr8WI9mXlYP5hNOgo?=
 =?us-ascii?Q?p73eB0Pp4a25n93YtV9+rz52ImQFCpZDh0KLzWygJQ2dliBnxEgccNKp5dG3?=
 =?us-ascii?Q?kGhi0fat0biT5K0Ix4Y/R7IN705f60qExVkkv1X3YwRtYLBsuJLOy12xZZML?=
 =?us-ascii?Q?W5MffScZxKv+fL6LxOzbEoD9tgx4KSyJ1DG+hGeCwbtduGPYcVDhEIiF+lKw?=
 =?us-ascii?Q?yLZWVBu6+NZCzxzYziZzyYlMLApxfujI/soJYv6lCGfdZZsVVWcPqg/cqTsg?=
 =?us-ascii?Q?tBd2p43jxqbsvmv4Li9EYyc0E5PBjXVzU3SyFsWbBuLf2FIVE/ROdsa671UO?=
 =?us-ascii?Q?cmaPYJHP0vHwfkvoz8xUvFNnle6K0ARqJIA8gdEkvQ7kI48zkMArp74V+bGV?=
 =?us-ascii?Q?MRPCj+Pl7iy5QrFBQ3mfnerTijAarx3ttc1j4uLzxk5rMjss5hsvxmBqijY1?=
 =?us-ascii?Q?Ea90zjaUA0CY5OO32NGWYle30XC9VqxcOqjXQ6CZSi/6AswgaPUykQKo6VAr?=
 =?us-ascii?Q?fhRHMG9zHHrljbE3Z12oErSaF0YdhGZUhgivducZKtHhI2O46Yy+DGyPknzX?=
 =?us-ascii?Q?CyWhx+QKeourlShENUWWZRUompeA//aIi3iI+ERr1QVgYDsAHxxR44eL0XFy?=
 =?us-ascii?Q?XBRFLcppNtYqaZO7B6LAmpGjT8JRxYqgh7ZObu6E4IOnlPe0IBqRsZSJFsWD?=
 =?us-ascii?Q?5CIYBEtGmM/Xm5+hM8WBbAU26bZFU8gWqH/vCAlFelvu3P+Sz88JOmWS0dlD?=
 =?us-ascii?Q?4LO1x+d5F2HxwmVW7XkkZqUoynuddUYW021CTIu2Or5GJrMD5QqkRFRrjYgL?=
 =?us-ascii?Q?+ohXvHhKGWOrUFGrCbS36BT6gu0S4TNkhM/AJRp4w0uARhpSuhm45EYgsT1T?=
 =?us-ascii?Q?YhaemR29ITsv/sHIBWK9WTTyWLO3HcDXYzi3QySJD7SEH1nfAC9OtZRLQKTR?=
 =?us-ascii?Q?XQCyK8oq1vPfoOcGE2/Yt/4XtVhoLvLVigknKeTFY4dKdU3OR/JZX3RaZIdz?=
 =?us-ascii?Q?piNrqKceKn8hmMA2rLgrBGboXqgjRgRNd75p/peQE1fu9OPBzilre4Zh+F8X?=
 =?us-ascii?Q?SsMUwU88flf9jL61SC2bm0xSYAh9t0tzxgVnZalSXAgGSjJFgH26ORxTnNrF?=
 =?us-ascii?Q?7Wy2YFU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HNYO0olGsnyykQF11nsmrgQFPs0wDssaGHKudHF1F5TAMuGTWioB1d9ebNr1?=
 =?us-ascii?Q?ifB8gRQXRzqX3TL8y0i4Lge2eMHnDzOC+Oe0erU7OPjR861Lo5W4xTcsEwfe?=
 =?us-ascii?Q?hq40bwahHhCv/27cCtHkb9vMTZSnZqCcPdIfJjfvWtckgt18eB0kJTHAmYSU?=
 =?us-ascii?Q?4QDklBtkjhaHRrp8ACfXfWGiOJ8Cyw8VpE/RQNMFksnus/J31KhaYRmTBrmg?=
 =?us-ascii?Q?mRrnIdOXYAvp4JQ9Zk97vEbPqJxeWJyYQRVIOW22h7EivA6SKBO0EuvDdAaA?=
 =?us-ascii?Q?bu1YHNRWUtw0CKZFdYhyQgIw2s4lpsOv5pKXTlnBEMl5x4TApPuB8O3o+AeR?=
 =?us-ascii?Q?xFpoNcRX/OCsrpCNeIKW4dqPKh0NFZMEMX9mmGZ1NyRjw1peeBmoaQfxTjKq?=
 =?us-ascii?Q?IHQhGaVScMVMUp+47PXcs7+rdxEUNkEE4CPHvgqJRQhrrzace0ey21HPUsqP?=
 =?us-ascii?Q?iq0XflgZu4L25q5mbE1lz2N/3cISNfSMEi0u6a0O+BjIKneM6LC61gbLJBWH?=
 =?us-ascii?Q?9brPzP0/zYeVMFwCtQGJjtkVT2AQHuD1w9oNtdBVsdB3M97C+qVc6bgzfBjc?=
 =?us-ascii?Q?QP0Fakolgl579KUO2DT9yN7iCXNXKyEyuRRnW6vT5GhKDAnRLTRbqeHEzKaU?=
 =?us-ascii?Q?UPe+Xm+nr7OevXcbn+zEfWI6RytPuyuDZ6ERXgxrCkquvNDZVU0kjOyVV4/P?=
 =?us-ascii?Q?mi3urejQV4nIwLzbAUkfMWOJIZKSZT35hBB+dRg7yEgb0ko+xq3TarUz2tln?=
 =?us-ascii?Q?i2zMip7p06+PjQXNJYKpzCU+BVRJrbalW1ojU7w8nZOHJQTkX0/Dt7P2EceR?=
 =?us-ascii?Q?Qh83Y88njInr90OWnXAAK4g8mXsUKWD3lhFJORjhlb3tEltFQzwKx9OcITIa?=
 =?us-ascii?Q?q805r+MbraVVXPq06WJ2hab/gakHPGil2ZyLvyB9vyegdC7G8LNeMqAMLOAH?=
 =?us-ascii?Q?2iyaE0qMpi26cw1NvRq4oyVRz2HO1+fZgQNjS3jHiQ4ayf8OvE7mWgILv69n?=
 =?us-ascii?Q?FyjXurd+3U6sN34J/9r5x9i7Pu4uoiS5AYd3wwH9ukYdBzYXjG+noPyPvlt1?=
 =?us-ascii?Q?Z9UAM84gAdANkhi/IC5FZMr5chYwKfuwJIeB+6OdIKr0xD5xQYIZjkS5MXdE?=
 =?us-ascii?Q?6LMqJ5oiwyW87leXifz++0qvy0kzbSva6QK0yEFq9/pW8IdkIdblqWQL7WP9?=
 =?us-ascii?Q?oDDfoJzmEtrvMI1LAdhVqRXsQdXnpJrFf2aPYLsl6gBqDJR1D9n8dz1ZUKMX?=
 =?us-ascii?Q?oaEdmipvqpzdLmiOUdczNNpvWQN9p5ND+7KdSqjIdhUrzLbFttQKVMHunqMp?=
 =?us-ascii?Q?MWsDDRCkDlqw4SWsD4nTGYTtIRurD2yqrPAaGgLqJAel/eLCFUtChEu/hAcq?=
 =?us-ascii?Q?3u854MKa0WkWLtosMetNIPQX1uB8OQy0o5rQtybDrOK7GdhyNeq+lQLyhGln?=
 =?us-ascii?Q?jDi+W9t4yKJy1jKCHHHAXmIr25hJoqKshZh2E0hwrUZYbW1dxXSBtsZvhd1c?=
 =?us-ascii?Q?C1EpEjU1Av1YheklxeXFbznrynklC9Dx7FVh8/IgjS9PlFzriYKDAzl9Aai/?=
 =?us-ascii?Q?zntKDmsXuIqSnxheOol2rL7KVPUR6AjbeGgf4CKX9vcyqEsO9OKzI+fGUqd3?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83410078-b9f6-4be0-d2a4-08dd048e9366
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 09:27:36.1127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYZ0AlGms/WRPtZyo4uZnZBTy9c1fZPu9uj16cQZTTEfgdf7ZHTrba8NsVJXij8pXvd7GOFaahELlBorRZi/hCRqpGtozjli7MVaRdr0Utg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Wednesday, November 13, 2024 10:54 PM
> To: intel-xe@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe/vram: drop 2G block restriction
>=20
> Currently we limit the max block size for all users to ensure each block
> can fit within a sg entry (uint). Drop this restriction and tweak the sg
> construction to instead handle this itself and break down blocks which
> are too big, if needed. Most users don't need an sg list in the first
> place.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 51 +++++++---------------------
>  1 file changed, 12 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 423b261ea743..1d39a8c53b3a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -52,7 +52,7 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>  	struct xe_ttm_vram_mgr *mgr =3D to_xe_ttm_vram_mgr(man);
>  	struct xe_ttm_vram_mgr_resource *vres;
>  	struct drm_buddy *mm =3D &mgr->mm;
> -	u64 size, remaining_size, min_page_size;
> +	u64 size, min_page_size;
>  	unsigned long lpfn;
>  	int err;
>=20
> @@ -98,17 +98,6 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>  		goto error_fini;
>  	}
>=20
> -	if (WARN_ON(min_page_size > SZ_2G)) { /* FIXME: sg limit */
> -		err =3D -EINVAL;
> -		goto error_fini;
> -	}
> -
> -	if (WARN_ON((size > SZ_2G &&
> -		     (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS))))
> {
> -		err =3D -EINVAL;
> -		goto error_fini;
> -	}
> -
>  	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
>  		err =3D -EINVAL;
>  		goto error_fini;
> @@ -116,9 +105,8 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>=20
>  	mutex_lock(&mgr->lock);
>  	if (lpfn <=3D mgr->visible_size >> PAGE_SHIFT && size > mgr-
> >visible_avail) {
> -		mutex_unlock(&mgr->lock);
>  		err =3D -ENOSPC;
> -		goto error_fini;
> +		goto error_unlock;
>  	}
>=20
>  	if (place->fpfn + (size >> PAGE_SHIFT) !=3D place->lpfn &&
> @@ -129,25 +117,11 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>  		lpfn =3D max_t(unsigned long, place->fpfn + (size >>
> PAGE_SHIFT), lpfn);
>  	}
>=20
> -	remaining_size =3D size;
> -	do {
> -		/*
> -		 * Limit maximum size to 2GiB due to SG table limitations.
> -		 * FIXME: Should maybe be handled as part of sg construction.
> -		 */
> -		u64 alloc_size =3D min_t(u64, remaining_size, SZ_2G);
> -
> -		err =3D drm_buddy_alloc_blocks(mm, (u64)place->fpfn <<
> PAGE_SHIFT,
> -					     (u64)lpfn << PAGE_SHIFT,
> -					     alloc_size,
> -					     min_page_size,
> -					     &vres->blocks,
> -					     vres->flags);
> -		if (err)
> -			goto error_free_blocks;
> -
> -		remaining_size -=3D alloc_size;
> -	} while (remaining_size);
> +	err =3D drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +				     (u64)lpfn << PAGE_SHIFT, size,
> +				     min_page_size, &vres->blocks, vres->flags);
> +	if (err)
> +		goto error_unlock;
>=20
>  	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>  		if (!drm_buddy_block_trim(mm, NULL, vres->base.size,
> &vres->blocks))
> @@ -194,9 +168,7 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
>=20
>  	*res =3D &vres->base;
>  	return 0;
> -
> -error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +error_unlock:
>  	mutex_unlock(&mgr->lock);
>  error_fini:
>  	ttm_resource_fini(man, &vres->base);
> @@ -393,7 +365,8 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	xe_res_first(res, offset, length, &cursor);
>  	while (cursor.remaining) {
>  		num_entries++;
> -		xe_res_next(&cursor, cursor.size);
> +		/* Limit maximum size to 2GiB due to SG table limitations. */
> +		xe_res_next(&cursor, min_t(u64, cursor.size, SZ_2G));
>  	}
>=20
>  	r =3D sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
> @@ -413,7 +386,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	xe_res_first(res, offset, length, &cursor);
>  	for_each_sgtable_sg((*sgt), sg, i) {
>  		phys_addr_t phys =3D cursor.start + tile->mem.vram.io_start;
> -		size_t size =3D cursor.size;
> +		size_t size =3D min_t(u64, cursor.size, SZ_2G);
>  		dma_addr_t addr;
>=20
>  		addr =3D dma_map_resource(dev, phys, size, dir,
> @@ -426,7 +399,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  		sg_dma_address(sg) =3D addr;
>  		sg_dma_len(sg) =3D size;
>=20
> -		xe_res_next(&cursor, cursor.size);
> +		xe_res_next(&cursor, size);
>  	}
>=20
>  	return 0;
> --
> 2.47.0
Looks good to me.
