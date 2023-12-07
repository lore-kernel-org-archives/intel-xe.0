Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF8C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB610E8C0;
	Thu,  7 Dec 2023 14:55:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E9610E8B9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701960936; x=1733496936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fDUppuR44qATS1Sxzu+Ywf9l0LseNN1lE6BHgUbpkdU=;
 b=GPz/yGH3m/pylq+TKXM7BP+QbxxqKQfpwjFsNhQGaG2DMxikm7JIA7/d
 64aF6QkwvYkb2YGoTUkKWu6K15lcTR7rIdKXNXM48vXbFmL2QUSyapHFU
 99qOJvHXjZXOUykiCyL/+krzfNlpzghQ//2WpMhXyRCI+ZU9gFA4O2lcN
 EpRVYASo68NnPsU0b9taJzo3XXTKuO4YhKs61W5j8xZN8xrjdxY9Vg1zE
 ctXyN1dSv44vxfW7dVMF3JeHLNoZSLyKUmd5GwAhjAihn+GT6KgT5I55I
 n0nTEEclwufFhxZXatdFDpKAa7wFksUpI/E2AelYgfhZDEuJDgRQg1fYk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480433771"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="480433771"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="842229724"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842229724"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2023 06:55:34 -0800
Received: from [10.249.143.167] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.143.167])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 68CFB3430C;
 Thu,  7 Dec 2023 14:55:33 +0000 (GMT)
Message-ID: <ec676ce0-7f27-4230-8bcf-9f4d3089ce2d@intel.com>
Date: Thu, 7 Dec 2023 15:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe/pf: Introduce Local Memory
 Translation Table
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
 <20231128151507.1015-4-michal.wajdeczko@intel.com>
 <yskn43rwevdtoffsdpj54dcqsvltjf4mu4ubog7cv55cytmgvl@okedhpmnqnij>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <yskn43rwevdtoffsdpj54dcqsvltjf4mu4ubog7cv55cytmgvl@okedhpmnqnij>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07.12.2023 01:43, Michał Winiarski wrote:
