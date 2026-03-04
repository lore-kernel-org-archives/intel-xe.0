Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5BFEF9011
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 16:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39A10EA75;
	Wed,  4 Mar 2026 16:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvYURutD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5887D10EA75
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772643289; x=1804179289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bn64yx5seLPeyJJ5Ve6VZ/5/q5DbiSnPf7fDs8x9uVg=;
 b=BvYURutDa6jtMhux2egC0Oj5YJGphGtq3Lf4xTHuZ6QWwEBGAjhF3KQx
 i6P4f8/VLr+qW8kQlZ0TDWi+dPYBAH9qvUGMfxuXlXFluwCH6IOPBKNCF
 h3QnEJom3DN52AaMknpYennOnAEjJh/3HJfuc7xPNWkRCOPXgvrQuAFcY
 z7FYPNLhXbfBflK+h30a0092qTLU92u5DmK2+dd7IeZlNs9chHRIK/Jhr
 XAI4R5NbHvRP/UpBcqZBlVYp9pLIlYrj/0/GDbLMz1YUJ7wCQTtJRJ2pH
 1jM5cra/QhkD6TFb214EO/Jfi1q6ETUmgE3ev71SEadPYND+vD4WSLgex w==;
X-CSE-ConnectionGUID: f1NYyIAURNeyBPp3NRF3mw==
X-CSE-MsgGUID: +GXiCOvqT2a6gbsy8qu4tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84420457"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84420457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:54:49 -0800
X-CSE-ConnectionGUID: KjidsiR8RAevPtf3YyYefg==
X-CSE-MsgGUID: jyPk45xeTSiGYzL8cg0WCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215316636"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:54:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:54:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 08:54:48 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:54:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuIsthOnDKBzR0UA6ukxv8sru/LVE+oNfzLIJInJrvKdW51DLmlX57WcolT7Xn5fRbVtoMXZMSpBzwVkNp3MicY6AmKrBPUsuN63it1FUu241Ab/t3/iUcd2PtaF/EUUeQ2+7+HvuTppEBvMzr9VGcWUFAHIanJxvAtDHCPN2KYy9eVpfHuBoiIrcFsl+E+uHZ3D88XKr6pnYU5NryqUwOiNm+Ue/opb1FIzHsfNFMZLXm/Gc1DMqA3g3RNuWz+phqJMiV5P/pFKnsAoPITXjg17+xIzdY+AP9nR0WcvrkJn3taJgZkB3/FylXsd3Nn2Pq/cb7OQSUdBkUH1nKIIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvUHeEgNBLcvkO2UVHqqYXvIEAH6JR2eqxDnOj+/nls=;
 b=Rd0GBjgihcgiKz9hLe7TIjBSKSshYe2YiQT3XBUcQCXin3GnYI2k/Js8W18DKJm3DiXJ1hupMTAPtnNUdstZsyY4eMOMSJObXxnHqrPsXdfvCxpGNoC3VPYd0JC0w7Q60R6Q9sy1JiUxH1zJQvcjMkRWpfU0L5eUdYHxykTbdzB5m0qsrc1hncglO68tayMfTyZtuff+meL7fTRNrcA8gc2tujCBPcHoSspqSyj/Blw3zqyShJ1Fzp1xmIAramVmdjH3xHKvZplu8P4gSYyUXCbPQSKOz8ziwzEMUBtlEVRq7DsVQ134VGxRv0GmLg5uPX1FvriLAWP4k+cJa99HVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:54:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 16:54:42 +0000
Date: Wed, 4 Mar 2026 08:54:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Skip over non leaf pte for PRL generation
Message-ID: <aahj0DVddXr/qz4f@lstrano-desk.jf.intel.com>
References: <20260304005607.2511440-5-brian3.nguyen@intel.com>
 <20260304005607.2511440-6-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260304005607.2511440-6-brian3.nguyen@intel.com>
