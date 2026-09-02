Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F961C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 11:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0E310F13E;
	Wed,  2 Sep 2026 11:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OI1nua+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB43210E233;
 Wed,  2 Sep 2026 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788350378; x=1819886378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2QJcqAFjGRqvBk7BsBxJYhGFyHWlRG7HsqQX+yiC7J8=;
 b=OI1nua+CGcLBfktqZr4oX76e05i4FeNrqlBTMxZDhcERkZBjI6cbJ+M3
 9edB13H8LfJ0AsZGJyI5MV+zxZMxscrruE1m16oWb2IsRQrAxX3xg9doj
 tIK7LrNCdr94chXEPIXkL5aFrmYsyv13qk9YOgaCdobaHpjhRbQ73e97N
 nUE7v9/4Legx+PiAxMO1QKT3YMxM5XCMpNmOI9AZt3t0gp+us0QsWmQeG
 wSE0Glpwuz+DNon8+JrADSndx51wjyeFj9aNRHKEuEMgbQ6l+r8XGMeJv
 OfOF0NpGOtN380Ih1FovT84FZcruhAEM21NQ9HvyDWds+AHdoIMbKn9Cv g==;
X-CSE-ConnectionGUID: hocNg914SWm14gqi/6Xq5g==
X-CSE-MsgGUID: GcLRuINRQqGHEp3q25yT8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88835119"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88835119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:59:38 -0700
X-CSE-ConnectionGUID: X7GvM7QsR4e6sXaMYWGQvA==
X-CSE-MsgGUID: OBy+xsWbRPW9Z1AnXMqewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="294242167"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:59:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or
 timing changes
In-Reply-To: <20260902105448.809455-2-mika.kahola@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-2-mika.kahola@intel.com>
Date: Wed, 02 Sep 2026 14:59:33 +0300
Message-ID: <1a0861fec350345f6999e7f7d88561c0220b4e69@intel.com>
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

On Wed, 02 Sep 2026, Mika Kahola <mika.kahola@intel.com> wrote:
> Our flipq eligibility check let pipe, M/N and LRR changes through.
> Reject those too, alongside the existing async flip/VRR/PSR/color/
> modeset/fastset exclusions.

Why?

>
> v2:
> - Drop the single-plane restriction, plane count doesn't matter (Ville)
> - Drop the update_wm_pre/post check, dead code for flipq-capable hw (Ville)
> - Drop the active/enabled planes check (Ville)
>
> Assisted-by: Copilot:claude-sonnet-5
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 43 ++++++++++++++++----
>  1 file changed, 36 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 553c60d452dd..f4b76a9547e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7369,6 +7369,41 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
>  	}
>  }
>  
> +static bool intel_flipq_commit_is_eligible(struct intel_atomic_state *state,
> +					   struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(state);
> +	const struct intel_crtc_state *new_crtc_state =
> +		intel_atomic_get_new_crtc_state(state, crtc);
> +
> +	if (!intel_flipq_supported(display))
> +		return false;
> +
> +	if (intel_crtc_needs_modeset(new_crtc_state) ||
> +	    intel_crtc_needs_fastset(new_crtc_state) ||
> +	    intel_crtc_needs_color_update(new_crtc_state))
> +		return false;
> +
> +	if (!new_crtc_state->update_planes)
> +		return false;
> +
> +	if (new_crtc_state->do_async_flip ||
> +	    new_crtc_state->vrr.enable ||
> +	    new_crtc_state->has_psr)
> +		return false;
> +
> +	/*
> +	 * Flipq is only suitable for simple queued plane updates that do
> +	 * not require additional pipe or timing programming.
> +	 */
> +	if (new_crtc_state->update_pipe ||
> +	    new_crtc_state->update_m_n ||
> +	    new_crtc_state->update_lrr)
> +		return false;
> +
> +	return true;
> +}
> +
>  static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
>  				     struct intel_crtc *crtc)
>  {
> @@ -7384,13 +7419,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
>  
>  	/* FIXME deal with everything */
>  	new_crtc_state->use_flipq =
> -		intel_flipq_supported(display) &&
> -		!new_crtc_state->do_async_flip &&
> -		!new_crtc_state->vrr.enable &&
> -		!new_crtc_state->has_psr &&
> -		!intel_crtc_needs_modeset(new_crtc_state) &&
> -		!intel_crtc_needs_fastset(new_crtc_state) &&
> -		!intel_crtc_needs_color_update(new_crtc_state);
> +		intel_flipq_commit_is_eligible(state, crtc);
>  
>  	new_crtc_state->use_dsb =
>  		!new_crtc_state->use_flipq &&

-- 
Jani Nikula, Intel
