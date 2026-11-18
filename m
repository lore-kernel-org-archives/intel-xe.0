Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AEA606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 20:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwcmbKkr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAEC10E6F6;
	Wed, 18 Nov 2026 20:38:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220AC10E6F6
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795034308; x=1826570308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rlgRDZ0mXk0zUeUl9mOaKC0t+LwUhW9Vbm6qXz9JcTM=;
 b=VwcmbKkr2/Rk69ZKfAIEl5irazBMjgARqaUNgVeqd2KXuVKRQka2K7cZ
 dupKzHs3bI9A/Bgd8KVd7qWP2vtQ3FKN+lTadLhOEPkKoioAYiey4Jq+r
 7KoL4zuxklv6sWMwMJtxCn6W60MCsNlk+YdzK105fYNQTm6Au7xwIRKJz
 pScAD4eflJdCgTgftkvOXFO05C+wp0p+rxEnPHDItC1D2J+PhjwtiG2kE
 FVP8Zk624avVLcQ/hYRIaFY5hrnIY5dTluoZVUNUtn9ceXuwZboXvsGDE
 HCf1hY2UXOgoBjec2LufpANnffYE1hSdWJllwzyHsKyRIv7qAQdzA27SY A==;
X-CSE-ConnectionGUID: grr35ZlZR5eyFZvTydBScA==
X-CSE-MsgGUID: 2twdQ8vwRw+kLVX5PGEaug==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3942065"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3942065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:38:27 -0800
X-CSE-ConnectionGUID: BAoV9T7JSjGy68VMCkiC4g==
X-CSE-MsgGUID: ted6sHI3T7id4WSpSCI7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10632057"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:38:27 -0800
Date: Wed, 18 Nov 2026 22:38:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 3/6] drm/xe/display: Reserve the original GGTT space
 before creating a bo
Message-ID: <av4Mv95tqBkEW_HV@intel.com>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-11-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116122828.266113-11-dev@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:28:32PM +0100, Maarten Lankhorst wrote:
> Annotate the original area of the framebuffer as reserved in the GGTT
> before creating a new GGTT entry. This allows us to remove the
> range restrictions of GGTT in xe_bo_create_pin_map_at_novm().
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index 0f86b73036d03..a100ad23be2a0 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -46,6 +46,7 @@ initial_plane_bo(struct xe_device *xe,
>  	resource_size_t phys_base;
>  	u32 base, size, flags;
>  	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> +	struct xe_ggtt_node *original_ggtt_node;
>  
>  	if (plane_config->size == 0)
>  		return NULL;
> @@ -111,8 +112,15 @@ initial_plane_bo(struct xe_device *xe,
>  		}
>  	}
>  
> +	original_ggtt_node = xe_ggtt_reserve_area(tile0->mem.ggtt, base, size);
> +	if (IS_ERR(original_ggtt_node))
> +		return NULL;
> +
>  	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
>  					  ttm_bo_type_kernel, flags, 0, false);
> +	if (original_ggtt_node)
> +		xe_ggtt_node_remove_noclear(original_ggtt_node);

I suppose the thing we're skipping here that i915 is we try again at the
original address if the pin fails with the old PTE protection in place.
But I suppose that might be a completely unrealistic case as the FB would
have to be large enough to not fit anywhere in the remaining free space. 
Also if we were to bind to the original address, the GuC stuff (and the
while reduced gggt->start stuff in xe) would still blow up.

So this seems good to me.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
>  	if (IS_ERR(bo)) {
>  		drm_dbg_kms(&xe->drm,
>  			    "Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
> -- 
> 2.55.0

-- 
Ville Syrjälä
Intel
