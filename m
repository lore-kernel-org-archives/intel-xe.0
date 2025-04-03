Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28BFC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 21:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CD910EA6E;
	Thu,  3 Apr 2025 21:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCzhNJJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4810EA6E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 21:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743714052; x=1775250052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pzD/U2lXwrkqXlpf0uhvogj12blVBMFmt1zmY0mm7+A=;
 b=HCzhNJJN+85h18yTi0f8C17b13WXnRoHRxfAi2f9Wqd5rN29TaqXbuMG
 rsUwiYeYAVnpKEDcJ20RMbE6xBqVh4B4JLgxZ6EeMVnEOV76o69DCiejK
 7JwCNpnv7xv5Eo00R+jy4QDQGQUBLr11+TOnxEDuGXqj+IbGsUZ8vE1XP
 pxhDloK7E/ENId4VA83+AHkD1ow+Um8ZksRti2aBoRww6bQHxfKLTtEik
 8eaIgmh7f86XsaINnAmviwcWE1syJTjg4Er2/roD1fjaHenpvwqYo52Rn
 WaQT6wuYsybJuwqUUFscN9VRvtMFgupHkgQ7/stogGz163/YDFZKI5eHe Q==;
X-CSE-ConnectionGUID: sazjcUXETlaWJ+MowGNqNA==
X-CSE-MsgGUID: sQsU29enTuK8QiMfHYAbEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48800901"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="48800901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:00:51 -0700
X-CSE-ConnectionGUID: YT+ms87AQX2i0mf2gyJp0g==
X-CSE-MsgGUID: p37X0iliTaulTC5jVU4A3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="158099367"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:00:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:00:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:00:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go/IxN2SmT/7X0GSm7fiZZJSDsud6M5vOqDMb+R+zsM9y/H/7qFP0ixq18bR9kafDhdnynInUKwaJf0PBLbIRu7G86ty9Y156Yx+AAiuhcb2OGVLZCkvBaeBEloMv2nZ8dNAbe6zWtcxRmrJvUzG4bDUJ1z36hkrzJQRbrLv2xxRfhQZmERu7il2Jdaus7ShXKh7lQkbyBE17xXEqnRs+tTe/2gQiRmqo2PAsMWe8BryiiwSWXdR2Ml8B75cBfm1W7QIgZ0bBFnpFDxtUZ0+hq7ZQj5dESKGl9f8LNDjaxz9eAPqHzZlNQ7oW9LziW3/mjkGq77MauEOHRIC/0LH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgIXY8N9n1E/HEpqa1+x7GdSqPeGo677wYswkIbSQEc=;
 b=oTeKWzZSZcyloumhLVtqbIGTz1ov65YmRGutbPm7ND4MmdoflHaML6t99OZLHbu7LSM03C7gdUzNMGfMtWyw9FVmxlsORnYY6g/2N3LHbw2jWdo0kFsaX36K9blsu36wWvQE6L5hdA48Lg9n4z2y+mN8qYCGXfE3W9GUVneiVPKcLUzZNAaHxg5rPsQPD1ihPqAsV61247bo1oSxghMoKdOsPUW5tB92B3599SKLvtpMY843B6HXNQhG6wGjbzrccJdPwBjtpCBUo11zj8LwJ925jm3V8YnjcUTOXGs+LMDvOW1p5SfrldEhbgkLAEBkd0QiN8tsu3sTAZST8DvmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 21:00:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 21:00:47 +0000
Date: Thu, 3 Apr 2025 14:02:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 08/29] drm/xe: Rename lookup_vma function to
 xe_find_vma_by_addr
