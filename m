Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D83BC0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 20:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066F310E0B1;
	Tue, 11 Feb 2025 20:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMk9xqTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EED10E0B1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 20:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739306703; x=1770842703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BxM9Ir8iF3aIl94A4PB46r+Dy4HboK1j2vhs+zPfs2M=;
 b=lMk9xqTa1VbcnfVfvUYGUB5XcGAg8TMyWtq+ATgTtL7WYbx+DZjrCIM5
 JY7QcgpzrMF4NzP7ZL3fzzWdkD6eNmIqiqfR4rJMpar7BzmJ8cy+rhMfx
 OcRi6mKcyh7prk080KK4boCTchuLULFbfpr3McpGqiu226uDYm7+v1Hj/
 LOZU+ohOD9kQgXBKgAkaMpuKIoSgQvr0Crc012eWRoOq03htYvFIwer5T
 +sHCzZFD9Uw806lvLLmvsio1Meu2jWUh2cAuYUZ4cUgW+x8yvaWhPjSaP
 QRWCprOQtfH2+gLWwGsYv6BazHAy696AeUKBYZ3LNRCB4+QXFD1L8LBD5 A==;
X-CSE-ConnectionGUID: uJOU7wZMTju3FxHeerS2lw==
X-CSE-MsgGUID: /CsRYysCT3WmdiLPwNdLOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39966003"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39966003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 12:45:02 -0800
X-CSE-ConnectionGUID: 5sLNNzcSS1KCX3cKBOIrCA==
X-CSE-MsgGUID: D9u9hCjRQu2ESZ6a2USgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117556298"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 12:45:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 12:45:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 12:45:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 12:45:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/HsaMYOMBxYM5GThOp0g8XgIyR1OgnDtjjtKTOJ5ajvAnpqLHY9ryFRjxNc8FPjRXNF09j346gV03r+oxFvGw1wApUa2U5QP+kKQ1z88F63VvLxbR4bQQDFEOyb+ByWfBMTebtIuEm3QC5ypi17SxDG2hzA7v05mTfUx9N3eQD3Nis67oGGpF85ym6l2xE9bTcrY33A/up+eLvKAFkIT1AHTGaElJ6Ba2zY3Ye41fPYONyqoT5LxBFkcGLZIZ6aCgVruZbmpY5OCd5muPzCJnQo7ENW7dVc2xi1I9qouMQlVENjGbN+CB3S3OdGmY1B1VL/NO2TnSbfyLIg/cFFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=969wd+p7pmzMWeeNk0AvLoIcPjuBzz5ew7qv8H4KKx0=;
 b=y5Zt+rPIBJRvv8ZBd6Li5m97SVS7/fPW36Z9fzGx0vwNJewyfvsGkZbg7VhpvpDDnRBtuOHl1W+gc+C7bd84jUnTWah9Z4SGHwUupBdhxqcba1t8+sAT7faY6pztr9puMIcgdc/HewyuQYUbNcIIKiJiHDOrqKfw4OKm6QT6jao3P0SJSYdUHi0UwGIC0DTrQ/s8LotNOnBu9Jeq/xCaaCDcxvxsnPEUPPuBh8ptENHbkcIpWKVGlgtzbA0IsH74wG55eOSZmc/wXH/HkmDykr6JWjc4XzEgFfRv54aDbLGDTAaHIgWWjB+nM4T5A7CE/fBwxtRugRYjOlYlkMdv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 20:44:45 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 20:44:45 +0000
Date: Tue, 11 Feb 2025 15:44:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <niranjana.vishwanathapura@intel.com>,
 <ayaz.siddiqui@intel.com>, <tomasz.mistat@intel.com>