> On Tue, Nov 28, 2023 at 04:15:05PM +0100, Michal Wajdeczko wrote:
>> The Local Memory Translation Table (LMTT) provides additional
>> abstraction for Virtual Functions (VF) accessing device VRAM.
>>
>> This code is based on prior work of Michal Winiarski.
>>
>> In this patch we focus only on LMTT initialization. Remaining LMTT
>> functions will be used once we add a VF provisioning to the PF.
>>
>> Bspec: 44117, 52404, 59314
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
> 
> One small comment/question below.
> 
>> ---
>>  drivers/gpu/drm/xe/Makefile             |   5 +
>>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  17 +
>>  drivers/gpu/drm/xe/xe_device_types.h    |   8 +
>>  drivers/gpu/drm/xe/xe_gt.c              |  10 +
>>  drivers/gpu/drm/xe/xe_lmtt.c            | 502 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_lmtt.h            |  27 ++
>>  drivers/gpu/drm/xe/xe_lmtt_2l.c         | 150 +++++++
>>  drivers/gpu/drm/xe/xe_lmtt_ml.c         | 161 ++++++++
>>  drivers/gpu/drm/xe/xe_lmtt_types.h      |  63 +++
>>  9 files changed, 943 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_2l.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_ml.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 551adbc22b5a..cf1237a148b1 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -125,6 +125,11 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>  # graphics virtualization (SR-IOV) support
>>  xe-y += xe_sriov.o
>>  
>> +xe-$(CONFIG_PCI_IOV) += \
>> +	xe_lmtt.o \
>> +	xe_lmtt_2l.o \
>> +	xe_lmtt_ml.o
>> +
>>  # i915 Display compat #defines and #includes
>>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>  	-I$(srctree)/$(src)/display/ext \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>> new file mode 100644
>> index 000000000000..58a4e0fad1e1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _REGS_XE_SRIOV_REGS_H_
>> +#define _REGS_XE_SRIOV_REGS_H_
>> +
>> +#include "regs/xe_reg_defs.h"
>> +
>> +#define XE2_LMEM_CFG			XE_REG(0x48b0)
>> +
>> +#define LMEM_CFG			XE_REG(0xcf58)
>> +#define   LMEM_EN			REG_BIT(31)
>> +#define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 2712905c7a91..bded80c50027 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -15,6 +15,7 @@
>>  #include "xe_devcoredump_types.h"
>>  #include "xe_heci_gsc.h"
>>  #include "xe_gt_types.h"
>> +#include "xe_lmtt_types.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_pt_types.h"
>>  #include "xe_pmu.h"
>> @@ -186,6 +187,13 @@ struct xe_tile {
>>  		struct xe_sa_manager *kernel_bb_pool;
>>  	} mem;
>>  
>> +	union {
>> +		struct {
>> +			/** @sriov.pf.lmtt: Local Memory Translation Table. */
>> +			struct xe_lmtt lmtt;
>> +		} pf;
>> +	} sriov;
>> +
>>  	/** @migrate: Migration helper for vram blits and clearing */
>>  	struct xe_migrate *migrate;
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 0dddb751c6a4..2c311b0e49ee 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -34,6 +34,7 @@
>>  #include "xe_hw_fence.h"
>>  #include "xe_hw_engine_class_sysfs.h"
>>  #include "xe_irq.h"
>> +#include "xe_lmtt.h"
>>  #include "xe_lrc.h"
>>  #include "xe_map.h"
>>  #include "xe_migrate.h"
>> @@ -44,6 +45,7 @@
>>  #include "xe_ring_ops.h"
>>  #include "xe_sa.h"
>>  #include "xe_sched_job.h"
>> +#include "xe_sriov.h"
>>  #include "xe_tuning.h"
>>  #include "xe_uc.h"
>>  #include "xe_vm.h"
>> @@ -344,6 +346,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>  		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>>  		if (err)
>>  			goto err_force_wake;
>> +		if (IS_SRIOV_PF(gt_to_xe(gt)))
>> +			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>>  	}
>>  
>>  	err = xe_uc_init(&gt->uc);
>> @@ -451,6 +455,9 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_force_wake;
>>  
>> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>> +		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>> +
>>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>  	XE_WARN_ON(err);
>>  	xe_device_mem_access_put(gt_to_xe(gt));
>> @@ -543,6 +550,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>  	if (err)
>>  		return err;
>>  
>> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>> +		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>> +
>>  	xe_mocs_init(gt);
>>  	err = xe_uc_start(&gt->uc);
>>  	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>> new file mode 100644
>> index 000000000000..d5ada31ae633
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
>> @@ -0,0 +1,502 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/align.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "regs/xe_sriov_regs.h"
>> +
>> +#include "xe_assert.h"
>> +#include "xe_bo.h"
>> +#include "xe_lmtt.h"
>> +#include "xe_map.h"
>> +#include "xe_mmio.h"
>> +#include "xe_res_cursor.h"
>> +#include "xe_sriov.h"
>> +#include "xe_sriov_printk.h"
>> +
>> +/**
>> + * DOC: Local Memory Translation Table
>> + *
>> + * The Local Memory Translation Table (LMTT) provides additional abstraction
>> + * when Virtual Function (VF) is accessing device Local Memory (VRAM).
>> + *
>> + * The Root LMTT Page Directory contains one entry for each VF. Entries are
>> + * indexed by the function number (1-based, index 0 is unused).
>> + *
>> + * See `Two-Level LMTT Structure`_ and `Multi-Level LMTT Structure`_.
>> + */
>> +
>> +#define lmtt_assert(lmtt, condition)	xe_tile_assert(lmtt_to_tile(lmtt), condition)
>> +#define lmtt_debug(lmtt, msg...)	xe_sriov_dbg_verbose(lmtt_to_xe(lmtt), "LMTT: " msg)
>> +
>> +static bool xe_has_multi_level_lmtt(struct xe_device *xe)
>> +{
>> +	return xe->info.platform == XE_PVC;
>> +}
>> +
>> +static struct xe_tile *lmtt_to_tile(struct xe_lmtt *lmtt)
>> +{
>> +	return container_of(lmtt, struct xe_tile, sriov.pf.lmtt);
>> +}
>> +
>> +static struct xe_device *lmtt_to_xe(struct xe_lmtt *lmtt)
>> +{
>> +	return tile_to_xe(lmtt_to_tile(lmtt));
>> +}
>> +
>> +static u64 lmtt_page_size(struct xe_lmtt *lmtt)
>> +{
>> +	return BIT_ULL(lmtt->ops->lmtt_pte_shift(0));
>> +}
>> +
>> +static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level)
>> +{
>> +	unsigned int num_entries = level ? lmtt->ops->lmtt_pte_num(level) : 0;
>> +	struct xe_lmtt_pt *pt;
>> +	struct xe_bo *bo;
>> +	int err;
>> +
>> +	pt = kzalloc(struct_size(pt, entries, num_entries), GFP_KERNEL);
>> +	if (!pt) {
>> +		err = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	bo = xe_bo_create_pin_map(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt), NULL,
>> +				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
>> +					     lmtt->ops->lmtt_pte_num(level)),
>> +				  ttm_bo_type_kernel,
>> +				  XE_BO_CREATE_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
>> +				  XE_BO_CREATE_PINNED_BIT);
> 
> I know that we have WARNs for misaligned objects, but do we actually
> have a guarantee that PTs are contiguous and 64K aligned at this point?

from xe_bo.c comment:

 * For pinned objects in on DGFX, which are also in vram, we expect
 * these to be in contiguous VRAM memory.

and from xe_pci.c:

 .vram_flags = XE_VRAM_FLAGS_NEED64K,

which translates to:

  flags |= XE_BO_INTERNAL_64K;
  alignment = SZ_64K >> PAGE_SHIFT;

we can add few more asserts once suitable helpers will be available

> 
> -Michał
> 
>> +	if (IS_ERR(bo)) {
>> +		err = PTR_ERR(bo);
>> +		goto out_free_pt;
>> +	}
>> +
>> +	lmtt_assert(lmtt, xe_bo_is_vram(bo));
>> +
>> +	pt->level = level;
>> +	pt->bo = bo;
>> +	return pt;
>> +
>> +out_free_pt:
>> +	kfree(pt);
>> +out:
>> +	return ERR_PTR(err);
>> +}
