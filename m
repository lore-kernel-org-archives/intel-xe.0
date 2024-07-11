Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C924C3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309DC10E095;
	Thu, 11 Jul 2024 19:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+WWVzoG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93C610EB74
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720726898; x=1752262898;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CEXtRzsOBsnMgwxtIvFQZsA2OBPOIJ2uEKwFB/kAPTE=;
 b=T+WWVzoG9cAajeeTnmL07TAsf7i+wDqc/bC7it1H6gkkqg56UG/7ORhV
 zyIAltSP0vT0a4ybuBU7lWOodbPYHE2zmH5cdjQUqniZoF3Nagvck77U+
 iDCG0C6dHygzMo0WCwqV00SNayS63A96RU8tH4zeS+Nm9X6alCU5mrvim
 Of1uhAPiOYObRp5AomsfTYjAm1XfncqeUBJSPuNeqQR0qKJL3pRHSJMYa
 D10xgTCOf3nXQ9nfKfH6cFR4VT0mUGyi3OSg9L/Cmpm6Hd8MEaCcDYH1I
 Ty7KkJwSVDoVwoLXcRe5eRQCrD4EXgVYCI++5E85Noz/Jf27/cTlCPSox g==;
X-CSE-ConnectionGUID: RltZgpjXSHygVGmwP7jNcA==
X-CSE-MsgGUID: Bm9pY2sDTxi+4+f0vygyyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18280166"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18280166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:41:38 -0700
X-CSE-ConnectionGUID: p2bXdAtuT4q3dAIHGERoYQ==
X-CSE-MsgGUID: bpDq9IqNTwG+7NLmOomCcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="49442798"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 11 Jul 2024 12:41:36 -0700
Received: from [10.246.49.75] (mwajdecz-MOBL.ger.corp.intel.com [10.246.49.75])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DA68528792;
 Thu, 11 Jul 2024 20:41:33 +0100 (IST)