X-ClientProxiedBy: BYAPR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::42) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 308fa295-ad61-44b3-b3ae-08de7a0ebb0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: OkjtD7N0SxDUf7f7Y+RKhce7/a5eUGQxn6KNxnh5qsqGR0exMrGE+ifgsHuh54C4pdgPOrvcfBe4gC7pWWbIGRTDdYukVss+AQi4Ew7z3TLyZfdnY8IjeaYH3wHZVZAQ++qNadt5H+95nmwXxRqskwO3CNMBkLCD1teAEdbrWwoq2oyJniLKPsF3EVXCj8Zivsnpdj68l+YhzZEked+fhMrNvMntAYKl8vUX53tHp9cdTDxetVqA4JGx2KW8SD7GUp8nLYVUs1uVnjvc4MYxHFxueNDF9LeOPe860ta/EAMlj6iG3eANNCuaQG76ItRJt6YfXduS8019lrmeLDlChHZrdcXDlBKS4xNe3Xg6X/2p1Tveqyq18ZZnC+rGIEhp5nlxEn5X6Wc5H2ZwUPBO6GKsyzOWZNZ/oUJ26oBHM8uCnB9t48Tb/ad1X6LcKtE8M1Q3soteQV1/aVasbYbWjBV0s0IC9nGrjSS8xje+UthpnwEqw/npr5yKsftGFTBsWz4Km48T7uUJal7vmIHRhZJusovyPDr/fWWijoH+6nXqSRTuWvQjGdTdnPQ6Ryv+Z0GSNFYvHEGwoireQ9fIlIwlFo68+flwhjbeVhXjg68jqNT6EFax/P+UgJKWDed4pErOcHfkVoWrzIhxWIYqhvoB9QnMAr6upGfyYjqzwC8Kf/LnBasVsMJnRZHUtDcjW1lGAcMBXsJcJqMxlueU5GF/rPj+pgQjgdHlW5j4+Lc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gfdhfd/g+IeZmAejN2HqbBdCcLsqMwcAtOd+9yA8jm9JOSBiUbRbT8VYFbMt?=
 =?us-ascii?Q?Swbeo7OIMcwHp+/BBdfr10PqE4TAr8PNXNegu7B6tspjbFvl9zEaSToYWaxd?=
 =?us-ascii?Q?vOot5ErjXzcbQL4VuJ5qGO9qpO2WY38ceW8uCo/4fyIj0LotVQv+RqL4asnN?=
 =?us-ascii?Q?U6skJeadjrSV8YIm0dr5LgNJJjwZ0vsQBHes5PRr7Cq8QGn5saJ6sEDcJUHx?=
 =?us-ascii?Q?/Mo/GuoZM5L8hySwYr76tvDNMbrLMsPzVR4QRVuR9sBZPW6QFetnsTLN3FVr?=
 =?us-ascii?Q?tybRwnV/nNThFbS4c5wTeQ2J8hPp1yqxW6WMEpx0H7dC0b5G/oEtJ1LIN9Da?=
 =?us-ascii?Q?ZCih7pJkl1SPTH5WymrZy1a/RvEefYxxWoL3CtWN6udClKhmbLMvcg1bKuc+?=
 =?us-ascii?Q?vy7ub2maQ/IQI+25I8s5SmbqTIb5L6SPqWj7Kw4k2d/1sxBKvWQEsKYit5Qd?=
 =?us-ascii?Q?2wZErpjwivStNeKlexCljofPXkqgBsQnWB5ouBJtx/WOd4KtxQhwfo23sr6C?=
 =?us-ascii?Q?/T2C5D8/wR4PK8ytSisZAkB+ZqP/vLAm4Uzplesgw+YpgeSizdB6HvO2PtAh?=
 =?us-ascii?Q?ATtbSWRfFtOVX1Qnti3iBCw4msB5AJdbE+mJB8NIcBaNMqS7rZA5yXacH0ND?=
 =?us-ascii?Q?FfK8O5OJBkxcFwmV0soptl756dZpt502rmgNG55dPnfpQu97Z9hATh4lcAiR?=
 =?us-ascii?Q?LXWMcMxP8q/QRTaHT+UeNCkim66waFBsfMXzR5yohz9uqxaIxLYNo5RHPBsE?=
 =?us-ascii?Q?boZAO0KaAOzebFuizZSk3bYC3In0EsiZVo0kUtLfp5Jk8VbR6/2xvtEeaV1P?=
 =?us-ascii?Q?TsDK68d88OBxAJ5XrjVcTJGrCg7V1tyiBh7zsL1fY+6zgN4i/sDRvGYMijwA?=
 =?us-ascii?Q?1uYDX98uaX5tMi2z3SA4M+mAFECiano3WVYcyWPVkRTn8lYwi3TObDKMhdFe?=
 =?us-ascii?Q?R+QWkutyUrvDeKIP5SprSc9oTRCqe//z6+d6AI07yT43pbv87Prj99ViwxFD?=
 =?us-ascii?Q?g7k7n5bxD59OvhFg/18Cuou/I0eIt1xKjVtwdY6i/8s5PMFSfT8TdH9Uq1lt?=
 =?us-ascii?Q?UqGatVP5u2QzFCPmIv1HgGz9JEg/ioVJ7Nq7QPsF2kBRuu828rAFNBbpJTvb?=
 =?us-ascii?Q?S9gVS2ErYUKHoUbTb5lQh4B4J0obi/l1Tx+jVCTGT98GrEgDEnSDU575SQ0x?=
 =?us-ascii?Q?ffqCEIFVTVDKrZ8cenxVvx6QKUohhOwayCUhWJyQMh/3JUXGO/hBfMcebTFf?=
 =?us-ascii?Q?yM31rUF81Qv9bWTqdn3VUAqPd/PHbePAQmRbtLE+xWsmJBBBupnLxVM6ZUPw?=
 =?us-ascii?Q?z86PxY/3yO8zbcYuTn3rNg9Gfmmt4k/FXVHC7gfwVbvyWfZLEE3E8EYGvrE2?=
 =?us-ascii?Q?fXIuBdYDcKu0jSzOyXvqHiGnUthh73j0gb900ujJZk7QTwAcF2M69CM4NxxK?=
 =?us-ascii?Q?3tfz5Slav+6j8vR3/+rg3QdPu89NjkPRCMLX6szeLwoPEsi31Awama0HcSHm?=
 =?us-ascii?Q?bTCm2eMfLlIeJ56TgtDbAK8JfvA+Emfow4WrEhDhT5N24HJguY+LJw7OMMIy?=
 =?us-ascii?Q?J7fbjkxkFCizJswis0uUVHmGXtoDc5mMAdMdm1u+8K3OBaztB3YExgibj7ha?=
 =?us-ascii?Q?dfoxxYSHOJnKnZXTcyvxhGF/08I1fn1li2QRmkNCusL0OoH5o7h4ADqw2LYe?=
 =?us-ascii?Q?Q6GK8h3fpsdVs2PT67EIuFauxLRVEbD2J8xrA4fsx1qG52pyGaFfQEASqzip?=
 =?us-ascii?Q?/UgBaRlY7WOsrNcyNPpLDHQdv5cJDJg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 308fa295-ad61-44b3-b3ae-08de7a0ebb0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:54:42.0897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUxOQYOchTxKLAezMH0vlBPTY17mghCTfZUQ6px0+cUn/ptDErL3NlxAJXnTsoW4+Bw1SavO/Hj4bHTD5lBy2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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