Subject: Re: [PATCH] drm/xe: Add per-engine pagefault and reset counts
Message-ID: <Z6u2uH9hkHyJ5kP4@intel.com>
References: <20250210193657.96030-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250210193657.96030-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:303:2b::7) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 55879323-6756-4637-c0ed-08dd4adceb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LgdrorMdSbeLwOmCBSxRAmGlwGCuILrj3HJV/5aInRWd3t92WQ5iQFwztkRP?=
 =?us-ascii?Q?OwVmf4z7d8v8faH8kYoFysGjAjSRT0l6mR/ZvBHnHP8oTpCzxN+ApyeuHj9a?=
 =?us-ascii?Q?UTaDKiIOwl79SwbYzLmR6u6C+vxS/oxAQnH2FKO1Dz5jPK7sD9CCzyFnvKbi?=
 =?us-ascii?Q?tUkbSdfJWDJIrmnfkIaOeB6by69PRC/op8Xmx6G0qcue7588VvsvNYzkQ0dY?=
 =?us-ascii?Q?q4Jq/juaH/c69aS9/ua6BjCZwPHEn9kcSXDRJoHM7E/3Vra7DWnFTfUQmesM?=
 =?us-ascii?Q?HyJxMJOU0EBOUq7GYfGZ0A7YQKqvDDX1Mm+4WUd2BQuJETpK8w28qRgtnJqO?=
 =?us-ascii?Q?MwpymRtlEv2BzNWJMlfXXCw11p7vxvaOHtO/c+f/tVDfmSF3PTnStTPPc9np?=
 =?us-ascii?Q?WOdBwgnL5JhpKiWe+9zVEo/wuu6QJwfXqwcejk2yxdg3kiCrNeyjUNsAjo29?=
 =?us-ascii?Q?qel4UfNZssnn7gv+s7TM49i6RegME35G02z82EqaFTswZt0G86Mi/eVwjvq8?=
 =?us-ascii?Q?d92UUZaNT00/HX+xpQAp4n2IFOhylaNXmhc1LqdPNjGFPVpyQCK6MVIIDPUT?=
 =?us-ascii?Q?rwOeGKE6MhLg2zw03EdbEoK0/8mWxO2/bLrjOawuKDKhrmgAZ/DIarWu48FI?=
 =?us-ascii?Q?gkp+X7cBeXL5ZVhRJ4hl8iDH0M3TGbAzpMQerNmVR1jjChsmBhv34REGVS5v?=
 =?us-ascii?Q?t/YcSF+l2K+ad7OO7zbADM3nbVnPWkTHHecj+hPRxoKvWdIgcmKGpV66FEDA?=
 =?us-ascii?Q?4+E21Ut6v1jf2QVPCi5i3Ji696GpILtEre06m0vd6daLhG+AVn0KC4bfj7XK?=
 =?us-ascii?Q?wXyGePNnLFcjNTICvRef/3KxVedhH2XsFwcvhuNS5UdwnCLrUgjI1OY1vN5B?=
 =?us-ascii?Q?D5rQPHHmezEI132rJgFZwMSdHWX/88UA9ElDflMC509hZyohYxZp5EpQ0h2B?=
 =?us-ascii?Q?GTU350q4fO99EqwjZT2dCupbSYW4mSGImUWdnNgBFzzzw9IEepRFChPF70uh?=
 =?us-ascii?Q?z1IpEDfu8B2xBZftPY1sfqogmdyr+ZuocWqDpeK6KnfJs/kGKxPIBQPZ06LQ?=
 =?us-ascii?Q?5wTc/sDS7rmKxeA/1FrpIxFwy4PpacPXLMRqH0VwsAYCmsThBBKqcnZxdmPF?=
 =?us-ascii?Q?4JelKS0DVfjONWRhT4ltLC+DjBwbLPE9Pe3aw9Fp6daBNZp5JKKytMv3wscf?=
 =?us-ascii?Q?Y+xp1b4sJx52NlirDYjO0pIrY/lgoNjfGG9orzAKMWrH+cybv1K1RIA17i9u?=
 =?us-ascii?Q?vUesg1yMawGBbbBpTn5465RiIxkDLjpq0dJw7hWE5t6rQfTyBtqzVCK/Gbby?=
 =?us-ascii?Q?UJ90Nm9qIRx08XOplX/gyVdPa55guCXmuoJktSGEqZf8httg3gXigW+QdWuE?=
 =?us-ascii?Q?6qH5t4sp8ZAHRltqUPz/kp/58Hev?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?je6smcw/EjgrZgFcniy6hjVLuZP3bR34yjVHugQtH+3Xpxaqzm4diz1z2S+b?=
 =?us-ascii?Q?ijjEM/HZurdA0hefMfh8OpGInMGm62r856dousw9fJjvX+hC9yMHNv90yLz2?=
 =?us-ascii?Q?knVCV1YtOBn/Om71Q41hcKDVr7rPh2r4rQiiYrHdF2Ra7eRc7UKzOl0ee+tP?=
 =?us-ascii?Q?5HeR7/eaP0qM0PxRm/w+HHggruIzkXkAShK9lGcNwW86UCtzAEdoxJiLl56v?=
 =?us-ascii?Q?nbnYRtrSSPZIHfyvhAPGIO2+XPHjSaMV3dwq9Yq83KFkJ0NGFOi74iFnev2q?=
 =?us-ascii?Q?2SkGhUwGibn5eTNRUA04LuQbZ4NyPjuKPE2fBAAbMUF1DN4OkRSKQo0kBmU4?=
 =?us-ascii?Q?nSVns1Jyw+Gs2abA8L+LFSPkclcdF9xHyXe8om7ahHU2PDY4hM+pVSVOo/WE?=
 =?us-ascii?Q?gvgwBIcT6Dt0ZiZZ3y0tq8L/6WSH/2KQsUL2b76p/B14XCx8sAgPkueHJ+Pz?=
 =?us-ascii?Q?My2JfPTX4idIRi7nAEdXFW8ygPQIN34Wz9MLGdWns0eqfPLvOQ/UeDeg6oSH?=
 =?us-ascii?Q?XDADBYx16/qV1dY0AwKZN0DGC97cJvmr7aULQPwDadj+RVDe9zZ4gsAuH3ST?=
 =?us-ascii?Q?EkRmTvK9rKZjpa1yO8GXT6M4E3hSWZ8abjW9adFq9RvlhiXGgcYl1X3k1Zi8?=
 =?us-ascii?Q?CunkREZD9ycQSZk181axR0z3EpOGM1QisQ8ksU0g6W7fpdqsJ7Qa96aD7j5f?=
 =?us-ascii?Q?jDyTznni755ORbjn791gZYHX/lC44+C8wBhKMC7FIajNwEE8g7LuUd+378Vw?=
 =?us-ascii?Q?ipMPFDY867NoR7fyyZL0DP+xOvVZF9wJV1CKlAXXuDBobzqbnDbBVhchCNGP?=
 =?us-ascii?Q?k0gs04N2yaLT0IwkzZoOBsNXTu0IJ3IsjtIHsfGrwB4gPCwhUZAbLbUkZW9m?=
 =?us-ascii?Q?xnQt/EH4iaI173au6zFCzBXs7VmSnR6P6SgoCXCFlVphuGyY6CTUZaOztgxr?=
 =?us-ascii?Q?JZBfMqB54l2NmvkyR6YqBjyrxFrYt+nndbTOf96zjDIFJrQG1hoI5jQmGalG?=
 =?us-ascii?Q?JzP0+c51fQZ8IzXNdnXRrdAA6Os7dVwWDKaBmE+Lx2bZHZNOPdPgejIU4aaY?=
 =?us-ascii?Q?3J4HFsuagk8fedjSEGZoVyt4YJFkwLUXZOE7DXPgM9o4K/UeVc9ls7B+eBMS?=
 =?us-ascii?Q?fRjLPLCy39Rg5Yx4KoweSV3gZPCeKK4Ejyn74YHKcTKdmxeOt3RSfoVS34cb?=
 =?us-ascii?Q?7Nmc+Fdy6k6NAx74jBGeoimtluUGlSSnHud+ZgbrcKuyif2WupN+bvU13hrv?=
 =?us-ascii?Q?yorbmQb1td9YoMgrz3ZuJ8Hm0jSvhGVf40Qm+OSf81LI+J827hST17ukeSjZ?=
 =?us-ascii?Q?XCWmUlCUkTv11G0pVxrnvlRJTSI5k8HCsl7zlHmVUOf7ACe+F0wEFPWDE30U?=
 =?us-ascii?Q?WKtTsp5LA2T8lneGN5ACvjqg7nCOvkGJJe4z9a1za9xbRq+VW9z9WckSK4NM?=
 =?us-ascii?Q?rdojcaDj57AcfrntszkckJVaDqjAZNQmVLeN9gaG/vmd/MDBFaPCv9AcYRTK?=
 =?us-ascii?Q?xM8IC1HvEL1PF2DF4Vw+zIwN+Gve30pt8ZoIsFphoFt3NV88qabg1VhxOzln?=
 =?us-ascii?Q?DBdff/tjQP0G7kMi5uvLfnOfDGyYIzJoS+QER6E8jxpBuokJd652AvdVq8Za?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55879323-6756-4637-c0ed-08dd4adceb1a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 20:44:45.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+fdJjKyefO9/xJrYkiJzJjybyRgwFD5bmHL5QmrGt/tDEq2ZDKjUbLhesm2cBpavfnkjwFtlUMvQvtQ1vEGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

