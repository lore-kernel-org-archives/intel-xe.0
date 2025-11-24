Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D1ACFA466
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 12:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD7E10E27C;
	Mon, 24 Nov 2025 12:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Knyr2SZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6314610E27C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763987402; x=1795523402;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zo5x4IycVyWT1aYYk3REzNUkOUntX7NH2YbSrN5aV4Q=;
 b=Knyr2SZMqSZYmL2hU+Hyp3JIBN5JQS+3CSv/SK+8WmbwG2w3RrHTnDgy
 VzpamVfahLs801vsfre+iAq74w42LlFyTKfGoHVsAqDVLB2jk3yewYnOQ
 dq2BFx1PDAkcsXlPdA0NGVOwAd+jyg/yX3bqs2+iLNtefpHTDIgKdBW4s
 LkRwOR7eccNHPaaK/DGT+aiDC7yBBkouCmcuUmJMKrGlGllSh9G925bNf
 iILWIu6UWBTdcLfCsqyrpfvGmqLPxFjDvVqyhUYztKqb1ubawB5pzD7D3
 NsKMtg9hlzpp9+sqaRb99vVBpUQ14QDejvqF98olZNwxR/EQVlH+4SFDC w==;
X-CSE-ConnectionGUID: fjF9FA/ZT+uJqlR3K8E+hg==
X-CSE-MsgGUID: 9vW43aXcSASGPFb6/xSuRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83373025"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="83373025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 04:30:01 -0800
X-CSE-ConnectionGUID: VMCBVx2MQzKPcZNgmIbYPA==
X-CSE-MsgGUID: 0XJ1bLvJQzWDO4Ns/okR1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="215661580"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.67])
 ([10.245.244.67])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 04:29:59 -0800
Message-ID: <a4270008-da3e-41d8-a7c7-825d1b637617@intel.com>
Date: Mon, 24 Nov 2025 12:29:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
To: Brian Nguyen <brian3.nguyen@intel.com>, intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com,
 shuicheng.lin@intel.com, stuart.summers@intel.com
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-11-brian3.nguyen@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251118090552.246243-11-brian3.nguyen@intel.com>
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

On 18/11/2025 09:05, Brian Nguyen wrote:
> In Xe3p and beyond, there are additional hardware managed L2$ flushing
> for the deemed transient display and transient app buffers. In those
> scenarios, page reclamation is unnecessary resulting in redundant
> cachline flushes, so skip over those corresponding ranges.
> 
> Add chicken bit to determine media engine status to help facilitate
> decision making in L2$ flush skipping.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 11 +++++++
>   drivers/gpu/drm/xe/xe_page_reclaim.c | 43 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_page_reclaim.h |  3 ++
>   drivers/gpu/drm/xe/xe_pat.c          |  9 +-----
>   drivers/gpu/drm/xe/xe_pt.c           |  3 +-
>   5 files changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 917a088c28f2..a18a2d59153e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -99,6 +99,14 @@
>   #define VE1_AUX_INV				XE_REG(0x42b8)
>   #define   AUX_INV				REG_BIT(0)
>   
> +#define _PAT_PTA				0x4820
> +#define   XE2_NO_PROMOTE			REG_BIT(10)
> +#define   XE2_COMP_EN				REG_BIT(9)
> +#define   XE2_L3_CLOS				REG_GENMASK(7, 6)
> +#define   XE2_L3_POLICY				REG_GENMASK(5, 4)
> +#define   XE2_L4_POLICY				REG_GENMASK(3, 2)
> +#define   XE2_COH_MODE				REG_GENMASK(1, 0)
> +
>   #define XE2_LMEM_CFG				XE_REG(0x48b0)
>   
>   #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> @@ -429,6 +437,9 @@
>   
>   #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>   
> +#define LTISEQCHK				XE_REG(0xb49c)
> +#define   XE3P_MEDIA_IS_ON			REG_BIT(2)
> +
>   #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>   
>   #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 801a7f1731c0..2f0e7547732c 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -13,8 +13,51 @@
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_macros.h"
> +#include "xe_mmio.h"
> +#include "xe_pat.h"
>   #include "xe_sa.h"
>   #include "xe_tlb_inval_types.h"
> +#include "xe_vm.h"
> +
> +/**
> + * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a VMA
> + * @tile: Tile owning the VMA
> + * @vma: VMA under consideration
> + *
> + * Xe3p and beyond can handle PPC flushing for specific PAT encodings.
> + * Skip PPC flushing in both scenarios below.
> + * - pat_index is transient display (1)
> + * - pat_index is transient app (2) and Media is off
> + *
> + * Return: true when page reclamation is unnecessary, false otherwise.
> + */
> +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma)
> +{
> +	struct xe_device *xe = xe_vma_vm(vma)->xe;
> +	struct xe_mmio *mmio = &tile->primary_gt->mmio;
> +	u16 pat_index = vma->attr.pat_index;
> +	u32 pat_value;
> +	u8 l3_policy;
> +	bool is_media_awake;
> +
> +	/* Ensure called only with Xe3p due to associated PAT index */
> +	xe_assert(tile->xe, GRAPHICS_VER(tile->xe) >= 35);
> +	xe_assert(tile->xe, pat_index < xe->pat.n_entries);
> +
> +	pat_value = xe->pat.table[pat_index].value;
> +	l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat_value);

