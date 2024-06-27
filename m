Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7926DC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 18:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A72F10E29A;
	Thu, 27 Jun 2024 18:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3y9l//Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F23C10E29A
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719513915; x=1751049915;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mkVSVgxtlsV03kJ3uWjjM/DLnDEAglkbZOuRVzJiIFA=;
 b=K3y9l//Y3mqOmhnzCtbE9J941UBxxt2dn+AROAUX9vcuo/0IIwmNIkf+
 i0uTqnuFn7gl1rLVU46ktB6803B2bgzcksRkbjGvGFwdUEo6m7AV5PBtf
 RDioO0kA0WpL+W5X99GzGdybLk1LB8YyvfgJGVDoefIMoFIZPHgGHuGKD
 FLxGpScskus2wS/W5ztzvEisZ0xTJCYE/XvvwSyuA0wPBHnqoCjevooLS
 GBrrwQqW1w+UxubEbktKnFKWgs5e73kd19KgU32pRJnLkUKHzoe45zHvU
 2UAsAlTseqaG0UbJvvZ/aUlq9bPz07vIzVyJ/ID21lNJW44ZtcZrKOMQz g==;
X-CSE-ConnectionGUID: g3uHMZXmTjKHSFVB05h8Lw==
X-CSE-MsgGUID: xY/UuhlUQNqZn00py+5fjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28066231"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="28066231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:45:14 -0700
X-CSE-ConnectionGUID: O4wPJXrPSXujzJLas4LmGA==
X-CSE-MsgGUID: c2jp/5xwSkSRcTiHbeXQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="49655998"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 27 Jun 2024 11:45:11 -0700
Received: from [10.246.27.12] (unknown [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 260B6332A8;
 Thu, 27 Jun 2024 19:45:10 +0100 (IST)
Message-ID: <9e266737-51ba-467d-a333-421bfbb01a4b@intel.com>
Date: Thu, 27 Jun 2024 20:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240624215404.3213075-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 24.06.2024 23:54, Zhanjun Dong wrote:
> Add referenced registers defines and list of registers.
> Update GuC ADS size allocation to include space for
> the lists of error state capture register descriptors.
> 
> Then, populate GuC ADS with the lists of registers we want
> GuC to report back to host on engine reset events. This list
> should include global, engine-class and engine-instance
> registers for every engine-class type on the current hardware.
> 
> Ensure we allocate a persistent store for the register lists
> that are populated into ADS so that we don't need to allocate
> memory during GT resets when GuC is reloaded and ADS population
> happens again.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/abi/guc_capture_abi.h  |  78 ++++
>  drivers/gpu/drm/xe/xe_guc.c               |   5 +
>  drivers/gpu/drm/xe/xe_guc.h               |   5 +
>  drivers/gpu/drm/xe/xe_guc_ads.c           | 157 +++++++-
>  drivers/gpu/drm/xe/xe_guc_ads_types.h     |   2 +
>  drivers/gpu/drm/xe/xe_guc_capture.c       | 428 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.h       |  44 +++
>  drivers/gpu/drm/xe/xe_guc_capture_types.h |  80 ++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h          |  22 ++
>  drivers/gpu/drm/xe/xe_guc_types.h         |   2 +
>  11 files changed, 812 insertions(+), 12 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7039008be234..e79babce44b5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -71,6 +71,7 @@ xe-y += xe_bb.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> +	xe_guc_capture.o \
>  	xe_guc_ct.o \
>  	xe_guc_db_mgr.o \
>  	xe_guc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> new file mode 100644
> index 000000000000..355fde5e2f95
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_CAPTURE_ABI_H
> +#define _ABI_GUC_CAPTURE_ABI_H
> +
> +#include <linux/types.h>
> +
> +#include "xe_guc_fwif.h"

we don't want to include driver specific headers (like xe_guc_fwif.h) in
ABI headers, as want ABI headers be pure and driver agnostic

you can include this ABI header in xe_guc_fwif.h though

but here just include <linux/types.h>

> +
> +/*
> + * struct guc_debug_capture_list_header / struct guc_debug_capture_list

either make it as generic intro:

/**
  * DOC: GuC Capture ...

or make it per struct kernel-doc

> + *
> + * As part of ADS registration, these header structures (followed by
> + * an array of 'struct guc_mmio_reg' entries) are used to register with
> + * GuC microkernel the list of registers we want it to dump out prior
> + * to a engine reset.
> + */
> +struct guc_debug_capture_list_header {
> +	u32 info;
> +#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
> +} __packed;
> +
> +struct guc_debug_capture_list {
> +	struct guc_debug_capture_list_header header;
> +	struct guc_mmio_reg regs[];
> +} __packed;
> +
> +/*
> + * struct guc_state_capture_header_t / struct guc_state_capture_t /
> + * guc_state_capture_group_header_t / guc_state_capture_group_t
> + *
> + * Prior to resetting engines that have hung or faulted, GuC microkernel
> + * reports the engine error-state (register values that was read) by
> + * logging them into the shared GuC log buffer using these hierarchy
> + * of structures.
> + */
> +struct guc_state_capture_header_t {
> +	u32 owner;
> +#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)

CAP is likely from CAPTURE
so then CAPTURE is redundant

maybe
	GUC_CAPTURE_STATE_OWNER_VFID

> +	u32 info;
> +#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
> +#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
> +#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)

maybe
	GUC_CAPTURE_STATE_INFO_TYPE
	GUC_CAPTURE_STATE_INFO_ENGINE_CLASS
	GUC_CAPTURE_STATE_INFO_ENGINE_INST

> +	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
> +	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
> +	u32 num_mmios;
> +#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)

seems either redundant or num_mmios name is wrong

> +} __packed;
> +
> +struct guc_state_capture_t {
> +	struct guc_state_capture_header_t header;
> +	struct guc_mmio_reg mmio_entries[];
> +} __packed;
> +
> +enum guc_capture_group_types {
> +	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
> +	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
> +	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,

MAX is likely not part of the ABI itself, only FULL=0 and PARTIAL=1

also it's good to match enumerators names with the enum name:

	GUC_CAPTURE_GROUP_TYPE_FULL = 0,
	GUC_CAPTURE_GROUP_TYPE_PARTIAL = 1,

> +};
> +
> +struct guc_state_capture_group_header_t {
> +	u32 owner;
> +#define CAP_GRP_HDR_CAPTURE_VFID GENMASK(7, 0)

	GUC_CAPTURE_STATE_GROUP_OWNER_VFID

> +	u32 info;
> +#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
> +#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */

	GUC_CAPTURE_STATE_GROUP_INFO_NUM
	GUC_CAPTURE_STATE_GROUP_INFO_TYPE

> +} __packed;
> +
> +/* this is the top level structure where an error-capture dump starts */
> +struct guc_state_capture_group_t {
> +	struct guc_state_capture_group_header_t grp_header;
> +	struct guc_state_capture_t capture_entries[];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 7ecb509c87d7..7081e451878f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_throttle.h"
>  #include "xe_guc_ads.h"
> +#include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_db_mgr.h"
>  #include "xe_guc_hwconfig.h"
> @@ -338,6 +339,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> +	ret = xe_guc_capture_init(guc);
> +	if (ret)
> +		goto out;
> +
>  	ret = xe_guc_ads_init(&guc->ads);
>  	if (ret)
>  		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index af59c9545753..ddfa855458ab 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -69,4 +69,9 @@ static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
>  	return gt_to_xe(guc_to_gt(guc));
>  }
>  
> +static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
> +{
> +	return &guc_to_xe(guc)->drm;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1c60b685dbc6..9b2e02ba9fc2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -18,6 +18,8 @@
>  #include "xe_gt_ccs_mode.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
> +#include "xe_guc_capture.h"
> +#include "xe_guc_capture_types.h"
>  #include "xe_guc_ct.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -127,6 +129,8 @@ struct __guc_ads_blob {
>  #define info_map_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
>  
> +static int guc_capture_prep_lists(struct xe_guc_ads *ads);
> +
>  static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
> @@ -148,8 +152,7 @@ static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>  
>  static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>  {
> -	/* FIXME: Allocate a proper capture list */
> -	return PAGE_ALIGN(PAGE_SIZE);
> +	return PAGE_ALIGN(ads->capture_size);
>  }
>  
>  static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> @@ -398,6 +401,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	struct xe_bo *bo;
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> +	/*
> +	 * At time of ads init, hwconfig was not loaded, engine info like
> +	 * engine mask is not ready.
> +	 * Capture size is using the worst size calculation.
> +	 */
> +	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
>  	ads->regset_size = calculate_regset_size(gt);
>  	ads->ads_waklv_size = calculate_waklv_size(ads);
>  
> @@ -418,8 +427,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   * @ads: Additional data structures object
>   *
>   * Recalcuate golden_lrc_size & regset_size as the number hardware engines may

typo

> - * have changed after the hwconfig was loaded. Also verify the new sizes fit in
> - * the already allocated ADS buffer object.
> + * have changed after the hwconfig was loaded. Also verify the new sizes fit
> + * in the already allocated ADS buffer object.
>   *
>   * Return: 0 on success, negative error code on error.
>   */
> @@ -431,6 +440,8 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>  	xe_gt_assert(gt, ads->bo);
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> +	/* Calculate Capture size with worst size */
> +	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
>  	ads->regset_size = calculate_regset_size(gt);
>  
>  	xe_gt_assert(gt, ads->golden_lrc_size +
> @@ -530,20 +541,142 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>  	}
>  }
>  
> -static void guc_capture_list_init(struct xe_guc_ads *ads)
> +static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
> +				       u32 capture_class)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 mask;
> +
> +	switch (capture_class) {
> +	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
> +		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
> +		break;
> +	case GUC_CAPTURE_LIST_CLASS_VIDEO:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
> +		break;
> +	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
> +		break;
> +	case GUC_CAPTURE_LIST_CLASS_BLITTER:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
> +		break;
> +	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
> +		break;
> +	default:
> +		mask = 0;
> +	}
> +
> +	return mask;
> +}
> +
> +static inline bool get_capture_list(struct xe_guc_ads *ads, struct xe_guc *guc, struct xe_gt *gt,
> +				    int owner, int type, int class, u32 *total_size, size_t *size,
> +				    void **pptr)
> +{
> +	*size = 0;
> +
> +	if (!xe_guc_capture_getlistsize(guc, owner, type, class, size)) {
> +		if (*total_size + *size > ads->capture_size)
> +			xe_gt_dbg(gt, "Capture size overflow :%zu vs %d\n",
> +				  *total_size + *size, ads->capture_size);
> +		else if (!xe_guc_capture_getlist(guc, owner, type, class, pptr))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>  {
> +	struct xe_guc *guc = ads_to_guc(ads);
> +	struct xe_gt *gt = ads_to_gt(ads);
> +	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
> +	struct iosys_map info_map;
> +	size_t size = 0;
> +	void *ptr;
>  	int i, j;
> -	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
>  
> -	/* FIXME: Populate a proper capture list */
> +	capture_offset = guc_ads_capture_offset(ads);
> +	ads_ggtt = xe_bo_ggtt_addr(ads->bo);
> +	info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> +					 offsetof(struct __guc_ads_blob, system_info));
> +
> +	/* first, set aside the first page for a capture_list with zero descriptors */
> +	total_size = PAGE_SIZE;
> +	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
> +
> +	null_ggtt = ads_ggtt + capture_offset;
> +	capture_offset += PAGE_SIZE;
> +
> +	/*
> +	 * Populate capture list : at this point adps is already allocated and
> +	 * mapped to worst case size
> +	 */
>  	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
> -		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
> -			ads_blob_write(ads, ads.capture_instance[i][j], addr);
> -			ads_blob_write(ads, ads.capture_class[i][j], addr);
> +		bool write_empty_list;
> +
> +		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
> +			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
> +			/* null list if we dont have said engine or list */
> +			if (!engine_mask) {
> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
> +				continue;
> +			}
> +
> +			/* engine exists: start with engine-class registers */
> +			write_empty_list = get_capture_list(ads, guc, gt, i,
> +							    GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +							    j, &total_size, &size, &ptr);
> +			if (!write_empty_list) {
> +				ads_blob_write(ads, ads.capture_class[i][j],
> +					       ads_ggtt + capture_offset);
> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
> +						 ptr, size);
> +				total_size += size;
> +				capture_offset += size;
> +			} else {
> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
> +			}
> +
> +			/* engine exists: next, engine-instance registers   */
> +			write_empty_list = get_capture_list(ads, guc, gt, i,
> +							    GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +							    j, &total_size, &size, &ptr);
> +			if (!write_empty_list) {
> +				ads_blob_write(ads, ads.capture_instance[i][j],
> +					       ads_ggtt + capture_offset);
> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
> +						 ptr, size);
> +				total_size += size;
> +				capture_offset += size;
> +			} else {
> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
> +			}
>  		}
>  
> -		ads_blob_write(ads, ads.capture_global[i], addr);
> +		/* global registers is last in our PF/VF loops */
> +		write_empty_list = get_capture_list(ads, guc, gt, i,
> +						    GUC_CAPTURE_LIST_TYPE_GLOBAL,
> +						    0, &total_size, &size, &ptr);
> +		if (!write_empty_list) {
> +			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
> +			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
> +					 size);
> +			total_size += size;
> +			capture_offset += size;
> +		} else {
> +			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
> +		}
>  	}
> +
> +	if (ads->capture_size != PAGE_ALIGN(total_size))
> +		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
> +			  ads->capture_size, PAGE_ALIGN(total_size));
> +	return PAGE_ALIGN(total_size);
>  }
>  
>  static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
> @@ -732,7 +865,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>  	guc_mmio_reg_state_init(ads);
>  	guc_prep_golden_lrc_null(ads);
>  	guc_mapping_table_init(gt, &info_map);
> -	guc_capture_list_init(ads);
> +	guc_capture_prep_lists(ads);
>  	guc_doorbell_init(ads);
>  	guc_waklv_init(ads);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 2de5decfe0fd..70c132458ac3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -22,6 +22,8 @@ struct xe_guc_ads {
>  	u32 regset_size;
>  	/** @ads_waklv_size: total waklv size supported by platform */
>  	u32 ads_waklv_size;
> +	/** @capture_size: size of register set passed to GuC for capture */
> +	u32 capture_size;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> new file mode 100644
> index 000000000000..172edcfd7c00
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021-2024 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_capture_abi.h"
> +#include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
> +#include "regs/xe_regs.h"
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_gt.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_capture.h"
> +#include "xe_guc_capture_types.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_log.h"
> +#include "xe_guc_submit.h"
> +#include "xe_hw_engine_types.h"
> +#include "xe_macros.h"
> +#include "xe_map.h"
> +
> +/*
> + * Define all device tables of GuC error capture register lists
> + * NOTE: For engine-registers, GuC only needs the register offsets
> + *       from the engine-mmio-base
> + */
> +#define COMMON_XELP_BASE_GLOBAL \
> +	{ FORCEWAKE_GT,		    0,      0}
> +
> +#define COMMON_BASE_ENGINE_INSTANCE \
> +	{ RING_ESR(0),              0,      0}, \
> +	{ RING_EMR(0),              0,      0}, \
> +	{ RING_EIR(0),              0,      0}, \
> +	{ RING_EXECLIST_STATUS_HI(0), 0,    0}, \
> +	{ RING_EXECLIST_STATUS_LO(0), 0,    0}, \
> +	{ RING_DMA_FADD(0),         0,      0}, \
> +	{ RING_DMA_FADD_UDW(0),     0,      0}, \
> +	{ RING_IPEHR(0),            0,      0}, \
> +	{ RING_BBADDR(0),           0,      0}, \
> +	{ RING_BBADDR_UDW(0),       0,      0}, \
> +	{ RING_ACTHD(0),            0,      0}, \
> +	{ RING_ACTHD_UDW(0),        0,      0}, \
> +	{ RING_START(0),            0,      0}, \
> +	{ RING_HEAD(0),             0,      0}, \
> +	{ RING_TAIL(0),             0,      0}, \
> +	{ RING_CTL(0),              0,      0}, \
> +	{ RING_MI_MODE(0),          0,      0}, \
> +	{ RING_HWS_PGA(0),          0,      0}, \
> +	{ RING_MODE(0),             0,      0}
> +
> +/* XE_LP Global */
> +static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
> +	COMMON_XELP_BASE_GLOBAL,
> +};
> +
> +/* Render / Compute Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe_rc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Media Decode/Encode Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe_vd_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Video Enhancement Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* XE_LP - GSC Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/*
> + * Empty list to prevent warnings about unknown class/instance types
> + * as not all class/instanace types have entries on all platforms.

typo

> + */
> +static const struct __guc_mmio_reg_descr empty_regs_list[] = {
> +};
> +
> +#define TO_GCAP_DEF_OWNER(x) (GUC_CAPTURE_LIST_INDEX_##x)
> +#define TO_GCAP_DEF_TYPE(x) (GUC_CAPTURE_LIST_TYPE_##x)
> +#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
> +	{ \
> +		regslist, \
> +		ARRAY_SIZE(regslist), \
> +		TO_GCAP_DEF_OWNER(regsowner), \
> +		TO_GCAP_DEF_TYPE(regstype), \
> +		class, \
> +	}
> +
> +/* List of lists */
> +static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(xe_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	{}
> +};
> +
> +static const char * const capture_list_type_names[] = {
> +	"Global",
> +	"Class",
> +	"Instance",
> +};
> +
> +static const char * const capture_engine_class_names[] = {
> +	"Render/Compute",
> +	"Video",
> +	"VideoEnhance",
> +	"Blitter",
> +	"GSC-Other",
> +};
> +
> +static const struct __guc_mmio_reg_descr_group *
> +guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
> +			 u32 owner, u32 type, u32 id)
> +{
> +	int i;
> +
> +	if (!reglists)
> +		return NULL;
> +
> +	for (i = 0; reglists[i].list; ++i) {
> +		if (reglists[i].owner == owner && reglists[i].type == type &&
> +		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
> +			return &reglists[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct __guc_mmio_reg_descr_group *
> +guc_capture_get_device_reglist(struct xe_guc *guc)
> +{
> +	return xe_lp_lists;
> +}
> +
> +static int
> +guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
> +		      struct guc_mmio_reg *ptr, u16 num_entries)
> +{
> +	u32 i = 0;
> +	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
> +	const struct __guc_mmio_reg_descr_group *match;
> +
> +	if (!reglists)
> +		return -ENODEV;
> +
> +	match = guc_capture_get_one_list(reglists, owner, type, classid);
> +	if (!match)
> +		return -ENODATA;
> +
> +	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
> +		ptr[i].offset = match->list[i].reg.addr;
> +		ptr[i].value = 0xDEADF00D;
> +		ptr[i].flags = match->list[i].flags;
> +		ptr[i].mask = match->list[i].mask;
> +	}
> +
> +	if (i < num_entries)
> +		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
> +			  num_entries);
> +
> +	return 0;
> +}
> +
> +static int
> +guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
> +{
> +	const struct __guc_mmio_reg_descr_group *match;
> +
> +	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
> +	if (!match)
> +		return 0;
> +
> +	return match->num_regs;
> +}
> +
> +static int
> +guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
> +			size_t *size, bool is_purpose_est)
> +{
> +	struct xe_guc_state_capture *gc = guc->capture;
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct __guc_capture_ads_cache *cache;
> +	int num_regs;
> +
> +	xe_gt_assert(gt, type < GUC_CAPTURE_LIST_TYPE_MAX);
> +	xe_gt_assert(gt, classid < GUC_CAPTURE_LIST_CLASS_MAX);
> +
> +	cache = &gc->ads_cache[owner][type][classid];
> +	if (!gc->reglists) {
> +		xe_gt_warn(gt, "No capture reglist for this device\n");
> +		return -ENODEV;
> +	}
> +
> +	if (cache->is_valid) {
> +		*size = cache->size;
> +		return cache->status;
> +	}
> +
> +	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
> +	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
> +		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
> +			xe_gt_warn(gt, "Missing capture reglist: global!\n");
> +		else
> +			xe_gt_warn(gt, "Missing capture reglist: %s(%u):%s(%u)!\n",
> +				   capture_list_type_names[type], type,
> +				   capture_engine_class_names[classid], classid);
> +		return -ENODEV;
> +	}
> +
> +	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
> +	/* intentional empty lists can exist depending on hw config */
> +	if (!num_regs)
> +		return -ENODATA;
> +
> +	if (size)
> +		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
> +				   (num_regs * sizeof(struct guc_mmio_reg)));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_capture_getlistsize - Get list size for owner/type/class combination
> + * @guc:	The GuC object
> + * @owner:	PF/VF owner
> + * @type:	Guc capture register type
> + * @classid:	Guc capture engine class id
> + * @size:	Point to the size
> + *
> + * This function will get the list for the owner/type/class combination, and
> + * return the page aligned list size.

