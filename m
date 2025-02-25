Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25555C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 14:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ADA10E6AE;
	Tue, 25 Feb 2025 14:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTfjfHe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1CC10E6B0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740492457; x=1772028457;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SQuwWgHqhhqZkeV39M4AB1hqGOTIbDyzj5UWj/flM80=;
 b=nTfjfHe+KTsY9wyaIk3oq2KkjGnNqSTi2H56MBRQ3LZCb/Ie5rcGo97E
 +QiBjkJTWhyNdnpsPtwnR2Q3KzLAfQ7o6ReJt7jMiaOA61sE+c4qDH3IX
 Aw6sKnCGogn6wHbcM2BNexTonab32p/Oh0KRHAAfwWfYXbffwqx6k/Vsm
 hsKxCqXjMu0gzW/8xQPglZw1orVCH1OCywU8RkrwxHbcEaq9Pq0Wa3HNl
 SQdAdP8nanqCRFlIamdJJmumxDHExeDKRZPaG3AJPFppGYCgAn/1MLQCd
 IBIO3L7yJeYaPBcJ+bTKu2qE/BXUsQqAFGYWy+u04Lp3QxbbYJpA2orep w==;
X-CSE-ConnectionGUID: UkgThi4QQwquVXWfQHll/w==
X-CSE-MsgGUID: LPmC6FrMQ+GOydOttnnf2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41425729"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41425729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:07:09 -0800
X-CSE-ConnectionGUID: GpZuwjecTKWZ8/5lPdxOJQ==
X-CSE-MsgGUID: 6bPnV/uDRJiMdFkIh8lZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116414913"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:07:07 -0800
Message-ID: <08eebcf9-945d-4756-8858-08c4d2d10384@intel.com>
Date: Tue, 25 Feb 2025 14:07:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/gt_stats: Detect and log overflow
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-2-francois.dugast@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250225131753.1170520-2-francois.dugast@intel.com>
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
> Check if the atomic counter limit has been reached and if that is the
> case, set the counter value to the new increment to prevent keeping
> a garbage value, and notify it in the kernel log as below:
> 
>      [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_stats.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 2e9879ea4674..753c081b68a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -8,8 +8,15 @@
>   #include <drm/drm_print.h>
>   
>   #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>   #include "xe_gt_stats.h"
>   
> +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> +	"tlb_inval_count",
> +	"vma_pagefault_count",
> +	"vma_pagefault_bytes",
> +};
> +
>   /**
>    * xe_gt_stats_incr - Increments the specified stats counter
>    * @gt: GT structure
> @@ -24,13 +31,12 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>   		return;
>   
>   	atomic_add(incr, &gt->stats.counters[id]);
> -}
>   
> -static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> -	"tlb_inval_count",
> -	"vma_pagefault_count",
> -	"vma_pagefault_bytes",
> -};
> +	if (atomic_read(&gt->stats.counters[id]) < 0) {
> +		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
> +		atomic_set(&gt->stats.counters[id], incr);
> +	}
> +}
>   
>   /**
>    * xe_gt_stats_print_info - Print the GT stats

