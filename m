Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A69606A329
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LMw5n41t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1027610EF74;
	Mon, 26 Oct 2026 15:15:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32810E341;
 Mon, 26 Oct 2026 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793027738; x=1824563738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kQlOyX9g+OziatTUR4B7co80FLZmoUVrNs1Chmy0RSc=;
 b=LMw5n41tE4hfV6kfMSTrHnC+54HlVgRyJAD9JVvXKkfeE3OBDgVKSeyf
 kRCKMDGQcI36s+tkoY/l652QYb3lFDpaNxHIw28mQ2Km+6Cun3U7294os
 XM28A1X2vyCVjeHTLElmr4ZlhhNRiP0vBKv7rarEBRjaHd3nFzqr8L/Ww
 vA3S857ClmXSec6P5hGLbA16GBe4VZoSc/uuoIDeiFA406M+WACqUPzec
 l7qhhUJUI92XFQw6zHnQMElHd6s85J0i17Q0YoUc73/9Ox3N5Y3pMcMHx
 a3EEoqxynQm/+WgbRExA37G9xgFsCYFwHO40FSnBVQ8/o/1MKccyBSp2O g==;
X-CSE-ConnectionGUID: AXw76wyvQF2KouNxC+YW5g==
X-CSE-MsgGUID: p9LigrvnSPaV35IA7uJZug==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1705644"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1705644"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 08:15:38 -0700
X-CSE-ConnectionGUID: QymV13gSTzWjf7wI3KeECg==
X-CSE-MsgGUID: btgowZn9QJOV70MIztoAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4270985"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 08:15:36 -0700
Date: Mon, 26 Oct 2026 17:15:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/i915/fbc: update the supported FP16 formats
Message-ID: <at9ulGJlfF6ImWOl@intel.com>
References: <20261026145508.235851-1-vinod.govindapillai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261026145508.235851-1-vinod.govindapillai@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 04:55:06PM +0200, Vinod Govindapillai wrote:
> FBC is supported with FP16 formats with or without alpha. At the
> same time modify the function name for the FP16 format check and
> simplify the FP16 format check calls.
> 
> Bspec: 68904
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 5694d20773f8..dbb16a9ec69d 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1180,14 +1180,15 @@ static bool lnl_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_
>  	}
>  }
>  
> -static bool
> -xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
> +static bool intel_fbc_is_fp16_format(const struct intel_plane_state *plane_state)
>  {
>  	const struct drm_framebuffer *fb = plane_state->hw.fb;
>  
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_ARGB16161616F:
> +	case DRM_FORMAT_XRGB16161616F:
>  	case DRM_FORMAT_ABGR16161616F:
> +	case DRM_FORMAT_XBGR16161616F:
>  		return true;
>  	default:
>  		return false;
> @@ -1196,24 +1197,16 @@ xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_state)
>  
>  static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *plane_state)
>  {
> -	if (lnl_fbc_pixel_format_is_valid(plane_state))
> -		return true;
> -
> -	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
> -		return true;
> -
> -	return false;
> +	return lnl_fbc_pixel_format_is_valid(plane_state) ||
> +	       intel_fbc_is_fp16_format(plane_state);

This is getting super messy. Would be much simpler to just list
the actual supported pixel formats here instead of trying to
this hard to follow inheritance thing.

>  }
>  
>  bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
>  {
>  	struct intel_display *display = to_intel_display(plane_state);
>  
> -	if (HAS_PIXEL_NORMALIZER(display) &&
> -	    xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
> -		return true;
> -
> -	return false;
> +	return HAS_PIXEL_NORMALIZER(display) &&
> +	       intel_fbc_is_fp16_format(plane_state);
>  }
>  
>  static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
