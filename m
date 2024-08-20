Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF03EC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 05:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775210E4AA;
	Tue, 20 Aug 2024 05:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgnqDxvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165010E4AA
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 05:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724130407; x=1755666407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a0HYMcD4QEV0cE6+j11b9p17zvMCRGNrd0dWnD5x81k=;
 b=NgnqDxvd6usgOXdju7Qe8vt+jgrCD8rQwCUl+ePEVf8jxNLmKrmRkWgH
 Zl2LSIxbJDgAsIQed8EMFA4ww/pAk80xGmI0eOmcO0FK6kfJrpNNMyrG3
 N+5uznlQTUreGOsk9yXRP8m0Ay/EKiTup/dtI5fapEnXUmzPQCWWrmlkl
 ksb9cPbYWao31SLPRroxWdBrsraiS54+vIpFO+gu+oltak06Kl/BYdzsL
 4PC/1cPEDRU2LPSdsiSfQ6bgReEDke3nTIgIeeyYYYFRbkV8Yakb6UZcy
 GRjrXN6j40ZpQyPGU5tf7153IfQ89ZxzeO9xi1yy7TC9O9vDKaI7wcNpH w==;
X-CSE-ConnectionGUID: 41LL+cVSSD6vf1rfAKXR0Q==
X-CSE-MsgGUID: S5DWZdspSgex5MB6elNnzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22582240"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22582240"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 22:06:47 -0700
X-CSE-ConnectionGUID: M8LwD0QSSliTJmgi3r8Eqw==
X-CSE-MsgGUID: PmTNMnr4RxKmk8RVRjMOUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60571394"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 22:06:46 -0700
Date: Tue, 20 Aug 2024 07:06:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Ensure display fb is aligned in GGTT to a
 multiple of 64k, through padding
Message-ID: <20240820050608.sueqpjtpayoygicj@zkempczy-mobl2>
References: <20240819153127.235831-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819153127.235831-1-maarten.lankhorst@linux.intel.com>
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

