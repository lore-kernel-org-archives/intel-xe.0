Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34992CD495B
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 06:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39E10E56F;
	Thu, 21 Sep 2023 06:44:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7D10E0C2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695278680; x=1726814680;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wWgV4w8pjiffjPaktClDY20rftmKBucjm+GPUWncanI=;
 b=ZLseff1At+L5IuKGfK0GNAkHDh9X5V6fmzZtvDFR0PF/cyidKP7cB34N
 9UWQDKmZ8+fKb4m1dbbLGQx2oD/Ij+DNZ8hQFT3pCWbxfIiMJPGjNm4ap
 5+zobsMOUaW+lU1Uuj8wHFR1oVnCwIwYSj35G/TvZF2oH27Wl+O5vhVnY
 NUs50SCJDMSlf88d9zuZHySY/rXJ7zlTY9/S8LVRLEW+eaXFGm21Nv1Ri
 GY8HZlWKEBwm92bf5jOCZrJuuGsDLZKzh8PYEOWWQlmWjNhysRdtuxske
 xH3Q+uYSQqnhnZ9Kjn3igLWJDTZfxMUjHcrPaYgf6eAoMwAwBMZJPQQs7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377732665"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="377732665"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870677960"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="870677960"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 23:44:37 -0700
Received: from [10.249.129.91] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.129.91])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 45930333D5;
 Thu, 21 Sep 2023 07:44:35 +0100 (IST)
Message-ID: <db2ee607-2f4e-b7b5-9bf7-b306eea198f0@intel.com>
Date: Thu, 21 Sep 2023 08:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20230921060314.5933-1-tejas.upadhyay@intel.com>
 <20230921060314.5933-2-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230921060314.5933-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Indroduce low level driver error
 counting APIs
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 21.09.2023 08:03, Tejas Upadhyay wrote:
> Low level driver error that might have power or performance
> impact on the system, we are adding a new error counter to GT
> and tile and increment on each occurrance. Lets introcuce APIs

typos

> to define and increment each error type counter.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_tile.c         | 25 +++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a0..14f477412581 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -57,6 +57,13 @@ struct xe_ggtt;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +enum xe_tile_err_type {

to follow enum name, below enumerator names likely should start with:

	XE_TILE_ERR_..

or change enum type name to:

	xe_tile_drv_err_type

> +	XE_TILE_DRV_ERR_GGTT = 0,

value of first enumerator is 0 by default, no need to set explicitly

> +	XE_TILE_DRV_ERR_GUC_COMM,

GuC is per GT, not per tile, so why here?

> +	XE_TILE_DRV_ERR_INTR,
> +	XE_TILE_DRV_ERR_MAX

while this is common practice to have "MAX" as part of the enum, it is
breaking the one of the benefit of allowing only explicit constants as
params - note that if someone passes "MAX" it wont be treated as error
by the compiler ...

maybe at least name that enumerator differently to avoid mistakes ?
or best make it as #define outside enum definition ?

> +};
> +
>  /**
>   * struct xe_mem_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -173,8 +180,14 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
>  };
>  
> +void xe_tile_cnt_drv_err(struct xe_tile *tile,
> +			 const enum xe_tile_err_type err);

this _types.h header, no forward decls here, please
move it to xe_device.h

> +
>  /**
>   * struct xe_device - Top level struct of XE device
>   */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1aa44d4f9ac1..61e4d0222836 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -47,6 +47,30 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *const xe_gt_drv_err_to_str[] = {
> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"

nit: bkm is to have trailing , to minimize diff once we add new item ;)

nit: why all names are upper-case ?

hmm, and starting only with "other" items does not sound promising, are
there no specific class of errors that we want to show?

> +};

and this whole table seems to be unused in this patch

> +
> +/**
> + * xe_gt_cnt_drv_err - Count driver err for gt

maybe xe_gt_report_driver_error() will be a better name?

from coding-style.rst

" If you have a function that counts the number of active users, you
should call that ``count_active_users()`` or similar, you should **not**
call it ``cntusr()``. "

> + * @gt: GT to count error for
> + * @err: enum error type
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Returns void.
> + */
> +void xe_gt_cnt_drv_err(struct xe_gt *gt,
> +		       const enum xe_gt_err_type err)
> +{
> +	if (err >= ARRAY_SIZE(gt->drv_err_cnt))
> +		return;

with correctly defined enums that wouldn't be possible ;)

and since this is only possible due to our coding mistake, we should use
xe_gt_assert() here rather then silently ignore the problem

> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);

maybe there is already some helper that inc given counter ?

> +}
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7..cb71aff16a0b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,12 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +enum xe_gt_err_type {
> +	XE_GT_DRV_ERR_ENGINE = 0,
> +	XE_GT_DRV_ERR_OTHERS,
> +	XE_GT_DRV_ERR_MAX

ditto

> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> @@ -347,6 +353,12 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
>  };
>  
> +void xe_gt_cnt_drv_err(struct xe_gt *gt,
> +		       const enum xe_gt_err_type err);

wrong header, move it to xe_gt.h

> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f65..c6dfcb4431f0 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -71,6 +71,31 @@
>   *  - MOCS and PAT programming
>   */
>  
> +static const char *const xe_tile_drv_err_to_str[] = {
> +	[XE_TILE_DRV_ERR_GGTT] = "GGTT",
> +	[XE_TILE_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> +};

ditto

> +
> +/**
> + * xe_tile_cnt_drv_err - Count driver err for tile

maybe xe_tile_report_driver_error() will be a better name?

> + * @tile: Tile to count error for
> + * @err: enum error type
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Returns void.
> + */
> +void xe_tile_cnt_drv_err(struct xe_tile *tile,
> +			 const enum xe_tile_err_type err)
> +{
> +	if (err >= ARRAY_SIZE(tile->drv_err_cnt))
> +		return;

ditto

> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +}
> +
>  /**
>   * xe_tile_alloc - Perform per-tile memory allocation
>   * @tile: Tile to perform allocations for
