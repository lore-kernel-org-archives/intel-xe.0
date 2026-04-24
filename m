Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E1EFE51FD
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 10:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D48710F4B8;
	Fri, 24 Apr 2026 10:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPTzFZp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D46410F4B6;
 Fri, 24 Apr 2026 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777024950; x=1808560950;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zdoPNKQHVHBhpUb4UGp7C12LJWf1ykGkylbSZrLJ75I=;
 b=NPTzFZp0SsYvDQK5x3n5ND0MuZ7BAhtc6fpAlykN4ChPxI1RuONI3rz4
 oYFkjOjRmgnPn/eKOoF4x7kmeU6uxgkqWgPzPpQuYZgd8p9IPfn3QYKeh
 vBVm7PBuLCiEjkfOvAf0sHCeHLlpOSU/+CeukkJVqlGwHJeFV4bGN2MkZ
 t58rONhYOCESKaxjp+KPKJHDz0Saszz1oj9qtnJSGZcR5N/yNEOlgGl/c
 2yh8mT2gIkD2b5mQ1V9OiiJNbXJKOmKSxXU4rWxmnD7ysfit9is1JPm43
 V8WWPB8o1KHArMZbFKxZqw1ZL0YcmcoZ/TqFsjdDiqswHRqVp7gvIwY/7 Q==;
X-CSE-ConnectionGUID: uOP4NagWR+CX6X9dyzc8mg==
X-CSE-MsgGUID: YIDeM2dtTsOSmFSHzkkbpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78059849"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="78059849"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:02:29 -0700
X-CSE-ConnectionGUID: DST4uC75SHysk86QWZMulQ==
X-CSE-MsgGUID: ayhi4XgUQW2Rx17raWPNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="256432717"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:02:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/16] drm/xe: Move the FORCE_WC assert into
 __xe_pin_fb_vma()
In-Reply-To: <20260423165346.20884-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-8-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 13:02:25 +0300
Message-ID: <bfb356535fb16b7d7cf5fa5a40c264af8ca89583@intel.com>
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
> No need to bother the higher level pinning code with the
> FORCE_WC assert. Move it into the lower level function.

Might mention that this introduces the check also to the
intel_fb_pin_to_ggtt() path.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index afb6cdda537e..487c092cd000 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -329,6 +329,9 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_ge=
m_object *obj, bool is_dpt,
>  	struct drm_exec exec;
>  	int ret =3D 0;
>=20=20
> +	/* We reject creating !SCANOUT fb's, so this is weird.. */
> +	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
> +
>  	if (!vma)
>  		return ERR_PTR(-ENODEV);
>=20=20
> @@ -466,7 +469,6 @@ int intel_plane_pin_fb(struct intel_plane_state *new_=
plane_state,
>  {
>  	struct drm_framebuffer *fb =3D new_plane_state->hw.fb;
>  	struct drm_gem_object *obj =3D intel_fb_bo(fb);
> -	struct xe_bo *bo =3D gem_to_xe_bo(obj);
>  	struct i915_vma *vma;
>  	struct intel_plane *plane =3D to_intel_plane(new_plane_state->uapi.plan=
e);
>  	struct intel_fb_pin_params pin_params =3D {
> @@ -478,9 +480,6 @@ int intel_plane_pin_fb(struct intel_plane_state *new_=
plane_state,
>  	if (reuse_vma(new_plane_state, old_plane_state))
>  		return 0;
>=20=20
> -	/* We reject creating !SCANOUT fb's, so this is weird.. */
> -	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
> -
>  	vma =3D __xe_pin_fb_vma(obj, intel_fb_uses_dpt(fb), &pin_params);
>=20=20
>  	if (IS_ERR(vma))

--=20
Jani Nikula, Intel
