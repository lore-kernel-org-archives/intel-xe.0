Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6B5606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoSiEVWn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F366B10FD80;
	Thu, 26 Nov 2026 12:12:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882EA10FD80;
 Thu, 26 Nov 2026 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795695160; x=1827231160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F6HUKQ7jyfTgEI24/gHVUuD3Gaw/dj741/VRoH9kaIY=;
 b=SoSiEVWns4356mFlzl3IKEoAhJLSsYUrzvGvmKsHmypu/BgMpM5c1ho/
 e5UkX6pYmCY+TCnPQy6n84+kfjE64pXUqQRtvQVBjOXA+KKthuomzuuLy
 5J0ffl67LQfIW+Yr8oWl67jis25BaCLQDDjpbPbR5nMEKxfRU2+hOkjEM
 rm4WIxufilW8JV4qjnLeXXm1FXljDR2mn1Q0WX4EysiDWRopU1VizV+U6
 4qgSgd16r1gEMAqD0l4BR/vZ3frI62q7juTDHxtPo8BZGc+ckiWUHfwiv
 o2bFl2cz3LO3H2/WZc/ZJje276f2SrSQeBdVqOGHOlmzlQxwnuVcouRl1 A==;
X-CSE-ConnectionGUID: sXPm/HsMReWlzuN5PTuOEA==
X-CSE-MsgGUID: 14bS9nG5QrCZMU1/dEgRag==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4688125"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4688125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:12:39 -0800
X-CSE-ConnectionGUID: ChgYRR/qSx26BVcy6SNjaQ==
X-CSE-MsgGUID: Rs+Pw1X4Qx6fQQz2yv/8/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12456950"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:12:37 -0800
Date: Thu, 26 Nov 2026 14:12:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] Revert "drm/i915/cdclk: Deal with 2 PPC hscale
 issues when calculating min CDCLK"
Message-ID: <awgiMrUUq4h8wc9M@intel.com>
References: <20261126121827.1951200-1-uma.shankar@intel.com>
 <20261126121827.1951200-2-uma.shankar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126121827.1951200-2-uma.shankar@intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 05:48:26PM +0530, Uma Shankar wrote:
> This reverts commit f69946f6d891aca1614233573741543b3bab4e6a.
> 
> The empirical "double the entire fractional part of hscale and
> multiply by vscale" formula overestimates the min CDCLK. Bspec now
> documents the actual 2 PPC downscale formula, which will be
> implemented in a follow-up patch.

Why are you reverting this and then adding it back? Just add the
min() to the existing thing?

