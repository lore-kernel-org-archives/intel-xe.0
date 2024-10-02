Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24A5CF31B7
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 13:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0D710E168;
	Wed,  2 Oct 2024 13:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyZsPIod";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D20B10E344
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727874303; x=1759410303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EVq6WpdaT3EK9c3W4HFMhFIfxpMQ55ijuqCvAI4tKhg=;
 b=OyZsPIodoQZaZiX0qLP1QiH6bRVnNhzzo/QkWlrDTt+k1Tm+yHSsqWdj
 eNaJfnuv3eMG687qgGNIdugBy+ovmrb3IgVqnviPsS6JQWjNRMXxbgE+l
 oS+2klULHQthEsHjx6j3HwDwwODFQElt+sxxjDlLSxAXkiwgZnoMHLXAt
 G8+hsMzUNaFUXHGjlNaDmZZp4wFEuo2fdG/CZ+LxmW9K/qeJETB/CQJGb
 NMcjRuY+pz0XJD5CzGqmyd7vpHVfg24SqKursTn3zHhIWb6BSVPcNp/zX
 YNaA8KIp3MVSpSox0f+vsretQotfJtS+0yoTjPn8Y8VgLpHNeqvvc7RUB Q==;
X-CSE-ConnectionGUID: xZZ5ujfBQ0Sqv1aeGlpyeg==
X-CSE-MsgGUID: KeAHIz6IQiO2DWron1YlSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38396115"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38396115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:05:02 -0700
X-CSE-ConnectionGUID: lEqjUkoXQj2x67wvnxR0NA==
X-CSE-MsgGUID: GfRSoaVTT66C+QU3SqRMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74115532"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 06:05:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 16:04:59 +0300
Date: Wed, 2 Oct 2024 16:04:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Mark dpt requiring 8K alignment
Message-ID: <Zv1E-wPvG43xsfHj@intel.com>
References: <20241002114815.1970048-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002114815.1970048-1-juhapekka.heikkila@gmail.com>
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

On Wed, Oct 02, 2024 at 02:47:55PM +0300, Juha-Pekka Heikkila wrote:
> Due to hw requirements relating to long strides let's align display
> page table to 8k.

This stuff belongs in plane->min_alignment(), and then the xe
ggtt/dpt code needs to be fixed to do what its told.

> 
> BSpec: 50417
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++++++---
>  drivers/gpu/drm/xe/xe_bo.h             | 1 +
>  drivers/gpu/drm/xe/xe_ggtt.c           | 2 ++
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 79dbbbe03c7f..976f4d1a03cd 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -103,19 +103,22 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  					   ttm_bo_type_kernel,
>  					   XE_BO_FLAG_VRAM0 |
>  					   XE_BO_FLAG_GGTT |
> -					   XE_BO_FLAG_PAGETABLE);
> +					   XE_BO_FLAG_PAGETABLE |
> +					   XE_BO_FLAG_NEED_8K_ALIGN);
>  	else
>  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>  					   ttm_bo_type_kernel,
>  					   XE_BO_FLAG_STOLEN |
>  					   XE_BO_FLAG_GGTT |
> -					   XE_BO_FLAG_PAGETABLE);
> +					   XE_BO_FLAG_PAGETABLE |
> +					   XE_BO_FLAG_NEED_8K_ALIGN);
>  	if (IS_ERR(dpt))
>  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>  					   ttm_bo_type_kernel,
>  					   XE_BO_FLAG_SYSTEM |
>  					   XE_BO_FLAG_GGTT |
> -					   XE_BO_FLAG_PAGETABLE);
> +					   XE_BO_FLAG_PAGETABLE |
> +					   XE_BO_FLAG_NEED_8K_ALIGN);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 31f4ba3bd8c1..154d6fe4c823 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,6 +39,7 @@
>  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
>  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> +#define XE_BO_FLAG_NEED_8K_ALIGN	BIT(18)
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f68af56c3f86..0b17c0afcd95 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -605,6 +605,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
> +	else if (bo->flags & XE_BO_FLAG_NEED_8K_ALIGN)
> +		alignment = SZ_8K;
>  
>  	if (XE_WARN_ON(bo->ggtt_node)) {
>  		/* Someone's already inserted this BO in the GGTT */
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
