Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C148C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 03:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D89810E012;
	Thu,  6 Apr 2023 03:42:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774810E012
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 03:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680752568; x=1712288568;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K1zJvd4FJcy+VFfR2mS+1gh0zkphPSBCcM+FsoxvRaA=;
 b=H256ln1oAo5L4RL8lhb30oD89AWGCKWgNWOb8QtXxQM4Aa5D5SetSPG2
 QCNJMIrty205yk5PmLVSP/5ZT1HOiF0kyc21OCC2IY10Q72sfUwJJyZZH
 ZNUxAtmqYmnWCVxIogsA/i6uBralU3hkN1lR7BtTFjGXq/h+QXoNU9UOf
 gKWlTGi/G7HA8Ub46n4WjKqBf19GUS7mfvLYIdpsX/ulzDdno0Hx1JHDe
 awaF+jfRb8yluUfSRjfGAlTA6/Ks9yMkJVk/HJEhNZFQ4wmw6IctQqmED
 Xajsu1j4Y7ROUGCuE+Egjjg29cKhq3I3IC74xI4sLA8WggWmXFNty0KAF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322280043"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322280043"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 20:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756215904"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="756215904"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2023 20:42:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 20:42:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 20:42:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 20:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TklIwo8J1LcbFH4MrTSuF0gddfRuWnj01GuO9obEf0xW7XeiKi9VuuuSa44YN0UvJFvALuZeCvr3f/4LaOqlNUZHEjd7YiX4s164yDuPylRHasSiSDJC9PuePnZEvI5upcsdGdTsc8rP5ruN5sD3vx5QkCUX7zU+CgYrx5Q3JeFMxdh+xJET5cF6yfQ2pAJT2/6N0vk3EAgBMDbr0GpH9HzlkpD9kV/lRcG3T9f4Xej1sSB9IWeI8R/ie4L1kD7jTHUB12Y/fBZRShEyAgh2XpYTa8pgBri7f0CdthvXMdDxJim+YlJSZvJnGwhZPDuDNXjseToIb6XpMfFVX5qcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSJ3v8tKf59yyeFIcLHh5nZLI/PvVUMTctRPGxqbJWc=;
 b=NYHtM/A+B7rll2Q0C13VLcCDyKov/5ZGPnbNmdRHKBdAzgVGTx6If6VDQxTkJL0FnwNiRuw1fWLkt5Hmoth2+7byz6G+80IAgzub1zEzWS+YdCKReiMkYpDgMKLGCc+KpD6xuJfMiAOAop/TDojiNkYoQpmhFT35WJdfu0PiQ5b3g5GEBL3d5YZOyZi17Sy9HPUmWFYu7qh8Qbx/yBy5N0L/7yVHNLHTg3fA6FWeQwwa58ZSZsOa8WUx1nWasWO0NHmn4Ux9DprUaq0K8L+Wyq1R8gAhzuJvMq53qhq7O+TzYmFd1HzUPrR8tIqTVxKz2NfLQ61B/j4555SrgX/0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY8PR11MB7106.namprd11.prod.outlook.com (2603:10b6:930:52::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 03:42:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 03:42:44 +0000
Date: Wed, 5 Apr 2023 20:42:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZC4/rAOBkwv6z2Ed@nvishwa1-DESK>
References: <20230405233403.151088-1-matthew.brost@intel.com>
 <20230405233403.151088-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230405233403.151088-3-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY8PR11MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: d517dc07-e3b8-445c-1232-08db3650fb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbwE3l6ytEMGvlsw89yE/cBWAUoUgDw4aL631xkA9Y74wps90HBywsJ71KZtoufZVgm2TKloMQmySsGq99pY5DOHVbxqM5HcSQezqklV6upfN9gIzUSuf74BoJJWEsq/UuCZCWSkjLepWID7NQ8Z91jwMHjM+30k2yGlXGzahPD+jrZDkYWA65MzQYq93w6+XDlD/k9p96y/q5lBVOuogwoON3aIMRpmes5tKvZW9dQtJrsPmZDRWc6fOGVOcGxRCJYSIQsbgqWQbH+iWapgAJRQwa9PTm4Q4kvE9YkJEhpwRzbWPKAVRyDHY3RLOZ/suId1ui8Z3KIDzycH85lujs+bfXGsdoF13wwikjeulwtUC414rpCXkkVN27NqJMdCne7GdshMduGJZlVC0TYcUsl49JxonilRKUOkeIXhvE9xlFf2dMa4NzPMQN+EagY51jAIIRZ9bF3rK0B6vEut558GXbCuSyI6LDJy1in5wZT+/mfTp3Wn82QL4VVuMQcTy5r8v1ip63TEOjupmlLRAZcJMeOk5ZUqzwChn8KRbH0hNtltQcgZOvMwxDxEUp4w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(38100700002)(5660300002)(2906002)(44832011)(8936002)(6862004)(66556008)(66946007)(66476007)(4326008)(41300700001)(86362001)(82960400001)(8676002)(6486002)(83380400001)(6666004)(6512007)(186003)(6636002)(26005)(6506007)(33716001)(9686003)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3lpqQOjJCu/UcKMGnR3u9hxCTl5fbyKaajtOCVL2DACNTorc1wJaOrHXkM2y?=
 =?us-ascii?Q?GUB39u08QP98aRaPbp6QfmExUgvrPe4BJJ0KDv6EQE+gEJt/FZC7Sn9/X7kX?=
 =?us-ascii?Q?4OCSzKDQGX755nc/tiirz09N+TJeEJ7d8RBlkge4edRWeyF3CLMmcqp/klGU?=
 =?us-ascii?Q?lD+79MW3mE+XhlEVKmBd+SwUReNQSzYMxmxFk0y1SxLolvJP67GLkRtsJPhx?=
 =?us-ascii?Q?tMdHO8gY9KtdGDHNS01Jhfyx3IIByB5a00N+u3gX9R11u2OqI2c8O9xMttWc?=
 =?us-ascii?Q?wvZZOBTObPd7Lcg0EkdndCE76Am87cN9hwdZXwhj1wrQ9Lz0AxWm/bRgH5b3?=
 =?us-ascii?Q?vpGcpTFrxlWv+x+c81e+QcKZVAyxDt0SKgxmRMh6j3y6lrVutHU6UKsGA+uW?=
 =?us-ascii?Q?DQpp9RNrAkDavLghLtzPlEN/oJyNT3027uA4atgROU4mHh7AXAu5ZXV8IzY6?=
 =?us-ascii?Q?0Yvad9iv+Qbqo7/11NlwCTVSRyDLznk3KrFCMB/YH4bwx+PytWrWV9fLxvXE?=
 =?us-ascii?Q?s8qvQN6iSnLe1eWRlOHqDc3l4cRBaReVeFk+CWhEOToDzx2xIRIavvffezkO?=
 =?us-ascii?Q?zCflIudR71Wl2T99UMALjhk7Tuky1ZM83lx5TKpixAEYMVGO5zSg7xFnKeRx?=
 =?us-ascii?Q?cMcHq/mjeT6GrA8LJkQpI8xb5MiT+K/IG67fsPY1SHuJNjtMNWYGS3UjCqyg?=
 =?us-ascii?Q?GP+cwBiPwO2SCUY3Pq1d9SVFI9/6vtjBxIhsskJvaxyAMM8Wlum0PKry+hFB?=
 =?us-ascii?Q?x7Saaiceasz0wwL3WhOSZUvkVRV0OD+I0I7J7MDj4PrHdBFOZiFbARLexSRC?=
 =?us-ascii?Q?s9taBycPv8R8LIWFfNg7RtLkAT3cVbuRU8AkvvjTr7Yv/YrT6b1Mj2tmcSwY?=
 =?us-ascii?Q?zKpSo+0zFRkQoLIMKUEFt2gYSplxqLFe+WUFOb4y/r2rstcikdnayzmfOxzC?=
 =?us-ascii?Q?2g13IiPDjRXYORKX3rYTwDczRPuMNUM1OmYHMtrRcN6Xn5/vD9B2TpkrXVgH?=
 =?us-ascii?Q?ewub6MeHQx+Y6naliW/3wsR6tkaW8imCi1VrzeJr5nWnpVzT8IBQXE9VuHO3?=
 =?us-ascii?Q?i+4gyUscUi0oLQevdJaZsKMb+tQiGwHb/38CxQCWBVUjM4XDAQHcM8pY+mYX?=
 =?us-ascii?Q?rN/pSqnxXbIjO2IXWgDjYv/YRSg0MzezOqm5P6HIUeERkNb69T6nSzbWKBtJ?=
 =?us-ascii?Q?jzrlakFHSRtga02fXzq/w8+hWrH1LytbLBpsaumN7OObNxAmSsjVrhT+UZvH?=
 =?us-ascii?Q?f7P8DbWbfub8KMcYky/6gI4/0VDPcmLNUsrOJL9O/Oq9lNEG+JynqOP3gLwD?=
 =?us-ascii?Q?hzCarEhpD+wBsiyf1XFAt1gH3XQuPcya+TxwX9Nh8FK59C3laTj+IEWjd/W7?=
 =?us-ascii?Q?CG7dRfazKtX4UD/0wyhmk+8O4sxm//QxrbJIBkIBvnp2d98UzNidDIjey7J6?=
 =?us-ascii?Q?tm3ktd5N0xvL39foFPJULQk2w6N/rfnBSHiGFVLNjcdMeleOoBuYCFjtJMxp?=
 =?us-ascii?Q?KDfTH7EDRIWfzOJb2hgEK6B0I0ProyexSlmYATfyPy2a9ipigrcDiAf3OAwK?=
 =?us-ascii?Q?E7r4PRHQpx5l4qltE1iMKLH4BQpqbkylQ474OtJ6I77Z8KTR0WfOnMJ996Y/?=
 =?us-ascii?Q?vnAhLeAoIRZaPizZwUbogOE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d517dc07-e3b8-445c-1232-08db3650fb1b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 03:42:44.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhpL5STpEubwVaDmoFFrn0zZR/pnb7loxdflqWAgF0uPBZUc0WGy3RongE1x2yXMP9PT4sAvGmvOG2Cv8jz6cjkdYCHClbG9w6mLPYtTfkVZUuWuxpn5rTspEHg8Ieny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7106
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop coalescing of GGTT
 invalidations
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 04:34:03PM -0700, Matthew Brost wrote:
>Causing a bunch of hangs driver load and in user space. Benefit is
>rather small too, so just drop this for to stablize the stack.
>

Looks like this should instead be revert of following patches?

drm/xe: Coalesce GGTT invalidations
drm/xe: Pad GGTT mapping with an extra page pointing to scratch

Niranjana

>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c         |  1 -
> drivers/gpu/drm/xe/xe_bo_types.h   |  2 --
> drivers/gpu/drm/xe/xe_ggtt.c       | 25 +------------------------
> drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
> 4 files changed, 1 insertion(+), 29 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 5460e6fe3c1f..c7f175a149be 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -975,7 +975,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> 			return bo;
> 	}
>
>-	bo->requested_size = size;
> 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
> 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
> 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
>diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>index db217500a970..6071611a2b29 100644
>--- a/drivers/gpu/drm/xe/xe_bo_types.h
>+++ b/drivers/gpu/drm/xe/xe_bo_types.h
>@@ -23,8 +23,6 @@ struct xe_vm;
> struct xe_bo {
> 	/** @ttm: TTM base buffer object */
> 	struct ttm_buffer_object ttm;
>-	/** @requested_size: Requested size of this buffer object */
>-	size_t requested_size;
> 	/** @size: Size of this buffer object after alignment adjusting */
> 	size_t size;
> 	/** @flags: flags for this buffer object */
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index a430d1568890..93f78aba2c8e 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -273,15 +273,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> 		xe_ggtt_set_pte(ggtt, start + offset, pte);
> 	}
>
>-	if (bo->size == bo->requested_size) {
>-		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
>-		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
>-	}
>-
>-	if (ggtt->invalidate) {
>-		xe_ggtt_invalidate(ggtt->gt);
>-		ggtt->invalidate = false;
>-	}
>+	xe_ggtt_invalidate(ggtt->gt);
> }
>
> static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>@@ -302,19 +294,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> 	if (err)
> 		return err;
>
>-	/*
>-	 * We add an extra page when mapping a BO in the GGTT so we can coalesce
>-	 * GGTT invalidations. Without this extra page GGTT prefetches can leave
>-	 * entries in the TLB pointing to an invalidation GGTT entry when in
>-	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
>-	 * to 64k already have padding so no need to add an extra page.
>-	 */
>-	if (bo->size == bo->requested_size) {
>-		size += SZ_4K;
>-		if (end != U64_MAX)
>-			end += SZ_4K;
>-	}
>-
> 	mutex_lock(&ggtt->lock);
> 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,
> 					  alignment, 0, start, end, 0);
>@@ -344,8 +323,6 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> 	drm_mm_remove_node(node);
> 	node->size = 0;
>
>-	ggtt->invalidate = true;
>-
> 	mutex_unlock(&ggtt->lock);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>index 8198aa784654..ea70aaef4b31 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>@@ -26,8 +26,6 @@ struct xe_ggtt {
> 	u64 __iomem *gsm;
>
> 	struct drm_mm mm;
>-
>-	bool invalidate;
> };
>
> #endif
>-- 
>2.34.1
>
