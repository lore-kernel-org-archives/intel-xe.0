Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEFCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B2F10E05C;
	Fri, 13 Oct 2023 14:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E4310E05C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697207187; x=1728743187;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vztTFBGE8HlVDGE2NHPfLWQlsjcL9zoCamYDfjueNKs=;
 b=Njrjjtd8kTHmeoAxQkX4ixC/0k6phodINWP4mR+wpxM0TTOr4n3cdmDt
 Riov4GV9pSUVugtXVQDE13LFP7UPeXUfZEyqCUjf/Sms5DvXbYQSeAh+M
 TW0vZbrb3w7ur4vGEQUBO4zry5KeNgibhc0NUS1J1U8i5wQuzCq0szvHK
 ldswB2/v0NNUBYky7n76y+XCncVTdW8amSWgBbHFhCpOFxvfTDubOYViL
 qtwn0x85kBqSQuK7dHhYHTwDx1w3QfMhtrDPxXuWEV/Dg5DQC7dom667c
 0UugO8bsYZnhRfo9E9Q1Mbh7Dzrt/OQSwyygh9Uc+wn/VoFxN3K7hrm/V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416241265"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="416241265"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 07:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878555838"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="878555838"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga004.jf.intel.com with ESMTP; 13 Oct 2023 07:26:21 -0700
Received: from [10.249.157.22] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.157.22])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 00F2C33EA0;
 Fri, 13 Oct 2023 15:26:19 +0100 (IST)
Message-ID: <f97de309-a4c2-49b4-a71c-feb5c0db8f3e@intel.com>
Date: Fri, 13 Oct 2023 16:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20231013121633.1038322-1-tejas.upadhyay@intel.com>
 <20231013121633.1038322-2-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231013121633.1038322-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V6 1/2] drm/xe: Introduce low level driver
 error counting APIs
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
Cc: Vishwanathapura@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 13.10.2023 14:16, Tejas Upadhyay wrote:
> Low level driver error that might have power or performance
> impact on the system, we are adding a new error counter to GT
> and tile and increment on each occurrance. Lets introduce APIs

typo

> to define and increment each error type counter.
> 
> V5:
>   - Fix MAX enum issue
>   - Use kernel doc for enum - Niranjana
> V4:
>   - Move API declaration under tile.h - Jani
>   - Typos
> V3:
>   - correct #define max value
> V2:
>   - Move some code to its related patch - Michal
>   - Renaming if API and enum - Michal
>   - GUC errors are moved per GT - Michal
>   - Some nits - Michal
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  3 +++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h         |  2 ++
>  6 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bc375ddda5a7..aac6d66622d9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -59,6 +59,20 @@ struct xe_pat_ops;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +/** @enum xe_tile_drv_err_type
> + *  enum for different types of tile level errors in driver
> + */
> +enum xe_tile_drv_err_type {
> +	/* Error type for all PPGTT and GTT errors */
> +	XE_TILE_DRV_ERR_GTT,

nit: any particular reason why do you want to track them together?
AFAIK there could be quite different problems in GGTT vs PPGTT management

> +	/* Interrupt errors */
> +	XE_TILE_DRV_ERR_INTR,
> +	/* Max defined error types, keep this last */
> +	__XE_TILE_DRV_ERR_MAX
> +};
> +
> +#define XE_TILE_DRV_ERR_MAX	__XE_TILE_DRV_ERR_MAX

why do you redefine this MAX?

this different naming of MAX value (using double underscore) was on
purpose to avoid mixing that with 'regular' enum values.
this define kills that

> +
>  /**
>   * struct xe_mem_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -188,6 +202,9 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];

__XE_TILE_DRV_ERR_MAX should work here too

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c63e2e4750b1..b81de3984626 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -47,6 +47,24 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +/**
> + * xe_gt_report_driver_error - Count driver error for gt
> + * @gt: GT to count error for
> + * @err: enum error type
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Returns void.
> + */
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err)
> +{
> +	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));

asserts use different logic than WARN_ON so this should rather be:

	xe_gt_assert(gt, err >= 0);
	xe_gt_assert(gt, err < __XE_TILE_DRV_ERR_MAX);

> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +}
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..9442d615042f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7..422f54c45ac9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,22 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +/** @enum xe_gt_drv_err_type
> + *  enum for different types of gt level errors in driver
> + */
> +enum xe_gt_drv_err_type {
> +	/* Driver guc communication errors */
> +	XE_GT_DRV_ERR_GUC_COMM,

do we care only about communication with GuC (lost CTB/MMIO, error
replies) or about all problems related to GuC (corrupted FW, FW crash)?

> +	/* Engine execution errors */
> +	XE_GT_DRV_ERR_ENGINE,
> +	/* Other errors like error during save/restore registers */
> +	XE_GT_DRV_ERR_OTHERS,
> +	/* Max defined error types, keep this last */
> +	__XE_GT_DRV_ERR_MAX
> +};
> +
> +#define XE_GT_DRV_ERR_MAX	__XE_GT_DRV_ERR_MAX

ditto

> +
>  #define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> @@ -347,6 +363,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f65..708dd385f2b1 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -71,6 +71,24 @@
>   *  - MOCS and PAT programming
>   */
>  
> +/**
> + * xe_tile_report_driver_error - Count driver error for tile
> + * @tile: Tile to count error for
> + * @err: enum error type
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Returns void.
> + */
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err)
> +{
> +	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));

wrong condition

> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +}
> +
>  /**
>   * xe_tile_alloc - Perform per-tile memory allocation
>   * @tile: Tile to perform allocations for
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 782c47f8bd45..092a6b17a97e 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,5 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err);
>  
>  #endif
