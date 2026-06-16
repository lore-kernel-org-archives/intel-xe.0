Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425F3CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 18:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E485D10E825;
	Tue, 16 Jun 2026 18:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4Y90BdL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10A10E824;
 Tue, 16 Jun 2026 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781632943; x=1813168943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=reqSrthhR38b2Nn14AwntR6mR0k+MdKlsn+oQwNcrnc=;
 b=P4Y90BdLX8sVvTKpX5NbVHNYFNnWeAdXvpLQ0QTQRuwcOGrMj0dywSeI
 c2Nas1+xXz3ezz4k6ilPRO1puP0gCSczQaUxd5ibYtMIRzp9CrpbZDd9O
 o6r+JCNt7JfL4aCDkWn09FMEozAGdL5PSXsvI9f6W5kHgWKtjlGWshD+E
 i1RQOaZpKst/z1JFat9R/zR8crUFehtpV0ZpNKVp9VQZDd6EGXTio0ywR
 pM1luZ2ZldushlK3KUW+66iu+6E3nawtolqc8GCUnnERBofS2ehFg5s51
 Y5cAbYy7vYCAyzkc4gaHGUIkGLegdtEn8qiJ2E/klIeEvsdoMoGX3O0g6 A==;
X-CSE-ConnectionGUID: OgROr0JuSEqr2tQToYkIhg==
X-CSE-MsgGUID: mzFT69ENTTq6YHZquISoXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81416837"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81416837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 11:02:23 -0700
X-CSE-ConnectionGUID: Ik8osjnETuihhc1Zu99ZCA==
X-CSE-MsgGUID: tEXFHTIRQvCF/roQyER5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252155685"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.15])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 11:02:21 -0700
Date: Tue, 16 Jun 2026 21:02:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915/dsb: Use safe window path when VRR TG is
 used
Message-ID: <ajGPqbOB6p3qkdxk@intel.com>
References: <20260608123711.1121908-1-ankit.k.nautiyal@intel.com>
 <20260608123711.1121908-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608123711.1121908-3-ankit.k.nautiyal@intel.com>
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

On Mon, Jun 08, 2026 at 06:07:10PM +0530, Ankit Nautiyal wrote:
> When the VRR timing generator is always used, the hardware behaves
> as VRR-active regardless of crtc_state->vrr.enable.
> 
> The DSB paths that depend on the VRR safe window therefore need to follow
> the VRR code paths in that case too:
> - dsb_chicken(): program the SAFE_WINDOW chicken bits,
> - intel_dsb_vblank_evade(): use vmin/vmax vblank starts for the
>   wait window,
> - intel_dsb_wait_for_delayed_vblank(): wait inside the vmin safe window
>   before the scanline-based delayed vblank wait.
> 
> Introduce helper pre_commit_use_safe_window() and use it in the three sites
> 
> v2: Instead of modifying pre_commit_is_vrr_active() use a new helper and
> use it only in the required places. (Ville).
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 07dd6318d9cc..d1441a86d1cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -210,6 +210,18 @@ static int dsb_scanline_to_hw(struct intel_atomic_state *state,
>  	return (scanline + vtotal - intel_crtc_scanline_offset(crtc_state)) % vtotal;
>  }
>  
> +static
> +bool pre_commit_use_safe_window(struct intel_atomic_state *state,
> +				struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc->base.dev);
> +
> +	if (intel_vrr_always_use_vrr_tg(display))
> +		return true;
> +
> +	return pre_commit_is_vrr_active(state, crtc);
> +}
> +
>  /*
>   * Bspec suggests that we should always set DSB_SKIP_WAITS_EN. We have approach
>   * different from what is explained in Bspec on how flip is considered being
> @@ -229,7 +241,7 @@ static u32 dsb_chicken(struct intel_atomic_state *state,
>  	u32 chicken = intel_psr_use_trans_push(new_crtc_state) ?
>  		DSB_SKIP_WAITS_EN : 0;
>  
> -	if (pre_commit_is_vrr_active(state, crtc))
> +	if (pre_commit_use_safe_window(state, crtc))
>  		chicken |= DSB_CTRL_WAIT_SAFE_WINDOW |
>  			DSB_CTRL_NO_WAIT_VBLANK |
>  			DSB_INST_WAIT_SAFE_WINDOW |
> @@ -759,7 +771,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
>  	if (crtc_state->has_psr)
>  		intel_dsb_emit_wait_dsl(dsb, DSB_OPCODE_WAIT_DSL_OUT, 0, 0);
>  
> -	if (pre_commit_is_vrr_active(state, crtc) && crtc_state->vrr.dc_balance.enable) {
> +	if (pre_commit_use_safe_window(state, crtc) && crtc_state->vrr.dc_balance.enable) {

This one I think should keep using pre_commit_is_vrr_active().

>  		int vblank_delay = crtc_state->set_context_latency;
>  		int vmin_vblank_start, vmax_vblank_start;
>  
> @@ -788,7 +800,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
>  		end = vmax_vblank_start;
>  		start = end - vblank_delay - latency;
>  		intel_dsb_wait_scanline_out(state, dsb, start, end);
> -	} else if (pre_commit_is_vrr_active(state, crtc)) {
> +	} else if (pre_commit_use_safe_window(state, crtc)) {
>  		int vblank_delay = crtc_state->set_context_latency;
>  
>  		end = intel_vrr_vmin_vblank_start(crtc_state);

This will now emit two WAIT_DSL commands, which may be a bit confusing.
Might be better to add a completely separate branch to the if ladder
for this situation. And for consistency it should perhaps use
intel_mode_vblank_start() rather than intel_vrr_*_vblank_start()
since we're dealing with fixed refresh rate timings here.

> @@ -891,7 +903,7 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
>  		&crtc_state->hw.adjusted_mode;
>  	int wait_scanlines;
>  
> -	if (pre_commit_is_vrr_active(state, crtc)) {
> +	if (pre_commit_use_safe_window(state, crtc)) {
>  		/*
>  		 * If the push happened before the vmin decision boundary
>  		 * we don't know how far we are from the undelayed vblank.
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