> 
> Conflicts resolved against the later GMCH pfit rework: the shared
> intel_crtc_compute_pixel_rate() now simply uses the pipe pixel rate
> as the CDCLK pixel rate again. GMCH platforms are 1 PPC, so nothing
> changes for them.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 27 +--------
>  drivers/gpu/drm/i915/display/intel_plane.c    | 55 -------------------
>  drivers/gpu/drm/i915/display/intel_plane.h    |  5 --
>  .../drm/i915/display/skl_universal_plane.c    |  6 +-
>  4 files changed, 4 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 19caae633d29..3235bcbbf054 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2283,30 +2283,6 @@ intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
>  				   pixel_rate);
>  }
>  
> -static unsigned int
> -intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
> -	unsigned int ppc = HAS_2PPC(display) ? 2 : 1;
> -	struct drm_rect src;
> -
> -	/*
> -	 * We only use IF-ID interlacing. If we ever use
> -	 * PF-ID we'll need to adjust the pixel_rate here.
> -	 */
> -
> -	if (!crtc_state->pfit.enabled)
> -		return pixel_rate;
> -
> -	drm_rect_init(&src, 0, 0,
> -		      drm_rect_width(&crtc_state->pipe_src) << 16,
> -		      drm_rect_height(&crtc_state->pipe_src) << 16);
> -
> -	return intel_adjusted_rate_cdclk(&src, &crtc_state->pfit.dst,
> -					 pixel_rate, ppc);
> -}
> -
>  static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
>  					 const struct drm_display_mode *timings)
>  {
> @@ -2332,8 +2308,7 @@ static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
>  {
>  	crtc_state->pixel_rate =
>  		intel_pipe_pixel_rate(crtc_state);
> -	crtc_state->pixel_rate_cdclk =
> -		intel_pipe_pixel_rate_cdclk(crtc_state);
> +	crtc_state->pixel_rate_cdclk = crtc_state->pixel_rate;
>  }
>  
>  static void intel_joiner_adjust_timings(const struct intel_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index d23de0f34e4b..82dcb1d87b5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -265,50 +265,6 @@ unsigned int intel_adjusted_rate(const struct drm_rect *src,
>  				dst_w * dst_h);
>  }
>  
> -static unsigned int hscale_cdclk(const struct drm_rect *src,
> -				 const struct drm_rect *dst,
> -				 unsigned int ppc)
> -{
> -	unsigned int hscale;
> -
> -	hscale = drm_rect_calc_hscale(src, dst, 0, INT_MAX);
> -	hscale = max(hscale, 0x10000);
> -
> -	/*
> -	 * Double the fractional part due to some 2 PPC granularity issue
> -	 *
> -	 * FIXME: BSpec calls for doubling only the <0.5 fractional part,
> -	 * and rounding it down to a unit fraction. In practice that is
> -	 * not sufficient, and we need a more aggressive CDCLK bump in
> -	 * many cases. The updated formula was derived empirically.
> -	 * This may need to be updated once we have better undestading
> -	 * of what's happening in the hardware...
> -	 */
> -	return (hscale & ~0xffff) + ppc * (hscale & 0xffff);
> -}
> -
> -static unsigned int vscale_cdclk(const struct drm_rect *src,
> -				 const struct drm_rect *dst)
> -{
> -	unsigned int vscale;
> -
> -	vscale = drm_rect_calc_vscale(src, dst, 0, INT_MAX);
> -	vscale = max(vscale, 0x10000);
> -
> -	return vscale;
> -}
> -
> -unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
> -				       const struct drm_rect *dst,
> -				       unsigned int rate,
> -				       unsigned int ppc)
> -{
> -	unsigned int hscale = hscale_cdclk(src, dst, ppc);
> -	unsigned int vscale = vscale_cdclk(src, dst);
> -
> -	return DIV64_U64_ROUND_UP((u64)rate * hscale * vscale, 1ull << 32);
> -}
> -
>  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
>  				    const struct intel_plane_state *plane_state)
>  {
> @@ -329,17 +285,6 @@ unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
>  				   crtc_state->pixel_rate);
>  }
>  
> -unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
> -					  const struct intel_plane_state *plane_state)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -	unsigned int ppc = HAS_2PPC(display) ? 2 : 1;
> -
> -	return intel_adjusted_rate_cdclk(&plane_state->uapi.src,
> -					 &plane_state->uapi.dst,
> -					 crtc_state->pixel_rate_cdclk, ppc);
> -}
> -
>  unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc_state,
>  				   const struct intel_plane_state *plane_state,
>  				   int color_plane)
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm/i915/display/intel_plane.h
> index dba2be24aae2..31a6229aea73 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.h
> +++ b/drivers/gpu/drm/i915/display/intel_plane.h
> @@ -29,13 +29,8 @@ bool intel_plane_can_async_flip(struct intel_plane *plane,
>  unsigned int intel_adjusted_rate(const struct drm_rect *src,
>  				 const struct drm_rect *dst,
>  				 unsigned int rate);
> -unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
> -				       const struct drm_rect *dst,
> -				       unsigned int rate, unsigned int ppc);
>  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
>  				    const struct intel_plane_state *plane_state);
> -unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
> -					  const struct intel_plane_state *plane_state);
>  
>  unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc_state,
>  				   const struct intel_plane_state *plane_state,
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index def4798f8502..4cd868d11ad6 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -267,7 +267,7 @@ bool icl_is_hdr_plane(struct intel_display *display, enum plane_id plane_id)
>  static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
>  			       const struct intel_plane_state *plane_state)
>  {
> -	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
> +	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
>  
>  	/* two pixels per clock */
>  	return DIV_ROUND_UP(pixel_rate, 2);
> @@ -291,7 +291,7 @@ glk_plane_ratio(const struct intel_plane_state *plane_state,
>  static int glk_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
>  			       const struct intel_plane_state *plane_state)
>  {
> -	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
> +	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
>  	unsigned int num, den;
>  
>  	glk_plane_ratio(plane_state, &num, &den);
> @@ -318,7 +318,7 @@ skl_plane_ratio(const struct intel_plane_state *plane_state,
>  static int skl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
>  			       const struct intel_plane_state *plane_state)
>  {
> -	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
> +	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
>  	unsigned int num, den;
>  
>  	skl_plane_ratio(plane_state, &num, &den);
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
