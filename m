Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56994C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0895110F952;
	Fri,  4 Sep 2026 08:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHekF9G7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150FE10F952;
 Fri,  4 Sep 2026 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788510540; x=1820046540;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BlrTCK6ZQaCyrQpoZH4Q9aCNtEX1OmszunUohAXOplA=;
 b=gHekF9G7UL4aGQN9uPj0eHaWlwJXssx1clHbUESe9UjW9MyqcyvqxWgD
 9iAfPmp1u62wikdtVFe/cyPp5RopKsFReyN7dYl9j2/Lw+GoH/W4g8DkD
 aZoHIgIifTzeU1Tlp1PrCz+IiFSlgZpuzVEDc47ywnk2ZJFMSO8lumAYi
 2BQROLiW2oKJcoxUwnOOEwAoh9SivJ8dHapxbiBkqK+VH+lV3ShgI1Yg6
 FWfUTT1hEtHa+/ibK0H4QSEMSciLUapTc4+Nqy3C6R2liOYGxUriHYt5v
 /db/ODaPlH4LbIPUrYt3dVa6ks9TeBJYzWqhNNOuVB/4oM2gnsNRfNDTB Q==;
X-CSE-ConnectionGUID: 1NLPl7x/SbaBhz4ISM9PgQ==
X-CSE-MsgGUID: q/caOj2GQk6qcm27JiX/2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92879116"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92879116"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:28:59 -0700
X-CSE-ConnectionGUID: Eaq0RUBhRJWVhnznHH0L4Q==
X-CSE-MsgGUID: lLVGkFmrSxC+5kTLb6iUyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="308194883"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.29])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:28:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH v1] drm/i915/display: Add command line param for DC balance
In-Reply-To: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Fri, 04 Sep 2026 11:28:55 +0300
Message-ID: <b9fa5fcc600b2a9b669d8e643d47dbb3a62c6036@intel.com>
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

On Fri, 28 Aug 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Add a new module parameter 'enable_dc_balance' to allow enabling or
> disabling the VRR DC balance feature at runtime. The DC balance
> computation in intel_vrr_dc_balance_compute_config() now honours this
> parameter, so the feature can be toggled without recompiling.

Why? Everything in the commit message above is obvious, and can be
trivially deduced from the code changes, but I'm none the wiser why this
change is needed.

Also, what's the specific need for this to be a module parameter? No new
module parameters should be added without strong justification. Could
this be a debugfs knob instead?

Module parameters are, as the name suggests, per module, not per device.


BR,
Jani.

>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
>  drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>  drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b09..ed3aa84c5d43 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr, int, 0400,
>  	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
>  	"Default: -1 (use per-chip default)");
>  
> +intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
> +	"Enable DC Balance (0=disabled, 1=enable). Default: 1 (use per-chip default)");
> +
>  intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
>  	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index b95ecf728daa..8c28c27e2c46 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -46,6 +46,7 @@ struct drm_printer;
>  	param(bool, enable_dp_mst, true, 0600) \
>  	param(int, enable_fbc, -1, 0600) \
>  	param(int, enable_psr, -1, 0600) \
> +	param(int, enable_dc_balance, false, 0600) \
>  	param(int, enable_panel_replay, -1, 0600) \
>  	param(bool, psr_safest_params, false, 0400) \
>  	param(bool, enable_psr2_sel_fetch, true, 0400) \
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e36db1174440..1698c54e258b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const struct intel_crtc_state *crtc_st
>  static void
>  intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
>  {
> +	struct intel_display *display = to_intel_display(crtc_state);
>  	int guardband_usec, adjustment_usec;
>  	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>  
> -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state->vrr.enable)
> +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
>  		return;
>  
>  	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;

-- 
Jani Nikula, Intel
