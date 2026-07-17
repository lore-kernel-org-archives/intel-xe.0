Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C44C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B32510E473;
	Fri, 17 Jul 2026 14:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGMq8bcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5E210E462;
 Fri, 17 Jul 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784298522; x=1815834522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BXO/RM6FMqwUWAS+VUCHsM7hXBDRUfKedzsDJohXeA8=;
 b=JGMq8bcf7L5bAKHvhSB4EFUY4zdHPbQo+uB1Cm2Cknkm9MoOQFaVgH2F
 aziwRst4QOph0kZY/x5BxgKUVEBFnK/m6b8HWhEE6sSDtp/gpBLERkxai
 iJ0Sw1I2h1khtEIpTLcwR/biDXK8Tx+eL6o7B8CFjtLH2tlvT7pfXzms/
 24brhojwy7e9fZ51ub4NQmstBDpzovn8LkNV28kYRC5nZsC2LIPnzZfav
 uMeFXRa+8ATrtPWtClqSdYegHKJLXklLoXfKiiPxZO/5RdxQhIyoAQSzt
 Er/h6vFyMqVcfq4r+eY5QmVTvTrXqodLJKQXsgpaD3iWlMYyN/ina4m/n g==;
X-CSE-ConnectionGUID: Q9HhsW/jStSZoEaYlZ1v6g==
X-CSE-MsgGUID: mqV7pO/fQdWPYFfURITKag==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96334232"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96334232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:28:41 -0700
X-CSE-ConnectionGUID: trr+6VmcTQu2OiAQZCxwRw==
X-CSE-MsgGUID: i+Kf9p7CSg+dUcJBzrkRJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="294994461"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:28:40 -0700
Date: Fri, 17 Jul 2026 17:28:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 3/6] drm/xe/display: Reserve the original GGTT space
 before creating a bo
Message-ID: <alo8FT1LfuwibrNC@intel.com>
References: <20260715110557.2172095-1-dev@lankhorst.se>
 <20260715110557.2172095-4-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715110557.2172095-4-dev@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jul 15, 2026 at 01:05:54PM +0200, Maarten Lankhorst wrote:
> Annotate the original area of the framebuffer as reserved in the GGTT
> before creating a new GGTT entry. This allows us to remove the
> range restrictions of GGTT in xe_bo_create_pin_map_at_novm().
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index 0f86b73036d03..f49dda8e28255 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -37,6 +37,25 @@ static bool need_pte_local(struct xe_device *xe)
>  	return IS_DGFX(xe) || has_lmembar(xe);
>  }
>  
> +static struct xe_ggtt_node *reserve_original_node(struct xe_ggtt *ggtt, u32 base, u32 size, u64 page_size)
> +{
> +	u64 ggtt_start = xe_ggtt_start(ggtt), ggtt_end = ggtt_start + xe_ggtt_size(ggtt);
> +
> +	/* Completely truncated? */
> +	if (base + size <= ggtt_start || base >= ggtt_end)
> +		return NULL;
> +
> +	/* Partially truncated? */
> +	if (base <= ggtt_start) {
> +		size -= ggtt_start - base;
> +		base = ggtt_start;
> +	} else if (base + size >= ggtt_end) {
> +		size = ggtt_end - base;
> +	}

This is exactly what I didn't want to have in the display code.
These are xe_ggtt.c implementation details that we shouldn't
have to know. So IMO either xe_ggtt_insert_node_at() should handle
all of it, or this reserve_original_node() wrapper should live in
xe_ggtt.c.

> +
> +	return xe_ggtt_insert_node_at(ggtt, size, page_size, base, base + size);
> +}
> +
>  static struct xe_bo *
>  initial_plane_bo(struct xe_device *xe,
>  		 struct intel_initial_plane_config *plane_config)
> @@ -46,6 +65,7 @@ initial_plane_bo(struct xe_device *xe,
>  	resource_size_t phys_base;
>  	u32 base, size, flags;
>  	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> +	struct xe_ggtt_node *original_ggtt_node;
>  
>  	if (plane_config->size == 0)
>  		return NULL;
> @@ -111,8 +131,15 @@ initial_plane_bo(struct xe_device *xe,
>  		}
>  	}
>  
> +	original_ggtt_node = reserve_original_node(tile0->mem.ggtt, base, size, page_size);
> +	if (IS_ERR(original_ggtt_node))
> +		return NULL;
> +
>  	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
>  					  ttm_bo_type_kernel, flags, 0, false);
> +	if (original_ggtt_node)
> +		xe_ggtt_node_remove_noclear(original_ggtt_node);
> +
>  	if (IS_ERR(bo)) {
>  		drm_dbg_kms(&xe->drm,
>  			    "Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
