Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9971C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E17710E793;
	Mon,  7 Sep 2026 11:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5uWyfXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C9F10E7A3;
 Mon,  7 Sep 2026 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788780515; x=1820316515;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=l/yWMAMI21Q4gtSWkAibE/wwztOQ+Avvfz+SCWiIAyU=;
 b=H5uWyfXahMdD4JIJC8FmMLp+TdvXtOUI0mpeyPObjx+SFJ0T8WtsW8bQ
 CQ2ajfrlZW3CeGt3qCdo06ZhtZc3gFWZ3LDuR9qcH7GuLHtyPdRyf3u27
 exodiqHkA/l3W61NtQ9WmqW6GAssqikXgQ/WYGTNjQjPv7621N9o7yND5
 sSueNzSEAZdP9NshJGF7Pfh/CGNGgVenHHAKWczS1II6syCSZJcUYbTXj
 wPbMc+MBMRzZ04rim9x5/jgTr+MUsqMAo3ImEANayYKSKPtFm5UPzc39n
 MDvoDT4xPrREznz0ki1KEgAnTZeFtuAkh/oGffUQ6szivgSAy009Sz8Ln w==;
X-CSE-ConnectionGUID: WycSXGD7TKK198EVRFCIBw==
X-CSE-MsgGUID: tYKF25VHQdGNmxnoMKGYEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="114724899"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="114724899"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:28:35 -0700
X-CSE-ConnectionGUID: bO+xg8WiRcySi0bIZco/0A==
X-CSE-MsgGUID: T3bNql4YTeucURFAvxk7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270152909"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:28:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Austin Hu <austin.hu@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com
Subject: Re: [PATCH v2 2/2] drm/i915/fbc: nuke CFB if Plane setting (except
 for surf addr) changes
In-Reply-To: <20260825165629.1799744-3-austin.hu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260825165629.1799744-3-austin.hu@intel.com>
Date: Mon, 07 Sep 2026 14:28:30 +0300
Message-ID: <d1b5683c79e704f5fbf9d00b07b9ff8bfa1af40b@intel.com>
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

On Tue, 25 Aug 2026, Austin Hu <austin.hu@intel.com> wrote:
> When FBC Dirty Rectangle mode is enabled, any non-PLANE_SURF register
> update requires fetching the full plane frame buffer from memory to
> re-compress and update the CFB in stolen memory.
>
> Check plane state attributes during atomic commits and force a full
> CFB nuke if any setting other than the surface address changes.

Please don't combine movement and functional changes in the same patch.

