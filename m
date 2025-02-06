Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF3C02198
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 15:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BEB10E1E3;
	Thu,  6 Feb 2025 15:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzNYupXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B1E10E23C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738855911; x=1770391911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nl53nHCkBKtQEWYycDdGNsOiwH2cbG/J25MT5PI01ww=;
 b=VzNYupXKFzJ0eLtjpDlfP+B2CxrIdkwF11PYiq8Y/oDLya0XSg0loBPM
 O8RbGsa3MZxTZ8Q/V6qsB/AeVvWGUS2hWEFypKsyhnXPG5u/7p3AICPr0
 v9Um/8pQLQDeomid1854M74FUuykYD6E8zsrzpzrqk5fuMJO2qKMtBhdG
 hkEfBVxPiARNZKd8qKZvTjt9Ov1aWlYAbaOdCDnEkQXJCwqdCcpeSYiHL
 mLlS1ysteAQuqrdMq+kUbtSvRuQwdsPi+XgsMXRWIjFFKqZkJt7KOiQlx
 hhxMMGS0wOS3NBhE+0tEOZa1YYdtouHew0uKwz8uTOmI5Xxg9qlkaBtpM A==;
X-CSE-ConnectionGUID: ry1OswWdShG9oczazu/i1w==
X-CSE-MsgGUID: TJiYhzK1RYW2nZhS6Q7XYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39362736"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39362736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:31:51 -0800
X-CSE-ConnectionGUID: Nx5L7KGYSsCDR6FoUHSHEA==
X-CSE-MsgGUID: Rg17QKXXTUiV9M7Hgw8KVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115860784"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 07:31:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 07:31:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 07:31:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 07:31:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dndN0GMmB2rKCvKlgAf6vRcMW8iEfu/pi/ylMjTrxR0hQv2GAnct0AntsWf9apizUvQLcgU0Zen5sD2iAWyPyQ9JzLuReig9lW/gpfqtHWpLC9+lNpcp6qGqSN1zpituvSLZcT9rogJlECjb+eCOsyEf4difKP3tDhNzlfZihhOsrqYsz4j7jpSorCZAkMcIKgnJhXgLg/etOHWe280o2nZSNiFGhzFELxJBKJTzLzoQ2/sRzg9BVn2s/b0od8SXJwGH1dba/XFJgBVqzO4hz0B2zdGjQeaFCHwEAlykGRqp9yHNE+9VSEJlmaxehj6ebNcv/UKigez38WnyyhP26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX4v9MkhdorExSF0+qZEXIacu91EwUiegPu9hJLhGno=;
 b=bza42td2cj2L49vZj1MTG0ZXlLBtd0qKHjb2ZBystl+crhhvOXH0UDr+Caqhhzzfvd1g5ihv41PaOOcVkIma/DpALgO9q4Y4tcSW9eWfHVCW2pN57YdD4PjgLsPwpMD4Y1eQLy+in5rw+aOrmzogVxN1yCoYR1uc16N+5vVbL2sFmUD2ghbOolFQkVdbGH3snzsW1j/CzO2assKILkXAiW9nEcjrbUGHsDSD0JCFbINdFFmnhC7yNrlpq+zaskWYm6IoOR7yBIzGb10YcwRGRjxYbp1gSW58rYHYRB+6TYvbQ6fIsnzX+vLdGVzYeuaQOcnXl6z2l6wenkjALidEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:31:33 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 15:31:33 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add stats for vma page faults
