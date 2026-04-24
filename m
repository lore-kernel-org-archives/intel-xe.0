Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1948BFE51FB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E6010F4B3;
	Fri, 24 Apr 2026 09:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo9DwXJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6C310F4B3;
 Fri, 24 Apr 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777024777; x=1808560777;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/Xf6aXsv20LiJZP3BN8mFMmK/zWPTh1tZmmkupJSAJc=;
 b=Wo9DwXJGrFcC7ncBptNno2JFLBYw/CRusBODYimr6rc7FPD3JD+hoP0u
 cNIeQANd9xquep056I2R18WgwZEyimsFtKRFS89GCItidq19AqtTpC3PD
 h2xoG//sMJIXRST3hjOCmR0qmje3G8PGeYfWq5TB5BiTxx+MnCvW2SHdl
 AqGr5XsfDqIWa+DF0jAwWfVOuBggwj+O1zAKs/8gRKvy+kQmpfNl1kM9W
 8hi+yAah03MJKy1UZV0g76UAMCgW28DsUXCjp2lVyM321gErNjeosccNF
 6/7skykkTkGHmp4eRawHXO+SmTtIhcVs8trJsCaF+0xuXO6BO9GQRzJHt A==;
X-CSE-ConnectionGUID: KCb0qe1LQumcYfgh1kdn+w==
X-CSE-MsgGUID: Kit0gsqtR8Ssn2OE/Gtt3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="95564310"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="95564310"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:59:37 -0700
X-CSE-ConnectionGUID: L1txAlPsQLOi4qTegrrNpQ==
X-CSE-MsgGUID: IrYwtw2ySKaMOmcKWPza2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232818473"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:59:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/16] drm/i915: Introduce i915_fb_pin_ggtt_(un)pin()
In-Reply-To: <20260423165346.20884-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-7-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 12:59:32 +0300
Message-ID: <e954c272bba4200dc4147dafd024eb1943c043fb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 23 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Extract the inner DPT parts of intel_plane_(un)pin() into the
> i915_fb_pin_ggtt_(un)pin(). These will become part of the new
> fb_pin parent interface.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_fb_pin.c | 68 +++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index 0019f570d843..e14d2c1fb81f 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -257,6 +257,41 @@ intel_plane_fb_vtd_guard(const struct intel_plane_st=
ate *plane_state)
>  				       plane_state->hw.rotation);
>  }
>=20=20
> +static int i915_fb_pin_ggtt_pin(struct drm_gem_object *obj,
> +				const struct intel_fb_pin_params *pin_params,
> +				struct i915_vma **out_ggtt_vma,
> +				u32 *out_offset,
> +				int *out_fence_id)
> +{
> +	struct i915_vma *ggtt_vma;
> +
> +	ggtt_vma =3D intel_fb_pin_to_ggtt(obj, pin_params, out_fence_id);
> +	if (IS_ERR(ggtt_vma))
> +		return PTR_ERR(ggtt_vma);
> +
> +	*out_ggtt_vma =3D ggtt_vma;
> +
> +	/*
> +	 * Pre-populate the dma address before we enter the vblank
> +	 * evade critical section as i915_gem_object_get_dma_address()
> +	 * will trigger might_sleep() even if it won't actually sleep,
> +	 * which is the case when the fb has already been pinned.
> +	 */
> +	if (pin_params->needs_physical)
> +		*out_offset =3D i915_gem_object_get_dma_address(to_intel_bo(obj), 0);
> +	else
> +		*out_offset =3D i915_ggtt_offset(ggtt_vma);
> +
> +	return 0;
> +}
> +
> +static void i915_fb_pin_ggtt_unpin(struct i915_vma *ggtt_vma,
> +				   int fence_id)
> +{
> +	if (ggtt_vma)
> +		intel_fb_unpin_vma(ggtt_vma, fence_id);
> +}
> +
>  static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_=
dpt *dpt,
>  			       const struct intel_fb_pin_params *pin_params,
>  			       struct i915_vma **out_dpt_vma,
> @@ -325,24 +360,11 @@ int intel_plane_pin_fb(struct intel_plane_state *pl=
ane_state,
>  			.needs_fence =3D intel_plane_needs_fence(display),
>  		};
>=20=20
> -		ggtt_vma =3D intel_fb_pin_to_ggtt(intel_fb_bo(&fb->base), &pin_params,
> -						intel_plane_uses_fence(plane_state) ? &fence_id : NULL);
> -		if (IS_ERR(ggtt_vma))
> -			return PTR_ERR(ggtt_vma);
> -
> -		/*
> -		 * Pre-populate the dma address before we enter the vblank
> -		 * evade critical section as i915_gem_object_get_dma_address()
> -		 * will trigger might_sleep() even if it won't actually sleep,
> -		 * which is the case when the fb has already been pinned.
> -		 */
> -		if (intel_plane_needs_physical(plane)) {
> -			struct drm_i915_gem_object *obj =3D to_intel_bo(intel_fb_bo(&fb->base=
));
> -
> -			offset =3D i915_gem_object_get_dma_address(obj, 0);
> -		} else {
> -			offset =3D i915_ggtt_offset(ggtt_vma);
> -		}
> +		ret =3D i915_fb_pin_ggtt_pin(intel_fb_bo(&fb->base),
> +					   &pin_params, &ggtt_vma, &offset,
> +					   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);
> +		if (ret)
> +			return ret;
>  	} else {
>  		struct intel_fb_pin_params pin_params =3D {
>  			.view =3D &plane_state->view.gtt,
> @@ -371,13 +393,11 @@ void intel_plane_unpin_fb(struct intel_plane_state =
*old_plane_state)
>  		to_intel_framebuffer(old_plane_state->hw.fb);
>=20=20
>  	if (!intel_fb_uses_dpt(&fb->base)) {
> -		struct i915_vma *vma;
> +		i915_fb_pin_ggtt_unpin(old_plane_state->ggtt_vma,
> +				       old_plane_state->fence_id);
>=20=20
> -		vma =3D fetch_and_zero(&old_plane_state->ggtt_vma);
> -		if (vma) {
> -			intel_fb_unpin_vma(vma, old_plane_state->fence_id);
> -			old_plane_state->fence_id =3D -1;
> -		}
> +		old_plane_state->ggtt_vma =3D NULL;
> +		old_plane_state->fence_id =3D -1;
>  	} else {
>  		i915_fb_pin_dpt_unpin(fb->dpt,
>  				      old_plane_state->dpt_vma,

--=20
Jani Nikula, Intel
