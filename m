Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE87C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 14:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE3010E6A9;
	Tue, 25 Feb 2025 14:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoSQz76y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE9D10E6A9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740492287; x=1772028287;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rT2XPLVURDkJcY5p1ly+Lx9Nc7VKVM5tnUzie4dIQ6Y=;
 b=hoSQz76y1XIdfF1KsrTXmmS0Zhp9Ga0CHVrvkYT5nvL/mDV+6eSQHGIH
 YSxgaZoWvTqYn0qFtfeO3cPfqrpoRf82bdfRxQLvUUOLPIWHlGh7n6YJD
 tGpdutHK4ctBej7Q7haV98kq/kNHIxCOIkPVJsBUYu1nfdqybJK26cLte
 IsIfnw62i/mOyLbrL4IR1K3G4lERg8Ht5GOycFfAh6QPQa+6uu+OBuCmr
 HlSTuy5zyEFlxzn+RtjZRkA1VENJ1IGrnImGVg8BXRZeSk8AB4fNZok90
 kLnyYcdC9xFm/+R0HT9h44YEZBhL7gwSl8f6Eh/yl89uDRBROWfRcoOf/ g==;
X-CSE-ConnectionGUID: W49aXlxRTXCCNxU5Y8lpCw==
X-CSE-MsgGUID: gH29jMiGS5G92LA7y5l7gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41434044"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41434044"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:04:46 -0800
X-CSE-ConnectionGUID: T8V622hSRceKdQn0onz6Dg==
X-CSE-MsgGUID: 4Rp7bDpaRQeUZrjr/f8+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="117010247"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:04:44 -0800
Message-ID: <aa69fa7f-3f1f-4f1f-b387-0cde292015f6@intel.com>
Date: Tue, 25 Feb 2025 14:04:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/gt_pagefault: Change vma_pagefault unit to
 kilobyte
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-4-francois.dugast@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250225131753.1170520-4-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 25/02/2025 13:17, Francois Dugast wrote:
> Increase the amount of bytes that can be counted before the counter
> overflows, while not losing information as the VMA is not expected
> to have sub-kilobyte size.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c   | 2 +-
>   drivers/gpu/drm/xe/xe_gt_stats.c       | 2 +-
>   drivers/gpu/drm/xe/xe_gt_stats_types.h | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 46701ca11ce0..17d69039b866 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -137,7 +137,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>   	bool atomic;
>   
>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> -	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);

Not sure if this will throw a build error on 32b?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   	trace_xe_vma_pagefault(vma);
>   	atomic = access_is_atomic(pf->access_type);
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 83de2ec92fdc..50a1636773d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -14,7 +14,7 @@
>   static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>   	"tlb_inval_count",
>   	"vma_pagefault_count",
> -	"vma_pagefault_bytes",
> +	"vma_pagefault_kb",
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index b072bd80c4b9..d556771f99d6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -9,7 +9,7 @@
>   enum xe_gt_stats_id {
>   	XE_GT_STATS_ID_TLB_INVAL,
>   	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> -	XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
> +	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
>   	/* must be the last entry */
>   	__XE_GT_STATS_NUM_IDS,
>   };

