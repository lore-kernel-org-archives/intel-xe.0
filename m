Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D987FE51FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4575710F498;
	Fri, 24 Apr 2026 09:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7sPLNWX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184B10F498;
 Fri, 24 Apr 2026 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777024536; x=1808560536;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qVZIib7eYsRcWVe7mBChQRpli6aLmp/9VPcBt5tE3Is=;
 b=S7sPLNWXV+tzGnPAr7RxBfuCEdlI2ATeeZzzb6sNO9crAwN4OhaF+8Ah
 0U01u6AhokuwWOBudznVUfDWqkFOKXXfvPJ0JuGJcd7KUq7yRufzXvIL3
 mv5HHNBQOaKsEOazzoBjI9XzZvP0etlq3BNxAaQMYcHdYTzUj6xNlRQGB
 lSICNZwvD3mSSF4Hy9C9ismlG42x8JL9ssJQLPNW9LaAnshNt8eGf0BUJ
 ZlMKHHxNEf3gCeyk4HtcChzWfkfaGT8dew/FPCs3n1Jgf+mORAsjUuU0e
 4sSn6YDrzWDdA4fZic7q5bxec7Sw2tHjNZFBYPrEDXsUdEHUb6MfOcRVD w==;
X-CSE-ConnectionGUID: +xKezVQfToCV2+VYN//sbw==
X-CSE-MsgGUID: 765kD93xQgaqmN7PtXsiWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="80586684"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="80586684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:55:35 -0700
X-CSE-ConnectionGUID: XhgVgsULQ3qYjyGy92LKrg==
X-CSE-MsgGUID: Pnr1JbGnTSav3mfA7hq3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="256208290"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:55:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/16] drm/i915: Reorganize intel_plane_pin_fb() a bit
In-Reply-To: <20260423165346.20884-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-5-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 12:55:31 +0300
Message-ID: <4821bf95a31dd715e38d04ef2c22126cea943247@intel.com>
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
> Move most of the plane state stuff out from the inner parts
> of intel_plane_pin_fb(). The plan is to take those inner parts and
> abstract them into the new fb_pin parent interface, and we don't
> want any plane_state stuff there.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_fb_pin.c | 67 +++++++++++++++---------------
>  1 file changed, 33 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index 400ad8768c11..bc2e185b4573 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -264,7 +264,10 @@ int intel_plane_pin_fb(struct intel_plane_state *pla=
ne_state,
>  	struct intel_plane *plane =3D to_intel_plane(plane_state->uapi.plane);
>  	const struct intel_framebuffer *fb =3D
>  		to_intel_framebuffer(plane_state->hw.fb);
> -	struct i915_vma *vma;
> +	struct i915_vma *ggtt_vma =3D NULL;
> +	struct i915_vma *dpt_vma =3D NULL;
> +	int fence_id =3D -1;
> +	u32 offset;
>=20=20
>  	if (!intel_fb_uses_dpt(&fb->base)) {
>  		struct intel_fb_pin_params pin_params =3D {
> @@ -277,15 +280,25 @@ int intel_plane_pin_fb(struct intel_plane_state *pl=
ane_state,
>  			.needs_physical =3D intel_plane_needs_physical(plane),
>  			.needs_fence =3D intel_plane_needs_fence(display),
>  		};
> -		int fence_id =3D -1;
>=20=20
> -		vma =3D intel_fb_pin_to_ggtt(intel_fb_bo(&fb->base), &pin_params,
> -					   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);
> -		if (IS_ERR(vma))
> -			return PTR_ERR(vma);
> +		ggtt_vma =3D intel_fb_pin_to_ggtt(intel_fb_bo(&fb->base), &pin_params,
> +						intel_plane_uses_fence(plane_state) ? &fence_id : NULL);
> +		if (IS_ERR(ggtt_vma))
> +			return PTR_ERR(ggtt_vma);
>=20=20
> -		plane_state->ggtt_vma =3D vma;
> -		plane_state->fence_id =3D fence_id;
> +		/*
> +		 * Pre-populate the dma address before we enter the vblank
> +		 * evade critical section as i915_gem_object_get_dma_address()
> +		 * will trigger might_sleep() even if it won't actually sleep,
> +		 * which is the case when the fb has already been pinned.
> +		 */
> +		if (intel_plane_needs_physical(plane)) {
> +			struct drm_i915_gem_object *obj =3D to_intel_bo(intel_fb_bo(&fb->base=
));
> +
> +			offset =3D i915_gem_object_get_dma_address(obj, 0);
> +		} else {
> +			offset =3D i915_ggtt_offset(ggtt_vma);
> +		}
>  	} else {
>  		struct intel_fb_pin_params pin_params =3D {
>  			.view =3D &plane_state->view.gtt,
> @@ -293,39 +306,25 @@ int intel_plane_pin_fb(struct intel_plane_state *pl=
ane_state,
>  			.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(&fb->base),
>  		};
>=20=20
> -		vma =3D i915_dpt_pin_to_ggtt(fb->dpt, pin_params.alignment / 512);
> -		if (IS_ERR(vma))
> -			return PTR_ERR(vma);
> +		ggtt_vma =3D i915_dpt_pin_to_ggtt(fb->dpt, pin_params.alignment / 512);
> +		if (IS_ERR(ggtt_vma))
> +			return PTR_ERR(ggtt_vma);
>=20=20
> -		plane_state->ggtt_vma =3D vma;
> -
> -		vma =3D intel_fb_pin_to_dpt(intel_fb_bo(&fb->base), fb->dpt, &pin_para=
ms);
> -		if (IS_ERR(vma)) {
> +		dpt_vma =3D intel_fb_pin_to_dpt(intel_fb_bo(&fb->base), fb->dpt, &pin_=
params);
> +		if (IS_ERR(dpt_vma)) {
>  			i915_dpt_unpin_from_ggtt(fb->dpt);
> -			plane_state->ggtt_vma =3D NULL;
> -			return PTR_ERR(vma);
> +			return PTR_ERR(dpt_vma);
>  		}
>=20=20
> -		plane_state->dpt_vma =3D vma;
> +		WARN_ON(ggtt_vma =3D=3D dpt_vma);
>=20=20
> -		WARN_ON(plane_state->ggtt_vma =3D=3D plane_state->dpt_vma);
> +		offset =3D i915_ggtt_offset(ggtt_vma);
>  	}
>=20=20
> -	/*
> -	 * Pre-populate the dma address before we enter the vblank
> -	 * evade critical section as i915_gem_object_get_dma_address()
> -	 * will trigger might_sleep() even if it won't actually sleep,
> -	 * which is the case when the fb has already been pinned.
> -	 */
> -	if (intel_plane_needs_physical(plane)) {
> -		struct drm_i915_gem_object *obj =3D to_intel_bo(intel_fb_bo(&fb->base)=
);
> -
> -		plane_state->surf =3D i915_gem_object_get_dma_address(obj, 0) +
> -			plane->surf_offset(plane_state);
> -	} else {
> -		plane_state->surf =3D i915_ggtt_offset(plane_state->ggtt_vma) +
> -			plane->surf_offset(plane_state);
> -	}
> +	plane_state->dpt_vma =3D dpt_vma;
> +	plane_state->ggtt_vma =3D ggtt_vma;
> +	plane_state->fence_id =3D fence_id;
> +	plane_state->surf =3D offset + plane->surf_offset(plane_state);
>=20=20
>  	return 0;
>  }

--=20
Jani Nikula, Intel
