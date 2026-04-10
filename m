Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EA2F459F7
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 16:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EA710E255;
	Fri, 10 Apr 2026 16:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g98p4xPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9610E255;
 Fri, 10 Apr 2026 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775836844; x=1807372844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MnOHOVyLa4WG6izrpiO+PKp8MguobJrDN7Hi32t8CjA=;
 b=g98p4xPo/J1kmeHHWYWGfZJIfcypk5H+tqWaJazlVxj5b9rlGcj0+cWo
 /2BI02TLyg+uo57hLLtVRoMoJVQ1ncBMuIos7gsMkPo3IkRZeARlccIQf
 fSLEIPd0o93fliDUe3ZL3XanekowIVg24kNwoy6dCm9DpphwL1yLRJEAR
 LmK/4EzWAqo0O/Dlq8ZhBn97WKB9Tpdnk2UwxutXmYuj/pkK0rEYvhDlC
 98saUHpiukh86Wo7Aj3h6ObfiAAjiqZeNUommHoPni0ZVe/hmpWSLZh1h
 DGjoRlXQmMjqkVNjp7dZxrcR3X4n1TGtb6mF+gmJ7tcHHZIhYqDjRefnI w==;
X-CSE-ConnectionGUID: jp1xgJoBRMOuhQjlhxhOvA==
X-CSE-MsgGUID: G+Vm8wiSTJyQlucSk1E+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87144385"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87144385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 09:00:35 -0700
X-CSE-ConnectionGUID: sL+rxAJqSva7QI8uMHVJwg==
X-CSE-MsgGUID: MqC8Nu05Q2SylUIztWTThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="224810970"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 09:00:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/10] drm/i915: Completely reject DPT BIOS FBs.
In-Reply-To: <20260410150449.9699-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
 <20260410150449.9699-10-ville.syrjala@linux.intel.com>
Date: Fri, 10 Apr 2026 19:00:31 +0300
Message-ID: <fad463cb24fc7e63cfd8360e370b7b7f9f4367a1@intel.com>
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
> Our BIOS FB handling can't deal with DPT, and instead everything
> just assumes a direct GGTT mapping. Reject any BIOS FB using DPT.
> Most likely this should never happen anyway.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Seems cleaner.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_initial_plane.c | 9 +++++++++
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ------
>  2 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers=
/gpu/drm/i915/display/intel_initial_plane.c
> index 55b6cdded126..e3d1b2d1669c 100644
> --- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
> @@ -92,6 +92,15 @@ intel_alloc_initial_plane_obj(struct intel_display *di=
splay,
>  		return NULL;
>  	}
>=20=20
> +	/*
> +	 * Would need to preserve the DPT, its GGTT
> +	 * mapping, and the actual FB memory.
> +	 */
> +	if (intel_fb_modifier_uses_dpt(display, fb->modifier)) {
> +		drm_dbg_kms(display->drm, "DPT not supported for initial FB\n");
> +		return NULL;
> +	}
> +
>  	return display->parent->initial_plane->alloc_obj(display->drm, plane_co=
nfig);
>  }
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 00c863e378a1..5aef8123d8b8 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -3148,12 +3148,6 @@ skl_get_initial_plane_config(struct intel_crtc *cr=
tc,
>=20=20
>  	fb->format =3D drm_get_format_info(display->drm, fourcc, fb->modifier);
>=20=20
> -	if (!display->params.enable_dpt &&
> -	    intel_fb_modifier_uses_dpt(display, fb->modifier)) {
> -		drm_dbg_kms(display->drm, "DPT disabled, skipping initial FB\n");
> -		goto error;
> -	}
> -
>  	/*
>  	 * DRM_MODE_ROTATE_ is counter clockwise to stay compatible with Xrandr
>  	 * while i915 HW rotation is clockwise, that's why this swapping.

--=20
Jani Nikula, Intel