Message-ID: <Z+73SkAyGHotMRry@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 2805a4b2-6091-486c-ec2d-08dd72f29b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wo+sYo0NE5QEqWh4nk8kiPR8wHYwt8vk86DWicEToFP+Fumd0GkY4KP79EAK?=
 =?us-ascii?Q?U4k9KkQ9q0sHH4PYDYZKC4azSts9FG++PgE+WP2ahECTJCY+FoQzls5m7Zp3?=
 =?us-ascii?Q?t9GtYnMhvkcq9ENwIOlEhNkwWUcaurozzon1YutoXYhyclmsJSeUrxrRHtNH?=
 =?us-ascii?Q?wZoHl48SHFrmUQ30U3oIGdIiClZ+/f+Ecp3K1z2C2qrTI4HR/Z22m5xM11UO?=
 =?us-ascii?Q?GWFGwfPtwLrYUfsG+z1uSyBgGZtoFvexiSdVnYW6jHcF+SdV9/g59gn0YuUp?=
 =?us-ascii?Q?NIsVR6rTrjBaNGySaG+8wRoI26/YsVXAsMTPq/uvc1gKTYItjdGrPhjXY5DJ?=
 =?us-ascii?Q?VJtvVtEDYNamk9zUxBfae0/0LCT2iCjKi3LzweEQGj3h+C4/skOosjOGpkdo?=
 =?us-ascii?Q?kh9Yo2Ps/GCLIKe40yO+GEHxK0qeAyy9prggGs0D1uUg4+p96UijV4/QODb+?=
 =?us-ascii?Q?xziBM1Grnyizcz4VSkPk9irBvMwEo77PIa9Pv1gj3B27hhD7+Fxr6WzTF4dy?=
 =?us-ascii?Q?IVh9Bg21QJU2SBmmYv+J/mn+747eekngE3btqJdi3iUnUoWbapBOwfy2HUxd?=
 =?us-ascii?Q?1pvyYOeakaCbMMG3rqPTZ6cYD/L+GCKN6Km1XaA0y7OKSeetxHRZSg++rMes?=
 =?us-ascii?Q?GMjUGgTnZ76NbwzODKiX+3deTtMMYWoBl1WLP7Rs33V0tBABR8U5RNP/PRgc?=
 =?us-ascii?Q?6PnEyKxTyB9akWkhz+kL7fl8avy3mBe/NSuIGlkhasVrDhEEWG23dCU3Cncy?=
 =?us-ascii?Q?QaFREVdRoCm9TVhTDVOePHjMmUfHBl6kETjoKZnukGzGIoIpf+juMscng6sP?=
 =?us-ascii?Q?Y70I2AwDPs0/NgZzwH52PMsK+6N1OdWtVB5HdcL2Ow/ofoHJcgYovuBu6Epo?=
 =?us-ascii?Q?gIdvv2zkEt/GO3qOpne+ZJOb57R6TG1BhNnUHAQfozk1IS6AczjeO7EoWTOv?=
 =?us-ascii?Q?QKgC56jIon2HhBbm/ur45ht6oMmb6wmj+LfCBqXZKDQk5NOU8riMpuxS9hpn?=
 =?us-ascii?Q?+HM1UohTYrwkSrP2EXPt5eRaSsSNw3Lb1mAPdFhK30ojQyJbKnT6GZJHQ48e?=
 =?us-ascii?Q?tA1iN4ITppwJzsvXZlMBHfWKpGBZStcK7CUqArSn/C+zffKAn36viZ+kGjTe?=
 =?us-ascii?Q?zniKoVkc7+lCq2xw7BnOZsPZm+y0kLZCX95OhqE09lD6pNjPGS46Wrc5ETzl?=
 =?us-ascii?Q?WwV+tIclMu94Fo3oEK9B6+HeXkRhYIikLFeAowYSNzEYMwSJw0dlKAb2v7OL?=
 =?us-ascii?Q?9HVSKq1HJOvwYs0klWhM9pdCjKZNQbXdh5DIHVGNeKnVPz9EGh6vK1UGtpI8?=
 =?us-ascii?Q?C5dp0zXiK4HFbKpE4fUXrMuA7ZUUtZC9ihRAkMQDpYXHPCOPB9oH1RWWjg9M?=
 =?us-ascii?Q?4fBjkb4iNDNHcic/ow0bvDU04yJa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vl7ScNXUtZhsz4PNgkE/41llO11N9B5hxl4doTFdaHJfvwdStgS+FmGiOj/6?=
 =?us-ascii?Q?AX6HHs/BS4LwnKpwdlumqMNiuvQ/U4kR1lUagdCzUQCtDawjht4p4yUfSQLb?=
 =?us-ascii?Q?n0JEDcd208yZAYlocaCxBMrhpG0xCAhtu41d8CF7VAlhzDohEAk4DtJykfDY?=
 =?us-ascii?Q?ReZgSb0U1hi04ufNu44TkbC9rW21wgJYGw1hGWxsQLrSwjB1tkhmfr5IjTB7?=
 =?us-ascii?Q?eOamebJWrSNZzLMAjAeYxFVMe1nT+k3EokTCnLgLMc13idb0V4hfNXhE2ZTv?=
 =?us-ascii?Q?AKtTGi/GRHU5fb4ffFl3iLPeoPplTAchCv91vvBZnt+OEim54ykcSFuCAPJu?=
 =?us-ascii?Q?SKtJX8C60BxqGNrz29Fue+DpKgHKF5TToRdmk+B0pbuIw8yGvVV4Ce/IiLGm?=
 =?us-ascii?Q?cLhTGjeAwwOJ8sjiKB7eV1J5WUtiRGzZIP3MiNMIMAux5J/aA8jgOBj3iYBN?=
 =?us-ascii?Q?qfuHTeba9RyVLSxmrJ23aNMq1ZhY6sXb3C9T1807fMjzOeGyE3NULlw4/tWs?=
 =?us-ascii?Q?wvqFbTYI/sJCW001Y0y/PBSjoIPTRd52KvpHZDKzmH9zh8bU7iFHrX1+/F0m?=
 =?us-ascii?Q?ERO3fGmVF/etI6nxp1xbK2ef9HpST4cuxdoqDJTU6Lqx5br0iQvkU/+mi47j?=
 =?us-ascii?Q?gSIh6KJHk2m3zN9JvqrxESn32SuJERd6ysSzbeoX0FyQovrpfMKVNc7W3EFG?=
 =?us-ascii?Q?W4PCRl/z8r8YGbw5EBnmocR98ULx3uCk8T/T3kXuDY2aUgmTRayqqHDt6QRc?=
 =?us-ascii?Q?RBmpPqO5Frf44MQULFJQCSMU3MzcH6jZyGdiQ2j4RA3WIk4VsBRvME8DoTGH?=
 =?us-ascii?Q?j2n1MxuCsbHcY4fhJaRCMuQSwt7bmaD7Rj8yBUQxEA0D9P4f4afXIr8o9KTt?=
 =?us-ascii?Q?y2160c7hj1muBjNObDOGixVial2LTCOTCHUewGvuggqACRuxXHhrNL87X2km?=
 =?us-ascii?Q?jeSskNC9ZIDpuNyzU6LriydY92EyViBsVYT7p14P4kGocIzPlTa90wr2knfa?=
 =?us-ascii?Q?hHdps53LyGZa2aYei1PcJBG8btPGl5AqgyxIqyZmvqQm3XW36WHh7Qe+8a+N?=
 =?us-ascii?Q?oV+KBHCAS08JykxgrP3eEC1ggR+atiXeD54KqHjGYH8LcpVEHRgOvFG8/BIE?=
 =?us-ascii?Q?bJjHqzcWO9KTCzHImEnLHLmm0HVJimIpeE8/wPZEWxX7BSElv8eGzyOCz3RC?=
 =?us-ascii?Q?KuSyP2430M3M0ITqF7pZxN8I1D7NNkeeQz65mcFXQAq2oKO0/r7owCSoRdRl?=
 =?us-ascii?Q?DcEemWFmRvog7rzubJKaFKJWbsKgSSOAXqqTPSqc9C9eoxZUlUnNbRAoVxKm?=
 =?us-ascii?Q?jING2hirVgYpOqmCgXYjnlyV65SchoXfW7aj9lsxdKrrYOXyGjmGOFg1jcud?=
 =?us-ascii?Q?Tv2NVGXjFpkgsL1fGhkVvIUYQH8mEJPu7yGQLmEZJ6YZS/leT0/HkLGkJwBO?=
 =?us-ascii?Q?rYLX+06fQntkzA5kLsaowsXorrf+DO+WpUFnjKjW+JTTT9GcnkQYi5aCQxwR?=
 =?us-ascii?Q?owOwSjlFOZZxvYZpILk4+39lONaa8/QcR4bSVzsUkXSbLJGdvdwoQVXHd5HP?=
 =?us-ascii?Q?1dEhjyFk7EOy3KZqpphj496VaJ6fzoW2lcuI8Z/UfAPQwZ0t6N798qzvjU0/?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2805a4b2-6091-486c-ec2d-08dd72f29b6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:00:47.3611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZzZdVyRyaqrHdrxR+yljjjfVSO9HM/tTkbheZyDyUzpiOq6St+7tw89gCCfwpnLA1ZWGkYftuzK4J+x2pn/iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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

