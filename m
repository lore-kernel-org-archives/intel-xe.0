Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56B1E7F156
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 11:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E43310E6FF;
	Fri, 29 Sep 2023 11:14:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B672110E11B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695986089; x=1727522089;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tolc2rLv1tdoCbuL6AiCXj8MOf1PcFECOpm39Y/8ZPk=;
 b=Tv683wFX16KCgLN0AbWSBrgaalVNT+I68vt677Xe+Y8fC4oo6V0dT40B
 IbqTbT9slfsXjnGU6otCnDdK02ugddJ0b7dmDNzGKRd+DJbLndCLy1X9L
 GEjs613kIococKKgxKiwbNGqSF2wEK7a/8KarMzHD2nxlvT8OMJQt9XSW
 Ju1sFKHwTalv8zC29uLr9/ZN74JAa+epJPIorJpln+43jDCC4S9Azq2rJ
 rZM8Paw5sGMX4NJ8FrJ4bPw6enNvPcyIox1EbKiNacUFQ8eerplzfEh1m
 2/0+Dw+gtshfFCPISXG3uUJtl+6DDzXQmnxHYREma/sA56Qd30EkfttDI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3849757"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="3849757"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="743420206"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="743420206"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:09:38 -0700
Message-ID: <85323d59-28c0-bb42-67af-1a6a2b8550ab@linux.intel.com>
Date: Fri, 29 Sep 2023 16:42:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-2-tejas.upadhyay@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230929062420.394375-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
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
Cc: Roper@freedesktop.org, Matthew D <matthew.d.roper@intel.com>,
 Wajdeczko@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 29/09/23 11:54, Tejas Upadhyay wrote:
> Low level driver error that might have power or performance
> impact on the system, we are adding a new error counter to GT
> and tile and increment on each occurrance. Lets introduce APIs
> to define and increment each error type counter.
>
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
>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  3 +++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h         |  2 ++
>  6 files changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0717839ae964..dc57b38d7e63 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -59,6 +59,12 @@ struct xe_pat_ops;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +#define XE_TILE_DRV_ERR_MAX	2
> +enum xe_tile_drv_err_type {
> +	XE_TILE_DRV_ERR_GGTT,
> +	XE_TILE_DRV_ERR_INTR
> +};
> +
i guess you missed to notice my earlier comment, repasting here:

"in that case do like this, so one would not accidentally miss updating the max when enum is updated.

enum xe_tile_drv_err_type {
    XE_TILE_DRV_ERR_GGTT,
    XE_TILE_DRV_ERR_INTR,
    __XE_TILE_DRV_ERR_MAX
};

#define XE_TILE_DRV_ERR_MAX __XE_TILE_DRV_ERR_MAX"

check below.

>  /**
>   * struct xe_mem_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -175,6 +181,9 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 68cd9a7ee087..a8b5f012588b 100644
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
> index d4310be3e1e7..4645ea9b7893 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,13 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +#define XE_GT_DRV_ERR_MAX	3
> +enum xe_gt_drv_err_type {
> +	XE_GT_DRV_ERR_GUC_COMM,
> +	XE_GT_DRV_ERR_ENGINE,
> +	XE_GT_DRV_ERR_OTHERS
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> @@ -347,6 +354,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];

should this be unsigned long?

Thanks,
Aravind.
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
