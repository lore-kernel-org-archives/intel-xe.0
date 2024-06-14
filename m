Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BEFC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 10:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2858D10ECF4;
	Fri, 14 Jun 2024 10:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6W0lQg0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3D10ED03
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718361987; x=1749897987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uhD9CYlmWR0PrM6zd/h5B4P7V3T6bAbatXck7VFHvg8=;
 b=W6W0lQg0azKquz1Gn0iyyDyOuBnOqKlWEG9Dt5tjEEI6rdneB/DUut18
 dNpXyFokeRmxgyJYyMFlMQO2bRp9mjS7qKcOBKdISyrMu/OC+bBy4uNA9
 Odjkv4UycwSnD+fa9bsrtkhow126EPLDFJMgQeUNVNclSarzEAxBWly3p
 sf56XU+aQemWbNK5f6DkoAO6xARH1khG/Q+UuWGvsglMsPdw96APjK2oi
 RjzJ5ZZ6H2v+wHCpVeVXHQPwkUOqK/dsi63dBzbEL8OKrI15Jo5cAxcRh
 ZoiUPGWEcR7xP/BOqM41KvSSaguNGSGZv8XCdQBUfHzWtmuMflOQ4LNME w==;
X-CSE-ConnectionGUID: iyGk1A7IQ6GhdTIXCays/A==
X-CSE-MsgGUID: 7z+oQ9n1Qjyq52ekiDnccQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32783604"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="32783604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:46:26 -0700
X-CSE-ConnectionGUID: 2O3+pyRvTPKIjiO2isZWLQ==
X-CSE-MsgGUID: Fa0HvK3dSba4avif2x1RSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="45583812"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 14 Jun 2024 03:46:23 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7A34B2816F;
 Fri, 14 Jun 2024 11:46:21 +0100 (IST)
Message-ID: <4e2aaaa1-b3c9-4283-92fb-b8c874f3ddfb@intel.com>
Date: Fri, 14 Jun 2024 12:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Introduce GGTT documentation
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240613214700.306424-1-rodrigo.vivi@intel.com>
 <20240613214700.306424-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240613214700.306424-2-rodrigo.vivi@intel.com>
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

Hi Rodrigo,

Thanks for doing this, few comments below

On 13.06.2024 23:47, Rodrigo Vivi wrote:
> Document xe_ggtt and ensure it is part of the built kernel docs.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/xe/xe_mm.rst     | 15 +++++
>  drivers/gpu/drm/xe/xe_ggtt.c       | 99 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_ggtt_types.h | 26 ++++++--
>  3 files changed, 129 insertions(+), 11 deletions(-)
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
> index 2d5e802f862d..950af831113d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -27,6 +27,19 @@
>  #include "xe_sriov.h"
>  #include "xe_wopcm.h"
>  
> +/**
> + * DOC: Global Graphics Translation Table (GGTT)
> + *
> + * Xe GGTT implements the support for a Global Virtual Address space that is used
> + * for resources that are accessible to privileged (i.e. kernel-mode) processes, and
> + * not tied to a specific user-level process. For example, the Graphics
> + * micro-Controller (GuC) and Display Engine (if present) utilize this Global
> + * address space.
> + *
> + * The Global GTT (GGTT) translates from the Global virtual address to a physical
> + * address that can be accessed by HW. The GGTT is a flat, single-level table.

nit: maybe also worth to mention about what range the GuC (our primary
user) is able to use and how this impacts our (simplified)
implementation (that we manage from WOPCM to GUC_TOP only)

see hidden note inside xe_ggtt_init_early()

> + */
> +
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  				   u16 pat_index)
>  {
> @@ -69,6 +82,12 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  	return ggms ? SZ_1M << ggms : 0;
>  }
>  
> +/**
> + * xe_ggtt_set_pte - Allow directly writing to a Page Table Entry (PTE)
> + * @ggtt: the &xe_ggtt with the PTE to be set
> + * @addr: address of the GSM

hmm, this is virtual address from GGTT address space for which we want
to setup GGTT PTE, no?

> + * @pte: value to be set directly to the PTE
> + */
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> @@ -130,12 +149,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
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
> @@ -225,6 +248,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
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
> @@ -345,6 +374,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
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
> @@ -352,6 +393,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
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
> @@ -365,6 +415,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
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
> @@ -412,17 +467,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
> @@ -451,6 +528,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
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
> @@ -507,6 +589,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
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
> index d8c584d9a8c3..5718726e8b3a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -13,26 +13,40 @@
>  struct xe_bo;
>  struct xe_gt;
>  
> +/**
> + * struct xe_ggtt_pt_ops - GGTT Page table operations
> + * Which can vary from platform to platform.
> + */
>  struct xe_ggtt_pt_ops {
> +	/** @pte_encode_bo: Encode PTE address for a given BO */
>  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
>  };
>  
> +/**
> + * struct xe_ggtt - Main GGTT struct
> + * In general, each tile can contains its own GGTT instance.
> + *
> + * The @flags can be:
> + * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.

hmm, that's quite strange place to document flags.
maybe it can be done as part of @flags documentation?

> + */
>  struct xe_ggtt {
> +	/** @tile: Back pointer to tile where this GGTT belongs */
>  	struct xe_tile *tile;
> -
> +	/** @size: Total size of this GGTT */
>  	u64 size;
>  
>  #define XE_GGTT_FLAGS_64K BIT(0)

> +	/** @flags: Flags for this GGTT */
>  	unsigned int flags;
> -
> +	/** @scratch: A BO as scratch page */

"Internal object allocation used as a scratch page" ?

>  	struct xe_bo *scratch;
> -
> +	/** @lock: Mutex lock to protect GGTT data */
>  	struct mutex lock;
> -
> +	/** @gsm: The iomem pointer for easy PTE manipulation */

"The iomem pointer to the actual location of the translation table
located in the GSM for easy PTE manipulation" ?

>  	u64 __iomem *gsm;
> -
> +	/** @pt_ops: Page Table operations per platform */
>  	const struct xe_ggtt_pt_ops *pt_ops;
> -
> +	/** @mm: The &drm_mm struct */

"The memory manager used to manage individual GGTT allocations" ?

>  	struct drm_mm mm;
>  };
>  
