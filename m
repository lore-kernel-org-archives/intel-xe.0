Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FCDC7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 09:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAF410E281;
	Mon, 22 May 2023 09:02:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DADD10E281
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684746147; x=1716282147;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Jb1P5bBeNJIbTGbV5FRhRpSH2QHLrZ3eTER8TPRsQhU=;
 b=egPXiHGsPkXLqBG8dkcdhEUVwNijufNbrK/bwKE9cWOIPiyzU1911TaA
 M6Ccu/beB/mUCCBEOkWqX3linhDykIkLa1JfVZhaUPpcNP13Pqw6oyjbR
 pFOEhngD3raHycPD9n2gg0NMJbEqm10aWq1zZSjQAwvnT8VcN/WxGA8XT
 TkO5RUxpJTFWC1iE2ziiAe30tmuQqCJ8Pv3j9UCGFOitpZpazGq5Q6AQA
 SODEniIcYA/ss5mO0zF0Qb8EgmgrmP/hzV00M6EXwBoaNZKDPSJwhjo8k
 EfFXMgApUd2beDBZ/0p/W9DnUEh7dLWQ7qH0UXrVDjI1Qt5dEWUeoZnJk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="342319245"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="342319245"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="680888594"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="680888594"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.40.98])
 ([10.249.40.98])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:02:03 -0700
Message-ID: <64820c6a-eb0f-333d-984b-c460170fa5e8@linux.intel.com>
Date: Mon, 22 May 2023 11:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-26-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230519231827.3572452-26-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 25/30] drm/xe: Invalidate TLB on all
 affected GTs during GGTT updates
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


On 5/20/2023 1:18 AM, Matt Roper wrote:
> The GGTT is part of the tile and is shared by the primary and media GTs
> on platforms with a standalone media architecture.  However each of
> these GTs has its own TLBs caching the page table lookups, and each
> needs to be invalidated separately.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7c87623ef5c5..31f958613c2f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -188,13 +188,10 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>   #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
>   #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
>   
> -void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> +static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>   {
> -	/*
> -	 * TODO: Loop over each GT in tile once media GT support is
> -	 * re-added
> -	 */
> -	struct xe_gt *gt = ggtt->tile->primary_gt;
> +	if (!gt)
> +		return;
>   
>   	/* TODO: vfunc for GuC vs. non-GuC */
>   
> @@ -219,6 +216,13 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>   	}
>   }
>   
> +void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> +{
> +	/* Each GT in a tile has its own TLB to cache GGTT lookups */
> +	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
> +	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> +}
> +
>   void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>   {
>   	u64 addr, scratch_pte;
