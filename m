Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB7CC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 16:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046F10E5BF;
	Fri, 10 May 2024 16:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgdxnSx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C5B10E5BF
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715356870; x=1746892870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cnER2l3dWcR72AAry87GtohP9e/lSQuMhrt0anRQKbo=;
 b=QgdxnSx1wA/nzuTR1UK2sAdqjQNozb+rMdIZxW/9dvZYzoneNWwZ5pdK
 UHIYATHPk5Fd6V7rE30XoO8x1GYXF16ZCCBMx8rGrySnnG72DiJ9zBg+A
 73mpggQnp7JshobB9CtXhmDKuENa/7YbJi3U3O9yvhQJtxtlfQSHtU91R
 A9VfrjgXDbuNYTFh7fr7+Nz7rrelvt+kO75wyVEq3JHZKP3OnlRxG6+F/
 5qrA12D8lyWl5rfBoZokvdOBEY+8VzQovkI6skZfHIobg8Y5z+lBq4lBk
 SSRxCO7ewTKKA2gReNXVw0O5bY2MjIEcDwM4wBvK1hPOSZ1+A3oHQnsJm A==;
X-CSE-ConnectionGUID: VAcVdCPrQ9ustlnzeS3AvA==
X-CSE-MsgGUID: 9gekeh9iQ/i8HQ6jx5JrqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11469332"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11469332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 09:01:09 -0700
X-CSE-ConnectionGUID: u7XKK6pASQSl4lB6BblAmA==
X-CSE-MsgGUID: UvKeVbV9RTWHRxGRCS2o7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29607828"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 May 2024 09:01:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 May 2024 19:01:05 +0300
Date: Fri, 10 May 2024 19:01:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/xe/display: Unify DPT mapping
Message-ID: <Zj5EwWxR7HUgYgV9@intel.com>
References: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
X-Patchwork-Hint: comment
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

