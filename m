Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA64606C16E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M2M43RIC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9E310EE3D;
	Mon, 19 Oct 2026 15:46:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EEE10EE4A;
 Mon, 19 Oct 2026 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792424754; x=1823960754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Shqj5IphTy7inCwXchukar1ENq7xHTsnFTLDVjNSbV4=;
 b=M2M43RIC2bNW7gSSpNJyTMnCIsRSg5NzREKCA37eV3W5FRZljoZcElUx
 6Bms3FN/yUpQGQx7Ekh1vAxBktaMC6jBv0kDb9OytKRiCkDZUoQ3MaKoc
 iGgeiVZBU/yY+pbwh9Tvr0+7emebv8cb6q3aDAR4STOUc6QRkh5CmG/vu
 v15ey87OPK1BTDaPUx89JIaiQOsqqGJrF5MoDMDCXbuMpzrro1qAEbv4U
 BQ0tBI4x/C5ahJvMfudfmQuBAbWDx8wtyNj9SH+kOC5UdbaQcZ4QDQCVD
 NoiJRBuwVBPJgRGFbqPH9YlwtP5O006wHxs34lidkapNAv4Ewl5I8bDJk A==;
X-CSE-ConnectionGUID: UGcz+0MPRcSMuBcj/x6h+g==
X-CSE-MsgGUID: sBkQ1deBQO+JF9ueqQqFEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1216580"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1216580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:45:54 -0700
X-CSE-ConnectionGUID: DuC+VC35Tk++TA4jTw1pJA==
X-CSE-MsgGUID: lB1v4nXuQKm16lvoG358KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2443347"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:45:52 -0700
Date: Mon, 19 Oct 2026 17:45:43 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Optimize VT-d w/a handling a bit
Message-ID: <fjcdw3rqjth4i7myfyc6yelulxjiqe4on4r7vre2jvqykpz4j5@dw2gmhov62lr>
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
 <20261019130014.8851-3-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019130014.8851-3-ville.syrjala@linux.intel.com>
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
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:00:13PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Since plane->min_alignment is already a vfunc we can skip
> the runtime VT-d checks by simply providing a VT-d specific
> implementation of the vfunc.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c   | 16 ++++++++++------
>  drivers/gpu/drm/i915/display/intel_cursor.c | 20 ++++++++++++--------
>  drivers/gpu/drm/i915/display/intel_sprite.c | 16 ++++++++++------
>  3 files changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index bd5f2c74959a..54e32b701770 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -830,18 +830,20 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
>  	}
>  }
>  
> +static unsigned int vtd_primary_min_alignment(struct intel_plane *plane,
> +					      const struct drm_framebuffer *fb,
> +					      int color_plane)
> +{
> +	return 256 * 1024;
> +}
> +
>  static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
>  					      const struct drm_framebuffer *fb,
>  					      int color_plane)
>  {
> -	struct intel_display *display = to_intel_display(plane);
> -
>  	if (intel_plane_can_async_flip(plane, fb->format, fb->modifier))
>  		return 256 * 1024;
>  
> -	if (intel_scanout_needs_vtd_wa(display))
> -		return 256 * 1024;
> -
>  	switch (fb->modifier) {
>  	case I915_FORMAT_MOD_X_TILED:
>  	case DRM_FORMAT_MOD_LINEAR:
> @@ -1013,8 +1015,10 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  	else
>  		plane->min_alignment = i9xx_plane_min_alignment;
>  
> -	if (intel_scanout_needs_vtd_wa(display))
> +	if (intel_scanout_needs_vtd_wa(display)) {
> +		plane->min_alignment = vtd_primary_min_alignment;
>  		plane->vtd_guard = 128;
> +	}
>  
>  	if (display->platform.i830 || display->platform.i845g) {
>  		plane->update_arm = i830_plane_update_arm;
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 4afd275de86e..2f33a05bc76e 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -365,15 +365,17 @@ static unsigned int i85x_cursor_min_alignment(struct intel_plane *plane,
>  	return 256; /* physical */
>  }
>  
> +static unsigned int vtd_cursor_min_alignment(struct intel_plane *plane,
> +					     const struct drm_framebuffer *fb,
> +					     int color_plane)
> +{
> +	return 64 * 1024;
> +}
> +
>  static unsigned int i9xx_cursor_min_alignment(struct intel_plane *plane,
>  					      const struct drm_framebuffer *fb,
>  					      int color_plane)
>  {
> -	struct intel_display *display = to_intel_display(plane);
> -
> -	if (intel_scanout_needs_vtd_wa(display))
> -		return 64 * 1024;
> -
>  	return 4 * 1024; /* physical for i915/i945 */
>  }
>  
> @@ -1188,15 +1190,17 @@ intel_cursor_plane_create(struct intel_display *display,
>  		else
>  			cursor->min_alignment = i9xx_cursor_min_alignment;
>  
> -		if (intel_scanout_needs_vtd_wa(display))
> -			cursor->vtd_guard = 2;
> -
>  		cursor->update_arm = i9xx_cursor_update_arm;
>  		cursor->disable_arm = i9xx_cursor_disable_arm;
>  		cursor->get_hw_state = i9xx_cursor_get_hw_state;
>  		cursor->check_plane = i9xx_check_cursor;
>  	}
>  
> +	if (intel_scanout_needs_vtd_wa(display)) {
> +		cursor->min_alignment = vtd_cursor_min_alignment;
> +		cursor->vtd_guard = 2;
> +	}
> +
>  	cursor->surf_offset = intel_cursor_surf_offset;
>  
>  	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index 116c7faf3452..42153a79d97b 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -981,15 +981,17 @@ hsw_sprite_max_stride(struct intel_plane *plane,
>  	return min(8192 * cpp, 16 * 1024);
>  }
>  
> +static unsigned int vtd_sprite_min_alignment(struct intel_plane *plane,
> +					     const struct drm_framebuffer *fb,
> +					     int color_plane)
> +{
> +	return 128 * 1024;
> +}
> +
>  static unsigned int g4x_sprite_min_alignment(struct intel_plane *plane,
>  					     const struct drm_framebuffer *fb,
>  					     int color_plane)
>  {
> -	struct intel_display *display = to_intel_display(plane);
> -
> -	if (intel_scanout_needs_vtd_wa(display))
> -		return 128 * 1024;
> -
>  	return 4 * 1024;
>  }
>  
> @@ -1675,8 +1677,10 @@ intel_sprite_plane_create(struct intel_display *display,
>  		}
>  	}
>  
> -	if (intel_scanout_needs_vtd_wa(display))
> +	if (intel_scanout_needs_vtd_wa(display)) {
> +		plane->min_alignment = vtd_sprite_min_alignment;
>  		plane->vtd_guard = 64;
> +	}
>  
>  	if (display->platform.cherryview && pipe == PIPE_B) {
>  		supported_rotations =
> -- 
> 2.55.0
> 
