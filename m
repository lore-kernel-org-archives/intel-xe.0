Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CB1D41C3A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 04:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A894610E0E4;
	Thu, 14 Nov 2024 04:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gq9EeUTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A78E10E06A;
 Thu, 14 Nov 2024 04:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731560354; x=1763096354;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WlPaE6tQHllI6Z2jb5FVcUXqhZ0BiTRmEsU6ikohyI8=;
 b=gq9EeUTCnCYEjz4WUt59T2DzmOL50qb0rJNGzThaxYt6DFD7UIq7F0VU
 vqzsFu2BHsC3rGsY0eDcfjaBzM4fHUculpYA6EqDmvTXKJPGDHXB6lDQw
 qJVv/x8uXehnHHGfzq1kZ7zQvbd/hTSC4YpCyg6W6/VUpW9EMAXq1s8JB
 zeqaIoz9dneZlHKKLNk2Q0J/J+KBOOV0GEP4gjwlDe/ACnt0FFhZjX8jr
 0e+zEtDrNRlG7JDoGHPvDlzTFGT1r2ulh9Id0CS+Lmn9v+X4BREzA4+3s
 LZoVpIhbFEODcaSUVj1QwLR2+Rff1SHP8OVZHYJno6FoGPWZERwt4XxGZ A==;
X-CSE-ConnectionGUID: IJxlDPSWTkyFr/UJ9F6ZgA==
X-CSE-MsgGUID: 9khPkOPMRP+89231Qcu7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31584846"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31584846"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:55 -0800
X-CSE-ConnectionGUID: 7qpSr+XxQk2zvLlJxLKn6A==
X-CSE-MsgGUID: InqbPpUSQ1aSd+SsyrdcSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="119018816"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 20:58:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 20:58:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 20:58:54 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 20:58:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHBCLPb/YqKmafcOjJ0vsrAwznBik5oFKFUBmqflLBzqyp116VwQU/g2ftCBG4CPG10rfHq//EOnVykbQG0Lqg8HiFZUeVpcDnHH8KDcEbCtKDXRFChRvzSehWG57Ip99kS4M1Yy7rkSin6IRa+8PTrgHcmDD4iJEwJ7lWVfHgbrJ7M8HN/Qp/Fj2cKp2tQw7tX15kgNwKzvIrWGBFG0cLSMdOnq0Xzd+jSdHjSZ6YCOdImV2HLX4dzScQtW7kdfSSZaYCi6IGL8xZeVLx54BLpXatDz6XDqueJ0FsiSq+m+tTbRLBKnBjtESBV93X2xrs9jlDUEKxumiTzOM6c+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SugETmoC/2C7TSdCfrcMQHjy2p0Uc7AXbv4mZcd0Fo=;
 b=BUcmGgzCKy1osZndSayx0ScxPnT0VwE8BPR7BpnPQCWFMmEl2qKBC50LTUIUHcjapQ4171R6bJRLpSkNSRQxhspw5eDXTV2fQsnxMIYp+NuYJwhRx069y9qCHTtXiEmwGyS75/XejvC9JGhqirA9IXP0hn05fcnhqptBKjRtLcQxAzOxop8r02KAO3ObtCtGpgzFdK7RG7CqJwf6JiSvSfNmd6ogyNRoe1AD7oA4nzbafx5N1L2ssVGowU40hvF5p41x/F0hZ5dY35kL7G5XOpNQZDZq11ZtObjrJiF2AE7iDgXqdg9hYfrrA2lu4LooZPhVvC32GIkIjQboSHBcCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 04:58:40 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 04:58:40 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 0/4] Add pci_membarrier test in xe_mmap
