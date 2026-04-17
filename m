Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB56F4368A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 09:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09BE10E9A6;
	Fri, 17 Apr 2026 09:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEUq8tGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5010E9A1;
 Fri, 17 Apr 2026 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776419462; x=1807955462;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dtDFJ1Sqp2aQBuNKgVNpbjc+Pp7GFLsrEzQHsc1Rd+k=;
 b=WEUq8tGSxMR2W4THThjMxTsCypI+1sgqwxqArTc5X93x1JCPpdgUhC+B
 Td8RqWEmJb/Xk3+lPHmYH+uZJfoSL/jvvcerWnpF3qgzHg5Mqf75lQdW0
 eWDrWcyvi7hctlV/XM5ZJv8xCnxXmLsw3o5D+QJypRzmEAwPiD6s60DNJ
 hftzPlt2+735Tetp1qKiuLqnHFs1iMDUF1SkAfb+hYvmNMdBfdX2vmdNx
 7Nb8w7Fl/FCTlsv5FjAZvHMxT1Rs1c8TSp7zbkr2Z/ulL8FKxhsHamAyW
 zpE/+Z1QgX/4dCMTT5h9vD75EPkWmmwigNQcoU6dUyAyjBHEUrjS7kjQc Q==;
X-CSE-ConnectionGUID: 5wpAveEUQkejYypNzNEbmw==
X-CSE-MsgGUID: PI7cNkLmQAK6tQqVu9Np9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80023134"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="80023134"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:50:59 -0700
X-CSE-ConnectionGUID: eiVzfIX2TXOEzXHMzpAu2A==
X-CSE-MsgGUID: mT/kXLseSni32CcaBs5UUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="232742301"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:50:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/11] drm/i915: Introduce pin_params.needs_physical
In-Reply-To: <20260416174448.28264-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-8-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 12:50:55 +0300
Message-ID: <be1ac262a723b245b01e20913d461905c2148e6d@intel.com>
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
> Add a new flag pin_params.needs_physical to inform the pinning
> code that the display needs a physical address and not GGTT
> address.
>
> This isn't strictly necessary as the current phys_alignment!=3D0
> check is enough in practice. But theoretically one could have
> needs_physical=3D=3Dtrue without any alignment requirements. And
> having an explicit flag feels a bit less magical.

Agreed.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb_pin.h | 1 +
>  drivers/gpu/drm/i915/i915_fb_pin.c          | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/dr=
m/i915/display/intel_fb_pin.h
> index cf54a96569de..3e37e9874f50 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
> @@ -21,6 +21,7 @@ struct intel_fb_pin_params {
>  	unsigned int vtd_guard;
>  	bool needs_cpu_lmem_access;
>  	bool needs_low_address;
> +	bool needs_physical;
>  };
>=20=20
>  struct i915_vma *
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index 97e4cdfd2447..bfe9a5342e13 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -148,7 +148,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  	i915_gem_ww_ctx_init(&ww, true);
>  retry:
>  	ret =3D i915_gem_object_lock(obj, &ww);
> -	if (!ret && pin_params->phys_alignment)
> +	if (!ret && pin_params->needs_physical)
>  		ret =3D i915_gem_object_attach_phys(obj, pin_params->phys_alignment);
>  	else if (!ret && HAS_LMEM(i915))
>  		ret =3D i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM_0);
> @@ -271,6 +271,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plan=
e_state,
>  			.vtd_guard =3D intel_plane_fb_vtd_guard(plane_state),
>  			.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(&fb->base),
>  			.needs_low_address =3D intel_plane_needs_low_address(display),
> +			.needs_physical =3D intel_plane_needs_physical(plane),
>  		};
>  		int fence_id =3D -1;

--=20
Jani Nikula, Intel