>
> ---
> v2:
>  - Address reviewer feedback to reuse intel_fbc_can_flip_nuke().
> ---
> Signed-off-by: Austin Hu <austin.hu@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 155 ++++++++++++++++-------
>  1 file changed, 106 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index c0fed695af0d..34c0e42dfdab 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1516,11 +1516,106 @@ static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
>  		intel_fbc_is_cfb_ok(plane_state);
>  }
>  
> +static bool intel_fbc_can_flip_nuke(struct intel_atomic_state *state,
> +				    struct intel_crtc *crtc,
> +				    struct intel_plane *plane)
> +{
> +	struct intel_display *display = to_intel_display(state);
> +	const struct intel_crtc_state *new_crtc_state =
> +		intel_atomic_get_new_crtc_state(state, crtc);
> +	const struct intel_plane_state *old_plane_state =
> +		intel_atomic_get_old_plane_state(state, plane);
> +	const struct intel_plane_state *new_plane_state =
> +		intel_atomic_get_new_plane_state(state, plane);
> +	const struct drm_framebuffer *old_fb = old_plane_state->hw.fb;
> +	const struct drm_framebuffer *new_fb = new_plane_state->hw.fb;
> +
> +	if (intel_crtc_needs_modeset(new_crtc_state))
> +		return false;
> +
> +	if (!intel_fbc_is_ok(old_plane_state) ||
> +	    !intel_fbc_is_ok(new_plane_state))
> +		return false;
> +
> +	if (old_fb->format->format != new_fb->format->format)
> +		return false;
> +
> +	if (old_fb->modifier != new_fb->modifier)
> +		return false;
> +
> +	if (intel_fbc_plane_stride(old_plane_state) !=
> +	    intel_fbc_plane_stride(new_plane_state))
> +		return false;
> +
> +	if (intel_fbc_cfb_stride(old_plane_state) !=
> +	    intel_fbc_cfb_stride(new_plane_state))
> +		return false;
> +
> +	if (intel_fbc_cfb_size(old_plane_state) !=
> +	    intel_fbc_cfb_size(new_plane_state))
> +		return false;
> +
> +	if (intel_fbc_override_cfb_stride(old_plane_state) !=
> +	    intel_fbc_override_cfb_stride(new_plane_state))
> +		return false;
> +
> +	if (!HAS_FBC_DIRTY_RECT(display))
> +		return true;
> +
> +	/*
> +	 * From BSpec about "FBC Dirty Rectangle", when Dirty Rectangle mode is
> +	 * active, partial updates only apply to surface address changes. Any other
> +	 * plane state modification requires Plane to fetch full-plane pixel data
> +	 * from memory to re-compress and update the entire CFB in stolen memory.
> +	 * Once fully re-compressed, subsequent atomic commits go ahead with FBC
> +	 * dirty rectangle updates for smooth visual updates.
> +	 *
> +	 * So check other Plane attribute changed except for its surface address by
> +	 * referring to intel_async_flip_check_hw() which also checks async flip.
> +	 */
> +
> +	/* Includes pixel_blend_mode, color_encoding & color_range checking. */
> +	if (old_plane_state->color_ctl != new_plane_state->color_ctl)
> +		return false;
> +
> +	if (!drm_rect_equals(&old_plane_state->uapi.src,
> +			     &new_plane_state->uapi.src) ||
> +	    !drm_rect_equals(&old_plane_state->uapi.dst,
> +			     &new_plane_state->uapi.dst))
> +		return false;
> +
> +	if ((old_plane_state->view.color_plane[0].x !=
> +	    new_plane_state->view.color_plane[0].x) ||
> +	    (old_plane_state->view.color_plane[0].y !=
> +	    new_plane_state->view.color_plane[0].y))
> +		return false;
> +
> +	if (old_plane_state->hw.rotation != new_plane_state->hw.rotation)
> +		return false;
> +
> +	if (old_plane_state->hw.alpha != new_plane_state->hw.alpha)
> +		return false;
> +
> +	if (skl_plane_aux_dist(old_plane_state, 0) !=
> +	    skl_plane_aux_dist(new_plane_state, 0))
> +		return false;
> +
> +	if (old_plane_state->decrypt != new_plane_state->decrypt)
> +		return false;
> +
> +	if (old_plane_state->cus_ctl != new_plane_state->cus_ctl)
> +		return false;
> +
> +	return true;
> +}
> +
>  static void
> -__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
> +__intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
> +			       const struct intel_plane_state *plane_state,
>  			       const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>  	struct intel_display *display = to_intel_display(plane_state);
>  	struct intel_fbc *fbc = plane->fbc;
>  	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
> @@ -1538,7 +1633,15 @@ __intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
>  		return;
>  	}
>  
> -	if (drm_rect_visible(damage)) {
> +	if (!intel_fbc_can_flip_nuke(state, crtc, plane)) {
> +		if (HAS_FBC_DIRTY_RECT(display))
> +			drm_dbg_kms(display->drm,
> +				    "[PLANE:%d:%s] Non surf addr changed for FBC DIRTY RECT\n",
> +				    plane->base.base.id, plane->base.name);
> +
> +		/* compress the entire region due to non PLANE_SURF updating. */
> +		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, height);
> +	} else if (drm_rect_visible(damage)) {
>  		int y1, y2;
>  
>  		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {
> @@ -1598,8 +1701,7 @@ intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
>  		mutex_lock(&fbc->lock);
>  
>  		if (fbc->state.plane == plane)
> -			__intel_fbc_prepare_dirty_rect(plane_state,
> -						       crtc_state);
> +			__intel_fbc_prepare_dirty_rect(state, plane_state, crtc_state);
>  
>  		mutex_unlock(&fbc->lock);
>  	}
> @@ -1798,51 +1900,6 @@ int intel_fbc_min_cdclk(const struct intel_crtc_state *crtc_state)
>  	return min_cdclk;
>  }
>  
> -static bool intel_fbc_can_flip_nuke(struct intel_atomic_state *state,
> -				    struct intel_crtc *crtc,
> -				    struct intel_plane *plane)
> -{
> -	const struct intel_crtc_state *new_crtc_state =
> -		intel_atomic_get_new_crtc_state(state, crtc);
> -	const struct intel_plane_state *old_plane_state =
> -		intel_atomic_get_old_plane_state(state, plane);
> -	const struct intel_plane_state *new_plane_state =
> -		intel_atomic_get_new_plane_state(state, plane);
> -	const struct drm_framebuffer *old_fb = old_plane_state->hw.fb;
> -	const struct drm_framebuffer *new_fb = new_plane_state->hw.fb;
> -
> -	if (intel_crtc_needs_modeset(new_crtc_state))
> -		return false;
> -
> -	if (!intel_fbc_is_ok(old_plane_state) ||
> -	    !intel_fbc_is_ok(new_plane_state))
> -		return false;
> -
> -	if (old_fb->format->format != new_fb->format->format)
> -		return false;
> -
> -	if (old_fb->modifier != new_fb->modifier)
> -		return false;
> -
> -	if (intel_fbc_plane_stride(old_plane_state) !=
> -	    intel_fbc_plane_stride(new_plane_state))
> -		return false;
> -
> -	if (intel_fbc_cfb_stride(old_plane_state) !=
> -	    intel_fbc_cfb_stride(new_plane_state))
> -		return false;
> -
> -	if (intel_fbc_cfb_size(old_plane_state) !=
> -	    intel_fbc_cfb_size(new_plane_state))
> -		return false;
> -
> -	if (intel_fbc_override_cfb_stride(old_plane_state) !=
> -	    intel_fbc_override_cfb_stride(new_plane_state))
> -		return false;
> -
> -	return true;
> -}
> -
>  static bool __intel_fbc_pre_update(struct intel_atomic_state *state,
>  				   struct intel_crtc *crtc,
>  				   struct intel_plane *plane)

-- 
Jani Nikula, Intel
