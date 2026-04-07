Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD857FF510A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D0D10E45A;
	Tue,  7 Apr 2026 15:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7pcD8hk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F8E10E0C7;
 Tue,  7 Apr 2026 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775576365; x=1807112365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=moUd4iXb2iqikd0DQ17ZYD4h6ve91Db+tpoInYDuAYo=;
 b=H7pcD8hkYYEaugGDDbDGh4UbzPQXHvT9ggBrepK1y9x+W95TZ274xcLY
 r5h7nnUjqQfPmzgL7EY/HMtRlM7rUsa86L3a2EuJ3PYxHXp6gpYtG+eKp
 6YqokqzWsynO6ADqZt57aO57T1GPpvzd/NltVwWf04fI+KuPkTpFul41m
 A2i8aZ1WygjHC7riNKy4z/S9DCm5R/b9dorGJ/B1Vi3JHmhLU1Jurgq9u
 SBMtiSp3Odn7Qxj+moeJzeWWStN6IYHQrSu4OFgHj3PODmgISgx8mooRy
 M3jD7xeNPsRl+LwO3CT99N6MUi+XeS981pRQ+lwA7evz+qki+rF22AXOc A==;
X-CSE-ConnectionGUID: BjkOLaUCTqaGPUxNZSg/yQ==
X-CSE-MsgGUID: NMQwgLm4T2Wi7UMWiKC16Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79132000"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="79132000"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:39:25 -0700
X-CSE-ConnectionGUID: 75Mmt5w8Tp2xywNbW9xjzw==
X-CSE-MsgGUID: n1YpNpFKQCC27KEcKSxR9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232236252"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:39:23 -0700
Date: Tue, 7 Apr 2026 18:39:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pfit: Prevent negative coordinates in center mode
Message-ID: <adUlKBUubNU6vZjl@intel.com>
References: <20260402061310.111073-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402061310.111073-1-nemesa.garg@intel.com>
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

On Thu, Apr 02, 2026 at 11:43:10AM +0530, Nemesa Garg wrote:
> When the pipe_src width or height are greater than adjusted_mode hdisplay
> and vdisplay, computed x and y offsets for center mode can be negative.
> Writing negative values into the pch_fit registers result in a state error.
> Add a check to clamp these values so that they are never negative.
> 
> v2: Compare in terms of pipe_src width and height.[Ville]
> v3: Change width/height to pipe_src_w/h in logging. [Ville]
> 
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

Thanks. Applied to drm-intel-next.

In the future please look into using the git format-patch -v<n>
and git send-email --in-reply-to knobs, especially for single
patches. Makes it easier to find the new versions of the patch.
When reposting a whole series one should not use --in-reply-to
however.

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index 6dda496190e0..2dec4ccf74ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -186,6 +186,7 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
>  			     const struct drm_connector_state *conn_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
>  	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
> @@ -200,6 +201,16 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
>  
>  	switch (conn_state->scaling_mode) {
>  	case DRM_MODE_SCALE_CENTER:
> +		if (adjusted_mode->crtc_hdisplay < pipe_src_w ||
> +		    adjusted_mode->crtc_vdisplay < pipe_src_h) {
> +			drm_dbg_kms(display->drm,
> +				    "[CRTC:%d:%s] pfit center mode source (%dx%d) exceeds display (%dx%d)\n",
> +				    crtc->base.base.id, crtc->base.name,
> +				    pipe_src_w, pipe_src_h,
> +				    adjusted_mode->crtc_hdisplay,
> +				    adjusted_mode->crtc_vdisplay);
> +			return -EINVAL;
> +		}
>  		width = pipe_src_w;
>  		height = pipe_src_h;
>  		x = (adjusted_mode->crtc_hdisplay - width + 1)/2;
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