missing "Return:" section

> + */
> +int
> +xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
> +{
> +	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
> +}
> +
> +/**
> + * xe_guc_capture_getlist - Get register capture list for owner/type/class
> + * combination
> + *
> + * @guc:	The GuC object
> + * @owner:	PF/VF owner
> + * @type:	Guc capture register type
> + * @classid:	Guc capture engine class id
> + * @outptr:	Point to cached register capture list
> + *
> + * This function will get the register capture list for the owner/type/class
> + * combination.

missing "Return:" section

> + */
> +int
> +xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
> +{
> +	struct xe_guc_state_capture *gc = guc->capture;
> +	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
> +	struct guc_debug_capture_list *listnode;
> +	int ret, num_regs;
> +	u8 *caplist, *tmp;
> +	size_t size = 0;
> +
> +	if (!gc->reglists)
> +		return -ENODEV;
> +
> +	if (cache->is_valid) {
> +		*outptr = cache->ptr;
> +		return cache->status;
> +	}
> +
> +	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
> +	if (ret) {
> +		cache->is_valid = true;
> +		cache->ptr = NULL;
> +		cache->size = 0;
> +		cache->status = ret;
> +		return ret;
> +	}
> +
> +	caplist = drmm_kzalloc(guc_to_drm(guc), size, GFP_KERNEL);
> +	if (!caplist)
> +		return -ENOMEM;
> +
> +	/* populate capture list header */
> +	tmp = caplist;
> +	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
> +	listnode = (struct guc_debug_capture_list *)tmp;
> +	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
> +
> +	/* populate list of register descriptor */
> +	tmp += sizeof(struct guc_debug_capture_list);
> +	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
> +
> +	/* cache this list */
> +	cache->is_valid = true;
> +	cache->ptr = caplist;
> +	cache->size = size;
> +	cache->status = 0;
> +
> +	*outptr = caplist;
> +
> +	return 0;
> +}
> +
> +/*

this should be /**

> + * xe_guc_capture_getnullheader - Get a null list for register capture
> + *
> + * @guc:	The GuC object
> + * @outptr:	Point to cached register capture list
> + * @size:	Point to the size
> + *
> + * This function will alloc for a null list for register capture.

missing "Return:" section

> + */
> +int
> +xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
> +{
> +	struct xe_guc_state_capture *gc = guc->capture;
> +	int tmp = sizeof(u32) * 4;
> +	void *null_header;
> +
> +	if (gc->ads_null_cache) {
> +		*outptr = gc->ads_null_cache;
> +		*size = tmp;
> +		return 0;
> +	}
> +
> +	null_header = drmm_kzalloc(guc_to_drm(guc), tmp, GFP_KERNEL);
> +	if (!null_header)
> +		return -ENOMEM;
> +
> +	gc->ads_null_cache = null_header;
> +	*outptr = null_header;
> +	*size = tmp;
> +
> +	return 0;
> +}
> +
> +/*

this should be /**

> + * xe_guc_capture_ads_input_worst_size - Calculate the worst size for GuC register capture
> + * @guc: point to xe_guc structure
> + *
> + * Calculate the worst size for GuC register capture by including all possible engines classes.
> + *
> + * Returns: Calculated size
> + */
> +size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
> +{
> +	size_t total_size, class_size, instance_size, global_size;
> +	int i, j;
> +
> +	/*
> +	 * This function calculates the worst case register lists size by
> +	 * including all possible engines classes. It is called during the
> +	 * first of a two-phase GuC (and ADS-population) initialization
> +	 * sequence, that is, during the pre-hwconfig phase before we have
> +	 * the exact engine fusing info.
> +	 */
> +	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
> +	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
> +		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
> +			if (xe_guc_capture_getlistsize(guc, i,
> +						       GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +						       j, &class_size) < 0)
> +				class_size = 0;
> +			if (xe_guc_capture_getlistsize(guc, i,
> +						       GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +						       j, &instance_size) < 0)
> +				instance_size = 0;
> +			total_size += class_size + instance_size;
> +		}
> +		if (xe_guc_capture_getlistsize(guc, i,
> +					       GUC_CAPTURE_LIST_TYPE_GLOBAL,
> +					       0, &global_size) < 0)
> +			global_size = 0;
> +		total_size += global_size;
> +	}
> +
> +	return PAGE_ALIGN(total_size);
> +}
> +
> +/*

/**

> + * xe_guc_capture_init - Init for GuC register capture
> + * @guc: The GuC object
> + *
> + * Init for GuC register capture, alloc memory for capture data structure.
> + *
> + * Returns: 0 if success.
> +	    -ENOMEM if out of memory
> + */
> +int xe_guc_capture_init(struct xe_guc *guc)
> +{
> +	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
> +	if (!guc->capture)
> +		return -ENOMEM;
> +
> +	guc->capture->reglists = guc_capture_get_device_reglist(guc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> new file mode 100644
> index 000000000000..232f60fc9a20
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_CAPTURE_H
> +#define _XE_GUC_CAPTURE_H
> +
> +#include <linux/types.h>
> +#include "regs/xe_reg_defs.h"
> +
> +struct xe_guc;
> +
> +/*
> + * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
> + *
> + * xe_guc_capture module uses these structures to maintain static
> + * tables (per unique platform) that consists of lists of registers
> + * (offsets, names, flags,...) that are used at the ADS regisration
> + * time as well as during runtime processing and reporting of error-
> + * capture states generated by GuC just prior to engine reset events.
> + */
> +struct __guc_mmio_reg_descr {
> +	struct xe_reg reg;
> +	u32 flags;
> +	u32 mask;
> +	const char *regname;
> +};
> +
> +struct __guc_mmio_reg_descr_group {
> +	const struct __guc_mmio_reg_descr *list;
> +	u32 num_regs;
> +	u32 owner; /* see enum guc_capture_owner */
> +	u32 type; /* see enum guc_capture_type */
> +	u32 engine; /* as per MAX_ENGINE_CLASS */
> +};

shouldn't above structs be defined in xe_guc_capture_types.h ?

> +
> +int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
> +int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
> +int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
> +size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
> +int xe_guc_capture_init(struct xe_guc *guc);
> +
> +#endif /* _XE_GUC_CAPTURE_H */

Xe maintainers don't like such markups on include guards #ifdef

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> new file mode 100644
> index 000000000000..b2e78ab53e2e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _xe_guc_capture_types_H
> +#define _xe_guc_capture_types_H

should be upper case

> +
> +#include <linux/types.h>
> +
> +#include "xe_guc_fwif.h"

do you need this header or maybe just abi/guc_capture_abi.h ?

> +
> +/*

/** or  intentional ?

> + * struct __guc_capture_ads_cache
> + *
> + * A structure to cache register lists that were populated and registered
> + * with GuC at startup during ADS registration. This allows much quicker
> + * GuC resets without re-parsing all the tables for the given gt.
> + */
> +struct __guc_capture_ads_cache {
> +	bool is_valid;
> +	void *ptr;
> +	size_t size;
> +	int status;

we should describe all members

> +};
> +
> +/**
> + * struct xe_guc_state_capture
> + *
> + * Internal context of the xe_guc_capture module.
> + */
> +struct xe_guc_state_capture {
> +	/**
> +	 * @reglists: static table of register lists used for error-capture state.
> +	 */
> +	const struct __guc_mmio_reg_descr_group *reglists;
> +
> +	/**
> +	 * @ads_cache: cached register lists that is ADS format ready
> +	 */
> +	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
> +						[GUC_CAPTURE_LIST_TYPE_MAX]
> +						[GUC_MAX_ENGINE_CLASSES];
> +
> +	/**
> +	 * @ads_null_cache: ADS null cache.
> +	 */
> +	void *ads_null_cache;
> +
> +	/**
> +	 * @cachelist: Pool of pre-allocated nodes for error capture output
> +	 *
> +	 * We need this pool of pre-allocated nodes because we cannot
> +	 * dynamically allocate new nodes when receiving the G2H notification
> +	 * because the event handlers for all G2H event-processing is called
> +	 * by the ct processing worker queue and when that queue is being
> +	 * processed, there is no absoluate guarantee that we are not in the
> +	 * midst of a GT reset operation (which doesn't allow allocations).
> +	 */
> +	struct list_head cachelist;
> +#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
> +#define PREALLOC_NODES_DEFAULT_NUMREGS 64
> +
> +	/**
> +	 * @max_mmio_per_node: Max MMIO per node.
> +	 */
> +	int max_mmio_per_node;
> +
> +	/**
> +	 * @outlist: Pool of pre-allocated nodes for error capture output
> +	 *
> +	 * A linked list of parsed GuC error-capture output data before
> +	 * reporting with formatting via xe_devcoredump. Each node in this linked list shall
> +	 * contain a single engine-capture including global, engine-class and
> +	 * engine-instance register dumps as per guc_capture_parsed_output_node
> +	 */
> +	struct list_head outlist;
> +};
> +
> +#endif /* _xe_guc_capture_types_H */

drop /* */

> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 19ee71aeaf17..04b03c398191 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -9,6 +9,7 @@
>  #include <linux/bits.h>
>  
>  #include "abi/guc_klvs_abi.h"
> +#include "xe_hw_engine_types.h"
>  
>  #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> @@ -164,8 +165,11 @@ struct guc_mmio_reg {
>  	u32 flags;
>  	u32 mask;
>  #define GUC_REGSET_MASKED		BIT(0)
> +#define GUC_REGSET_STEERING_NEEDED	BIT(1)
>  #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
>  #define GUC_REGSET_RESTORE_ONLY		BIT(3)
> +#define GUC_REGSET_STEERING_GROUP       GENMASK(16, 12)
> +#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
>  } __packed;
>  
>  /* GuC register sets */
> @@ -194,6 +198,24 @@ enum {
>  	GUC_CAPTURE_LIST_INDEX_MAX = 2,
>  };
>  
> +/*Register-types of GuC capture register lists */
> +enum guc_capture_type {
> +	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
> +	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +	GUC_CAPTURE_LIST_TYPE_MAX,

MAX is likely not part of the ABI

and maybe guc_capture_type should be defined in abi/guc_capture_abi.h ?

> +};
> +
> +/* Class indecies for capture_class and capture_instance arrays */
> +enum {
> +	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
> +	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
> +	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
> +	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
> +	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
> +	GUC_CAPTURE_LIST_CLASS_MAX  = 5

MAX is likely not part of the ABI

and move to abi/guc_capture_abi.h ?

> +};
> +
>  /* GuC Additional Data Struct */
>  struct guc_ads {
>  	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 546ac6350a31..6d7d0976b7af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -58,6 +58,8 @@ struct xe_guc {
>  	struct xe_guc_ads ads;
>  	/** @ct: GuC ct */
>  	struct xe_guc_ct ct;
> +	/** @capture: the error-state-capture module's data and objects */
> +	struct xe_guc_state_capture *capture;
>  	/** @pc: GuC Power Conservation */
>  	struct xe_guc_pc pc;
>  	/** @dbm: GuC Doorbell Manager */