On Mon, Aug 19, 2024 at 05:31:27PM +0200, Maarten Lankhorst wrote:
> This workaround is needed on battlemage to ensure that there is no
> corruption when CCS is used.
> 
> For testing, always enable the workaround. Should be easier to see if something blows up. :)
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 82 ++++++++++++++++++++++++--
>  1 file changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d7db44e79eaf5..29a13a889414d 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -15,8 +15,68 @@
>  #include "xe_gt.h"
>  #include "xe_pm.h"
>  
> +static inline bool needs_bmg_64k_workaround(struct xe_device *xe, const struct intel_framebuffer *fb)
> +{
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		goto skip;
> +
> +	/* XXX? What is affected? */
> +	if (fb->base.modifier != I915_FORMAT_MOD_4_TILED)
> +		goto skip;
> +
> +	if (!(intel_fb_obj(&fb->base)->ttm.base.size % SZ_64K))
> +		goto skip;
> +
> +	return true;
> +skip:
> +	return true;

I guess you mean false here according to commit description.

I'm not too familiar with fb code, but if I'm not wrong you're adding
dedicated padding on ggtt to keep fb in 64K chunks, but this is virtual
range. Display folks said we should use physically contiguous 64K pages
due to decompression CCS is resolved at physical addressing, not virtual.

If I don't understand your code correctly, just forget about above note.

--
Zbigniew

> +}
> +
> +static inline void pad_bmg_dpt(struct xe_device *xe, const struct intel_framebuffer *fb,
> +			       struct iosys_map *map, u32 ofs)
> +{
> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> +	struct xe_bo *bo = intel_fb_obj(&fb->base);
> +	u32 pad = 16 - (ofs % 16), x;
> +	u64 pte;
> +
> +	if (!needs_bmg_64k_workaround(xe, fb))
> +		return;
> +
> +	if (!(ofs % 16))
> +		return;
> +
> +	pte = ggtt->pt_ops->pte_encode_bo(bo, 0, xe->pat.idx[XE_CACHE_NONE]);
> +
> +	/* Start over with the first few pages, dpt is always aligned to a multiple
> +		* of 512 pages, which means that there is enough padding here
> +		*/
> +	for (x = 0; x < pad; x++)
> +		iosys_map_wr(map, (ofs + x) * 8, u64, pte);
> +}
> +
> +static inline void pad_bmg_ggtt(struct xe_device *xe, const struct intel_framebuffer *fb, u32 ofs)
> +{
> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> +	struct xe_bo *bo = intel_fb_obj(&fb->base);
> +	u32 pad = SZ_64K - (ofs % SZ_64K), x;
> +	u64 pte;
> +
> +	if (!needs_bmg_64k_workaround(xe, fb))
> +		return;
> +
> +	if (!(ofs % SZ_64K))
> +		return;
> +
> +	pte = ggtt->pt_ops->pte_encode_bo(bo, 0, xe->pat.idx[XE_CACHE_NONE]);
> +
> +	for (x = 0; x < pad; x += XE_PAGE_SIZE)
> +		ggtt->pt_ops->ggtt_set_pte(ggtt, ofs + x, pte);
> +}
> +
>  static void
> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> +write_dpt_rotated(const struct intel_framebuffer *fb, struct xe_bo *bo,
> +		  struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
>  		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> @@ -39,6 +99,9 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>  			src_idx -= src_stride;
>  		}
>  
> +		/* Just pad everything out of paranoia? */
> +		pad_bmg_dpt(xe, fb, map, *dpt_ofs / 8);
> +
>  		/* The DE ignores the PTEs for the padding tiles */
>  		*dpt_ofs += (dst_stride - height) * 8;
>  	}
> @@ -128,6 +191,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  
>  			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>  		}
> +
> +		/* BMG is crappy, just pad everything? */
> +		pad_bmg_dpt(xe, fb, &dpt->vmap, x);
>  	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
>  		const struct intel_remapped_info *remap_info = &view->remapped;
>  		u32 i, dpt_ofs = 0;
> @@ -145,7 +211,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  		u32 i, dpt_ofs = 0;
>  
>  		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
> -			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
> +			write_dpt_rotated(fb, bo, &dpt->vmap, &dpt_ofs,
>  					  rot_info->plane[i].offset,
>  					  rot_info->plane[i].width,
>  					  rot_info->plane[i].height,
> @@ -159,7 +225,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  }
>  
>  static void
> -write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
> +write_ggtt_rotated(const struct intel_framebuffer *fb,
> +		   struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
>  		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> @@ -177,6 +244,8 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>  			src_idx -= src_stride;
>  		}
>  
> +		pad_bmg_ggtt(xe, fb, *ggtt_ofs);
> +
>  		/* The DE ignores the PTEs for the padding tiles */
>  		*ggtt_ofs += (dst_stride - height) * XE_PAGE_SIZE;
>  	}
> @@ -201,7 +270,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  		goto out;
>  
>  	align = XE_PAGE_SIZE;
> -	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> +	if ((xe_bo_is_vram(bo) && (ggtt->flags & XE_GGTT_FLAGS_64K)) ||
> +	    needs_bmg_64k_workaround(xe, fb))
>  		align = max_t(u32, align, SZ_64K);
>  
>  	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
> @@ -220,6 +290,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  
>  			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.start + x, pte);
>  		}
> +
> +		pad_bmg_ggtt(xe, fb, vma->node.start + x);
>  	} else {
>  		u32 i, ggtt_ofs;
>  		const struct intel_rotation_info *rot_info = &view->rotated;
> @@ -235,7 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  		ggtt_ofs = vma->node.start;
>  
>  		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
> -			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
> +			write_ggtt_rotated(fb, bo, ggtt, &ggtt_ofs,
>  					   rot_info->plane[i].offset,
>  					   rot_info->plane[i].width,
>  					   rot_info->plane[i].height,
> -- 
> 2.45.2
> 
