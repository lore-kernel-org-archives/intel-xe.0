Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9649BD185EC
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 12:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5882510E6FB;
	Thu,  8 Jan 2026 12:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2QG+qfg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8B010E6FB
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767876184; x=1799412184;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wAIpX8/hg8J/A6nT4PCesrvFlDw36VLoxoaNCNXdtqs=;
 b=D2QG+qfglUCbH+0ineI/v8W54vP3w0DyIhp9hZJ7gwQC53jExJdjU6Bz
 3O3R0xfBVSkrPwdkgLGUrG11Fq5G/wcAhiT774iXgs8nwI9UaeWEAMSju
 IJwNDQW2ognOFkqrcOEiuYicir9E1QlgauwAnf65T3HajxaUOAZoJelGv
 hVQAIjt91h1DTXyyCC9M+U2tHSi0z+SeRgyDmiLoeowXiU5DSNC047Zu4
 U2a2JXcibqkGe0od8X/ixvxZwB47TAK9OX+E1FC7V4N6J25vifA3rDheK
 zSpN3Fz4Evx4bIoj2q1dZenoRyaYc+Hxoe5qqXAaOVxdpb69/nFJd8+Ik A==;
X-CSE-ConnectionGUID: AtfvDzjuSR6Kr4TC9YtpcQ==
X-CSE-MsgGUID: 3ukEFt6bQTybQReAKs3wUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68985903"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="68985903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:43:04 -0800
X-CSE-ConnectionGUID: AOgSH9xMTJyrKnulOBPxhg==
X-CSE-MsgGUID: hICrw7FVRwWWEYN1NVWPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208261391"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.1])
 ([10.245.244.1])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:43:02 -0800