Thread-Topic: [PATCH 0/4] Add pci_membarrier test in xe_mmap
Thread-Index: AQHbNdU6ZnW8PqoWDEO1E1CFGruKcbK2N/Aw
Date: Thu, 14 Nov 2024 04:58:40 +0000
Message-ID: <SJ1PR11MB6204F5D8B1CEC6B481EB69A7815B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV8PR11MB8462:EE_
x-ms-office365-filtering-correlation-id: 09fa1c2f-035a-4eb3-83c9-08dd046901c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?83LLtuSxNkm3oouNFqqMqmlD0KcS4vUMS626S7BXqoxmKNPuZPkNGVdbE15M?=
 =?us-ascii?Q?+C6PEJki/lk6Bykr51+F7L7tf3IyDTD3xX5vxQkdGJabflshSBatk9onEcR7?=
 =?us-ascii?Q?MxxicpQXtirku6gbTRkzaHtIgC2Go7IN85ax82/FZp5UCq6v8RIRVwskIjAG?=
 =?us-ascii?Q?9v0LfJhQjLf5Ze8Z+voWGljFpJXklWdMHiMD/26n8jNRuWhngR02gogMGF6V?=
 =?us-ascii?Q?gexsOTnqoBKbuOSmM6VZ2UD9XdclZSIGw5beALgSjwGwKkepRgpBCOKTm3uv?=
 =?us-ascii?Q?poSPyNEDgTIMaFI2W1+xE2MYr6WYh0SOZzdH7FsBqx0pOtkcoWUyqrCduJDr?=
 =?us-ascii?Q?zu/0CvDdxy6fTOHaorXBHqoljSb09yIWBTiS9R8LqpdY+MXzvjSSrmyl9JVm?=
 =?us-ascii?Q?ijX7Ov6q32h8bX0sKNXQUyDH1nLOJVNOEB20cohb8Rp9ruRaqyqAx28Ulx+o?=
 =?us-ascii?Q?iVvoLuoE7XgNzTmJAymgaEmHRLfplSKnUsoSLCD7RhrSp3rJUVjAbst23hND?=
 =?us-ascii?Q?d6BPINgQzj/3uu7DXa32so/BtDdow5rzBv0IW3x9VBuq3epHoEv9apeC6Fsc?=
 =?us-ascii?Q?oV9+llTHtjVoIUwzt/sKedpGxpToY717D0beH7PlKd9HNjiyqKhwd7nlQfoN?=
 =?us-ascii?Q?0CwiUrmHiWISShi3Q27XusebYLeM9k0oVyUKZ/kiLMdDaIoRJePbUvZcV9tQ?=
 =?us-ascii?Q?4CNlgNbPi7u2PWXVsRAiwbYG0NrqCYgPkcwKSmhn7RRyikMSSpCyQmE1mjY8?=
 =?us-ascii?Q?3YBWe5Uzg+Xa60wJ9DkITd3gl972gSHkO5uB6K4eFMibkiq0pLw+K30SjELs?=
 =?us-ascii?Q?xbIlUNOFhPnVD+YZTNhEmSwAxl9cCrWWTDP8LJK1ffyQ+pEQi58QGTVaCHQV?=
 =?us-ascii?Q?EELBdl3uSjX3itM2WUVHstsSK4p91Op9c2uVsPG1DJIB/Cyy3YifTzbiYIHO?=
 =?us-ascii?Q?Mwf9P+xsKvfo55RmIC9n8H2lQ9dQ6VGdAE1bHF4Hcfbu+WRrndBuUXVXuQvi?=
 =?us-ascii?Q?x0V8uZ8h518TvOsS5I0TsknpOm6IH2+mx5zzN4FAnl1KhQrAGJyqPcXmu9oP?=
 =?us-ascii?Q?04Uyi+tgCJIAJKdHtmQ1TIYkCtSRD5kKSp7WFQ02tpOmpkjYIFj/EojevGMX?=
 =?us-ascii?Q?fEe61biiWdRJheS78j8rn4Fushh7bhJ94SNdiAr/3jM0epTU5toGyuaxe92T?=
 =?us-ascii?Q?vRZtV+0Wu4bZ+5klbnia/UP5az4hnb7lrUEnpJsoEYxTlyABce3k471HD3HZ?=
 =?us-ascii?Q?r5HzQOn6hUp2WAaOyt8EHS1BKe7KNoXqh34mVHiXwhpPl7sKMav9OndMcApd?=
 =?us-ascii?Q?gonQT86ipqYUFYB+eXcuvx/nyjstySCMB6c4I0G3u+kZbbmIRFIpKGff3S/Z?=
 =?us-ascii?Q?mRj6kjo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/H0WKyn9lO5VqAd15LefU0l6dNUd9HvBcsVXWK74YeVykQHmaEKiSpCV/KnC?=
 =?us-ascii?Q?mADmOyaqqDd2hCVft5asXAFWXRkWVXZgvwL0T19hWo9iOxD71aiR9FHHX99G?=
 =?us-ascii?Q?Hd8DWhUlUmVZZesQ2wt50P6D7CrAsiFBnAI4zWi42s0FXXLXfm9bT0QYkNWw?=
 =?us-ascii?Q?Yj61kSK+5X+ttcFf+rVY93ysBq7z1ajnZvZTO8lEDSm3jSi930MuVHr7/atr?=
 =?us-ascii?Q?HaCiaOlQgAlHMHm6fGuNDKDkgyfn8ON+KSMyHpcel7GV67A0QueDKh12qP9p?=
 =?us-ascii?Q?M0AGSvW3wNpuyFUnI3SYLa2akzotizN7NOkiM5fcuGkT2rO8yGCeP7pUNngw?=
 =?us-ascii?Q?GsCrMX8ASGmk2WT7DqWkFlxPxKYZgvGShYMdAnnHFHNAyJ7LNhsbuOaQHpcQ?=
 =?us-ascii?Q?91KLmRYui/BZ5Q+gpeLj0pOuPFYJZrhvIeKeNApHcuOKqakSbD2REZXiDAjd?=
 =?us-ascii?Q?9Kvq5y0N9N8B9nrpSaxN6b4SPgGUNpohcI3t+UUKH1REEwU8QErISAgHPTM/?=
 =?us-ascii?Q?zI0ZNOQD7dqQHbTAvLo9YlGgAbwz3zo/Wv3BK52ZRiQYUeYVs27e8UrNeHLn?=
 =?us-ascii?Q?aMBG6a0Qxv+tPCdqND9IqxuaLcEGfYYSTua1AkZfJva6E1CkYOApm/k5p/Ts?=
 =?us-ascii?Q?cg/0kSpwks+Am8HSobp3XcTtHuahaVcGrNyaN5z3vk4yp3Zqkgxmq7vBx9cl?=
 =?us-ascii?Q?4zdQGeaj23TldMOw6+ZWp1yZxtrYURN2nbpaCzO3Fpr+hvaEIOAezMjounIQ?=
 =?us-ascii?Q?UfeUjOLuWwRVpNW4UeWTEbKFLBMolEdAsyJlnAaxJJ3LwdlXK7LdeX9rb++7?=
 =?us-ascii?Q?EF+hrpSSzwn6CFxFG9JF+m0dtQRTs0rTayBwQ/JWhxawcpU6AiRmJyWVWeaR?=
 =?us-ascii?Q?pnBMgwkngWp6FmVppesr3PxEEHx5f0hiMdfWKZB7NmcyVGlx0xulaMNWQgeE?=
 =?us-ascii?Q?xKho3nmE7uDiOAESeRXJOwm+IHeWoHhFH/xW4nawc86JCe0RWJa5eQZebftL?=
 =?us-ascii?Q?CYO1lqjkG5Vzgi/O17BJc82yUGCRNt+3sGFDr6NMoTie1vhr16ENKztp35f9?=
 =?us-ascii?Q?h025qwR/Puf0pYQzudvWZH3gNgzQlYMiPykihX3Q55T5gMSy6QxGYVvueUBO?=
 =?us-ascii?Q?X4AHt5I08aqsWcoxE7dyUljM2l/7N/sCPovYsRM5y2DEBCa0iKdzLU99czh9?=
 =?us-ascii?Q?37/C2g2yFo16yF6WMmOrKzBK8+g0voYRXJXvnjLhmziVRYa29mBeevuGfgTX?=
 =?us-ascii?Q?LrwWfPzhu8AQEtQ3W0CuWScl1GFiqI09bFoyEGU2MwudV9tVJI1SblXsKSl6?=
 =?us-ascii?Q?qMBbEjWVco+U8P9MvInmIHPvIKRK4Apco9RQGU5Lg2CW1mfYLB5KiNWF2Oxc?=
 =?us-ascii?Q?rs65q0lBT34u7s1j2zTxfA0lryZg7+QWa6TXTnBxkVW6Lhe5iGZB4Zmp+fgE?=
 =?us-ascii?Q?4+l3Imo+uDJckEu8i3R0VPB9TL4KcTBOGfDnB0fXyKL5MQJxCxZXC0oNwE7Y?=
 =?us-ascii?Q?Xce+bGYucag2j3khTnJahcV+LeItYDFhXGUgekc0IWtK1ey5Kaf1lJlpTkb0?=
 =?us-ascii?Q?mx3tcdS+dmedqIBceV3R0C7FkOYfCik78vdihH9h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fa1c2f-035a-4eb3-83c9-08dd046901c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 04:58:40.4106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSK6XYjPBigXPXlXlk7X2yp48IGfKPETHQqwBCQGGV/fD8GL/mfWNkev7X+xONyzl0ayOoeKb2gllaS9SpFiyt6B/r24bbbMVyE5Y9UgPXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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

