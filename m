Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29E3F459EF
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 16:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A0D10E979;
	Fri, 10 Apr 2026 16:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak1yxVyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C36E10E255;
 Fri, 10 Apr 2026 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775836893; x=1807372893;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0SnPiXS7uzVmWgEVgb39k8gqX0J50G6ZzP8hxRFLYhY=;
 b=ak1yxVydqe8Dcz50Y8oEhoJNLhkztAi26y1uLxFPKfKPcNlLtgIWtkGm
 SLX3oucDC2Ti6kfF1ILd3rhnn61eajTwmbR0j+4u4Q1CSTrl+CABWRo1v
 soneV4rzzPQgx224rXrGduAl4B8gQIFL8xUcAXAT99I6rp7cJPhvtEX9/
 KT3kC+8WBVMG17Jb8PwwE48iTuylTDJU0YBht+BlqMwe57rUyHHnhWYR9
 e05nz1Qg3RNLLXyhbMIuuBNJwGqx4j4y84boZ6vZWrVN0yma4Ica7m61O
 WingFbsRqCDKsneOKQxxRtWptwmW6Mmf5B41TWC4O888VQE9G3KqSnWD8 A==;
X-CSE-ConnectionGUID: G/ynGX4/QXuuoKur8TAZkQ==
X-CSE-MsgGUID: Z3szaZZJSFWZGg1Eko24+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76767805"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76767805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 09:01:30 -0700
X-CSE-ConnectionGUID: 9/gE1t66Tl2+sf6+Oq53fQ==
X-CSE-MsgGUID: z/AopjSYRFKUf2aXGgucwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="233507731"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 09:01:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/10] drm/i915: Reject BIOS FB rotation in common code
In-Reply-To: <20260410150449.9699-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
 <20260410150449.9699-11-ville.syrjala@linux.intel.com>
Date: Fri, 10 Apr 2026 19:01:25 +0300
Message-ID: <d06effdaa8466c75c948b90f549fdd317def9d64@intel.com>
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

On Fri, 10 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Reject 90/270 degree rotated BIOS framebuffers in common
> code. Currently skl_get_initial_plane_config() already rejects
> these, but we may want to implement the missing parts there
> so that skl_get_initial_plane_config() could be reused for
> general plane state verification purposes.
>
> 90/270 degree rotated framebuffers require two completely
> separate GGTT mappings (0 degree for the CPU, 270 degree
> for the display engine), and the rest of the BIOS FB
> takeover code is not prepared for that.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_initial_plane.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers=
/gpu/drm/i915/display/intel_initial_plane.c
> index e3d1b2d1669c..0e5cd45f01cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
> @@ -3,6 +3,7 @@
>=20=20
>  #include <linux/iopoll.h>
>=20=20
> +#include <drm/drm_blend.h>
>  #include <drm/drm_print.h>
>  #include <drm/intel/display_parent_interface.h>
>=20=20
> @@ -101,6 +102,15 @@ intel_alloc_initial_plane_obj(struct intel_display *=
display,
>  		return NULL;
>  	}
>=20=20
> +	/*
> +	 * Would need to preserve the 270 degree rotated
> +	 * GGTT mapping used by the display hardware.
> +	 */
> +	if (drm_rotation_90_or_270(plane_config->rotation)) {
> +		drm_dbg_kms(display->drm, "90/270 degree rotation not supported for in=
itial FB\n");
> +		return NULL;
> +	}
> +
>  	return display->parent->initial_plane->alloc_obj(display->drm, plane_co=
nfig);
>  }

--=20
Jani Nikula, Intel
