Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70612C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8710E1A3;
	Fri, 24 Mar 2023 21:40:46 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AFE10E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679694045; x=1711230045;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SaJtNPY/JqGN3zXC695EyXZl4dU7rpN+v//H2+95+5I=;
 b=b04qZFyxg0OQJlXuq7qmI4gIhcqdBRsLIlEuf3kEMzHION8SdMg1VN0s
 kVo0aeT58Wy8Ne2d6T/F3znAo+6ukUUCLOQ7/XLNR1i98I7iv099aT6+q
 RHBzVYiThmIbakYUPkqeTKwTdNwpRGyQCySzEoL1Of+RfxN5XJtlS9fzH
 ZD7ULDTHSO1R3r3htwI6NgRBl9IrRyvYfiJSNBAiRHM2Rymxl16XflrSy
 dtMVlRhMXh2eKQWJkzT4bJaD6u10xYK/rSI1BTLbGJDx/IE5CJR3bNyrx
 NBWhOi8gMzxCUzY5EaMWLKzgKZTTRAVR2+EDEMiGDYnhxKt9Yjs2Ad41F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339914507"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="339914507"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="747308568"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="747308568"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.175])
 ([10.252.38.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:40:43 -0700
Message-ID: <bde4fcea-6d3c-710e-0f64-9b8619496a8d@linux.intel.com>
Date: Fri, 24 Mar 2023 22:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
 <20230324210415.2434992-2-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230324210415.2434992-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe/pat: Move PAT setup to a
 dedicated file
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


On 3/24/2023 10:04 PM, Matt Roper wrote:
> PAT handling is growing in complexity and will continue to do so in
> upcoming platforms.  Separate it out to a dedicated file to keep things
> tidy.
>
> The code is moved as-is here (aside from a few unused #define's that are
> just dropped); further changes will come in future patches.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 -
>   drivers/gpu/drm/xe/xe_gt.c           | 82 +---------------------------
>   drivers/gpu/drm/xe/xe_pat.c          | 79 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pat.h          | 13 +++++
>   5 files changed, 96 insertions(+), 80 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pat.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pat.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5799589d2634..78d6a1791198 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -67,6 +67,7 @@ xe-y += xe_bb.o \
>   	xe_mmio.o \
>   	xe_mocs.o \
>   	xe_module.o \
> +	xe_pat.o \
>   	xe_pci.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4ab7860db9f2..f45251df5715 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -69,7 +69,6 @@
>   #define GEN12_VE1_AUX_NV			_MMIO(0x42b8)
>   #define   AUX_INV				REG_BIT(0)
>   
> -#define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
>   #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>   #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 07464ba42746..245117e67e9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -29,6 +29,7 @@
>   #include "xe_map.h"
>   #include "xe_migrate.h"
>   #include "xe_mmio.h"
> +#include "xe_pat.h"
>   #include "xe_mocs.h"
>   #include "xe_reg_sr.h"
>   #include "xe_ring_ops.h"
> @@ -92,83 +93,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>   	return 0;
>   }
>   
> -/* FIXME: These should be in a common file */
> -#define CHV_PPAT_SNOOP			REG_BIT(6)
> -#define GEN8_PPAT_AGE(x)		((x)<<4)
> -#define GEN8_PPAT_LLCeLLC		(3<<2)
> -#define GEN8_PPAT_LLCELLC		(2<<2)
> -#define GEN8_PPAT_LLC			(1<<2)
> -#define GEN8_PPAT_WB			(3<<0)
> -#define GEN8_PPAT_WT			(2<<0)
> -#define GEN8_PPAT_WC			(1<<0)
> -#define GEN8_PPAT_UC			(0<<0)
> -#define GEN8_PPAT_ELLC_OVERRIDE		(0<<2)
> -#define GEN8_PPAT(i, x)			((u64)(x) << ((i) * 8))
> -#define GEN12_PPAT_CLOS(x)              ((x)<<2)
> -
> -static void tgl_setup_private_ppat(struct xe_gt *gt)
> -{
> -	/* TGL doesn't support LLC or AGE settings */
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
> -}
> -
> -static void pvc_setup_private_ppat(struct xe_gt *gt)
> -{
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> -			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
> -			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
> -			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
> -			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
> -}
> -
> -#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
> -#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
> -#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> -#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> -#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> -#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> -#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> -#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> -
> -static void mtl_setup_private_ppat(struct xe_gt *gt)
> -{
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
> -			MTL_PPAT_1_WT | MTL_2_COH_1W);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
> -			MTL_PPAT_3_UC | MTL_2_COH_1W);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
> -			MTL_PPAT_0_WB | MTL_2_COH_1W);
> -	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> -			MTL_PPAT_0_WB | MTL_3_COH_2W);
> -}
> -
> -static void setup_private_ppat(struct xe_gt *gt)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (xe->info.platform == XE_METEORLAKE)
> -		mtl_setup_private_ppat(gt);
> -	else if (xe->info.platform == XE_PVC)
> -		pvc_setup_private_ppat(gt);
> -	else
> -		tgl_setup_private_ppat(gt);
> -}
> -
>   static int gt_ttm_mgr_init(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -447,7 +371,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	if (err)
>   		goto err_hw_fence_irq;
>   
> -	setup_private_ppat(gt);
> +	xe_pat_init(gt);
>   
>   	if (!xe_gt_is_media_type(gt)) {
>   		err = xe_ggtt_init(gt, gt->mem.ggtt);
> @@ -633,7 +557,7 @@ static int do_gt_restart(struct xe_gt *gt)
>   	enum xe_hw_engine_id id;
>   	int err;
>   
> -	setup_private_ppat(gt);
> +	xe_pat_init(gt);
>   
>   	xe_gt_mcr_set_implicit_defaults(gt);
>   	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> new file mode 100644
> index 000000000000..bd64de956772
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "regs/xe_reg_defs.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +
> +#define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> +
> +#define GEN8_PPAT_WB			(3<<0)
> +#define GEN8_PPAT_WT			(2<<0)
> +#define GEN8_PPAT_WC			(1<<0)
> +#define GEN8_PPAT_UC			(0<<0)
> +#define GEN12_PPAT_CLOS(x)              ((x)<<2)
> +
> +static void tgl_setup_private_ppat(struct xe_gt *gt)
> +{
> +	/* TGL doesn't support LLC or AGE settings */
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
> +}
> +
> +static void pvc_setup_private_ppat(struct xe_gt *gt)
> +{
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> +			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
> +			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
> +			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
> +			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
> +}
> +
> +#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
> +#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
> +#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> +#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> +#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> +#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> +#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> +#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> +
> +static void mtl_setup_private_ppat(struct xe_gt *gt)
> +{
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
> +			MTL_PPAT_1_WT | MTL_2_COH_1W);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
> +			MTL_PPAT_3_UC | MTL_2_COH_1W);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
> +			MTL_PPAT_0_WB | MTL_2_COH_1W);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> +			MTL_PPAT_0_WB | MTL_3_COH_2W);
> +}
> +
> +void xe_pat_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe->info.platform == XE_METEORLAKE)
> +		mtl_setup_private_ppat(gt);
> +	else if (xe->info.platform == XE_PVC)
> +		pvc_setup_private_ppat(gt);
> +	else
> +		tgl_setup_private_ppat(gt);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> new file mode 100644
> index 000000000000..659de4008131
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PAT_H_
> +#define _XE_PAT_H_
> +
> +struct xe_gt;
> +
> +void xe_pat_init(struct xe_gt *gt);
> +
> +#endif