Forgot to "i-g-t" tag, please ignore this sending another one.

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Wednesday, November 13, 2024 7:40 PM
> To: igt-dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH 0/4] Add pci_membarrier test in xe_mmap
>=20
> Series adds,
> 1. Remove all local defines which are landed from upstream kernel include=
 2.
> New flag in mmap_offset ioctl to provide query support for special offset=
.
> 3. Adds pci_membarrier subtests xe_mmap test
>=20
> Note: Similar drm-uapi change made here is under review in KMD as well
>=20
> Tejas Upadhyay (4):
>   lib/i915_drm_local: Remove macros added via merged kernel
>   include/drm-uapi-experimental: Move i915_drm_local.h to
>     drm-uapi-experimental
>   include/intel_drm_local.h: Add
> DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
>   tests/xe/mmap: add tests for pci mem barrier
>=20
>  .../drm-uapi-experimental/intel_drm_local.h   | 29 ++++++
>  lib/i915/gem_scheduler.c                      |  2 +-
>  lib/i915/i915_drm_local.h                     |  6 --
>  lib/i915/intel_memory_region.h                |  2 +-
>  lib/igt_gt.h                                  |  2 +-
>  tests/intel/xe_mmap.c                         | 96 +++++++++++++++++++
>  tools/i915-perf/i915_perf_recorder.c          |  2 +-
>  7 files changed, 129 insertions(+), 10 deletions(-)  create mode 100644
> include/drm-uapi-experimental/intel_drm_local.h
>=20
> --
> 2.34.1