On Tue, May 07, 2024 at 08:35:39PM +0300, Juha-Pekka Heikkila wrote:
> Unify writing of rotated, remapped and straight DPTs
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
>  1 file changed, 51 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 3e1ae37c4c8b..bdb0dac5600e 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -14,66 +14,44 @@
>  
>  #include <drm/ttm/ttm_bo.h>
>  
> -static void
> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> -		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map *map,
> +				 u32 *ofs, u32 src_idx, struct xe_device *xe)
>  {
> -	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> -	u32 column, row;
> -
> -	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
> -	 * by writing dpt/ggtt in a different order?
> -	 */
> -
> -	for (column = 0; column < width; column++) {
> -		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
> -
> -		for (row = 0; row < height; row++) {
> -			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_NONE]);
> -
> -			iosys_map_wr(map, *dpt_ofs, u64, pte);
> -			*dpt_ofs += 8;
> -			src_idx -= src_stride;
> -		}
> -
> -		/* The DE ignores the PTEs for the padding tiles */
> -		*dpt_ofs += (dst_stride - height) * 8;
> -	}
> -
> -	/* Align to next page */
> -	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
> +	u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> +					      xe->pat.idx[XE_CACHE_NONE]);
> +	iosys_map_wr(map, *ofs, u64, pte);
> +	*ofs += 8;
>  }
>  
> -static void
> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
> -		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> -		   u32 dst_stride)
> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
> +		      const struct intel_remapped_plane_info *plane,
> +		      enum i915_gtt_view_type type)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> -	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> -	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
> -		= ggtt->pt_ops->pte_encode_bo;
> -	u32 column, row;
> -
> -	for (row = 0; row < height; row++) {
> -		u32 src_idx = src_stride * row + bo_ofs;
> -
> -		for (column = 0; column < width; column++) {
> -			iosys_map_wr(map, *dpt_ofs, u64,
> -				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -				     xe->pat.idx[XE_CACHE_NONE]));
> -
> -			*dpt_ofs += 8;
> -			src_idx++;
> +	const u32 dpt_even = (plane->dst_stride - (type == I915_GTT_VIEW_ROTATED
> +			      ? plane->height : plane->width)) * 8;
> +	u32 src_idx;
> +
> +	for (u32 row = 0; row < plane->height; ++row) {
> +		for (u32 column = 0; column < plane->width; ++column) {

This order doesn't look correct for the rotated case.

> +			switch (type) {
> +			case I915_GTT_VIEW_NORMAL:
> +				src_idx = plane->offset + column;
> +				break;
> +			case I915_GTT_VIEW_REMAPPED:
> +				src_idx = plane->offset +
> +					row * plane->src_stride + column;
> +				break;
> +			case I915_GTT_VIEW_ROTATED:
> +				src_idx = plane->offset + plane->src_stride *
> +					(plane->height - 1 - row) + column;
> +				break;
> +			}
> +			encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
>  		}
> -
> -		/* The DE ignores the PTEs for the padding tiles */
> -		*dpt_ofs += (dst_stride - width) * 8;
> +		*dpt_ofs += dpt_even;
>  	}
> -
> -	/* Align to next page */
>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>  }
>  
> @@ -83,19 +61,33 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  {
>  	struct xe_device *xe = to_xe_device(fb->base.dev);
>  	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> -	struct xe_ggtt *ggtt = tile0->mem.ggtt;
>  	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
>  	u32 dpt_size, size = bo->ttm.base.size;
> +	const struct intel_remapped_plane_info *plane;
> +	u32 i, plane_count, dpt_ofs = 0;
> +	struct intel_remapped_plane_info normal_plane;
>  
> -	if (view->type == I915_GTT_VIEW_NORMAL)
> +	if (view->type == I915_GTT_VIEW_NORMAL) {
>  		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
> -	else if (view->type == I915_GTT_VIEW_REMAPPED)
> -		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
> +		normal_plane.offset = 0;
> +		normal_plane.width = size / XE_PAGE_SIZE;
> +		normal_plane.height = 1;
> +		normal_plane.src_stride = size / XE_PAGE_SIZE;
> +		normal_plane.dst_stride = size / XE_PAGE_SIZE;
> +		plane = &normal_plane;
> +		plane_count = 1;
> +	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
> +		dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
>  				 XE_PAGE_SIZE);
> -	else
> +		plane = view->remapped.plane;
> +		plane_count = ARRAY_SIZE(view->remapped.plane);
> +	} else {
>  		/* display uses 4K tiles instead of bytes here, convert to entries.. */
>  		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>  				 XE_PAGE_SIZE);
> +		plane = view->rotated.plane;
> +		plane_count = ARRAY_SIZE(view->rotated.plane);
> +	}
>  
>  	if (IS_DGFX(xe))
>  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> @@ -118,39 +110,8 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> -	if (view->type == I915_GTT_VIEW_NORMAL) {
> -		u32 x;
> -
> -		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
> -			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_NONE]);
> -
> -			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> -		}
> -	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
> -		const struct intel_remapped_info *remap_info = &view->remapped;
> -		u32 i, dpt_ofs = 0;
> -
> -		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
> -			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
> -					   remap_info->plane[i].offset,
> -					   remap_info->plane[i].width,
> -					   remap_info->plane[i].height,
> -					   remap_info->plane[i].src_stride,
> -					   remap_info->plane[i].dst_stride);
> -
> -	} else {
> -		const struct intel_rotation_info *rot_info = &view->rotated;
> -		u32 i, dpt_ofs = 0;
> -
> -		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
> -			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
> -					  rot_info->plane[i].offset,
> -					  rot_info->plane[i].width,
> -					  rot_info->plane[i].height,
> -					  rot_info->plane[i].src_stride,
> -					  rot_info->plane[i].dst_stride);
> -	}
> +	for (i = 0; i < plane_count; i++)
> +		write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
>  
>  	vma->dpt = dpt;
>  	vma->node = dpt->ggtt_node;
> -- 
> 2.43.2

-- 
Ville Syrjälä
Intel
