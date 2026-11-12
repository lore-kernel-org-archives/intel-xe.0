Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650AE606A335
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ia7XAxEq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34C10FF60;
	Thu, 12 Nov 2026 09:29:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5555F10FF71;
 Thu, 12 Nov 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794475772; x=1826011772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ACJa7+Ypuq4PLECKAn5XCT/g8Vg6cOZxVadILS2s2jM=;
 b=Ia7XAxEqmA1qdPUBeaDiGti2APavgFIEXSjXLtvvp1jwfJFVSnS0Lfmt
 L9/SxhxWoQKGPMuqa7kCkJcMhZfDWnSCuc0L/ohpYCfNRDoF6KKIiG9U5
 FDBkuGgwaEkkvdOokFWmZ9lgAbYz76KwXGcYVaovO//o8+Y0S7nZbA+ZP
 OR2bQmw/P3XKBiK+/SYHi/+x9xne/BkrZ2vx/0UXXG8wVbnmcaoKQM8IG
 zd2ooqXQmlkSNCLYk1WRX4QsOdAY++axU/BiK3cfzDIFCluR6gK7qH9jy
 dfWXFXFkgsbfotUYGYuUuAjP2Rzds9v5u3Ep/YLaIkId6YqQV0IHleJU+ w==;
X-CSE-ConnectionGUID: TJ2gmPAyR+WMvWNGANlImA==
X-CSE-MsgGUID: YOogyz0FTwOKKGbcA0uqag==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3152230"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3152230"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:29:32 -0800
X-CSE-ConnectionGUID: C3GJI8bgRpyU+g5m9Gi1ZQ==
X-CSE-MsgGUID: bdl+vA8rQ/CBvF0RrQuIig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8480500"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:29:31 -0800
Date: Thu, 12 Nov 2026 10:29:24 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 11/15] drm/i915/pfit: Check panel fitter source size on
 GMCH
Message-ID: <h6sdecf2hn7h437odemlqdsbdsfhtybmmmim5x64tnac6w2smk@ghegb2kkz4fx>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-12-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019135309.23578-12-ville.syrjala@linux.intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:53:05PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The GMCH panel fitter is limited to <=2048 pixel wide
> sources. Check for that.
> 
> There doesn't really seem to be any vertical limit.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index 5c2e7fdb93cc..d94301c80d57 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -532,6 +532,27 @@ static void i9xx_scale_fullscreen(struct intel_crtc_state *crtc_state,
>  	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
>  }
>  
> +static int i9xx_pfit_check_src_size(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
> +	int max_src_w;
> +
> +	/* Not sure there is any vertical limit */
> +	max_src_w = 2048;
> +
> +	if (pipe_src_w > max_src_w) {
> +		drm_dbg_kms(display->drm,
> +			    "[CRTC:%d:%s] source width %d exceeds pfit max %d\n",
> +			    crtc->base.base.id, crtc->base.name,
> +			    pipe_src_w, max_src_w);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
> @@ -678,6 +699,10 @@ static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
>  	if ((pfit_control & PFIT_ENABLE) == 0)
>  		return 0;
>  
> +	ret = i9xx_pfit_check_src_size(crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	ret = i9xx_pfit_check_scaling(crtc_state);
>  	if (ret)
>  		return ret;
> -- 
> 2.55.0
> 
> 
