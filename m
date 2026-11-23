Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C471A606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NDqDa6f0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E3C10E79A;
	Mon, 23 Nov 2026 10:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF510E79A;
 Mon, 23 Nov 2026 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795428071; x=1826964071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8D5XPmApNOj0e/WSTMUuq+fLTR6DnrklMLHo9Vq9Iqc=;
 b=NDqDa6f0KMCsvDl3/Rv3KxBdUMMv693Kc5v+qC8LH7CjVpEyiLvxZTTi
 xySMigkrB4p2bwhSqpyJXhMqO+aiZ+z+rIUI1Z4G+yW4ss1IC7OvqrjZB
 f3AS+6b4cUNYqAZWv7sbmJnIWhIZzCulRtuRTf8aDDGG3SA3b2FtiUviB
 0nslgRKQhh7sEt4VJmkwStHGPDpep9D0yS28lJfrZ9KA5e8d3VdRx9zNR
 wLa2Ra+j8hiTPTmTuKne4Pe/h5ywNhfeV8op36WOad7rR8b3H0frb826U
 0KatjxclbpXdPHytJWMkvjs1bmkrQqJ5NZ0EQsb/DEsntt51OVnM90D79 A==;
X-CSE-ConnectionGUID: oN3NfXaGTraR8V90DDACSA==
X-CSE-MsgGUID: cJ+prBF/Swuvd+f346/mjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4280449"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4280449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:01:10 -0800
X-CSE-ConnectionGUID: wzY+wQwYSMWgp6Psxo95MQ==
X-CSE-MsgGUID: BbTTku51Qk+WAs2DzdztbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11815497"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:01:08 -0800
Date: Mon, 23 Nov 2026 12:01:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: Re: [PATCH v2] drm/i915/color: Program the 3D LUT on the plane's own
 pipe with joiner
Message-ID: <awQO4Lln7Y1YQQ6d@intel.com>
References: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
 <20261123090251.934904-1-chaitanya.kumar.borah@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123090251.934904-1-chaitanya.kumar.borah@intel.com>
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

On Mon, Nov 23, 2026 at 02:32:51PM +0530, Chaitanya Kumar Borah wrote:
> With joiner, a secondary pipe plane gets its hw state from the primary
> pipe's plane, but its own uapi.crtc stays NULL. intel_color_load_3dlut()
> and intel_color_plane_commit_arm() take the CRTC from uapi.crtc, so they
> skip the secondary plane and its pipe's 3D LUT is never loaded or
> enabled, leaving that part of the screen without it.
> 
> Use hw.crtc, the CRTC the plane is actually on. The linked Y-plane of a
> planar YUV scanout also has hw.crtc set but no 3D LUT state of its own,
> so skip it in intel_color_plane_commit_arm() to keep it from clearing
> LUT_3D_CTL.
> 
> v2:
> - Correct the commit message (Sashiko)
> - Skip the linked Y-plane (Sashiko)
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Matthew Schwartz <matthew.schwartz@linux.dev>
> Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
> Matthew, the is_y_plane check is only needed to keep this patch
> regression free on its own: with hw.crtc the linked Y-plane would
> otherwise reach glk_lut_3d_commit() and clear LUT_3D_CTL. If you
> rebase your series on top of this patch, the check can be dropped in
> your patch 1 [1], since the owning-plane check there already skips
> the Y-plane, which is never PLANE_PRIMARY.
> 
> [1] https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwartz@linux.dev/
> 
>  drivers/gpu/drm/i915/display/intel_color.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 4070dc8d97d9..e5d40575aa95 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4278,7 +4278,11 @@ void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>  				  const struct intel_plane_state *plane_state)
>  {
>  	struct intel_display *display = to_intel_display(plane_state);
> -	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
> +
> +	/* The linked Y-plane has no 3D LUT state of its own */
> +	if (plane_state->is_y_plane)
> +		return;

I didn't think we exposed the 3D LUT property on anything but
one of the HDR planes?

>  
>  	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>  		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);

This is where the problem seems to be. Why is this not checking
that the plane is actually the one exposing the 3D LUT?

Also the 'crtc' NULL check looks completely pointless. This
shouldn't even be called for a disabled plane.

> @@ -4318,7 +4322,7 @@ intel_color_load_3dlut(struct intel_dsb *dsb,
>  		       const struct intel_plane_state *plane_state)
>  {
>  	struct intel_display *display = to_intel_display(plane_state);
> -	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
>  
>  	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>  		glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
