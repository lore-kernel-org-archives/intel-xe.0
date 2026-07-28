Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20A0C54EFC
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6C410E84E;
	Tue, 28 Jul 2026 09:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cY3iQaBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D029310E84E;
 Tue, 28 Jul 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785231723; x=1816767723;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q2gfabg0PWqFZ2RId/vUfubDR25oLnXAZV6rbXo2WLo=;
 b=cY3iQaBQxUL+HszKURriDbD0bOl9MN2JG3ngJ6BqtciH8FDfOi2mYiVt
 VglBDU8yppPDkb4xd8hgF8ICVzEWT9m19McTjkfzMakZuLZs+RISPQLfz
 GdZveLVyEqQWQd3Wh/uxmyqG82lOlXdSs8H08R1jRx6Zt9fp/HZokYs54
 gi2tQUITnskG3C41PR5vRvxweMe7LyAKy7+JURbB9eE/9oHhAFqgOSJeB
 vhkAUgkGINqJqzI1l06H7hjVCpS+271p2bXeBXBqdpSNjSCbU3EXIQUwa
 A/mehCB8RNIqsPkSEDEGqLukq90i6CSEkWmha6Gk9+jNSx21Jj9IS3r2z Q==;
X-CSE-ConnectionGUID: KIhpY/gLSUm0rjkHi8EHdg==
X-CSE-MsgGUID: Y1lUhnQNRGyGhivaSxmeFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108610198"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="108610198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:42:02 -0700
X-CSE-ConnectionGUID: d1lBSjYlTDWhNr1p42DJ8w==
X-CSE-MsgGUID: J9Mz2kA+TPWdQ2eph8EO9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="284201117"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:42:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
 capable sinks
In-Reply-To: <20260709113951.3557968-3-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
 <20260709113951.3557968-3-chaitanya.kumar.borah@intel.com>
Date: Tue, 28 Jul 2026 12:41:58 +0300
Message-ID: <2f89bdd9ac273191ea28665bc48314eb36444d27@intel.com>
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

On Thu, 09 Jul 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> Per DP 1.4a section 2.2.4.3, the MSA MISC1 VSC_SDP bit signals that
> the sink should defer colorimetry to the VSC SDP. It should only be set
> when the sink advertises DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED and a
> VSC SDP with pixel encoding/colorimetry payload will actually be sent.
>
> Fold the colorimetry_support check into intel_dp_needs_vsc_colorimetry()
> so both intel_ddi_set_dp_msa() and intel_dp_compute_vsc_sdp() share a
> single consistent gate.
>
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6

Who would teach Claude to add proper Fixes: and Cc: stable tags so
important fixes actually propagate to users in a timely fashion?

BR,
Jani.

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp.c  | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index c764472bd69a..13010375e21b 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -469,6 +469,8 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
>  	 * of Color Encoding Format and Content Color Gamut] while sending
>  	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1 fields
>  	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
> +	 * Only set the delegation bit when the content needs it and
> +	 * the sink advertises support.
>  	 */
>  	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state))
>  		temp |= DP_MSA_MISC_COLOR_VSC_SDP;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 93282694c29b..53688c5bef74 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3163,8 +3163,7 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>  {
>  	struct drm_dp_vsc_sdp *vsc;
>  
> -	if ((!intel_dp->colorimetry_support ||
> -	     !intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) &&
> +	if (!intel_dp_needs_vsc_colorimetry(crtc_state, conn_state) &&
>  	    !crtc_state->has_psr)
>  		return;
>  
> @@ -3173,7 +3172,6 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>  	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
>  	vsc->sdp_type = DP_SDP_VSC;
>  
> -	/* Needs colorimetry */
>  	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) {
>  		intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
>  						 vsc);
> @@ -5103,11 +5101,19 @@ bool
>  intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_state,
>  			       const struct drm_connector_state *conn_state)
>  {
> +	struct intel_dp *intel_dp =
> +		enc_to_intel_dp(to_intel_encoder(conn_state->best_encoder));
> +
>  	/*
>  	 * As per DP 1.4a spec section 2.2.4.3 [MSA Field for Indication
>  	 * of Color Encoding Format and Content Color Gamut], in order to
> -	 * sending YCBCR 420 or HDR BT.2020 signals we should use DP VSC SDP.
> +	 * send YCBCR 420 or HDR BT.2020 signals we should use DP VSC SDP.
> +	 * Only signal this when the sink advertises VSC SDP colorimetry
> +	 * support.
>  	 */
> +	if (!intel_dp->colorimetry_support)
> +		return false;
> +
>  	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>  		return true;

-- 
Jani Nikula, Intel
