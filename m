Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBBFFE51EE
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E0210E3A4;
	Fri, 24 Apr 2026 09:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhO1aJ3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7BE89023;
 Fri, 24 Apr 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777022361; x=1808558361;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=f2gfKUyTxsgTCWyY+csp1H0hJ/hFdocA/H6/pWqtI5s=;
 b=DhO1aJ3QZE9KIzDHUXQ3eSJyC3GfXA4RICctMZi8e9jP3mj35incX33H
 i6SNo9JzyambU+wdmY9VRjARZ+nCsLqD3m90GdgUTJrreFGbEzhtRoYbr
 0bpbWF9zGD4Id+jsqhMAa+/jfgIPmkPCLdMAT4ZPLMWhONK+ErDNuMGuj
 K+hVt9ZrYod4EV4n8hDYSBFHoB3rXDJ4jEoidNzURAQzI4TdklFexH4ZE
 F3EZ+4p9B+oxBybPPB39LNxrg66GrrOnObpGmkNduanWwCL0Ggnrk48Gv
 3WVmFeekNr3YfA1ZMpbX9vJ6evp9GU7muYA/sPrJn7hSutqjZy3drIPq5 Q==;
X-CSE-ConnectionGUID: dKR3ZyZFR3GnebhU3IvfAQ==
X-CSE-MsgGUID: iX3Gv3R0Qs65dLpGJA553g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77987437"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77987437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:19:20 -0700
X-CSE-ConnectionGUID: j9vFIzagQFuadUMqgFbaPQ==
X-CSE-MsgGUID: wwdS5xtnTeSR8u71imSMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="228341697"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:19:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/16] drm/i915: Move intel_fb_pin_params to the parent
 interface
In-Reply-To: <20260423165346.20884-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-3-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 12:19:17 +0300
Message-ID: <6fc7e55124ebc0b04f9f6a368376689abf54429e@intel.com>
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
> strut intel_fb_pin_params will be an important part of the fb_pin
> interface, so move the definition to the parent interface file.
>
> Or maybe we should have a separate header for this kind of stuff
> since the users of the parent interface will need the struct
> definition but not the parent interface vfunc struct definitions?

Yeah, another hard one. I've tried to keep the interface definition
clear of other type definitions, and in particular to use types that are
readily available in generic drm headers. Or opaque pointers.

I think let's see how bad it gets. We're bound to need a few structs
specific to this interface, like struct intel_fb_pin_params. If it's
just a few structs, and they don't need to include the world for their
definition, let's just keep them here. But if it starts to look like
there'll be plenty, and they need a bunch of dependencies, let's split
them out. It's not a big deal to do that later.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb_pin.h  | 12 +-----------
>  drivers/gpu/drm/i915/display/intel_fbdev.c   |  1 +
>  include/drm/intel/display_parent_interface.h | 12 ++++++++++++
>  3 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/dr=
m/i915/display/intel_fb_pin.h
> index 805e23067004..84530f20d7d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
> @@ -10,21 +10,11 @@
>=20=20
>  struct drm_gem_object;
>  struct i915_vma;
> +struct intel_fb_pin_params;
>  struct intel_plane_state;
>  struct i915_gtt_view;
>  struct iosys_map;
>=20=20
> -struct intel_fb_pin_params {
> -	const struct i915_gtt_view *view;
> -	unsigned int alignment;
> -	unsigned int phys_alignment;
> -	unsigned int vtd_guard;
> -	bool needs_cpu_lmem_access;
> -	bool needs_low_address;
> -	bool needs_physical;
> -	bool needs_fence;
> -};
> -
>  struct i915_vma *
>  intel_fb_pin_to_ggtt(struct drm_gem_object *obj,
>  		     const struct intel_fb_pin_params *pin_params,
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index ce4082da30e8..aa2701795caa 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -38,6 +38,7 @@
>  #include <linux/vga_switcheroo.h>
>=20=20
>  #include <drm/clients/drm_client_setup.h>
> +#include <drm/intel/display_parent_interface.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/i=
ntel/display_parent_interface.h
> index ee2e9572bfca..b363d6a85dfe 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -16,6 +16,7 @@ struct drm_mode_fb_cmd2;
>  struct drm_plane_state;
>  struct drm_scanout_buffer;
>  struct fb_info;
> +struct i915_gtt_view;
>  struct i915_vma;
>  struct intel_dpt;
>  struct intel_dsb_buffer;
> @@ -29,6 +30,17 @@ struct ref_tracker;
>  struct seq_file;
>  struct vm_area_struct;
>=20=20
> +struct intel_fb_pin_params {
> +	const struct i915_gtt_view *view;
> +	unsigned int alignment;
> +	unsigned int phys_alignment;
> +	unsigned int vtd_guard;
> +	bool needs_cpu_lmem_access;
> +	bool needs_low_address;
> +	bool needs_physical;
> +	bool needs_fence;
> +};
> +
>  /* Keep struct definitions sorted */
>=20=20
>  struct intel_display_bo_interface {

--=20
Jani Nikula, Intel
