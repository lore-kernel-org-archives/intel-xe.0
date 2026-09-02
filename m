Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE1FC624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3C910E4D0;
	Wed,  2 Sep 2026 12:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNHv6Qa2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8ED10E4D0;
 Wed,  2 Sep 2026 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352052; x=1819888052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lCIV5q6rgc2NWTjbN4/x14nhUptPcrH1fpH6QTblKQU=;
 b=cNHv6Qa2H4QBP9ur+qUjKa9tqC0IHBG3VVD89xDlh6zeYB9LL2kw6MKe
 J2XIHK/19KvGKWj1TI75XhDjJmvxyXS3hY3uQtS46z6Q+47RJ0Dz23fLa
 i4av0bS1snYSQxcjbxCa6qhU9WUPD+vnhUryfAj91sQiCn4mybFeZevZr
 HsfPmg2mGWFejYbo7dw2clHsZV6AeqpD//WaK/jrS8xpLo9W3wuuBLkMg
 9ufDyIggNuBW1jpuHsKug3GEiKm96abZgNc/UyZmCz9cU4KMV6GgclZgw
 u6nycAelc6f4bkiw7EQcRXrdLA4IUSmktSYEm/yRe+YSEYLMiePbrI3S8 Q==;
X-CSE-ConnectionGUID: LOXHOCmTTxOQb8v3lpgSSA==
X-CSE-MsgGUID: 1jHhCokJRA+JxQYZF/nNkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88734740"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88734740"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:27:31 -0700
X-CSE-ConnectionGUID: xg1DS3izTPOCkTcxarIWlA==
X-CSE-MsgGUID: xTKRgjgETYOB5d7dCW0rHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="274657796"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.200])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:27:29 -0700
Date: Wed, 2 Sep 2026 15:27:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or timing
 changes
Message-ID: <apgWLiseQuBOrk70@intel.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-2-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902105448.809455-2-mika.kahola@intel.com>
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

On Wed, Sep 02, 2026 at 10:54:46AM +0000, Mika Kahola wrote:
> Our flipq eligibility check let pipe, M/N and LRR changes through.
> Reject those too, alongside the existing async flip/VRR/PSR/color/
> modeset/fastset exclusions.
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

Why?

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

That is all covered by intel_crtc_needs_fastset().

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
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
