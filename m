Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E2F43683
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 10:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407C710E9D9;
	Fri, 17 Apr 2026 10:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUUz9khI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5B10E058;
 Fri, 17 Apr 2026 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776421175; x=1807957175;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=a7xoVr/Y+vLxXenpInznQQ2gLS1mBHcDt+jUqp6rk9s=;
 b=jUUz9khIbIIQ0C6nQI3K5RauBmhk1RXhUNifJZCpfvSh4m9BIFVYdwQY
 llH9n1oEWIPtuyT/oI2BS+GRzkPJf1LFT2omLn+RaWcAArA1Zk5Phn8AD
 yOse50uSZ2cAqcpdH3Ud3/JhLwYtXsDS1AVBYZB2PvuQz5h+f229Xsokm
 sLhzv5JoXrfpctzOW3VMaytZ6XBzXQwE/QtZtG/7Ftk9gc7RoadZM8N8T
 QTAPzEDlWCw9sYtm/j69X9zaY0DUQKg4zIpgrSrxkYMrmKqV26dBhvO34
 L4peu25PyZ371vVUkgRuTJ6l/OwqQBxsna9tIoanqkIw9jgC8se/mtgKH g==;
X-CSE-ConnectionGUID: 01z9aH8ZRaOPmGIvuWShvA==
X-CSE-MsgGUID: hhF1QgF9QE2p3KQQxYl/uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77555817"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77555817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 03:19:35 -0700
X-CSE-ConnectionGUID: F962EbpbTaCNOuD57kYmWA==
X-CSE-MsgGUID: TMrYEMjKQ1G4dKUAZ1MC1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230137060"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 03:19:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/11] drm/xe: Eliminate intel_fb_uses_dpt() call from
 __xe_pin_fb_vma()
In-Reply-To: <20260416174448.28264-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-11-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 13:19:30 +0300
Message-ID: <b5b0c71a91ce90b18dbd7ef928c7d49bcde4f948@intel.com>
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

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Move the intel_fb_uses_dpt() out from __xe_pin_fb_vma() into
> intel_plane_pin_fb() so the we don't any display stuff that deep
> in the pinning code.

Parse error. "so that we don't have"?

> And intel_fb_pin_to_ggtt() can just say "this does not need DPT"
> always since it's specifically about pinning the fb into GGTT.
> The previous logic here was kinda insane with the high level code
> assuming GGTT, and low level code potentially deciding otherwise.
> In practice it should have been fine because intel_fb_pin_to_ggtt()
> only gets used from the intiial_palne code, and there we are
> not supposed to be have a framebuffer that needs DPT.

*initial_plane

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index a4eb06cfa769..44562769fbc9 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -318,7 +318,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_fr=
amebuffer *fb,
>  	return ret;
>  }
>=20=20
> -static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *=
fb,
> +static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *=
fb, bool is_dpt,
>  					const struct intel_fb_pin_params *pin_params)
>  {
>  	struct drm_device *dev =3D fb->base.dev;
> @@ -375,7 +375,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct =
intel_framebuffer *fb,
>  		goto err;
>=20=20
>  	vma->bo =3D bo;
> -	if (intel_fb_uses_dpt(&fb->base))
> +	if (is_dpt)
>  		ret =3D __xe_pin_fb_vma_dpt(fb, pin_params, vma);
>  	else
>  		ret =3D __xe_pin_fb_vma_ggtt(fb, pin_params, vma);
> @@ -419,7 +419,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  	if (out_fence_id)
>  		*out_fence_id =3D -1;
>=20=20
> -	return __xe_pin_fb_vma(to_intel_framebuffer(fb), pin_params);
> +	return __xe_pin_fb_vma(to_intel_framebuffer(fb), false, pin_params);
>  }
>=20=20
>  void intel_fb_unpin_vma(struct i915_vma *vma, int fence_id)
> @@ -483,7 +483,8 @@ int intel_plane_pin_fb(struct intel_plane_state *new_=
plane_state,
>  	/* We reject creating !SCANOUT fb's, so this is weird.. */
>  	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
>=20=20
> -	vma =3D __xe_pin_fb_vma(intel_fb, &pin_params);
> +	vma =3D __xe_pin_fb_vma(intel_fb, intel_fb_uses_dpt(&intel_fb->base),
> +			      &pin_params);
>=20=20
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);

--=20
Jani Nikula, Intel
