Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51B606A329
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 12:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkVhVrnH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECBF10F6D6;
	Tue, 17 Nov 2026 12:57:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5F910F6AA;
 Tue, 17 Nov 2026 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794920218; x=1826456218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0ArNAx9ZZ+WflkQGczW+9rORkLuY614ZVoYhtXpHvX0=;
 b=DkVhVrnH4Wpwv8N245dcWE2QbHa/53Pt6lvpvX/XSCNXkdiHV02/wQWq
 GvlmUCfd6EY4EbeP9gtVeZatBF5FjtGyxN86f2jF4cdDxrl+qww+NiFsY
 u4/syv3Ggr/xfRey/+Vd/TvNf7fN8TPay2pcDY6w2duiqxhgU33EDLtzz
 8h46KgBrW0lvYaDtxuVCfQ6DwoX960JHh5aRLfaKQkcebtrpavp0qV+bb
 Hp3JqYkWq2N2FcryTVb5oEGPezCExfd0/LPxIt28ue8CYeYAr/1BJAsLj
 7UzOjf2N93KOWCbsxnwoy3xsRGs7gdJydkVpVcWQxS5Ki70TuQSPx01bl A==;
X-CSE-ConnectionGUID: xTk9lfagRkOJbDDAFVdBLw==
X-CSE-MsgGUID: tz5sW+geS26oHc/FodjjPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3554559"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3554559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:56:58 -0800
X-CSE-ConnectionGUID: +7zhPpcMQJi/qc/Z5nhW5g==
X-CSE-MsgGUID: BqcG9UdqRHmQAu8AVjF7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10152515"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:56:57 -0800
Date: Tue, 17 Nov 2026 14:56:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 uma.shankar@intel.com
Subject: Re: [PATCH] drm/i915/dp: Extend HDR mode to HLG
Message-ID: <avxPFH45alKwZBxj@intel.com>
References: <20261117104808.2023577-1-vidya.srinivas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117104808.2023577-1-vidya.srinivas@intel.com>
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

On Tue, Nov 17, 2026 at 04:18:07PM +0530, Vidya Srinivas wrote:
> intel_dp_in_hdr_mode() only recognizes the SMPTE ST 2084 (PQ) EOTF.
> Extend it to treat BT.2100 HLG as HDR.
> 
> The eDP HDR backlight interface in intel_dp_aux_backlight.c
> uses the same check, and its TCON can only decode ST 2084
> set INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE only for a PQ
> output and clear it otherwise, so that the panel doesn't decode HLG
> signal as PQ.

I can't parse that.

> 
> Suggested-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c               |  5 ++++-
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 +++++++++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ef164a797618..adaa8fb25732 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3388,17 +3388,20 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>  	}
>  }
>  
> +/* True for both HDR transfer functions, SMPTE ST 2084 (PQ) and BT.2100 HLG. */
>  bool
>  intel_dp_in_hdr_mode(const struct drm_connector_state *conn_state)
>  {
>  	struct hdr_output_metadata *hdr_metadata;
> +	u8 eotf;
>  
>  	if (!conn_state->hdr_output_metadata)
>  		return false;
>  
>  	hdr_metadata = conn_state->hdr_output_metadata->data;
> +	eotf = hdr_metadata->hdmi_metadata_type1.eotf;
>  
> -	return hdr_metadata->hdmi_metadata_type1.eotf == HDMI_EOTF_SMPTE_ST2084;
> +	return eotf == HDMI_EOTF_SMPTE_ST2084 || eotf == HDMI_EOTF_BT_2100_HLG;
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index dc2f0f3088a9..fa68cc6803a6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -284,8 +284,16 @@ intel_dp_aux_fill_hdr_tcon_params(const struct drm_connector_state *conn_state,
>  	 * HDR mode.
>  	 */
>  	if (intel_dp_in_hdr_mode(conn_state)) {
> +		const struct hdr_output_metadata *hdr_metadata =
> +			conn_state->hdr_output_metadata->data;
> +
>  		*ctrl |= INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE;
> -		*ctrl |= INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
> +
> +		/* The TCON can only decode SMPTE ST 2084 (PQ), not HLG. */
> +		if (hdr_metadata->hdmi_metadata_type1.eotf == HDMI_EOTF_SMPTE_ST2084)
> +			*ctrl |= INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
> +		else
> +			*ctrl &= ~INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;

If the TCON doesn't know it's HLG and not regular SDR content aren't we
getting bad results? I suppose it's less wrong than when claiming that
it's PQ though.

Are there actual systems where we still need to use this custom DPCD
interface *and* the display claims HLG support? Or is this a "user
uses HLG anyway even though the panel can't handle it" situation?

>  	}
>  
>  	if (DISPLAY_VER(display) < 11)
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