I think if we need something like this, it might make sense to create a 
helper in xe_pat and use that here? Not sure if want stuff outside of 
xe_pat looking at such internals.

> +	is_media_awake = xe_mmio_read32(mmio, LTISEQCHK) & XE3P_MEDIA_IS_ON;

Do we need this? Whether media is off/on should be an internal detail 
for fw/hw, not KMD I think, and will influence whether fw/hw will only 
flush cahelines shared with CPU or whether to flush entire cache at 
various places, like end of submission. Also this seems racy, since 
Media can turn on/off after checking this?

> +
> +	/**
> +	 *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"),

Why do we skip Transient Display? Can you share some more details or 
maybe add a comment here? AFAIK transient display just allows using the 
GPU caches for display surfaces, with the idea of then doing a targeted 
transient flush only when doing the actual scanout. On newer hw this 
flush is done by hw, I think, instead of KMD, but I assume it is only 
done when doing the scanout step? Or is that now handled differently?

Concern here is that user does render copy to display surface with 
transient display PAT index but then never does an actual scanout, and 
then just deletes the memory. Where is the flush in that flow?

> +	 *                  2=XA ("WB - Transient App" for Xe3p), 3=UC
> +	 * From Xe3p, transient display flush is taken care by HW, l3_policy = 1
> +	 *
> +	 * Also with Xe3p, pat_index=18/19 corresponds to transient app flushing
> +	 * which is handled by HW when media is off.
> +	 */
> +	return (l3_policy == 1 || (!is_media_awake && (pat_index == 18 || pat_index == 19)));
> +}
>   
>   /**
>    * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index f82b4d0865e0..dafd4edd6f61 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -17,6 +17,8 @@
>   
>   struct xe_tlb_inval;
>   struct xe_tlb_inval_fence;
> +struct xe_tile;
> +struct xe_vma;
>   
>   struct xe_guc_page_reclaim_entry {
>   	u32 valid:1;
> @@ -35,6 +37,7 @@ struct xe_page_reclaim_list {
>   #define XE_PAGE_RECLAIM_INVALID_LIST	-1
>   };
>   
> +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
>   int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval, struct xe_tlb_inval_fence *fence);
>   void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
>   int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 1b4d5d3def0f..4783acd1f027 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -9,6 +9,7 @@
>   
>   #include <generated/xe_wa_oob.h>
>   
> +#include "regs/xe_gt_regs.h"
>   #include "regs/xe_reg_defs.h"
>   #include "xe_assert.h"
>   #include "xe_device.h"
> @@ -23,14 +24,6 @@
>   #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
>   								   0x4800, 0x4804, \
>   								   0x4848, 0x484c)
> -#define _PAT_PTA				0x4820
> -
> -#define XE2_NO_PROMOTE				REG_BIT(10)
> -#define XE2_COMP_EN				REG_BIT(9)
> -#define XE2_L3_CLOS				REG_GENMASK(7, 6)
> -#define XE2_L3_POLICY				REG_GENMASK(5, 4)
> -#define XE2_L4_POLICY				REG_GENMASK(3, 2)
> -#define XE2_COH_MODE				REG_GENMASK(1, 0)
>   
>   #define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
>   #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 03723c8d2601..8ccab39c2599 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2008,7 +2008,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   		if (err < 0)
>   			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
>   	}
> -	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl : NULL;
> +	pt_op->prl = (pt_update_ops->prl.entries &&
> +		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl : NULL;
>   
>   	err = vma_reserve_fences(tile_to_xe(tile), vma);
>   	if (err)

