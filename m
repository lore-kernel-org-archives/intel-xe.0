Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C3606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FrM6GcpA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6379510FF48;
	Thu, 12 Nov 2026 09:28:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A581E10FF48;
 Thu, 12 Nov 2026 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794475689; x=1826011689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tJ7OJKVwR6Ke3CuP53uEpQkh0J7GNKjUfY1eCjWLb1I=;
 b=FrM6GcpAHLkD2rsfExw6oOAGYyUJC+1NGufihJT31fsuHWWeB1X4Qt9x
 3FYo1sN32tP1yhFiGbDZL5HyyyUQihEnyN1NYIMAmsm2u3ZJG81EzIvt5
 gOVbdfnqjtK5h/1iV8SJKPV0CdC5A+Fqz9C8SWLD1dQaqi9DpwwfM+WzA
 JKoFb8f2M0kE1jOilDO87CZiB3gJ8kOCn+UOqbVdLSYiQTloBBKog8Yjx
 dLqjyeR5SuNzMObCeu++HrMB7Ktf3ebxxSg6DITBdXTqsqKgD8w6eMneD
 L4rYpzdgqOf13F4XCVLP7BoiUhF9gWhF6EnoAa04lsyb2+NWwlAtqBG8n A==;
X-CSE-ConnectionGUID: oTrWyG18ToiaCg5V405GQA==
X-CSE-MsgGUID: 7EVJvpVbQnCNqRQOxc8Svw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3121784"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3121784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:28:09 -0800
X-CSE-ConnectionGUID: JattlxHTT3i7Z2xP5HfdJA==
X-CSE-MsgGUID: 2pRTmR3pSmKseygF1F18Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8439220"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:28:08 -0800
Date: Thu, 12 Nov 2026 10:27:55 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/15] drm/i915/pfit: Check scaling factor on GMCH
Message-ID: <6eh76u3vrzbsze7hfmzqnggv7bw4irlibbrcqyl2qfwcqfsmly@ff6rl5eyjyas>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-11-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019135309.23578-11-ville.syrjala@linux.intel.com>
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

On Mon, Oct 19, 2026 at 04:53:04PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Make sure the pfit scaling factor is legal on GMCH platforms.
> For now we'll limit all platforms to upscaling only, even
> though i965+ can actually downscale.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index 63e5a656a33b..5c2e7fdb93cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -532,6 +532,42 @@ static void i9xx_scale_fullscreen(struct intel_crtc_state *crtc_state,
>  	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
>  }
>  
> +static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	const struct drm_rect *dst = &crtc_state->pfit.dst;
> +	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
> +	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
> +	int hscale, vscale, max_scale;
> +	struct drm_rect src;
> +
> +	max_scale = 0x10000;
> +
> +	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
> +
> +	hscale = drm_rect_calc_hscale(&src, dst, 0, max_scale);
> +	if (hscale < 0) {
> +		drm_dbg_kms(display->drm,
> +			    "[CRTC:%d:%s] pfit horizontal downscaling (%d->%d) exceeds max (0x%x)\n",
> +			    crtc->base.base.id, crtc->base.name,
> +			    pipe_src_w, drm_rect_width(dst),
> +			    max_scale);
> +		return hscale;
> +	}
> +
> +	vscale = drm_rect_calc_vscale(&src, dst, 0, max_scale);
> +	if (vscale < 0) {
> +		drm_dbg_kms(display->drm,
> +			    "[CRTC:%d:%s] pfit vertical downscaling (%d->%d) exceeds max (0x%x)\n",
> +			    crtc->base.base.id, crtc->base.name,
> +			    pipe_src_h, drm_rect_height(dst),
> +			    max_scale);
> +		return vscale;
> +	}
> +
> +	return 0;
> +}
>  static int i9xx_pfit_check_timings(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
> @@ -642,6 +678,10 @@ static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
>  	if ((pfit_control & PFIT_ENABLE) == 0)
>  		return 0;
>  
> +	ret = i9xx_pfit_check_scaling(crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	ret = i9xx_pfit_check_timings(crtc_state);
>  	if (ret)
>  		return ret;
> -- 
> 2.55.0
> 
> 
