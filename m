Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6597CC25B5F
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 15:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032C310E88B;
	Fri, 10 May 2024 15:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNZN22k6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ABA10E88B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353642; x=1746889642;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NQZXU4FtwGWRHy9/1gLuaUEI7kAYVnHJVqZ2PR9fkqI=;
 b=gNZN22k60Tf5/4E+mv+w0oS3DDhATBaizSX2DD3otfwz729+BXkZXu7D
 JkfSj0OxOJDnAFTQU6fyS2JDAeCQnPAxockyhGuArgxMSi7QXEcwLoBVS
 8z65WqJr8Fe5MQhPZYA6bCp8H8af8TTgC7GJLJWjmzj0vQKjMhppNIOSp
 OlquqWbxetbXgMXVJ6xZzshOqFOYLu82b7R2P8Caf2VCSIQWGaE/kFP9+
 uwmH8YEevgemOHtD7Bau/8Yfn8tTW/m0+jhoFNsIEviSI1Vz/aNzogGj+
 +bnp+6ssZzCtZGjEQMfZP/ofIZBcQpZVPG2SxwS2ZRquMAGyTObJAvyA9 Q==;
X-CSE-ConnectionGUID: DNo2GbusSVWlvARM5uXnqQ==
X-CSE-MsgGUID: PqfnusO/Q3aTia+bNTcG6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14288991"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="14288991"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:07:22 -0700
X-CSE-ConnectionGUID: v6iPnthdQvGyfrENjWx2QQ==
X-CSE-MsgGUID: 2LLkBjCwTNalwrJfKOrqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67117923"
Received: from mgalili1-mobl1.ger.corp.intel.com (HELO [10.252.51.215])
 ([10.252.51.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:07:21 -0700
Message-ID: <76fd4905-40f9-4d9b-9a65-756b1718fda2@linux.intel.com>
Date: Fri, 10 May 2024 17:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/display: Unify DPT mapping
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org
References: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
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

Hey,

Den 2024-05-07 kl. 19:35, skrev Juha-Pekka Heikkila:
> Unify writing of rotated, remapped and straight DPTs
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
>   1 file changed, 51 insertions(+), 90 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 3e1ae37c4c8b..bdb0dac5600e 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -14,66 +14,44 @@
>   
>   #include <drm/ttm/ttm_bo.h>
>   
> -static void
> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> -		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map *map,
> +				 u32 *ofs, u32 src_idx, struct xe_device *xe)
>   {
> -	struct xe_device *xe = xe_bo_device(bo);
>   	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
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
>   }
>   
> -static void
> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
> -		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> -		   u32 dst_stride)
> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
> +		      const struct intel_remapped_plane_info *plane,
> +		      enum i915_gtt_view_type type)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
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
>   		}
> -
> -		/* The DE ignores the PTEs for the padding tiles */
> -		*dpt_ofs += (dst_stride - width) * 8;
> +		*dpt_ofs += dpt_even;
>   	}
> -
> -	/* Align to next page */
>   	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>   }
>   
> @@ -83,19 +61,33 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>   {
>   	struct xe_device *xe = to_xe_device(fb->base.dev);
>   	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> -	struct xe_ggtt *ggtt = tile0->mem.ggtt;
>   	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
>   	u32 dpt_size, size = bo->ttm.base.size;
> +	const struct intel_remapped_plane_info *plane;
> +	u32 i, plane_count, dpt_ofs = 0;
> +	struct intel_remapped_plane_info normal_plane;
>   
> -	if (view->type == I915_GTT_VIEW_NORMAL)
> +	if (view->type == I915_GTT_VIEW_NORMAL) {
>   		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
> -	else if (view->type == I915_GTT_VIEW_REMAPPED)
> -		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
> +		normal_plane.offset = 0;
> +		normal_plane.width = size / XE_PAGE_SIZE;
> +		normal_plane.height = 1;
> +		normal_plane.src_stride = size / XE_PAGE_SIZE;
> +		normal_plane.dst_stride = size / XE_PAGE_SIZE;
> +		plane = &normal_plane;
> +		plane_count = 1;

I guess we cannot stuff this inside the vma view?

Patch 2 looks good. I guess there is no way to do this, so for both:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com

