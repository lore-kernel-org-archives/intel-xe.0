Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8FC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 07:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737EC10E48F;
	Wed, 16 Sep 2026 07:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjCUc+sk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115C010E48F;
 Wed, 16 Sep 2026 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789543585; x=1821079585;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kC65slVluORbV0jyQyp6DxGmvA1yF90ZT7xXWIZ7QWo=;
 b=kjCUc+skq6u95oCzsDmXz1+ulvhh7N9FlV60mXMpOrXWWo8T8tugAyGi
 cXGI67AnvQKmryx7ChQWu3fwYRAQ4aur8Fsd+ODYr+n1wbL529np+xzGy
 z2D2tdY5xSKoQdtRP1JdWQchpGZHsK3ydMLNLir8SDY3FPVrYXdGWtNH4
 +gnwhLCXs1KJVwpa3XZo0/VOy5dr5hMa/8V7QZo0u6eMz1R/PzE/K2Sx/
 PANGxfDjCvVIl+4XbTmTdTEYPdGZRY7/mkBIWmECgWAbYHsfCvxuv88nn
 UkXTx7n4+rJndvsLeJL78f+R9sjfqpHlCqeI7UfyKM9Un5j2n1hjpKPDu w==;
X-CSE-ConnectionGUID: eOt3FyoMSyy24VQQF3JlNw==
X-CSE-MsgGUID: UmfoYPyVRPOqTkbzjj09QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93786408"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93786408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:26:24 -0700
X-CSE-ConnectionGUID: 6eSLNF8iQImz925g4LXZZg==
X-CSE-MsgGUID: 9Gm+npnsQcqYHR0U72wM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="303143486"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:26:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH v2] drm/i915/display: Add command line param for DC balance
In-Reply-To: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Wed, 16 Sep 2026 10:26:20 +0300
Message-ID: <cc91cacab48c7134647a12da0bfb8c3832e2fc5b@intel.com>
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

On Tue, 15 Sep 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Add an 'enable_dc_balance' display module parameter, disabled by
> default, so the feature can be explicitly opted in at driver
> initialization on configurations where it is known to be beneficial,
> while preserving existing behaviour everywhere else.
> intel_vrr_dc_balance_compute_config() honours the parameter, so no
> recompilation is needed to try the feature.

How does this preserve existing behaviour? This disables DC balance by
default. Why?

What are you trying to do? What is the goal?

We shouldn't be adding module parameters to begin with, and the *only*
reason for adding them is *debugging* only. Nothing else.

"feature can be explicitly opted in" is *not* what we use module
parameters for at all.


BR,
Jani.


>
> --v2:
> - Make enable_dc_balance a bool and keep it disabled by default; fix the
>   parameter type/value mismatch and correct the description (Chaitanya
>   Kumar Borah, Jani Nikula)
> - Explain in the commit message why the feature is gated and why a
>   module parameter is used (Jani Nikula)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_params.c | 4 ++++
>  drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>  drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b090..ca0ef466bb103 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -120,6 +120,10 @@ intel_display_param_named_unsafe(enable_psr, int, 0400,
>  	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
>  	"Default: -1 (use per-chip default)");
>  
> +intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
> +	"Enable VRR DC balance (0=disabled, 1=enabled). "
> +	"Default: 0 (disabled)");
> +
>  intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
>  	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index ba01aeaf89440..5c5a1a1358c32 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -46,6 +46,7 @@ struct drm_printer;
>  	param(bool, enable_dp_mst, true, 0600) \
>  	param(int, enable_fbc, -1, 0600) \
>  	param(int, enable_psr, -1, 0600) \
> +	param(bool, enable_dc_balance, false, 0600) \
>  	param(int, enable_panel_replay, -1, 0600) \
>  	param(bool, psr_safest_params, false, 0400) \
>  	param(bool, enable_psr2_sel_fetch, true, 0400) \
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e36db11744405..1698c54e258b4 100644
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
