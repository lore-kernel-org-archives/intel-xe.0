Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ADE606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGTovxAk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790710F654;
	Tue, 10 Nov 2026 12:31:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BB310F654;
 Tue, 10 Nov 2026 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794313884; x=1825849884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8BHI0A1XIk/UhxQCu5Jn9xGpbdPnZfn02QIwMfiKjkE=;
 b=QGTovxAkEvwSC4Zyl7FiG5NMIzAi+PhZ4lMQxVVdFkVM5icTyQT1aTsv
 y8chBL6B27lRYAW//+thNT9KI+mLqLV7uA1ieFS3D46zKkK+NCEAlJt/N
 L2cbClcgChhxMefJ6Ui+/ydYE9U6nPOOOI5bXSL10vr612Eh5HUgQfP6Q
 XcBwkYVsI80wM38o6HbXddqStgMmpR8NpQ14Eq2ziQIcpeMYjycIdZm8n
 xeshyzEIEtSABY9BADmkvWsx844IyFq1VO655D9eO+iBbw5hBXIr/eL3b
 75D/jBWunFWa7pQVXKdgki9tAs/TLUoYYhZrRXOOjtpe9aCRnibIZJf6A w==;
X-CSE-ConnectionGUID: lElGpyqhQamnkzN7TOCPNQ==
X-CSE-MsgGUID: E+3h8/BhSaC8RS9/wOA2fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2963446"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2963446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:31:24 -0800
X-CSE-ConnectionGUID: 7PBwH+yUSQyED6R4Kpdh9w==
X-CSE-MsgGUID: GIp2pncLQ9yRoJi16emaLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8013265"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:31:23 -0800
Date: Tue, 10 Nov 2026 14:31:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/i915/bios: Parse eDP fast link training params
 only if enabled
Message-ID: <avMOl1UQ6kSCbROo@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
 <20261110115432.894616-3-shawn.c.lee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110115432.894616-3-shawn.c.lee@intel.com>
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

On Tue, Nov 10, 2026 at 11:54:30AM +0000, Lee Shawn C wrote:
> The VBT eDP fast link training params are parsed regardless of the
> per-panel fast link training enable bit (VBT 182+), which itself is not
> parsed. Parse the enable bit into panel->vbt.edp.fast_link_training and
> parse the params only if it is set.
> 
> VBT default fast link training lane count is 1, while hardly any
> eDP panel uses a single lane, so treat a lane count of 1 as not
> specified, like a rate of 0, leaving the selection to the driver.
> 
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c     | 34 +++++++++++++++++--
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 6b2924c56cae..378f8b60b4a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1448,6 +1448,12 @@ parse_edp_fast_link_params(struct intel_display *display,
>  	const struct edp_fast_link_params *edp_link_params =
>  		&edp->fast_link_params[panel_type];
>  
> +	if (display->vbt.version < 182 ||
> +	    !panel_bool(edp->fast_link_training, panel_type))
> +		return;
> +
> +	panel->vbt.edp.fast_link_training = true;
> +
>  	if (display->vbt.version >= 224) {
>  		panel->vbt.edp.rate =
>  			edp->edp_fast_link_training_rate[panel_type] * 20;
> @@ -1526,6 +1532,29 @@ parse_edp_fast_link_params(struct intel_display *display,
>  			    edp_link_params->vswing);
>  		break;
>  	}
> +
> +	/*
> +	 * The fast link training rate is limited by the eDP max port link
> +	 * rate: FLT rate = min(FLT rate, eDP max port link rate).
> +	 */
> +	if (panel->vbt.edp.rate && panel->vbt.edp.max_link_rate)
> +		panel->vbt.edp.rate = min(panel->vbt.edp.rate,
> +					  panel->vbt.edp.max_link_rate);

The Windows driver discards the fast link training parameters
if the rate exceeds the max.

It also requires DP_NO_AUX_HANDSHAKE_LINK_TRAINING. Without that
it will not use the fast link training parameters, even for a full
link training.

> +
> +	/*
> +	 * The VBT default fast link training lane count is 1, while hardly
> +	 * any eDP panel uses a single lane. Treat a lane count of 1 as not
> +	 * specified, leaving the lane count selection to the driver, the
> +	 * same way as a fast link training rate of 0.
> +	 */
> +	if (panel->vbt.edp.lanes == 1)
> +		panel->vbt.edp.lanes = 0;
> +
> +	drm_dbg_kms(display->drm,
> +		    "VBT eDP fast link training enabled: rate %d, lanes %d, vswing %d, pre-emphasis %d\n",
> +		    panel->vbt.edp.rate, panel->vbt.edp.lanes,
> +		    panel->vbt.edp.vswing >> DP_TRAIN_VOLTAGE_SWING_SHIFT,
> +		    panel->vbt.edp.preemphasis >> DP_TRAIN_PRE_EMPHASIS_SHIFT);
>  }
>  
>  static void
> @@ -1555,8 +1584,6 @@ parse_edp(struct intel_display *display,
>  	vbt_edp_to_pps_delays(&panel->vbt.edp.pps,
>  			      &edp->power_seqs[panel_type]);
>  
> -	parse_edp_fast_link_params(display, panel, edp);
> -
>  	if (display->vbt.version >= 173) {
>  		u8 vswing;
>  
> @@ -1577,6 +1604,9 @@ parse_edp(struct intel_display *display,
>  		panel->vbt.edp.max_link_rate =
>  			edp->edp_max_port_link_rate[panel_type] * 20;
>  
> +	/* Depends on max_link_rate */
> +	parse_edp_fast_link_params(display, panel, edp);
> +
>  	if (display->vbt.version >= 251)
>  		panel->vbt.edp.dsc_disable =
>  			panel_bool(edp->edp_dsc_disable, panel_type);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 90a5d29169c6..11f90ab1654c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -354,6 +354,7 @@ struct intel_vbt_panel_data {
>  		int bpp;
>  		struct intel_pps_delays pps;
>  		u8 drrs_msa_timing_delay;
> +		bool fast_link_training;
>  		bool low_vswing;
>  		bool hobl;
>  		bool dsc_disable;
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
