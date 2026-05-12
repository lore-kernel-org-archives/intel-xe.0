Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7243CCD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 10:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A1D10EA1E;
	Tue, 12 May 2026 10:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhRIhdZ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A3110EA1E;
 Tue, 12 May 2026 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778582046; x=1810118046;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=a2lWujwy7e4w7KPt6ZVtmcDQg2AWjSTzR/hYdC6BpG8=;
 b=dhRIhdZ6uago7zXQ2Qt3BJFwf5OkG30aNoy8ir8tABamWkjqqUlvcpiU
 UT3XmfFfheYQZf8aBStBI5Mm7Hv/UsWvurv2kHlELAVz5cbWCj2Zho2Wh
 ZfAeeL5XASfdw6CRN+TF4XAiDqSi5f9i0LR/qQHr/8Pv5aGlBdGqVMDuR
 96hDLKqFzf7kqBQOH1A+XAKqKiT/P9yO6swoJHZcbalvXaxgYrHXEd17i
 5eYup1lBk8dgMrcuaXCmt3+9byWX6h6q2AzNzQon3j4Ai1MfMR9oyKRkq
 JgFSX/yzb7Hx23Z3HjcIz+Kbz7bOqWNN5jXFiRlU/cSolo9581suamvYl g==;
X-CSE-ConnectionGUID: ZwbJLb3ZQDm45KnMAwvl9Q==
X-CSE-MsgGUID: so4KLZxjSKOqYFgr7RF2RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79518359"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79518359"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:34:05 -0700
X-CSE-ConnectionGUID: O6H8/FSPQxablFJUhBa0lw==
X-CSE-MsgGUID: AJXi6hVQQZC0kiAzadBeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="268075980"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:34:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/14] drm/i915: Throw away the BIOS fb if has the wrong
 depth/bpp
In-Reply-To: <20260511214122.8468-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-4-ville.syrjala@linux.intel.com>
Date: Tue, 12 May 2026 13:33:59 +0300
Message-ID: <32a54727126b8c7d6605b3bfdd937e82608c2e9a@intel.com>
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

On Tue, 12 May 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Respect the user's choice of depth/bpp for the fbdev framebuffer
> and throw out the fb we inherited from the BIOS if it doesn't
> match.

Seems reasonable, although I admit I might not be aware of all the
consequences here.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index f9c135400453..3754810cc187 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -268,6 +268,8 @@ static bool bios_fb_ok(const struct intel_framebuffer=
 *fb,
>  	struct intel_display *display =3D to_intel_display(fb->base.dev);
>  	int width =3D fb->base.width;
>  	int height =3D fb->base.height;
> +	int depth =3D fb->base.format->depth;
> +	int bpp =3D fb->base.format->cpp[0] * 8;
>=20=20
>  	if (sizes->fb_width > width || sizes->fb_height > height) {
>  		drm_dbg_kms(display->drm,
> @@ -276,6 +278,13 @@ static bool bios_fb_ok(const struct intel_framebuffe=
r *fb,
>  		return false;
>  	}
>=20=20
> +	if (sizes->surface_depth !=3D depth || sizes->surface_bpp !=3D bpp) {
> +		drm_dbg_kms(display->drm,
> +			    "BIOS fb using wrong depth/bpp (%d/%d), we require (%d/%d), relea=
sing it\n",
> +			    depth, bpp, sizes->surface_depth, sizes->surface_bpp);
> +		return false;
> +	}
> +
>  	return true;
>  }

--=20
Jani Nikula, Intel
