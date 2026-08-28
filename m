Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F40C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 18:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8410E4B4;
	Fri, 28 Aug 2026 18:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNeCA44m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB1A10E4B4;
 Fri, 28 Aug 2026 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787942291; x=1819478291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0/ZiyGbExvWaPpDKnrb7bvuPjhi7hUiY8NGgg3OhjWk=;
 b=PNeCA44mnrzXMDlZfgi3Gs19Jmp3TGyEMvM9oRNEPS0Zn9MTKyKB7H7l
 u570dMh1CVRZZMr1in2I1gDT5HT8CQgx6PmbRnpL0TIdElKBr82ZoSqib
 pNUyM6WUcziTdwFj0MrntYH0yGCR6mAeAG0dsIWwxTEjmO9mTSO4KbbQa
 CsLr4AzNt6t39pEYy3opN1mKKzgKPBJkPIxm2g2vN+rFgRKjeRUsRoR+N
 l9ANCPdQtbCiGRMYYF2Qwj79L+w+brq2lWAykVmKJ84fPlSmQko1OvUo+
 AVo896zzTnCIbQ+ccNEuAOSDJ1jb0RCZKAPu65Ds+mkQZvUsQSx2YBbQa Q==;
X-CSE-ConnectionGUID: ZZKVaxTBRdGkLwYfymS6VA==
X-CSE-MsgGUID: YDB/oFcZRVOAqqfP3I1vXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99806753"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="99806753"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:38:10 -0700
X-CSE-ConnectionGUID: h9FPx/SXTVCeJZXOI9VrBg==
X-CSE-MsgGUID: j3U1S9vmRHiouQdXtYSSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="264991112"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.161])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:38:08 -0700
Date: Fri, 28 Aug 2026 21:38:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/display: Restrict flipq to simple
 single-plane updates
Message-ID: <apHVjiELFEoIfBM4@intel.com>
References: <20260807121540.2032283-1-mika.kahola@intel.com>
 <20260807121540.2032283-3-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807121540.2032283-3-mika.kahola@intel.com>
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

On Fri, Aug 07, 2026 at 12:15:39PM +0000, Mika Kahola wrote:
> Our flipq eligibility check is too loose: it still lets through
> commits that change the active/enabled plane mask, or need extra
> pipe/M-N/LRR/watermark programming. Those aren't simple queued plane
> updates and have no business going through flipq.
> 
> Found this chasing a CRC mismatch in kms_cursor_crc's
> cursor-alpha-opaque: a plane enable/disable commit slipped through
> flipq ahead of the plane-content commit the CRC actually checks.
> 
> Reject flipq for anything touching more than one plane, changing the
> active/enabled plane masks, or needing async flip, VRR, PSR, color,
> pipe, M/N, LRR or watermark updates. More conservative than strictly
> necessary in some cases, but better safe than racy.
> 
> Assisted-by: Copilot:claude-sonnet-5
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 53 +++++++++++++++++---
>  1 file changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 5cdaa59f005e..2483c031631c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7323,6 +7323,51 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
>  	}
>  }
>  
> +static bool intel_flipq_commit_is_eligible(struct intel_atomic_state *state,
> +					   struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(state);
> +	const struct intel_crtc_state *old_crtc_state =
> +		intel_atomic_get_old_crtc_state(state, crtc);
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
> +	if (!new_crtc_state->update_planes ||
> +	    !is_power_of_2(new_crtc_state->update_planes))
> +		return false;

The number of planes being updated doesn't matter.

> +
> +	if (new_crtc_state->do_async_flip ||
> +	    new_crtc_state->vrr.enable ||
> +	    new_crtc_state->has_psr)
> +		return false;
> +
> +	if (old_crtc_state->active_planes != new_crtc_state->active_planes ||
> +	    old_crtc_state->enabled_planes != new_crtc_state->enabled_planes)
> +		return false;

Enabling/disabling planes is perfectly fine.

> +
> +	/*
> +	 * Flipq is only suitable for simple queued single-plane updates
> +	 * that do not change plane topology and do not require additional
> +	 * pipe/timing/watermark programming.
> +	 */
> +	if (new_crtc_state->update_pipe ||
> +	    new_crtc_state->update_m_n ||
> +	    new_crtc_state->update_lrr ||
> +	    new_crtc_state->update_wm_pre ||
> +	    new_crtc_state->update_wm_post)

Those update_wm_* flags are just hacks for ancient platforms.
Not relevant here.

> +		return false;
> +
> +	return true;
> +}
> +
>  static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
>  				     struct intel_crtc *crtc)
>  {
> @@ -7338,13 +7383,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
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
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
