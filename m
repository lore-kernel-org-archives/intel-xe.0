Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35934606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=diKe9+1f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0D710F596;
	Tue, 27 Oct 2026 15:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2EA10E42B;
 Tue, 27 Oct 2026 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793114042; x=1824650042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ieShEb+J4XGYdbClo0lXwq5vJL94he1pNX64j7exwmU=;
 b=diKe9+1fnTT9KjtxyUbsSsK4/ThLUrs2WgPJNcZlr5/XdUzjW2kpeXYi
 WYlw7JQ/KV24ooIqGO0IBw/AEwi3VgzusHkmHNMrQvEm7Tm9OVEUyv5t4
 TD7VLI/qkew66C+PxJPTzhCJ8dmdGlzPNdPdPSVte0hSHDOv7qlPkQhJ7
 sNwvdQcdmPDYvuPgyP1E+Sf+AodcyB3Gm5CJJkv4+uJnsTi259C7LUUEP
 cK9RZcelE45Q5KtMr7RrMhmgzXVyy4zZhgJBjCQyUFRdGsIQXqh8qLwzT
 N/huPaxWyONF9hxkhj+LNk2AEAsGX7X/IfQz3m/serp+LmfID+Tvqv0xn w==;
X-CSE-ConnectionGUID: J5TiinoMTYCxvNxbPHxKZw==
X-CSE-MsgGUID: Z1Y+hUZxSDGRnIH7xmMVOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1705866"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1705866"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:14:02 -0700
X-CSE-ConnectionGUID: WktzqyouTdeUnG8baj6O/Q==
X-CSE-MsgGUID: N6eorhIUQQGxzBPR9tN3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6443080"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:13:59 -0700
Date: Tue, 27 Oct 2026 17:13:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ville.syrjala@intel.com, juha-pekka.heikkila@intel.com
Subject: Re: [PATCH v3 2/3] drm/i915/fbc: Apply Wa_14028723391
Message-ID: <auC_tAQTwUlC67Wv@intel.com>
References: <20261027150544.81548-1-vinod.govindapillai@intel.com>
 <20261027150544.81548-2-vinod.govindapillai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027150544.81548-2-vinod.govindapillai@intel.com>
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

On Tue, Oct 27, 2026 at 05:05:43PM +0200, Vinod Govindapillai wrote:
> Disable FBC in XE3P_LPD for FP16 formats with Alpha.
> 
> v2: Group the wa conditions as a separate function
>     Wa condition to check pixel blend mode
> 
> v3: use fomrat_is_float()
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_wa.c   |  2 ++
>  .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
>  drivers/gpu/drm/i915/display/intel_fbc.c      | 22 +++++++++++++++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index cc0b28d524f6..3df25104fb12 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -159,6 +159,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
>  		return IS_DISPLAY_VERx100(display, 1100, 1400);
>  	case INTEL_DISPLAY_WA_22021048059:
>  		return IS_DISPLAY_VER(display, 14, 35);
> +	case INTEL_DISPLAY_WA_14028723391:
> +		return DISPLAY_VER(display) == 35;
>  	default:
>  		drm_WARN(display->drm, 1, "Missing Wa: %s\n", name);
>  		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 2086c7da710d..5514771f513b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -56,6 +56,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_22012358565,
>  	INTEL_DISPLAY_WA_22014263786,
>  	INTEL_DISPLAY_WA_22021048059,
> +	INTEL_DISPLAY_WA_14028723391,
>  };
>  
>  bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name);
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index b84fa350c433..f70f3e34d655 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1215,6 +1215,23 @@ static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *p
>  	}
>  }
>  
> +static bool
> +intel_fbc_wa_14028723391_applies(const struct intel_plane_state *plane_state)
> +{
> +	struct intel_display *display = to_intel_display(plane_state);
> +	const struct drm_framebuffer *fb = plane_state->hw.fb;
> +
> +	/*
> +	 * Wa_14028723391:
> +	 * Fixes: Screen corruption with FBC enabled on a plane with the FP16
> +	 * Workaround: Disable FBC for FP16+Alpha in xe3p_lpd
> +	 */
> +	return intel_display_wa(display, INTEL_DISPLAY_WA_14028723391) &&
> +	       format_is_float(plane_state) &&
> +	       fb->format->has_alpha &&
> +	       plane_state->hw.pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE;

Seems overly complicated. Could just drop the alpha formats from
the list and be done with it.

> +}
> +
>  bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
>  {
>  	struct intel_display *display = to_intel_display(plane_state);
> @@ -1679,6 +1696,11 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
>  		return 0;
>  	}
>  
> +	if (intel_fbc_wa_14028723391_applies(plane_state)) {
> +		plane_state->no_fbc_reason = "Wa_14028723391";
> +		return 0;
> +	}
> +
>  	if (!tiling_is_valid(plane_state)) {
>  		plane_state->no_fbc_reason = "tiling not supported";
>  		return 0;
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