Thread-Topic: [PATCH v2] drm/xe: Add stats for vma page faults
Thread-Index: AQHbeJ2JTjbn0m4fuUCnwz45smtKi7M6YIkQ
Date: Thu, 6 Feb 2025 15:31:33 +0000
Message-ID: <CH0PR11MB54443A257DF88EF5ED38122CE5F62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250206134551.1321265-1-francois.dugast@intel.com>
In-Reply-To: <20250206134551.1321265-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6344:EE_
x-ms-office365-filtering-correlation-id: 3deb609e-7504-4abd-3f67-08dd46c35633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RMRSfB8vbxt2Gv3/kKr1wwihVxPmWL2BgtKpoq06tFZdgDLaEwaWReENuf2r?=
 =?us-ascii?Q?jRZWbO3tFN8lBKT8HtJQLMoc4nChWVrmQ8HLgBdALkB0S4ivGhKy/jfbfmdY?=
 =?us-ascii?Q?V1RTUF/hqQZ6eYeWC0SYOxTrntMeQd6468kRJc2Dh0P05mMU2gB3l3J3BAjJ?=
 =?us-ascii?Q?0XZlTZUDSUog4J5bqKTFy4WMRyhhNUbJV1OXyatj32UhotTNQyzSnwS3zCEy?=
 =?us-ascii?Q?hYFCQ4Jegcm4FrdA9uKjreRhoUpeZN6SjXxFhrKIrJ+CQvzii+0fXtGhiHxC?=
 =?us-ascii?Q?jpMYJZkttbvSnLxX+TSRJiz7rsW2FvAJQiECWoRNPsfTCkneAe8RS/JuCTI/?=
 =?us-ascii?Q?KHe9OhnhNS7u54ax2T4y24bf9e0w+Ip33upQJMrIcL0dQmzpmnK0Iw+9PF3a?=
 =?us-ascii?Q?WP/A6zppCoKx15yg08izPf0xIs1pq51K7owBiD4/eKjDCn4vl3fN4kt7Yp6+?=
 =?us-ascii?Q?LzmSQRsgYKIjBEJWj3xmPanviMAcR3lFjurFfz3bnnQgI/Lz1zku/gKcp8fW?=
 =?us-ascii?Q?RssZCx2Hc+SnUXFI4M0WKwf85bvjj8skCVlCC6lEc8J/562ws8HKxpZRK092?=
 =?us-ascii?Q?rOwb1RgRigMcKxYVTn91YKyo5Jpu/c49OjbGGEV00Y2jc/IzxOu1f0H6Y32c?=
 =?us-ascii?Q?fqChvVZ+teOPQERFW18rvxPZNaNhmCzkjBO9hZ5R4OWqhJv/tII+NekIq5SX?=
 =?us-ascii?Q?GWGHM74KOOtqycbo8FZ9THoyOqw9vIRDUCFLTYiri4FYghuuzLftxF/bEUf0?=
 =?us-ascii?Q?oywd6ziOEdIPmaiDjxZ3irCgb77+SDG0u5Ncu4FJOq7oCYQr+B4wmkvwogZb?=
 =?us-ascii?Q?wVQKwIY5XcZyWhQehsXjXolMqhgPH5LJMzp+Ao7SRmPfik8EbgkU1SF/oDn0?=
 =?us-ascii?Q?FGzwDugjvGLtn/ErUXiXyoU1KBwraZCIqobArB71GY8eYOVRu+7GBmLSvk0S?=
 =?us-ascii?Q?QHABdWankwuwClBgZNv6wMBKLUkPNrJ4bd8/iOeb38Ni4nNT4tpW/CNi9M0X?=
 =?us-ascii?Q?EtsvzdjHS1gV7ebXOnCpNimMtXc/lUep8ibqDbhCPKP2DD8lLWyr0biOmkQL?=
 =?us-ascii?Q?1ced+GwOrMmEH8b2MCs5d2hOWoymUZoqFijlY5jdRpsKCyukPNoqlUITHyg5?=
 =?us-ascii?Q?FntQMG5hk3KK9CHsUNLRpK+7vAXtXwuGOxnlUcVPa/qsJbw4C/1RCX6p/0fF?=
 =?us-ascii?Q?kF95FtFcEQNdeCMGsOLsL3onYz/JgtQo8vh+Hr7RMXq3PZ0Pq+CA6vZA13a1?=
 =?us-ascii?Q?AdkVKhd8JHeuWRL7XRU7M9tR+gMG6nUMesg0cK4QblE+m8aoV9dli2m7fp0Y?=
 =?us-ascii?Q?lqhHQiSyt0VyKJEfZMlH1urx/IwjGB39MHMWsV0ukTNMVl7SjZOufkvUMLLk?=
 =?us-ascii?Q?fBQrshmQk9FqwngnzZpG5sDkdQlPIUFOXJs5QCNnmKVkhDz2/Wi5Q7+4Melc?=
 =?us-ascii?Q?/6pgfouMF0ln3IQxgaLsvJ3R3C8Y63pO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dzPYwk6N3YTrqX8a5x1RqOj6OWpAXF2HTyGL9A2R7Ge7Vn8Du6Z0ntIsWQRx?=
 =?us-ascii?Q?ULwiUDKQuwKDzrKIz7G1gF6XrniqurRAj5Pr2GMA++JfmhI0z9wLdHTvVrHy?=
 =?us-ascii?Q?ZoVEZIHQbpt/ecEtfhLJJCVjjSrQxUKScVrT7lpzAKAzsEsw4xtErg7+Nck4?=
 =?us-ascii?Q?7m8cuy8NfpGbABtSvmuqeIzgyywChMwsG41tGOLAjES3F7SCL9f90bx9Yloz?=
 =?us-ascii?Q?iQQlDAnB1HLHVbajYVxL2AyDLVxx1qFDN68r2Kq7GdHcCBtBobo5DR/vhpeG?=
 =?us-ascii?Q?MA766qdZ134+7nWkSu/8j2A/AB4LdTLw/mBU9EEHmydS0KhQK3eFq/X9qD8O?=
 =?us-ascii?Q?FpEF5bPJtuMb2gAepTTO1Tlzee4GzNuiCJRqQ+RZhwCX7s3oWNaLWmojsXqX?=
 =?us-ascii?Q?LzT1beX50X4bsQwbMnxH86DlZYeI0YryqamXjBf2ZjJzCIkb56gfuJu815WK?=
 =?us-ascii?Q?Aeqfnss0o3fC36ISwGFKq6enIoHiHeMTS7oXye9zK3ZeXrWzzVFBYlPQR9Rg?=
 =?us-ascii?Q?1ZlFebX2jZFDcA7TSHHebCuPjQ1mincRnXh5ZlGyeej8yYtM86W5E5cuz8tX?=
 =?us-ascii?Q?p9EzsDLCXaWttVe94BfA2kNjhaTsndsV+SC3Idsj/Sew1itBbAU6abjw+LDT?=
 =?us-ascii?Q?GvaBM0U3W8ev78HaCnSyaU98C54LLefVAv6lv/gbv9y0g+gOLtkwi1KXYDAl?=
 =?us-ascii?Q?h7L8ElMnc6gEovtnN3X3t+osivPTZKJ3pPpDefpOG0Fss7Qscflp/evgwHiF?=
 =?us-ascii?Q?fHj3KnReScsOXpJNgYXDTl49lUfIvBUWmeDLKSNMz77sAilSSP/4bkdsOPlj?=
 =?us-ascii?Q?CxcDYVEwpBBJ3HRphfJ/aggmXmQOdC1SwfXua4QcrK5Q17Ib0hrzrymTQTI3?=
 =?us-ascii?Q?+e6wmc7QiXN0buFONie2ow8mo9y9018C7RLyU57F23F+fUBxyjMQx2Jju88s?=
 =?us-ascii?Q?2XPFx3Kjur6BF7AKajw1i9yXa3aVd3YsqiUGUrefVJ73eSx87LrxQ+nlM8Ez?=
 =?us-ascii?Q?+OZtzWrs+elDkBblTKBT35lxi1sw402ihvV4pTzARMt1NIy2edRT1J8WaMJ5?=
 =?us-ascii?Q?WuVxipbzhyk0awZSk2O8vskdK2OYXCYvdzGvlG7raBGrdujYyWH/qDWrJC3L?=
 =?us-ascii?Q?rPV8mYb3fllY+vX8t/ytZHUVFcm/jy+Tv43FiCnp3yGloAyKnI/b2lan3SIj?=
 =?us-ascii?Q?qvkJ9F2TrJFwgHkHu8L/2aZ98l2/37WQcqkCawAcMSmarCmC1wMYQjlK3Mmp?=
 =?us-ascii?Q?/LpIG0SCb1Y8TZ7ORtH1IGaPcAluP3GTRrW4jJxWilhvvC0Ac8JmN2vMrz7N?=
 =?us-ascii?Q?z5v54+T2dZkilZLSI5aKJ1tFAIkEUTAVBU8YyH3Au0TOk0ceZhlbDqidwnlU?=
 =?us-ascii?Q?N/TlLJ8MO90SFPWt1dNyWjraL+wGyvNCzOVEzMDrRtM4AW5fEjsjnHRdBZcX?=
 =?us-ascii?Q?ABin/2pcuQuzeK2/9Dgv6dSg2qR51Nciam+vvVUBZCxloL3zrfSKycAcxR5m?=
 =?us-ascii?Q?ZYGVDHx0ypCzevPZJYSOWC3KrR1ahbtzxbp+hpMdMlNb/OSRDuB/MqIzFenV?=
 =?us-ascii?Q?StyKuegMB0EBE3C8o7ioiBTofnupNLIa4aj4p/qN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3deb609e-7504-4abd-3f67-08dd46c35633
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 15:31:33.4737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZUGYluxCHv0/6jzmAyZk5yaH+63seqRAwtyNx4cOQcF1JWed0gKxQWswNue/gVqkVO5di9M0TJbR2kuBTKYVGWoRHlPhB5ekaIQb0AOGTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Franco=
is Dugast
Sent: Thursday, February 6, 2025 5:46 AM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH v2] drm/xe: Add stats for vma page faults
>=20
> Add new entries in stats for vma page faults. If CONFIG_DEBUG_FS is
> enabled, the count and number of bytes can be viewed per GT in the
> stat debugfs file. This helps when testing, to confirm page faults
> have been triggered as expected. It also helps when looking at the
> performance impact of page faults. Data is simply collected when
> entering the page fault handler so there is no indication whether
> it completed successfully, with or without retries, etc.
>=20
> Example output:
>=20
>     cat /sys/kernel/debug/dri/0/gt0/stats
>     tlb_inval_count: 129
>     vma_pagefault_count: 12
>     vma_pagefault_bytes: 98304
>=20
> v2: Rebase
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   | 10 +++++++---
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  2 ++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h |  2 ++
>  3 files changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe=
_gt_pagefault.c
> index cb92fb5cbc75..46701ca11ce0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -124,16 +125,20 @@ static int xe_pf_begin(struct drm_exec *exec, struc=
t xe_vma *vma,
>  	return 0;
>  }
> =20
> -static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *=
pf,
> +static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>  				struct xe_vma *vma)
>  {
>  	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	ktime_t end =3D 0;
>  	int err;
>  	bool atomic;
> =20
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vm=
a));
> +
>  	trace_xe_vma_pagefault(vma);
>  	atomic =3D access_is_atomic(pf->access_type);
> =20
> @@ -202,7 +207,6 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe,=
 u32 asid)
>  static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> -	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct xe_vm *vm;
>  	struct xe_vma *vma =3D NULL;
>  	int err;
> @@ -231,7 +235,7 @@ static int handle_pagefault(struct xe_gt *gt, struct =
pagefault *pf)
>  		goto unlock_vm;
>  	}
> =20
> -	err =3D handle_vma_pagefault(tile, pf, vma);
> +	err =3D handle_vma_pagefault(gt, pf, vma);
> =20
>  unlock_vm:
>  	if (!err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_=
stats.c
> index 7a6c1d808e41..2e9879ea4674 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -28,6 +28,8 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_g=
t_stats_id id, int incr)
> =20
>  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] =3D {
>  	"tlb_inval_count",
> +	"vma_pagefault_count",
> +	"vma_pagefault_bytes",
>  };
> =20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/=
xe_gt_stats_types.h
> index 2fc055e39f27..b072bd80c4b9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -8,6 +8,8 @@
> =20
>  enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_TLB_INVAL,
> +	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> --=20
> 2.43.0
>=20
>=20
