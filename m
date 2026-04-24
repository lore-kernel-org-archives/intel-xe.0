Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C4FFE51FF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 10:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1868E10F4BA;
	Fri, 24 Apr 2026 10:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYFXi5rC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69E10F4BA;
 Fri, 24 Apr 2026 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777025631; x=1808561631;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rZkJd5X+JRF7lhwLYkaRw5XHMNcfVN7GVlFRa9KhK5g=;
 b=NYFXi5rCK4GQx814utLo2i48misMQiqy1BaALlO4Zh4l89q6wLhT+jBb
 N7gLq2zpa2UPA99qjWWUAfNH/ZS/kC7H4xiJ70+Ln3omTpyqzp4uEA41+
 EMIX0ZohVrpgiWf78UF4+gzJVOSz5W4ipYlLJ4WJU0BV6Y+1UrrkJVeLu
 tpj2cbKAuH8s+xIbvR/aeXhtG4vCnfYrDxkWmCj1Cn9fj580b5JYXiWEF
 NGAoAO01jSWD0ILTL1V/LzdplGq8KHkN1Z7gcbWkisYQduDtBskSgB+OX
 rPsjPJi6oez1hV5YsvHnAoWNAxW+ykHoWsaSQt5ppPb1u2MX8xPRqjYX0 w==;
X-CSE-ConnectionGUID: o+z1M0ubSCW80PrtULblsA==
X-CSE-MsgGUID: MlSpFOGYTSe5wktmiq4gOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="95565634"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="95565634"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:13:51 -0700
X-CSE-ConnectionGUID: 3sVxB27xT/uwWb1F1zBmEg==
X-CSE-MsgGUID: HKkFJ6OITk2XncrQAkGurA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232821062"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:13:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 11/16] drm/xe: Introduce xe_fb_pin_ggtt_(un)pin()
In-Reply-To: <20260423165346.20884-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-12-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 13:13:46 +0300
Message-ID: <52216f17707eb17a37edf77a8dcbc1b8a3c83899@intel.com>
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
> xe_fb_pin_ggtt_(un)pin(). These will become part of the new
> fb_pin parent interface.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 41 ++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 46f6ae6acc4e..bdd6a4da0997 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -428,6 +428,34 @@ void intel_fb_unpin_vma(struct i915_vma *vma, int fe=
nce_id)
>  	__xe_unpin_fb_vma(vma);
>  }
>=20=20
> +static int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
> +			      const struct intel_fb_pin_params *pin_params,
> +			      struct i915_vma **out_ggtt_vma,
> +			      u32 *out_offset,
> +			      int *out_fence_id)
> +{
> +	struct i915_vma *ggtt_vma;
> +
> +	ggtt_vma =3D __xe_pin_fb_vma(obj, false, pin_params);
> +	if (IS_ERR(ggtt_vma))
> +		return PTR_ERR(ggtt_vma);
> +
> +	*out_ggtt_vma =3D ggtt_vma;
> +	*out_offset =3D xe_ggtt_node_addr(ggtt_vma->node);
> +	if (out_fence_id)
> +		*out_fence_id =3D -1;
> +
> +	return 0;
> +}
> +
> +static void xe_fb_pin_ggtt_unpin(struct i915_vma *ggtt_vma,
> +				 int fence_id)
> +{
> +	WARN_ON(fence_id >=3D 0);
> +
> +	__xe_unpin_fb_vma(ggtt_vma);
> +}
> +
>  static int xe_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dp=
t *dpt,
>  			     const struct intel_fb_pin_params *pin_params,
>  			     struct i915_vma **out_dpt_vma,
> @@ -505,11 +533,10 @@ int intel_plane_pin_fb(struct intel_plane_state *ne=
w_plane_state,
>  		return 0;
>=20=20
>  	if (!intel_fb_uses_dpt(&fb->base)) {
> -		ggtt_vma =3D __xe_pin_fb_vma(obj, false, &pin_params);
> -		if (IS_ERR(ggtt_vma))
> -			return PTR_ERR(ggtt_vma);
> -
> -		offset =3D xe_ggtt_node_addr(ggtt_vma->node);
> +		ret =3D xe_fb_pin_ggtt_pin(obj, &pin_params,
> +					 &ggtt_vma, &offset, NULL);
> +		if (ret)
> +			return ret;
>  	} else {
>  		ret =3D xe_fb_pin_dpt_pin(obj, fb->dpt, &pin_params,
>  					&dpt_vma, &ggtt_vma, &offset);
> @@ -530,9 +557,11 @@ void intel_plane_unpin_fb(struct intel_plane_state *=
old_plane_state)
>  	const struct intel_framebuffer *fb =3D to_intel_framebuffer(old_plane_s=
tate->hw.fb);
>=20=20
>  	if (!intel_fb_uses_dpt(&fb->base)) {
> -		__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
> +		xe_fb_pin_ggtt_unpin(old_plane_state->ggtt_vma,
> +				     old_plane_state->fence_id);
>=20=20
>  		old_plane_state->ggtt_vma =3D NULL;
> +		old_plane_state->fence_id =3D -1;
>  	} else {
>  		xe_fb_pin_dpt_unpin(fb->dpt, old_plane_state->dpt_vma,
>  				    old_plane_state->ggtt_vma);

--=20
Jani Nikula, Intel
