Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD47CA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD93110E810;
	Fri, 30 Aug 2024 06:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQO/ZICw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CF910E810
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724999986; x=1756535986;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/jG0Dh7cFtz1yFcXAA3d4YVm9+4Jj2oAGsY+r8Lq2k4=;
 b=kQO/ZICwggqiLNvZCU6gwaSS/7Z48VnhInO6Lf8nGRVKACHNNTCAEt7R
 v5Nzj2fZcy07DHv4ZVfSDOi0MIFLZpO8v/akkZ0hF3cPY+0QvSCYnlLtw
 6mxHG4yJGqgb/qpFGl6H4FybA4XOr4TD7UHldeHhgzbqskap+j2YhO1HC
 cNSpzOCwUURunX/qd8QBDXXlYNWYSjSll050zpsd/EHpf1MW+V4+EMMi6
 y6+K5rbgF5Nc69VW3301UkSL3I87Boe2iRy+1EErOe30DTD+y7G/74WW4
 oB5e7V5eJ358LdThdVYQBtL0a1keIX1ktFMNUtiIHKkFzwJkj1g1FK+nb Q==;
X-CSE-ConnectionGUID: lI2YXF3XTqyqa+gpeTYnmA==
X-CSE-MsgGUID: 7AViSXbyS/KNicTwnqJPTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23586545"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23586545"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:39:45 -0700
X-CSE-ConnectionGUID: ifsLMN+aScuNEtw886qRUw==
X-CSE-MsgGUID: Jme7ZqMOTfeEGH0oDWVhQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68207641"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:39:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan-Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH] drm/xe: Apply workaround 14016747170
In-Reply-To: <20240829203143.2021381-1-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240829203143.2021381-1-jonathan.cavitt@intel.com>
Date: Fri, 30 Aug 2024 09:39:38 +0300
Message-ID: <87zfouv7it.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 29 Aug 2024, Jonathan-Cavitt <jonathan.cavitt@intel.com> wrote:
> Some revisions of MTL do not properly report the correct value from the
> FUSE3_MBC_MEDIA register.  This results in the wrong value being
> reported for the l3 mask.
>
> Use the recommended replacement register in this case.
>
> Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 9 +++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
>  4 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e119..e0d735a5a7fa1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -522,6 +522,9 @@
>  #define   FORCEWAKE_MT(bit)			BIT(bit)
>  #define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
>  
> +#define MTL_GT_ACTIVITY_FACTOR			XE_REG(0x138010)
> +#define   MTL_GT_L3_EXC_MASK			REG_GENMASK(5, 3)
> +
>  #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>  #define MTL_MEDIA_MC6				XE_REG(0x138048)
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7d7bd0be6233e..211be9dee2e4a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -15,6 +15,9 @@
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  
> +#include <generated/xe_wa_oob.h>
> +#include "xe_wa.h"

Please keep includes sorted, and <generated/...> separate.


> +
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support
>   *
> @@ -245,6 +248,11 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
>  					      xe_mmio_read32(gt, XEHP_FUSE4));
>  
> +		/* Wa_14016747170 */
> +		if (XE_WA(gt, 14016747170))
> +			bank_mask = REG_FIELD_GET(MTL_GT_L3_EXC_MASK,
> +						  xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR));
> +
>  		/*
>  		 * Group selects mslice, instance selects bank within mslice.
>  		 * Bank 0 is always valid _except_ when the bank mask is 010b.
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 0662f71c6ede7..3a8792845bd76 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -13,6 +13,9 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> +#include <generated/xe_wa_oob.h>
> +#include "xe_wa.h"
> +
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> @@ -144,6 +147,12 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
>  		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
>  
> +		/* Wa_14016747170 */
> +		if (XE_WA(gt, 14016747170)) {
> +			fuse4 = xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR);
> +			bank_val = REG_FIELD_GET(MTL_GT_L3_EXC_MASK, fuse4);
> +		}
> +
>  		bitmap_set_value8(per_mask_bit, 0x3, 0);
>  		gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 2, bank_val);
>  		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca50601466..5bac4123b5db1 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -37,3 +37,4 @@
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 2004)
> +14016747170	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)

-- 
Jani Nikula, Intel