On Mon, Feb 10, 2025 at 07:36:57PM +0000, Jonathan Cavitt wrote:
> Add counters to all engines that count the number of pagefaults and
> engine resets that have been triggered on them.  Report these values
> during an engine reset.

My fear is that later someone start using this as some form of metric.

Could we keep this behind a debug config?

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Tomasz Mistat <tomasz.mistat@intel.com>
> CC: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c    | 6 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++++--
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
>  4 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 46701ca11ce0..04e973b20019 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -130,6 +130,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_hw_engine *hwe = NULL;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	ktime_t end = 0;
> @@ -140,6 +141,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
>  
>  	trace_xe_vma_pagefault(vma);
> +
> +	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
> +	if (hwe)
> +		atomic_inc(&hwe->pagefault_count);
> +
>  	atomic = access_is_atomic(pf->access_type);
>  
>  	/* Check if VMA is valid */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..6f5d74340319 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1972,6 +1972,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
> +	struct xe_hw_engine *hwe;
>  	u32 guc_id;
>  
>  	if (unlikely(len < 1))
> @@ -1983,8 +1984,12 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	hwe = q->hwe;
> +	atomic_inc(&hwe->reset_count);
> +
> +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, pagefault_count=%u, reset_count=%u",
> +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> +		   atomic_read(&hwe->pagefault_count), atomic_read(&hwe->reset_count));
>  
>  	trace_xe_exec_queue_reset(q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..0be6c38fe2a4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -516,6 +516,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->fence_irq = &gt->fence_irq[info->class];
>  	hwe->engine_id = id;
>  
> +	atomic_set(&hwe->pagefault_count, 0);
> +	atomic_set(&hwe->reset_count, 0);
> +
>  	hwe->eclass = &gt->eclass[hwe->class];
>  	if (!hwe->eclass->sched_props.job_timeout_ms) {
>  		hwe->eclass->sched_props.job_timeout_ms = 5 * 1000;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e4191a7a2c31..635dc3da6523 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -150,6 +150,10 @@ struct xe_hw_engine {
>  	struct xe_oa_unit *oa_unit;
>  	/** @hw_engine_group: the group of hw engines this one belongs to */
>  	struct xe_hw_engine_group *hw_engine_group;
> +	/** @pagefault_count: number of pagefaults associated with this engine */
> +	atomic_t pagefault_count;
> +	/** @reset_count: number of engine resets associated with this engine */
> +	atomic_t reset_count;
>  };
>  
>  enum xe_hw_engine_snapshot_source_id {
> -- 
> 2.43.0
> 
