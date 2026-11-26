Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F14606A33C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfxGQsON
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F8110E96D;
	Thu, 26 Nov 2026 08:59:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ADC10E96D;
 Thu, 26 Nov 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795683543; x=1827219543;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XPQEQkZ7GdLfMWJF4w2jljfMyBZ8yKZ5rxptP/hlNTQ=;
 b=lfxGQsONO5M2Al/+HhQAtKkdpgQ5OlqVx2DGww+aAy4wOOZPf4htDVjt
 bnN81vGF8TONHOM0D56gYe63+77GeqMD/rVOByUwO1UCvjV4XyIxmWey1
 Iz8GKwvD1XYOgl0bS5NNy+PQx3qRBuFFP5WfWzTBSd9OkKaBdROi6VDOU
 ZnDaTtayGBXAw9pipFrOpajUWmY3H4UBmw1vVAiUhriIZJzSCQ0AOMAhA
 836apwjxytrd/wAIIbYdcJuOkl0bzyz0HsuLY53W/Zz1tfIHWLpQ/fddL
 qIaR4oIvE2WeOQ/tcTseH0BlJLYgonB9lLHjl4c1z4EF9e12SjvRoBlnE w==;
X-CSE-ConnectionGUID: dqENesRXR2GVdUYAuRvKqg==
X-CSE-MsgGUID: 2TF6sluURvSeXiDro/17nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4477787"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4477787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:59:02 -0800
X-CSE-ConnectionGUID: JFB+U5duRSWGov11aRoQpA==
X-CSE-MsgGUID: kOkQXG9PTsuYD7JO8l/+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12268691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:58:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 10/15] drm/i915/vrr: Split out setting the guardband
In-Reply-To: <20261126063459.863698-11-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-11-suraj.kandpal@intel.com>
Date: Thu, 26 Nov 2026 10:58:57 +0200
Message-ID: <5c3107ba9fadff86183457e3d98e630b381a7ba7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 26 Nov 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Move setting the VRR guardband, and the vblank start and pipeline
> full derived from it, out of intel_vrr_compute_guardband() into a
> new intel_vrr_guardband_val(). Pipelock is going to use it to raise
> the guardband of a tile to match the other tiles in its group.
>
> No functional change.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 30 +++++++++++++++---------
>  drivers/gpu/drm/i915/display/intel_vrr.h |  1 +
>  2 files changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 47603c141298..ad88034c23f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -620,22 +620,13 @@ static bool intel_vrr_use_optimized_guardband(const struct intel_crtc_state *crt
>  	return true;
>  }
>  
> -void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
> +void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int guardband)

What does intel_vrr_guardband_val() mean?

I mean I don't actually want you to explain it to me, but think about
it, and compare with what the function *does*, and ask yourself if the
name describes the function.

It's a non-static function. It better have a good name. This one doesn't
say anything about what it does.

>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
>  	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>  	struct drm_display_mode *pipe_mode = &crtc_state->hw.pipe_mode;
> -	int guardband;
>  
> -	if (!intel_vrr_possible(crtc_state))
> -		return;
> -
> -	if (intel_vrr_use_optimized_guardband(crtc_state))
> -		guardband = intel_vrr_compute_optimized_guardband(crtc_state);
> -	else
> -		guardband = crtc_state->vrr.vmin - adjusted_mode->crtc_vdisplay;
> -
> -	crtc_state->vrr.guardband = min(guardband, intel_vrr_max_guardband(crtc_state));
> +	crtc_state->vrr.guardband = guardband;
>  
>  	if (intel_vrr_always_use_vrr_tg(display)) {
>  		adjusted_mode->crtc_vblank_start  =
> @@ -654,6 +645,23 @@ void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
>  							     crtc_state->vrr.guardband);
>  }
>  
> +void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
> +{
> +	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	int guardband;
> +
> +	if (!intel_vrr_possible(crtc_state))
> +		return;
> +
> +	if (intel_vrr_use_optimized_guardband(crtc_state))
> +		guardband = intel_vrr_compute_optimized_guardband(crtc_state);
> +	else
> +		guardband = crtc_state->vrr.vmin - adjusted_mode->crtc_vdisplay;
> +
> +	intel_vrr_guardband_val(crtc_state,
> +				min(guardband, intel_vrr_max_guardband(crtc_state)));
> +}
> +
>  static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 19c7990be1b2..225e2607c9df 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -24,6 +24,7 @@ void intel_vrr_check_modeset(struct intel_atomic_state *state);
>  void intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>  			      struct drm_connector_state *conn_state);
>  void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state);
> +void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int guardband);
>  void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state);
>  void intel_vrr_enable(const struct intel_crtc_state *crtc_state);
>  void intel_vrr_send_push(struct intel_dsb *dsb,

-- 
Jani Nikula, Intel
