Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA8C02194
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 13:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059D310E0A3;
	Mon,  3 Feb 2025 13:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+c1mP8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D910E0A3
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738588034; x=1770124034;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L/kB/XtjQ43pdr0fInCi1+krgzQHINmbL5Ou8W/lM6o=;
 b=m+c1mP8nYZLobNZVUqyGsf611Zv4nA/c72tf/E17bXbZt/PwHBn98OsE
 fauQzrEiaKZU9O0Ng9jtTAzQGsME+L9B7EUcKfkGEcqNFKppVJg3de8GO
 rkp7b24oYPKwCkTSzCnJpY5KeWduaNxnoSLzQV5baTHUHD7cGWw/gVEFR
 RbmWe0RBB5At1QAKI8zdNWAZGgRoXYCDstn8EiIidpIilQD5eZ9qoMHgK
 G84wuqF7c3r2cCou2PNt6xjbcrv1r4Yw3egOeTiSs5hSx728+d+W1weaR
 zjAZa6T0+Db7DIFGVvbSYQmE2nRj+sK7ey/PAIQQ+rRDwQFODL+Zq+0Ps Q==;
X-CSE-ConnectionGUID: t1fCL6BiT7qRK5jtXHSQ7g==
X-CSE-MsgGUID: bVfN9x7IQ4ubQ3lX3rEB0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50492917"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50492917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:07:14 -0800
X-CSE-ConnectionGUID: pB68mmaPRruc1NmL5fhIdg==
X-CSE-MsgGUID: jdCoyKuZSESa8cwbOSmPww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110237630"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:07:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, lucas.demarchi@intel.com, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
In-Reply-To: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
Date: Mon, 03 Feb 2025 15:07:08 +0200
Message-ID: <87o6zj6utf.fsf@intel.com>
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

On Tue, 14 Jan 2025, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
> This also fixes bug where dpt could have been allocated from system
> memory when on dgfx.

Cc: Rodrigo, Lucas, Maarten

Should this be merged via drm-intel or drm-xe?

>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>  1 file changed, 43 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 9fa51b84737c..c28885316986 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>  }
>  
> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
> +				     struct xe_tile *tile0, u64 size,
> +				     u64 physical_alignment)
> +{
> +	struct xe_bo *dpt;
> +
> +	/*
> +	 * If DGFX: try VRAM0 only
> +	 */
> +	if (IS_DGFX(xe)) {
> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> +						      size, ~0ull,
> +						      ttm_bo_type_kernel,
> +						      XE_BO_FLAG_VRAM0 |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_PAGETABLE,
> +						      physical_alignment);
> +	} else {
> +		/*
> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
> +		 */
> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> +						      size, ~0ull,
> +						      ttm_bo_type_kernel,
> +						      XE_BO_FLAG_STOLEN |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_PAGETABLE,
> +						      physical_alignment);
> +		if (IS_ERR(dpt)) {
> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> +							      size, ~0ull,
> +							      ttm_bo_type_kernel,
> +							      XE_BO_FLAG_SYSTEM |
> +							      XE_BO_FLAG_GGTT |
> +							      XE_BO_FLAG_PAGETABLE,
> +							      physical_alignment);
> +		}
> +	}
> +	return dpt;
> +}
> +
>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  			       const struct i915_gtt_view *view,
>  			       struct i915_vma *vma,
> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>  				 XE_PAGE_SIZE);
>  
> -	if (IS_DGFX(xe))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size, ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_VRAM0 |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> -	else
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_STOLEN |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> -	if (IS_ERR(dpt))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_SYSTEM |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> +	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
> +
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);

-- 
Jani Nikula, Intel
