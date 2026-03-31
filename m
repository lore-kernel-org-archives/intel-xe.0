Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABD210F930F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 23:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9855410E51B;
	Tue, 31 Mar 2026 23:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLnqmyE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6310E51B;
 Tue, 31 Mar 2026 23:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775000126; x=1806536126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FINDbUCbiUUjpWYoiqbxyWVNiJVu6dF9vlN2As/4gq4=;
 b=iLnqmyE7KbvyBgADe5MtNUUzGazX05C4B72oLoEHPLm2c6EOMUPGpn8D
 1MUkWCC/8B4+2HB9k+Msu4JFUPqRNptqURoMwkwin4mBS31qJocXTBMQ/
 fnWMn0yGsTEwOYN8KlMTSg23jXMZChv2B0Jvk/bXc2NZzijY23gVPQhjh
 H6J7289TLkAgPJWVzuBYB9kgrfjqmDx3n+3uM68RqPUgnYlvXQpHBvLaJ
 Z4kDI5SLSpPMUCjXCxYnkG/rSSLMHsDpLOjMUD4+sgUHlNTmqxmKOdmek
 zacoRTjv/S1HkA0UCRBgOPG94Wmbh3SQ+N8TJr66mLWy4nCWjvRdmbtCI Q==;
X-CSE-ConnectionGUID: 7K1+ZAC3Sm2Qg2jhPJd7cw==
X-CSE-MsgGUID: HE0ulB4ZQIWcgQE9b3u9+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87104967"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="87104967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 16:35:25 -0700
X-CSE-ConnectionGUID: x0EknEaOS+mYAm0ZR5vuMw==
X-CSE-MsgGUID: Ro6DeeYySiK0wp0s8uNNAQ==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 16:35:23 -0700
Date: Wed, 1 Apr 2026 02:35:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com
Subject: Re: [PATCH] drm/i915/backlight: Remove try_vesa_interface
Message-ID: <acxaN8mUWjRue2lR@intel.com>
References: <20260224031322.2568874-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224031322.2568874-1-suraj.kandpal@intel.com>
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

On Tue, Feb 24, 2026 at 08:43:22AM +0530, Suraj Kandpal wrote:
> Remove try_vesa_interface. This is because we now make VESA Interface
> as a fallback mechanism for Panels which needs VESA DPCD AUX backlight
> mechanism to work but have a broken VBT indicating otherwise.
> While at in sneak in a small comment cleanup too.

This broke the backlight on my VLV chromebook.

 i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i915]] [CONNECTOR:98:eDP-1] Detected unsupported HDR backlight interface version 0
+i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i915]] [CONNECTOR:98:eDP-1] AUX Backlight Control Supported!
+i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i915]] [CONNECTOR:98:eDP-1] Using VESA eDP backlight controls
 i915 0000:00:02.0: [drm:intel_panel_init [i915]] [CONNECTOR:98:eDP-1] DRRS type: none
+i915 0000:00:02.0: [drm:drm_edp_backlight_init [drm_display_helper]] AUX C/DP C: Found backlight: aux_set=1 aux_enable=0 mode=1
+i915 0000:00:02.0: [drm:drm_edp_backlight_init [drm_display_helper]] AUX C/DP C: Backlight caps: level=1023/1023 pwm_freq_pre_divider=0 lsb_reg_used=1
+i915 0000:00:02.0: [drm:intel_dp_aux_vesa_setup_backlight [i915]] [CONNECTOR:98:eDP-1] AUX VESA backlight enable is controlled through PWM
+i915 0000:00:02.0: [drm:intel_dp_aux_vesa_setup_backlight [i915]] [CONNECTOR:98:eDP-1] AUX VESA backlight level is controlled through DPCD
 i915 0000:00:02.0: [drm:vlv_setup_backlight [i915]] [CONNECTOR:98:eDP-1] Using native PWM for backlight control (on pipe A)
-i915 0000:00:02.0: [drm:intel_backlight_setup [i915]] [CONNECTOR:98:eDP-1] backlight initialized, enabled, brightness 7812/7812
+i915 0000:00:02.0: [drm:intel_dp_aux_vesa_setup_backlight [i915]] [CONNECTOR:98:eDP-1] Using AUX VESA interface for backlight control
+i915 0000:00:02.0: [drm:intel_backlight_setup [i915]] [CONNECTOR:98:eDP-1] backlight initialized, disabled, brightness 1023/1023

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15679
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index eb05ef4bd9f6..a8e9872566cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -644,9 +644,10 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_device *dev = connector->base.dev;
>  	struct intel_panel *panel = &connector->panel;
> -	bool try_intel_interface = false, try_vesa_interface = false;
> +	bool try_intel_interface = false;
>  
> -	/* Check the VBT and user's module parameters to figure out which
> +	/*
> +	 * Check the VBT and user's module parameters to figure out which
>  	 * interfaces to probe
>  	 */
>  	switch (display->params.enable_dpcd_backlight) {
> @@ -655,7 +656,6 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	case INTEL_DP_AUX_BACKLIGHT_AUTO:
>  		switch (panel->vbt.backlight.type) {
>  		case INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE:
> -			try_vesa_interface = true;
>  			break;
>  		case INTEL_BACKLIGHT_DISPLAY_DDI:
>  			try_intel_interface = true;
> @@ -668,20 +668,12 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  		if (panel->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
>  			try_intel_interface = true;
>  
> -		try_vesa_interface = true;
> -		break;
> -	case INTEL_DP_AUX_BACKLIGHT_FORCE_VESA:
> -		try_vesa_interface = true;
>  		break;
>  	case INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL:
>  		try_intel_interface = true;
>  		break;
>  	}
>  
> -	/* For eDP 1.5 and above we are supposed to use VESA interface for brightness control */
> -	if (intel_dp->edp_dpcd[0] >= DP_EDP_15)
> -		try_vesa_interface = true;
> -
>  	/*
>  	 * Since Intel has their own backlight control interface, the majority of machines out there
>  	 * using DPCD backlight controls with Intel GPUs will be using this interface as opposed to
> @@ -694,6 +686,9 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	 * panel with Intel's OUI - which is also required for us to be able to detect Intel's
>  	 * backlight interface at all. This means that the only sensible way for us to detect both
>  	 * interfaces is to probe for Intel's first, and VESA's second.
> +	 *
> +	 * Also there is a chance some VBT's may advertise false Intel backlight support even if the
> +	 * tcon's DPCD says otherwise. This mean we keep VESA interface as fallback in that case.
>  	 */
>  	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector) &&
>  	    intel_dp->edp_dpcd[0] <= DP_EDP_14b) {
> @@ -703,7 +698,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  		return 0;
>  	}
>  
> -	if (try_vesa_interface && intel_dp_aux_supports_vesa_backlight(connector)) {
> +	if (intel_dp_aux_supports_vesa_backlight(connector)) {
>  		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using VESA eDP backlight controls\n",
>  			    connector->base.base.id, connector->base.name);
>  		panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