Message-ID: <9c3b2995-350e-485f-a988-2bd1c67a112d@intel.com>
Date: Thu, 11 Jul 2024 21:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/xe: Introduce GGTT documentation
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240711171155.173717-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 11.07.2024 19:11, Rodrigo Vivi wrote:
> Document xe_ggtt and ensure it is part of the built kernel docs.
> 
> v2: - Accepted all Michal's suggestions
>     - Rebased on top of new set_pte per platform/wa function pointer
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/xe/xe_mm.rst     |  15 ++++
>  drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_ggtt_types.h |  32 +++++--
>  3 files changed, 148 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
> index 6c8fd8b4a466..95864a4502dd 100644
> --- a/Documentation/gpu/xe/xe_mm.rst
> +++ b/Documentation/gpu/xe/xe_mm.rst
> @@ -7,6 +7,21 @@ Memory Management
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
>     :doc: Buffer Objects (BO)
>  
> +GGTT
> +====
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
> +   :doc: Global Graphics Translation Table (GGTT)
> +
> +GGTT Internal API
> +-----------------
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
> +   :internal:
> +
>  Pagetable building
>  ==================
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index add14f3dea1f..709ef48f2fdb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -30,6 +30,39 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +/**
> + * DOC: Global Graphics Translation Table (GGTT)
> + *
> + * Xe GGTT implements the support for a Global Virtual Address space that is used
> + * for resources that are accessible to privileged (i.e. kernel-mode) processes,
> + * and not tied to a specific user-level process. For example, the Graphics
> + * micro-Controller (GuC) and Display Engine (if present) utilize this Global
> + * address space.
> + *
> + * The Global GTT (GGTT) translates from the Global virtual address to a physical
> + * address that can be accessed by HW. The GGTT is a flat, single-level table.
> + *
> + * Xe implements a simplified version of the GGTT specifically managing only a
> + * certain range of it that goes from the WOPCM (Write-Once Power Control Module)

this is "Write Once Protected Content Memory"

and if we ever include xe_wopcm.c to the doc then we can link with
"Write Once Protected Content Memory (WOPCM) Layout"

> + * to a predefined GUC_GGTT_TOP. This approach avoids complications related to
> + * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
> + * is limited on both ends of the GGTT, because the GuC shim HW redirects
> + * accesses to those addresses to other HW areas instead of going through the
> + * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
> + * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
> + * simple, instead of checking each object to see if they are accessed by GuC or
> + * not, we just exclude those areas from the allocator. Additionally, to simplify
> + * the driver load, we use the maximum WOPCM size in this logic instead of the
> + * programmed one, so we don't need to wait until the actual size to be
> + * programmed is determined (which requires FW fetch) before initializing the
> + * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
> + * depending on the platform) but we can live with this. Another benifit of this

typo: benefit

> + * is the GuC bootrom can't access anything below the WOPCM max size so anything
> + * the bootom needs to access (e.g. a RSA key) needs to be placed in the GGTT

typo: bootrom

> + * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
> + * give us the correct placement for free.
> + */
> +
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  				   u16 pat_index)
>  {
> @@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
>  };
>  
> -/*
> - * Early GGTT initialization, which allows to create new mappings usable by the
> - * GuC.
> - * Mappings are not usable by the HW engines, as it doesn't have scratch /
> +/**
> + * xe_ggtt_init_early - Early GGTT initialization
> + * @ggtt: the &xe_ggtt to be initialized
> + *
> + * It allows to create new mappings usable by the GuC.
> + * Mappings are not usable by the HW engines, as it doesn't have scratch nor
>   * initial clear done to it yet. That will happen in the regular, non-early
> - * GGTT init.
> + * GGTT initialization.
> + *
> + * Return: 0 on success or a negative error code on failure.
>   */
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
> @@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>  		ggtt->flags |= XE_GGTT_FLAGS_64K;
>  
> -	/*
> -	 * 8B per entry, each points to a 4KB page.
> -	 *
> -	 * The GuC address space is limited on both ends of the GGTT, because
> -	 * the GuC shim HW redirects accesses to those addresses to other HW
> -	 * areas instead of going through the GGTT. On the bottom end, the GuC
> -	 * can't access offsets below the WOPCM size, while on the top side the
> -	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
> -	 * checking each object to see if they are accessed by GuC or not, we
> -	 * just exclude those areas from the allocator. Additionally, to
> -	 * simplify the driver load, we use the maximum WOPCM size in this logic
> -	 * instead of the programmed one, so we don't need to wait until the
> -	 * actual size to be programmed is determined (which requires FW fetch)
> -	 * before initializing the GGTT. These simplifications might waste space
> -	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
> -	 * live with this.
> -	 *
> -	 * Another benifit of this is the GuC bootrom can't access anything
> -	 * below the WOPCM max size so anything the bootom needs to access (e.g.
> -	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
> -	 * Starting the GGTT allocations above the WOPCM max give us the correct
> -	 * placement for free.
> -	 */
>  	if (ggtt->size > GUC_GGTT_TOP)
>  		ggtt->size = GUC_GGTT_TOP;
>  
> @@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> +/**
> + * xe_ggtt_init - Regular non-early GGTT initialization
> + * @ggtt: the &xe_ggtt to be initialized
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_ggtt_init(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> @@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> +/**
> + * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
> + * @ggtt: the &xe_ggtt where node will be inserted
> + * @node: the &drm_mm_node to be inserted
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + * @mm_flags: flags to control the node behavior
> + *
> + * To be used in cases where ggtt->lock is already taken.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  				       u32 size, u32 align, u32 mm_flags)
>  {
> @@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
>  					  mm_flags);
>  }
>  
> +/**
> + * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
> + * @ggtt: the &xe_ggtt where node will be inserted
> + * @node: the &drm_mm_node to be inserted
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  				u32 size, u32 align)
>  {
> @@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  	return ret;
>  }
>  
> +/**
> + * xe_ggtt_map_bo - Map the BO into GGTT
> + * @ggtt: the &xe_ggtt where node will be mapped
> + * @bo: the &xe_bo to be mapped
> + */
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> @@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	return err;
>  }
>  
> +/**
> + * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
> + * @ggtt: the &xe_ggtt where bo will be inserted
> + * @bo: the &xe_bo to be inserted
> + * @start: address where it will be inserted
> + * @end: end of the range where it will be inserted
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  			 u64 start, u64 end)
>  {
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
>  }
>  
> +/**
> + * xe_ggtt_insert_bo - Insert BO into GGTT
> + * @ggtt: the &xe_ggtt where bo will be inserted
> + * @bo: the &xe_bo to be inserted
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> +/**
> + * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
> + * @ggtt: the &xe_ggtt where node will be removed
> + * @node: the &drm_mm_node to be removed
> + * @invalidate: if node needs invalidation upon removal
> + */
>  void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  			 bool invalidate)
>  {
> @@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  	drm_dev_exit(idx);
>  }
>  
> +/**
> + * xe_ggtt_remove_bo - Remove a BO from the GGTT
> + * @ggtt: the &xe_ggtt where node will be removed
> + * @bo: the &xe_bo to be removed
> + */
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	if (XE_WARN_ON(!bo->ggtt_node.size))
> @@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
>  }
>  #endif
>  
> +/**
> + * xe_ggtt_dump - Dump GGTT for debug
> + * @ggtt: the &xe_ggtt to be dumped
> + * @p: the &drm_mm_printer helper handle to be used to dump the information
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 2245d88d8f39..4e2114201b35 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -13,30 +13,48 @@
>  struct xe_bo;
>  struct xe_gt;
>  
> +/**
> + * struct xe_ggtt - Main GGTT struct

separation line?

> + * In general, each tile can contains its own GGTT instance.

maybe worth to link with "Global Graphics Translation Table (GGTT)"

> + */
>  struct xe_ggtt {
> +	/** @tile: Back pointer to tile where this GGTT belongs */
>  	struct xe_tile *tile;
> -
> +	/** @size: Total size of this GGTT */
>  	u64 size;
>  
>  #define XE_GGTT_FLAGS_64K BIT(0)
> +	/**
> +	 * @flags: Flags for this GGTT
> +	 * Acceptable flags:
> +	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
> +	 */
>  	unsigned int flags;
> -
> +	/** @scratch: Internal object allocation used as a scratch page */
>  	struct xe_bo *scratch;
> -
> +	/** @lock: Mutex lock to protect GGTT data */
>  	struct mutex lock;
> -
> +	/**
> +	 *  @gsm: The iomem pointer to the actual location of the translation
> +	 * table located in the GSM for easy PTE manipulation
> +	 */
>  	u64 __iomem *gsm;
> -
> +	/** @pt_ops: Page Table operations per platform */
>  	const struct xe_ggtt_pt_ops *pt_ops;
> -
> +	/** @mm: The memory manager used to manage individual GGTT allocations */
>  	struct drm_mm mm;
> -
>  	/** @access_count: counts GGTT writes */
>  	unsigned int access_count;
>  };
>  
> +/**
> + * struct xe_ggtt_pt_ops - GGTT Page table operations
> + * Which can vary from platform to platform.
> + */
>  struct xe_ggtt_pt_ops {
> +	/** @pte_encode_bo: Encode PTE address for a given BO */
>  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> +	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  };
>  