Message-ID: <37ad5960-4b56-4af0-ba81-faf03b2f54e4@intel.com>
Date: Thu, 8 Jan 2026 12:43:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Allow compressible surfaces to be 1-way
 coherent
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20260108014257.398697-1-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260108014257.398697-1-x.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/01/2026 01:42, Xin Wang wrote:
> Previously, compressible surfaces were required to be non-coherent (allocated
> as WC) because compression and coherency were mutually exclusive. Starting
> with Xe3, hardware supports combining compression with 1-way coherency,
> allowing compressible surfaces to be allocated as WB memory. This provides
> applications with more efficient memory allocation by avoiding WC allocation
> overhead that can cause system stuttering and memory management challenges.
> 
> The implementation adds support for compressed+coherent PAT entry for the
> xe3_lpg devices and updates the driver logic to handle the new compression
> capabilities.
> 
> v2: (Matthew Auld)
>   - Improved error handling with XE_IOCTL_DBG()
>   - Enhanced documentation and comments
>   - Fixed xe_bo_needs_ccs_pages() outdated compression assumptions
> 
> v3:
>   - Improve WB compression support detection by checking PAT table instead
> of version check
> 
> v4:
>   - Add XE_CACHE_WB_COMPRESSION, which simplifies the logic.
> 
> Bspec: 71582, 59361, 59399
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++
>   drivers/gpu/drm/xe/xe_bo.c           | 17 ++++-----
>   drivers/gpu/drm/xe/xe_gt.c           | 32 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_pat.c          | 52 ++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_pat.h          |  2 ++
>   drivers/gpu/drm/xe/xe_pt_types.h     |  1 +
>   drivers/gpu/drm/xe/xe_vm.c           | 13 +++++++
>   7 files changed, 109 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 93643da57428..24fc64fc832e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -89,6 +89,7 @@
>   #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
>   
>   #define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
> +#define   EN_CMP_1WCOH				REG_BIT(15)
>   #define   CG_DIS_CNTLBUS			REG_BIT(6)
>   
>   #define CCS_AUX_INV				XE_REG(0x4208)
> @@ -101,6 +102,11 @@
>   
>   #define XE2_LMEM_CFG				XE_REG(0x48b0)
>   
> +#define XE2_GAMWALK_CTRL			0x47e4
> +#define XE2_GAMWALK_CTRL_MEDIA			XE_REG(XE2_GAMWALK_CTRL + MEDIA_GT_GSI_OFFSET)
> +#define XE2_GAMWALK_CTRL_3D			XE_REG_MCR(XE2_GAMWALK_CTRL)
> +#define   EN_CMP_1WCOH_GW			REG_BIT(14)
> +
>   #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>   #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8b6474cd3eaf..637adefd020d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -29,6 +29,7 @@
>   #include "xe_gt.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
> +#include "xe_pat.h"
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_pxp.h"
> @@ -3517,16 +3518,16 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>   	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
>   		return false;
>   
> +	/* Check if userspace explicitly requested no compression */
> +	if (bo->flags & XE_BO_FLAG_NO_COMPRESSION)
> +		return false;
> +
>   	/*
> -	 * Compression implies coh_none, therefore we know for sure that WB
> -	 * memory can't currently use compression, which is likely one of the
> -	 * common cases.
> -	 * Additionally, userspace may explicitly request no compression via the
> -	 * DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag, which should also disable
> -	 * CCS usage.
> +	 * For WB (Write-Back) CPU caching mode, check if the device
> +	 * supports WB compression with coherency.
>   	 */
> -	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB ||
> -	    bo->flags & XE_BO_FLAG_NO_COMPRESSION)
> +	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB &&
> +	    xe->pat.idx[XE_CACHE_WB_COMPRESSION] == XE_PAT_INVALID_IDX)
>   		return false;
>   
>   	return true;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 313ce83ab0e5..04dbf995a18b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -140,6 +140,36 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>   }
>   
> +static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
> +	u32 reg;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref)
> +			return;
> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
> +		reg |= EN_CMP_1WCOH;
> +		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> +
> +		if (xe_gt_is_media_type(gt)) {
> +			xe_mmio_rmw32(&gt->mmio, XE2_GAMWALK_CTRL_MEDIA, 0, EN_CMP_1WCOH_GW);
> +		} else {
> +			reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMWALK_CTRL_3D);
> +			reg |= EN_CMP_1WCOH_GW;
> +			xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
> +		}
> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	}
> +}
> +
>   static void gt_reset_worker(struct work_struct *w);
>   
>   static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> @@ -466,6 +496,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>   	xe_gt_topology_init(gt);
>   	xe_gt_mcr_init(gt);
>   	xe_gt_enable_host_l2_vram(gt);
> +	xe_gt_enable_comp_1wcoh(gt);
>   
>   	if (xe_gt_is_main_type(gt)) {
>   		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> @@ -745,6 +776,7 @@ static int do_gt_restart(struct xe_gt *gt)
>   	xe_pat_init(gt);
>   
>   	xe_gt_enable_host_l2_vram(gt);
> +	xe_gt_enable_comp_1wcoh(gt);
>   
>   	xe_gt_mcr_set_implicit_defaults(gt);
>   	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 2c3375e0250b..14d0dce5190a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -132,9 +132,10 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>    * in the table.
>    *
>    * Note: There is an implicit assumption in the driver that compression and
> - * coh_1way+ are mutually exclusive. If this is ever not true then userptr
> - * and imported dma-buf from external device will have uncleared ccs state. See
> - * also xe_bo_needs_ccs_pages().
> + * coh_1way+ are mutually exclusive for platforms prior to Xe3. Starting
> + * with Xe3, compression can be combined with coherency. If using compression
> + * with coherency, userptr and imported dma-buf from external device will
> + * have uncleared ccs state. See also xe_bo_needs_ccs_pages().
>    */
>   #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
>   	{ \
> @@ -144,8 +145,7 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>   			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
>   			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
>   			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
> -		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
> -			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
> +		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
>   		.valid = 1 \
>   	}
>   
> @@ -181,6 +181,38 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>   	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>   };
>   
> +static const struct xe_pat_table_entry xe3_lpg_pat_table[] = {
> +	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
> +	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
> +	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
> +	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
> +	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
> +	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
> +	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
> +	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
> +	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
> +	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
> +	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
> +	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
> +	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
> +	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
> +	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
> +	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
> +	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),
> +	/* 17..19 are reserved; leave set to all 0's */
> +	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
> +	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
> +	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
> +	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
> +	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
> +	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
> +	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
> +	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
> +	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
> +	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
> +	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
> +	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
> +};
>   /* Special PAT values programmed outside the main table */
>   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
> @@ -490,6 +522,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>   
>   void xe_pat_init_early(struct xe_device *xe)
>   {
> +	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;

As a follow up series we could maybe also repeat this for 
XE_CACHE_NONE_COMPRESSION? And maybe also add some asserts in places 
like pte_encode_pat_index() to check that we never see such an index, or 
perhaps add a helper accessor function for turning cache mode into 
pat_index which can check there?

>   	if (GRAPHICS_VERx100(xe) == 3511) {
>   		xe->pat.ops = &xe3p_xpc_pat_ops;
>   		xe->pat.table = xe3p_xpc_pat_table;
> @@ -501,7 +534,12 @@ void xe_pat_init_early(struct xe_device *xe)
>   		xe->pat.idx[XE_CACHE_WB] = 2;
>   	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>   		xe->pat.ops = &xe2_pat_ops;
> -		xe->pat.table = xe2_pat_table;
> +		if (GRAPHICS_VER(xe) == 30) {
> +			xe->pat.table = xe3_lpg_pat_table;
> +			xe->pat.idx[XE_CACHE_WB_COMPRESSION] = 16;
> +		} else {
> +			xe->pat.table = xe2_pat_table;
> +		}
>   		xe->pat.pat_ats = &xe2_pat_ats;
>   		if (IS_DGFX(xe))
>   			xe->pat.pat_pta = &xe2_pat_pta;
> @@ -658,6 +696,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>   	if (GRAPHICS_VER(xe) >= 20) {
>   		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
>   			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +		drm_printf(p, "IDX[XE_CACHE_WB_COMPRESSION] = %d\n",
> +			   xe->pat.idx[XE_CACHE_WB_COMPRESSION]);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index d5dadfb7f924..1b2c7d3c7c16 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -12,6 +12,8 @@ struct drm_printer;
>   struct xe_device;
>   struct xe_gt;
>   
> +#define XE_PAT_INVALID_IDX	U32_MAX

Would U16_MAX be better match here? I believe all the lower level places 
use u16 for the index. Perhaps that could be cleaned up also at some 
point so we use u16 everywhere.

Otherwise I think lgtm.

> +
>   /**
>    * struct xe_pat_table_entry - The pat_index encoding and other meta information.
>    */
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 88fabf8e2655..84b51d3762a4 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -20,6 +20,7 @@ enum xe_cache_level {
>   	XE_CACHE_WT,
>   	XE_CACHE_WB,
>   	XE_CACHE_NONE_COMPRESSION, /*UC + COH_NONE + COMPRESSION */
> +	XE_CACHE_WB_COMPRESSION,
>   	__XE_CACHE_LEVEL_COUNT,
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a07d8b53de66..481ee7763b09 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3405,6 +3405,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   		u16 pat_index = (*bind_ops)[i].pat_index;
>   		u16 coh_mode;
> +		bool comp_en;
>   
>   		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
>   				 (!xe_vm_in_fault_mode(vm) ||
> @@ -3421,6 +3422,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
>   		(*bind_ops)[i].pat_index = pat_index;
>   		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +		comp_en = xe_pat_index_get_comp_en(xe, pat_index);
>   		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
>   			err = -EINVAL;
>   			goto free_bind_ops;
> @@ -3451,6 +3453,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +		    XE_IOCTL_DBG(xe, comp_en &&
> +				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
>   				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
>   		    XE_IOCTL_DBG(xe, obj &&
> @@ -3529,6 +3533,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   					u16 pat_index, u32 op, u32 bind_flags)
>   {
>   	u16 coh_mode;
> +	bool comp_en;
>   
>   	if (XE_IOCTL_DBG(xe, (bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
>   			 xe_pat_index_get_comp_en(xe, pat_index)))
> @@ -3574,6 +3579,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * Ensures that imported buffer objects (dma-bufs) are not mapped
> +	 * with a PAT index that enables compression.
> +	 */
> +	comp_en = xe_pat_index_get_comp_en(xe, pat_index);
> +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
> +		return -EINVAL;
> +
>   	/* If a BO is protected it can only be mapped if the key is still valid */
>   	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
>   	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)

