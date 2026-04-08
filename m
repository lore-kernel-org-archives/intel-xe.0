Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473B8FD5F8E
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228910E58D;
	Wed,  8 Apr 2026 08:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ16pfKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D5D10E58D;
 Wed,  8 Apr 2026 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775637780; x=1807173780;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+/B8V6+qumrlqiIXs/DgToQnYXp4NgtEFZMWyPCWCwE=;
 b=nQ16pfKLpwP2726ttjXqon5GuRwfLjWF7xJMaj1WoTM9Mw3G0qwTGk++
 dIqI6bDzmj75GuOtevbWjfbp3US71np8SbXGnQB0RsK+3Vl39zDg73bA/
 2wKGUVStn58MBjwgVd3S383ZC17xnpztUbm400xpY+uF8XK7y3VaNcpjE
 sYWiq9Aro76riE/ukBPjC9WiGiMaXZX1j9DMUMBiQEH84OZQunh72TJfV
 LbtueoLXa5LVQef2VjNC1UzRtWRW5OdWqZnXyeXJqGTWvD7UKMo4JCbS2
 Ma/fEKGc42PlG14ku/POMWsR0P6tz23E76N+8+isZZ9Ua6wAjGEA1rozR Q==;
X-CSE-ConnectionGUID: 2L1otuL2RFGXE2x4U2iQVg==
X-CSE-MsgGUID: mv3hQR1EQY6v9u+KEyPcvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80208993"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80208993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:43:00 -0700
X-CSE-ConnectionGUID: BZqJ634TSWSVDarlRERhxw==
X-CSE-MsgGUID: KDP/HlrFSpubpOrCsxDOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228310284"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:42:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/12] drm/i915/fb: Nuke intel_tile_row_size()
In-Reply-To: <20260407155053.32156-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-2-ville.syrjala@linux.intel.com>
Date: Wed, 08 Apr 2026 11:42:54 +0300
Message-ID: <3ee6c763bb12c2df96ef6af6756be6bca4c9dea8@intel.com>
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

On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> intel_tile_row_size() is unused. Nuke it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 9 ---------
>  drivers/gpu/drm/i915/display/intel_fb.h | 1 -
>  2 files changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index 5768619f840f..83392c1a1ebe 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -876,15 +876,6 @@ static void intel_tile_block_dims(const struct drm_f=
ramebuffer *fb, int color_pl
>  		*tile_height =3D 1;
>  }
>=20=20
> -unsigned int intel_tile_row_size(const struct drm_framebuffer *fb, int c=
olor_plane)
> -{
> -	unsigned int tile_width, tile_height;
> -
> -	intel_tile_dims(fb, color_plane, &tile_width, &tile_height);
> -
> -	return fb->pitches[color_plane] * tile_height;
> -}
> -
>  unsigned int
>  intel_fb_align_height(const struct drm_framebuffer *fb,
>  		      int color_plane, unsigned int height)
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i9=
15/display/intel_fb.h
> index 22514d5f2bb6..fb1ec2a1e905 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -62,7 +62,6 @@ int skl_main_to_aux_plane(const struct drm_framebuffer =
*fb, int main_plane);
>  unsigned int intel_tile_size(struct intel_display *display);
>  unsigned int intel_tile_width_bytes(const struct drm_framebuffer *fb, in=
t color_plane);
>  unsigned int intel_tile_height(const struct drm_framebuffer *fb, int col=
or_plane);
> -unsigned int intel_tile_row_size(const struct drm_framebuffer *fb, int c=
olor_plane);
>  unsigned int intel_fb_align_height(const struct drm_framebuffer *fb,
>  				   int color_plane, unsigned int height);

--=20
Jani Nikula, Intel
