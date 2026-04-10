Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022B9F459F5
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 15:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABD310E97D;
	Fri, 10 Apr 2026 15:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Scxt6SaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657F510E24C;
 Fri, 10 Apr 2026 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775836522; x=1807372522;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bibI8JKePOlnt07RSzEfw0O6UFe8jkuJWjH+yrF+0g4=;
 b=Scxt6SaNn8AEMIOdg7eeGCx/vSxM/MwoIgKKOshs+R+/+6GYlHenKTX6
 E+PUSY0b7qSbqQqAFXLHuN4qjhqJSy3ZCDLQZ922jYk9Gc0DW8PHQxiQ9
 cA+WffcWlA8uTHd87OTYRp84ABrByoEhOHqSc0nbGPYqnmGdgS7PNlc73
 tz93sHTh3nL5CwNJ7R8RzIywmdCp1tS9Ozl5sW7tJX+SCGypot2XcX+cj
 KcqDsh+ht1Dj+IV7GiaqNxACyyuhzbdr/NAOd+Qj6PiZIV0n/5lnkTLb/
 P9kw2JhqtNPSzESy6De9MqpYIKqD2+UrBxhLrkoWKlhmusoCDnGCKAZLP g==;
X-CSE-ConnectionGUID: I7CdGGq6Su6PY2GnHb4nUQ==
X-CSE-MsgGUID: ccPkQ26mSU+l9GjatO3QIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87934577"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87934577"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:55:20 -0700
X-CSE-ConnectionGUID: YZvauTi1QDCwj5RBnHuPsQ==
X-CSE-MsgGUID: D+YryTznRpCin0o63Orbpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229037558"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:55:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/10] drm/i915: Reject tile4 BIOS FB
In-Reply-To: <20260410150449.9699-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
 <20260410150449.9699-8-ville.syrjala@linux.intel.com>
Date: Fri, 10 Apr 2026 18:55:15 +0300
Message-ID: <d8b7837ec586c63bb36ce85e486968e1ac4d1f52@intel.com>
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
> There is no such thing as tile4 fenced region, so there is no
> way to have a linear view of the tile4 framebuffer for the CPU.
> Thus we should never encounter a tile4 BIOS FB, but if we somehow
> do, then reject it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_initial_plane.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers=
/gpu/drm/i915/display/intel_initial_plane.c
> index 4f1591b55752..5a5adf738d4a 100644
> --- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
> @@ -81,7 +81,6 @@ intel_alloc_initial_plane_obj(struct intel_display *dis=
play,
>  	case DRM_FORMAT_MOD_LINEAR:
>  	case I915_FORMAT_MOD_X_TILED:
>  	case I915_FORMAT_MOD_Y_TILED:
> -	case I915_FORMAT_MOD_4_TILED:
>  		break;
>  	default:
>  		drm_dbg_kms(display->drm, "Unsupported modifier for initial FB: 0x%llx=
\n",

--=20
Jani Nikula, Intel