On Fri, Mar 14, 2025 at 01:32:05PM +0530, Himal Prasad Ghimiray wrote:
> This update renames the lookup_vma function to xe_vm_find_vma_by_addr and
> makes it accessible externally. The function, which looks up a VMA by
> its address within a specified VM, will be utilized in upcoming patches.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Side note just noticed there are multiple version of the list of this
patch but no versioning which then I accidentally replied to older
patches. Next rev, please include versioning.

Matt

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 +----------------------
>  drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>  3 files changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c5ad9a0a89c2..3aaf4090fcfe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -72,28 +72,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>  		!(BIT(tile->id) & vma->tile_invalidated);
>  }
>  
> -static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> -{
> -	if (page_addr > xe_vma_end(vma) - 1 ||
> -	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
> -		return false;
> -
> -	return true;
> -}
> -
> -static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
> -{
> -	struct xe_vma *vma = NULL;
> -
> -	if (vm->usm.last_fault_vma) {   /* Fast lookup */
> -		if (vma_matches(vm->usm.last_fault_vma, page_addr))
> -			vma = vm->usm.last_fault_vma;
> -	}
> -	if (!vma)
> -		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
> -
> -	return vma;
> -}
>  
>  static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  		       bool atomic, unsigned int id)
> @@ -231,7 +209,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> -	vma = lookup_vma(vm, pf->page_addr);
> +	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
>  	if (!vma) {
>  		err = -EINVAL;
>  		goto unlock_vm;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b83154d338c7..07cad2804b14 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2135,6 +2135,35 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> +{
> +	if (page_addr > xe_vma_end(vma) - 1 ||
> +	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_vm_find_vma_by_addr() - Find a VMA by its address
> + *
> + * @vm: the xe_vm the vma belongs to
> + * @page_address: address to look up
> + */
> +struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
> +{
> +	struct xe_vma *vma = NULL;
> +
> +	if (vm->usm.last_fault_vma) {   /* Fast lookup */
> +		if (vma_matches(vm->usm.last_fault_vma, page_addr))
> +			vma = vm->usm.last_fault_vma;
> +	}
> +	if (!vma)
> +		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
> +
> +	return vma;
> +}
> +
>  static const u32 region_to_mem_type[] = {
>  	XE_PL_TT,
>  	XE_PL_VRAM0,
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0ef811fc2bde..99e164852f63 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -169,6 +169,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  		!xe_vma_is_cpu_addr_mirror(vma);
>  }
>  
> +struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
