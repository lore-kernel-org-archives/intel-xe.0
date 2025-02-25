Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D6C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA1410E6A3;
	Tue, 25 Feb 2025 13:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVu5dS+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1E10E6A3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740491708; x=1772027708;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=D3NSG4ebp83CIPoRDfYYS3Qm3RLWork+GlLVtc3ManA=;
 b=CVu5dS+stIhHUQWrKjOATpqSl9AyJ5sDfnEIsTszxIOjEcjkwbfn5h5u
 pyV1D9pC8hObbbrRag47YAe6Rj341+uaVm7D3b5be2ECkweohEHGcU4iX
 Un6YVh8Iynh/HwJe1VKJdonomaYDEvAEgJlvRuTWGzVEoeaV19BhOCaxh
 iEZ48hbhsv3EM4BliZa5+it/dH2TSBCZIgDaeGA2bxspn6tGlfr32T5RN
 ndeaLwlDg95aGWMcBajPLCUMJwCy55x4l0Gmrn2RrLSLHP3c4FioQe81r
 Ww+KZJ62X79sVEBzroiwP6y91Trud4hPEolymYZFMqw/BzTf/29MW3LHl w==;
X-CSE-ConnectionGUID: l3Hq6RMKSMybVIc3e/ch/Q==
X-CSE-MsgGUID: NviiOkY3TWGFPj8eLl6EBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41423337"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41423337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:55:07 -0800
X-CSE-ConnectionGUID: VhvDxdhqS8iBBHNQBuqwIQ==
X-CSE-MsgGUID: Y/Wq9NdTRPWLXC+Yc0g8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116586843"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:55:05 -0800
Message-ID: <5d3142bf-f4c5-451b-a867-400829c31103@intel.com>
Date: Tue, 25 Feb 2025 13:54:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/gt_stats: Use atomic64_t for counters
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-3-francois.dugast@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250225131753.1170520-3-francois.dugast@intel.com>
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
> The stats counters are now used for things like counting the VMA
> bytes during page faults. During workload execution, the counter
> value can grow fast and easily reach the atomic int limit, in
> which case it overflows. To make this less likely to happen, push
> the limit by switching to 64b atomic to store the counter value.
> Overhead is very small as there are only 3 stat entries per GT as
> of now, and stats are only enabled with CONFIG_DEBUG_FS.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
 > --->   drivers/gpu/drm/xe/xe_gt_stats.c | 10 +++++-----
>   drivers/gpu/drm/xe/xe_gt_types.h |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 753c081b68a6..83de2ec92fdc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -30,11 +30,11 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)

Do we also bump the incr? Maybe s64?

Either way,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	if (id >= __XE_GT_STATS_NUM_IDS)
>   		return;
>   
> -	atomic_add(incr, &gt->stats.counters[id]);
> +	atomic64_add(incr, &gt->stats.counters[id]);
>   
> -	if (atomic_read(&gt->stats.counters[id]) < 0) {
> +	if (atomic64_read(&gt->stats.counters[id]) < 0) {
>   		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
> -		atomic_set(&gt->stats.counters[id], incr);
> +		atomic64_set(&gt->stats.counters[id], incr);
>   	}
>   }
>   
> @@ -50,8 +50,8 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>   	enum xe_gt_stats_id id;
>   
>   	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> -		drm_printf(p, "%s: %d\n", stat_description[id],
> -			   atomic_read(&gt->stats.counters[id]));
> +		drm_printf(p, "%s: %lld\n", stat_description[id],
> +			   atomic64_read(&gt->stats.counters[id]));
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6e66bf0e8b3f..f72b965cc9e6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -139,7 +139,7 @@ struct xe_gt {
>   	/** @stats: GT stats */
>   	struct {
>   		/** @stats.counters: counters for various GT stats */
> -		atomic_t counters[__XE_GT_STATS_NUM_IDS];
> +		atomic64_t counters[__XE_GT_STATS_NUM_IDS];
>   	} stats;
>   #endif
>   

