Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC2CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F53110E6EE;
	Wed, 13 Aug 2025 10:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZ7PqbQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ECF10E6F0
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755081732; x=1786617732;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CHaq04osmu9vCy6PrehF6Ulp4SeyKW5EojefOgfATDQ=;
 b=hZ7PqbQiHZOdEGEj4qU5t1L6hfhsHy0+UQc6WgWbEcHqhYXTyIKez7gL
 hkpGaea9WAXGHTqpQ7dPABmKajMvRElSmCvV+WVaK2y4U3cr/5Cwf/tXW
 OP7WbmobJccOgQ6aToQLIR8uEbsJD839EnpJyfjqlX/UVygFcjBl3Bc/M
 HMSwABX46UHPPklfMsGZctXpN2q8zi8JYDLsKiaG9cmd9XOb0b2uYjJ98
 vRdaE3xOLKkxLBiiMF1yAs9ubAerLlXRoLpu2LroWT+GxA+U4rZ4kYv3Z
 4J5CgLMBn1TJIzjZj9DUDCuwUyX8Jkrh2UuMWcSyVxuHAxlYzmQMBN3U9 g==;
X-CSE-ConnectionGUID: HdffmMz8QsWQPl4n0Dm85g==
X-CSE-MsgGUID: VewA9OePS7Cx+igCt6ekKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="59992786"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="59992786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:42:11 -0700
X-CSE-ConnectionGUID: qlle0lvDS0COlO4M86aPcQ==
X-CSE-MsgGUID: xz0xywWqS2ywFoTy4f/xZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170643427"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.238])
 ([10.245.245.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:42:10 -0700
Message-ID: <141f2daa-30cd-44bf-9314-69e6af1c771e@intel.com>
Date: Wed, 13 Aug 2025 11:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] drm/xe/psmi: Add debugfs interface for PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: prashanth.kumar@intel.com, dnyaneshwar.bhadane@intel.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Brian Welty <brian.welty@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-2-a111e9f1e4b7@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250808-psmi-v3-2-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/08/2025 18:29, Lucas De Marchi wrote:
> Requirement for PSMI capture is to have a physically contiguous buffer.
> All the needed configuration is done by the userspace tool directly to
> the GPU via mmio access.
> 
> This interface only support allocating from VRAM regions. For integrated
> devices, the PSMI buffer is in SYSTEM memory and should be allocated by
> userspace using hugetlbfs.
> 
> Here we add the ability to allocate a region of physically contiguous
> memory by writing to debugfs file (listed below). For multi-tile devices,
> the capture tool requires ability to allocate a capture buffer per tile
> (VRAM region) and so user can specify a region_mask. The tool then
> can mmap the buffers via direct mmap of the PCIBAR via sysfs.
> 
> To support the capture tool, 3 new debugfs entries are added:
> 
>     psmi_capture_addr - physical address per VRAM region's capture buffer
>     psmi_capture_region_mask - select which region(s) to allocate a buffer
>     psmi_capture_size - size of current capture buffer
> 
> Writing psmi_capture_size will allocate new buffer of requested size per
> region after freeing any current buffers.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Original-author: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
>   - Fix kernel-doc
>   - Do not walk all region_mask on cleanup: it should never be needed
>   - Replace sysmem checks by asserts as they should never be set
>   - s/debugfs_create/debugfs_register/ and do not pass the root dir:
>     this makes it similar to other parts registering debugfs
>   - Do not export a cleanup function, rather use a init that registers
>     a devm action if needed
>   - Drop modparam in favor of configfs whose attribute will be
>     implemented when everything is ready
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_debugfs.c      |   3 +
>   drivers/gpu/drm/xe/xe_device.c       |   5 +
>   drivers/gpu/drm/xe/xe_device_types.h |   8 +
>   drivers/gpu/drm/xe/xe_psmi.c         | 313 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_psmi.h         |  14 ++
>   6 files changed, 344 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757c..85b8d3a59ef07 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_pcode.o \
>   	xe_pm.o \
>   	xe_preempt_fence.o \
> +	xe_psmi.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 0b4a532f7c45c..bc717519502dd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -20,6 +20,7 @@
>   #include "xe_guc_ads.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
> +#include "xe_psmi.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_pf.h"
> @@ -400,6 +401,8 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_pxp_debugfs_register(xe->pxp);
>   
> +	xe_psmi_debugfs_register(xe);
> +
>   	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>   
>   	if (IS_SRIOV_PF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f4..62edb39b61fb0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -54,6 +54,7 @@
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
>   #include "xe_pmu.h"
> +#include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_shrinker.h"
> @@ -908,6 +909,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_psmi_init(xe);
> +	if (err)
> +		return err;
> +
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f7..bf9af8d0b84ae 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -576,6 +576,14 @@ struct xe_device {
>   	atomic64_t global_total_pages;
>   #endif
>   
> +	/** @psmi: GPU debugging via additional validation HW */
> +	struct {
> +		/** @psmi.capture_obj: PSMI buffer for VRAM */
> +		struct xe_bo *capture_obj[XE_MAX_TILES_PER_DEVICE + 1];
> +		/** @psmi.region_mask: Mask of valid memory regions */
> +		u8 region_mask;
> +	} psmi;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
> new file mode 100644
> index 0000000000000..e6a67e85e1bb2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_psmi.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_configfs.h"
> +#include "xe_psmi.h"
> +
> +/*
> + * PSMI capture support
> + *
> + * Requirement for PSMI capture is to have a physically contiguous buffer.  The
> + * PSMI tool owns doing all necessary configuration (MMIO register writes are
> + * done from user-space). However, KMD needs to provide the PSMI tool with the
> + * required physical address of the base of PSMI buffer in case of VRAM.
> + *
> + * VRAM backed PSMI buffer:
> + * Buffer is allocated as GEM object and with XE_BO_CREATE_PINNED_BIT flag which
> + * creates a contiguous allocation. The physical address is returned from
> + * psmi_debugfs_capture_addr_show(). PSMI tool can mmap the buffer via the
> + * PCIBAR through sysfs.
> + *
> + * SYSTEM memory backed PSMI buffer:
> + * Interface here does not support allocating from SYSTEM memory region.  The
> + * PSMI tool needs to allocate memory themselves using hugetlbfs. In order to
> + * get the physical address, user-space can query /proc/[pid]/pagemap. As an
> + * alternative, CMA debugfs could also be used to allocate reserved CMA memory.
> + */
> +
> +static bool psmi_enabled(struct xe_device *xe)
> +{
> +	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
> +}
> +
> +static void psmi_free_object(struct xe_bo *bo)
> +{
> +	xe_bo_lock(bo, NULL);
> +	xe_bo_unpin(bo);
> +	xe_bo_unlock(bo);
> +	xe_bo_put(bo);
> +}
> +
> +/*
> + * Free PSMI capture buffer objects.
> + */
> +static void psmi_cleanup(struct xe_device *xe)
> +{
> +	unsigned long id, region_mask = xe->psmi.region_mask;
> +	struct xe_bo *bo;
> +
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		bo = xe->psmi.capture_obj[id];
> +		if (bo) {
> +			psmi_free_object(bo);
> +			xe->psmi.capture_obj[id] = NULL;
> +		}
> +	}
> +}
> +
> +static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
> +				       unsigned int id, size_t bo_size)
> +{
> +	struct xe_bo *bo = NULL;
> +	struct xe_tile *tile;
> +	int err;
> +
> +	if (!id || !bo_size)
> +		return NULL;
> +
> +	tile = &xe->tiles[id - 1];
> +
> +	/* VRAM: Allocate GEM object for the capture buffer */
> +	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
> +				 ttm_bo_type_kernel,
> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				 XE_BO_FLAG_PINNED |
> +				 XE_BO_FLAG_NEEDS_CPU_ACCESS);

It might make sense to add XE_BO_FLAG_PINNED_LATE_RESTORE, assuming this 
memory needs to be saved and restored for VRAM case. Since it might 
could be ~large it might benefit from using the blitter instead of CPU?

Also do you want the memory to be pre-cleared here? Currently it just 
gives you back uncleared memory, also with uncleared CCS. If uncleared 
is fine, then should that be documented somewhere for the user so that 
there are no surprises?

> +
> +	if (!IS_ERR(bo)) {
> +		/* Buffer written by HW, ensure stays resident */
> +		err = xe_bo_pin(bo);
> +		if (err)
> +			bo = ERR_PTR(err);
> +		xe_bo_unlock(bo);
> +	}
> +
> +	return bo;
> +}
> +
> +/*
> + * Allocate PSMI capture buffer objects (via debugfs set function), based on
> + * which regions the user has selected in region_mask.  @size: size in bytes
> + * (should be power of 2)
> + *
> + * Always release/free the current buffer objects before attempting to allocate
> + * new ones.  Size == 0 will free all current buffers.
> + *
> + * Note, we don't write any registers as the capture tool is already configuring
> + * all PSMI registers itself via mmio space.
> + */
> +static int psmi_resize_object(struct xe_device *xe, size_t size)
> +{
> +	unsigned long id, region_mask = xe->psmi.region_mask;
> +	struct xe_bo *bo = NULL;
> +	int err = 0;
> +
> +	/*
> +	 * Buddy allocator anyway will roundup to next power of 2,
> +	 * so rather than waste unused pages, require user to ask for
> +	 * power of 2 sized PSMI buffers.

It will internally do a trim for you to give back any excess, if not a 
power-of-two, so might be beneficial to drop this restriction. Probably 
doesn't matter all that much though.

> +	 */
> +	if (size && !is_power_of_2(size))
> +		return -EINVAL;
> +
> +	/* if resizing, free currently allocated buffers first */
> +	psmi_cleanup(xe);
> +
> +	/* can set size to 0, in which case, now done */
> +	if (!size)
> +		return 0;
> +
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		bo = psmi_alloc_object(xe, id, size);
> +		if (IS_ERR(bo)) {
> +			err = PTR_ERR(bo);
> +			break;
> +		}
> +		xe->psmi.capture_obj[id] = bo;
> +
> +		drm_info(&xe->drm,
> +			 "PSMI capture size requested: %zu bytes, allocated: %lu:%zu\n",
> +			 size, id, bo ? xe_bo_size(bo) : 0);
> +	}
> +
> +	/* on error, reverse what was allocated */
> +	if (err)
> +		psmi_cleanup(xe);
> +
> +	return err;
> +}
> +
> +/*
> + * Returns an address for the capture tool to use to find start of capture
> + * buffer. Capture tool requires the capability to have a buffer allocated per
> + * each tile (VRAM region), thus we return an address for each region.
> + */
> +static int psmi_debugfs_capture_addr_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = m->private;
> +	unsigned long id, region_mask;
> +	struct xe_bo *bo;
> +	u64 val;
> +
> +	region_mask = xe->psmi.region_mask;
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		/* VRAM region */
> +		bo = xe->psmi.capture_obj[id];
> +		if (!bo)
> +			continue;
> +
> +		/* pinned, so don't need bo_lock */
> +		val = __xe_bo_addr(bo, 0, PAGE_SIZE);
> +		seq_printf(m, "%ld: 0x%llx\n", id, val);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Return capture buffer size, using the size from first allocated object that
> + * is found. This works because all objects must be of the same size.
> + */
> +static int psmi_debugfs_capture_size_get(void *data, u64 *val)
> +{
> +	unsigned long id, region_mask;
> +	struct xe_device *xe = data;
> +	struct xe_bo *bo;
> +
> +	region_mask = xe->psmi.region_mask;
> +	for_each_set_bit(id, &region_mask,
> +			 ARRAY_SIZE(xe->psmi.capture_obj)) {
> +		/* smem should never be set */
> +		xe_assert(xe, id);
> +
> +		bo = xe->psmi.capture_obj[id];
> +		if (bo) {
> +			*val = xe_bo_size(bo);
> +			return 0;
> +		}
> +	}
> +
> +	/* no capture objects are allocated */
> +	*val = 0;
> +
> +	return 0;
> +}
> +
> +/*
> + * Set size of PSMI capture buffer. This triggers the allocation of capture
> + * buffer in each memory region as specified with prior write to
> + * psmi_capture_region_mask.
> + */
> +static int psmi_debugfs_capture_size_set(void *data, u64 val)
> +{
> +	struct xe_device *xe = data;
> +
> +	/* user must have specified at least one region */
> +	if (!xe->psmi.region_mask)
> +		return -EINVAL;
> +
> +	return psmi_resize_object(xe, val);
> +}
> +
> +static int psmi_debugfs_capture_region_mask_get(void *data, u64 *val)
> +{
> +	struct xe_device *xe = data;
> +
> +	*val = xe->psmi.region_mask;
> +
> +	return 0;
> +}
> +
> +/*
> + * Select VRAM regions for multi-tile devices, only allowed when buffer is not
> + * currently allocated.
> + */
> +static int psmi_debugfs_capture_region_mask_set(void *data, u64 region_mask)
> +{
> +	struct xe_device *xe = data;
> +	u64 size = 0;
> +
> +	/* SMEM is not supported (see comments at top of file) */
> +	if (region_mask & 0x1)
> +		return -EOPNOTSUPP;
> +
> +	/* input bitmask should contain only valid TTM regions */
> +	if (!region_mask || region_mask & ~xe->info.mem_region_mask)
> +		return -EINVAL;
> +
> +	/* only allow setting mask if buffer is not yet allocated */
> +	psmi_debugfs_capture_size_get(xe, &size);
> +	if (size)
> +		return -EBUSY;
> +
> +	xe->psmi.region_mask = region_mask;
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(psmi_debugfs_capture_addr);
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_region_mask_fops,
> +			 psmi_debugfs_capture_region_mask_get,
> +			 psmi_debugfs_capture_region_mask_set,
> +			 "0x%llx\n");
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_size_fops,
> +			 psmi_debugfs_capture_size_get,
> +			 psmi_debugfs_capture_size_set,
> +			 "%lld\n");
> +
> +void xe_psmi_debugfs_register(struct xe_device *xe)
> +{
> +	struct drm_minor *minor;
> +
> +	if (!psmi_enabled(xe))
> +		return;
> +
> +	minor = xe->drm.primary;
> +	if (!minor->debugfs_root)
> +		return;
> +
> +	debugfs_create_file("psmi_capture_addr",
> +			    0400, minor->debugfs_root, xe,
> +			    &psmi_debugfs_capture_addr_fops);
> +
> +	debugfs_create_file("psmi_capture_region_mask",
> +			    0600, minor->debugfs_root, xe,
> +			    &psmi_debugfs_capture_region_mask_fops);
> +
> +	debugfs_create_file("psmi_capture_size",
> +			    0600, minor->debugfs_root, xe,
> +			    &psmi_debugfs_capture_size_fops);
> +}
> +
> +static void psmi_fini(void *arg)
> +{
> +	psmi_cleanup(arg);
> +}
> +
> +int xe_psmi_init(struct xe_device *xe)
> +{
> +	if (!psmi_enabled(xe))
> +		return 0;
> +
> +	return devm_add_action(xe->drm.dev, psmi_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_psmi.h b/drivers/gpu/drm/xe/xe_psmi.h
> new file mode 100644
> index 0000000000000..b1dfba80d893d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_psmi.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PSMI_H_
> +#define _XE_PSMI_H_
> +
> +struct xe_device;
> +
> +int xe_psmi_init(struct xe_device *xe);
> +void xe_psmi_debugfs_register(struct xe_device *xe);
> +
> +#endif
> 

