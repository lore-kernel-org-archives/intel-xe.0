Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76EDC3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D34610EB87;
	Thu, 11 Jul 2024 20:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="misCXa7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC16C10EB87
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720728055; x=1752264055;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pbemnWyuy9khthSGRSvoy+yckK08/4dOmtwqsbD1B14=;
 b=misCXa7uc5893Psyi0UYVHsrITptF7L0FuNdZ+JmsQTxfcztNpApona6
 zNdN/9psx0m1vo2VzgG5gBDgYHaIuUpvlwO+QOW6IIWHrNKhnNm4/mHR5
 C0w2HyEdXE3KXiJcv/FaujkDrtFvdz9il5wrMMxrz7wt7oI5+6IgbOuES
 6pv15g0cbjUDR6qWD7TfvLHRU19xUS1epvf8Ackq76ZHFO+oKFBhMoBW4
 yYFU2fHhSW2nm3+RC3zEVACSxl0GUasnHe9/SlDU3rNLGmB52yauDfWr8
 yweevh7a+0JmrYzJ1X+UMcLOYptkYShl2H8BStRCkpy1Vei/CcnqR9lLH A==;
X-CSE-ConnectionGUID: qP23BiBbSKOXqpt1oAUBsA==
X-CSE-MsgGUID: X7DdAe1USXi/ynMMTc6yTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18286949"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18286949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:00:55 -0700
X-CSE-ConnectionGUID: qCmAgYhMSzeYp/iKpSVxJw==
X-CSE-MsgGUID: /Ei4YlB0TXSWmY0OLEk1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48747992"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2024 13:00:53 -0700
Received: from [10.246.49.75] (mwajdecz-MOBL.ger.corp.intel.com [10.246.49.75])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7D2B928793;
 Thu, 11 Jul 2024 21:00:52 +0100 (IST)
Message-ID: <3ef3dece-525e-4832-9952-0a425a9c1017@intel.com>
Date: Thu, 11 Jul 2024 22:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-8-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240711171155.173717-8-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 11.07.2024 19:11, Rodrigo Vivi wrote:
> Introduce a new xe_ggtt_largest_hole helper that attends the SRIOV
> demand and continue with the goal of limiting drm_mm access to xe_ggtt.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++------------
>  3 files changed, 38 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 67337bfeb81e..dbaf1ce87fb4 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -584,6 +584,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>  }
>  
> +/**
> + * xe_ggtt_largest_hole - Largest GGTT hole
> + * @ggtt: the &xe_ggtt that will be inspected
> + * @alignment: mininum alignment

typo: minimum

> + * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
> + *
> + * Return: size of the largest continuous GGTT region
> + */
> +u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> +{
> +	const struct drm_mm *mm = &ggtt->mm;
> +	const struct drm_mm_node *entry;
> +	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));

this is likely not needed any more as xe_ggtt is always above WOPCM
(unlikely to previous driver ;)

> +	u64 hole_start, hole_end, hole_size;
> +	u64 max_hole = 0;
> +
> +	mutex_lock(&ggtt->lock);
> +
> +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> +		hole_start = max(hole_start, hole_min_start);
> +		hole_start = ALIGN(hole_start, alignment);
> +		hole_end = ALIGN_DOWN(hole_end, alignment);
> +		if (hole_start >= hole_end)
> +			continue;
> +		hole_size = hole_end - hole_start;
> +		if (spare)
> +			*spare -= min3(*spare, hole_size, max_hole);
> +		max_hole = max(max_hole, hole_size);
> +	}
> +
> +	mutex_unlock(&ggtt->lock);
> +
> +	return max_hole;
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  static u64 xe_encode_vfid_pte(u16 vfid)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index f816b3c0732b..31060fe7644b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -29,6 +29,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  			 u64 start, u64 end);
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> +u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index efaf188290ea..1d17c34fe5a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -590,30 +590,11 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
>  static u64 pf_get_max_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> -	const struct drm_mm *mm = &ggtt->mm;
> -	const struct drm_mm_node *entry;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
>  	u64 spare = pf_get_spare_ggtt(gt);
> -	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> -	u64 hole_start, hole_end, hole_size;
> -	u64 max_hole = 0;
> -
> -	mutex_lock(&ggtt->lock);
> -
> -	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start = max(hole_start, hole_min_start);
> -		hole_start = ALIGN(hole_start, alignment);
> -		hole_end = ALIGN_DOWN(hole_end, alignment);
> -		if (hole_start >= hole_end)
> -			continue;
> -		hole_size = hole_end - hole_start;
> -		xe_gt_sriov_dbg_verbose(gt, "HOLE start %llx size %lluK\n",
> -					hole_start, hole_size / SZ_1K);
> -		spare -= min3(spare, hole_size, max_hole);
> -		max_hole = max(max_hole, hole_size);
> -	}
> +	u64 max_hole;
>  
> -	mutex_unlock(&ggtt->lock);
> +	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
>  
>  	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
>  				max_hole / SZ_1K, spare / SZ_1K);
