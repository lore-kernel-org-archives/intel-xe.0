Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CF60774F0
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dl/WHpHE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA5C10EE3D;
	Mon, 19 Oct 2026 15:45:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8053610EE2F;
 Mon, 19 Oct 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792424732; x=1823960732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/Fo9nYevVdlDdQT9rW40kebnOmr1dnncZ5oIEBa2EXs=;
 b=dl/WHpHEBLvCUcFs/XohdpfRHksa15+yj8rZ0Yl1YT2dk/fWU6aDkDpD
 O29496XYQeo6qnZVYOBXbGBH97Hv1Sin4iUKBugDd88XaO8vWMbXN6bnz
 KnWoZGzPi9T3KoSGuUuURabe4czv8WpWizKrWrW4AXhdku8wFzV570B4g
 +TNJDQfxPZ8g/yn7zc8ODFTsidSjpx9fSG1t4QAQxq4/Iz6zoudyfsL1Y
 prWmXueOsUz9K+kCjKMoR1bsCV3b9fMdF98BtiiYlzt7Xt38wtfCocyzP
 PqqYRx7//9O4tSbuf4NfG+NBSE/UQr700ypmElihiiYq7CQkamt7AQTzH w==;
X-CSE-ConnectionGUID: ZmXIgb55SU+95AKhYMzcdQ==
X-CSE-MsgGUID: 2/ueVTofSmGgwSGPUMbGbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1011099"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1011099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:45:31 -0700
X-CSE-ConnectionGUID: ZqML/GAXTR2d4BB5Q4cvzQ==
X-CSE-MsgGUID: aa3RURiQToW+KYTA/nXr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2621104"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:45:29 -0700
Date: Mon, 19 Oct 2026 17:45:24 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Drop bogus VLV/CHV VT-d stuff
Message-ID: <vaxdomt6b24q6xyrufmwhxdilm2vz3hp46x7y5jqjlhcxhyg2p@zcg4ndkaftvz>
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
 <20261019130014.8851-2-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019130014.8851-2-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:00:12PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Apparently VLV and CHV don't support VT-d at all. Drop the
> dead code and FIXMEs related to this.
> 
> And since intel_scanout_needs_vtd_wa() is never true
> for VLV/CHV we can put the vtd_guard assignement into the

s/assignement/assignment/

> common code path in intel_sprite_plane_create(), which is
> how intel_primary_plane_create() already does it as well.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c   |  7 -------
>  drivers/gpu/drm/i915/display/intel_sprite.c | 13 +++----------
>  2 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index 0902b17d0269..bd5f2c74959a 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -816,15 +816,9 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
>  				     const struct drm_framebuffer *fb,
>  				     int color_plane)
>  {
> -	struct intel_display *display = to_intel_display(plane);
> -
>  	if (intel_plane_can_async_flip(plane, fb->format, fb->modifier))
>  		return 256 * 1024;
>  
> -	/* FIXME undocumented so not sure what's actually needed */
> -	if (intel_scanout_needs_vtd_wa(display))
> -		return 256 * 1024;
> -
>  	switch (fb->modifier) {
>  	case I915_FORMAT_MOD_X_TILED:
>  		return 4 * 1024;
> @@ -1019,7 +1013,6 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  	else
>  		plane->min_alignment = i9xx_plane_min_alignment;
>  
> -	/* FIXME undocumented for VLV/CHV so not sure what's actually needed */
>  	if (intel_scanout_needs_vtd_wa(display))
>  		plane->vtd_guard = 128;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index 2321bfbb8630..116c7faf3452 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -1618,10 +1618,6 @@ intel_sprite_plane_create(struct intel_display *display,
>  		plane->min_alignment = vlv_plane_min_alignment;
>  		plane->min_cdclk = vlv_plane_min_cdclk;
>  
> -		/* FIXME undocumented for VLV/CHV so not sure what's actually needed */
> -		if (intel_scanout_needs_vtd_wa(display))
> -			plane->vtd_guard = 128;
> -
>  		if (display->platform.cherryview && pipe == PIPE_B) {
>  			formats = chv_pipe_b_sprite_formats;
>  			num_formats = ARRAY_SIZE(chv_pipe_b_sprite_formats);
> @@ -1650,9 +1646,6 @@ intel_sprite_plane_create(struct intel_display *display,
>  
>  		plane->min_alignment = g4x_sprite_min_alignment;
>  
> -		if (intel_scanout_needs_vtd_wa(display))
> -			plane->vtd_guard = 64;
> -
>  		formats = snb_sprite_formats;
>  		num_formats = ARRAY_SIZE(snb_sprite_formats);
>  
> @@ -1669,9 +1662,6 @@ intel_sprite_plane_create(struct intel_display *display,
>  		plane->min_alignment = g4x_sprite_min_alignment;
>  		plane->min_cdclk = g4x_sprite_min_cdclk;
>  
> -		if (intel_scanout_needs_vtd_wa(display))
> -			plane->vtd_guard = 64;
> -
>  		if (display->platform.sandybridge) {
>  			formats = snb_sprite_formats;
>  			num_formats = ARRAY_SIZE(snb_sprite_formats);
> @@ -1685,6 +1675,9 @@ intel_sprite_plane_create(struct intel_display *display,
>  		}
>  	}
>  
> +	if (intel_scanout_needs_vtd_wa(display))
> +		plane->vtd_guard = 64;
> +
>  	if (display->platform.cherryview && pipe == PIPE_B) {
>  		supported_rotations =
>  			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> -- 
> 2.55.0
> 