On Wed, Mar 04, 2026 at 12:56:09AM +0000, Brian Nguyen wrote:
> The check using xe_child->base.children was insufficient in determining
> if a pte was a leaf node. So explicitly skip over every non-leaf pt and
> conditionally abort if there is a scenario where a non-leaf pt is
> interleaved between leaf pt, which results in the page walker skipping
> over some leaf pt.
> 
> Note that the behavior being targeted for abort is
> PD[0] = 2M PTE
> PD[1] = PT -> 512 4K PTEs
> PD[2] = 2M PTE
> 
> results in abort, page walker won't descend PD[1].
> 
> With new abort, ensuring valid PRL before handling a second abort.
> 
> v2:
>  - Revert to previous assert.
>  - Revised non-leaf handling for interleaf child pt and leaf pte.
>  - Update comments to specifications. (Stuart)
>  - Remove unnecessary XE_PTE_PS64. (Matthew B)
> 
> v3:
>  - Modify secondary abort to only check non-leaf PTEs. (Matthew B)
> 
> Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 38 +++++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 13b355fadd58..2d9ce2c4cb4f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1655,14 +1655,35 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	XE_WARN_ON(!level);
>  	/* Check for leaf node */
>  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> -	    (!xe_child->base.children || !xe_child->base.children[first])) {
> +	    xe_child->level <= MAX_HUGEPTE_LEVEL) {
>  		struct iosys_map *leaf_map = &xe_child->bo->vmap;
>  		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
>  
>  		for (pgoff_t i = 0; i < count; i++) {
> -			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +			u64 pte;
>  			int ret;
>  
> +			/*
> +			 * If not a leaf pt, skip unless non-leaf pt is interleaved between
> +			 * leaf ptes which causes the page walk to skip over the child leaves
> +			 */
> +			if (xe_child->base.children && xe_child->base.children[first + i]) {
> +				u64 pt_size = 1ULL << walk->shifts[xe_child->level];
> +				bool edge_pt = (i == 0 && !IS_ALIGNED(addr, pt_size)) ||
> +					       (i == count - 1 && !IS_ALIGNED(next, pt_size));
> +
> +				if (!edge_pt) {
> +					xe_page_reclaim_list_abort(xe_walk->tile->primary_gt,
> +								   xe_walk->prl,
> +								   "PT is skipped by walk at level=%u offset=%lu",
> +								   xe_child->level, first + i);
> +					break;
> +				}
> +				continue;
> +			}
> +
> +			pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +
>  			/*
>  			 * In rare scenarios, pte may not be written yet due to racy conditions.
>  			 * In such cases, invalidate the PRL and fallback to full PPC invalidation.
> @@ -1674,9 +1695,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  			}
>  
>  			/* Ensure it is a defined page */
> -			xe_tile_assert(xe_walk->tile,
> -				       xe_child->level == 0 ||
> -				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> +			xe_tile_assert(xe_walk->tile, xe_child->level == 0 ||
> +				       (pte & (XE_PDE_PS_2M | XE_PDPE_PS_1G)));
>  
>  			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
>  			if (pte & XE_PTE_PS64)
> @@ -1701,11 +1721,11 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	killed = xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
>  
>  	/*
> -	 * Verify PRL is active and if entry is not a leaf pte (base.children conditions),
> -	 * there is a potential need to invalidate the PRL if any PTE (num_live) are dropped.
> +	 * Verify if any PTE are potentially dropped at non-leaf levels, either from being
> +	 * killed or the page walk covers the region.
>  	 */
> -	if (xe_walk->prl && level > 1 && xe_child->num_live &&
> -	    xe_child->base.children && xe_child->base.children[first]) {
> +	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> +	    xe_child->level > MAX_HUGEPTE_LEVEL && xe_child->num_live) {
>  		bool covered = xe_pt_covers(addr, next, xe_child->level, &xe_walk->base);
>  
>  		/*
> -- 
> 2.43.0
> 
