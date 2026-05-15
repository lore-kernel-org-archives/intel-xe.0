Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DF6CD4851
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 10:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27510E0DC;
	Fri, 15 May 2026 10:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqCG6cki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE1510E0DC;
 Fri, 15 May 2026 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778840488; x=1810376488;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kiOb+hsemc4b9HaQHWVjmwHWfSnn9cd6fEGoMYVPWuc=;
 b=ZqCG6cki/cNWxRSKIwEOeEId/TS+kja0UrlRzk1deyQaSCX82yMObcvt
 QWmhxyxrUkifsjM137Z+ylGQQ/Gix0xuLxICDnIWj+3+qHPLKEf84Y/An
 pn+UG6xwsR7jgpLyPTI5UwnUFXIJ0g/l7WpMLtfUZbPWKrBWa97BlAJuR
 S7n9Ui2KDF0V256VEIRVc0BBU9O8syUWWW695AxJMPz+08CxUIVwPOPMr
 kTzJabMTWkvVQ0rF/58WOnM9e/JdeCXiNX3wDaBYySOG8Iy/mJFuFNqWP
 m4TTdaxJ0KMZj9UxFjjuUQZnLwxOvr2F1SdjMjXBaofeX6V/BbM/PgcKl Q==;
X-CSE-ConnectionGUID: aKTwsfSgShSdpeb4x57ZAQ==
X-CSE-MsgGUID: Xwmif8KzT3uNW+KzSADIEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90898029"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90898029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:21:28 -0700
X-CSE-ConnectionGUID: leqAaAMTTiOpswwKrJcUZQ==
X-CSE-MsgGUID: BYMmA68WRmCmxy/43Wxlqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="235607838"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:21:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver
 >= 30
In-Reply-To: <20260515082443.975592-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260515082443.975592-1-suraj.kandpal@intel.com>
Date: Fri, 15 May 2026 13:21:23 +0300
Message-ID: <af6c1f14f5b4efa0d3ecb34848f9f900fa8f97e5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 15 May 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Starting with display version 30, the per-pipe frame timestamp is read
> from the PIPEDMC register block (PIPEDMC_FRMTMSTMP) instead of the
> legacy PIPE_FRMTMSTMP MMIO. Extend PIPE_FRMTMSTMP() to take the display
> and select the appropriate register based on DISPLAY_VER(), and update
> all callers (intel_vblank, intel_initial_plane) accordingly.
>
> Bspec: 79482
> WA: 14022946399
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h  | 7 +++++--
>  drivers/gpu/drm/i915/display/intel_initial_plane.c | 4 ++--
>  drivers/gpu/drm/i915/display/intel_vblank.c        | 4 ++--
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 4321f8b529da..579f802215d3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -3149,8 +3149,11 @@ enum skl_power_gate {
>  /* g4x+, except vlv/chv! */
>  #define _PIPE_FRMTMSTMP_A		0x70048
>  #define _PIPE_FRMTMSTMP_B		0x71048
> -#define PIPE_FRMTMSTMP(pipe)		\
> -	_MMIO_PIPE(pipe, _PIPE_FRMTMSTMP_A, _PIPE_FRMTMSTMP_B)
> +#define _PIPEDMC_FRMTMSTMP_A		0x5f0ac
> +#define _PIPEDMC_FRMTMSTMP_B		0x5f4ac
> +#define PIPE_FRMTMSTMP(display, pipe)	(DISPLAY_VER(display) >= 30 ? \
> +	_MMIO_PIPE(pipe, _PIPEDMC_FRMTMSTMP_A, _PIPEDMC_FRMTMSTMP_B) : \
> +	_MMIO_PIPE(pipe, _PIPE_FRMTMSTMP_A, _PIPE_FRMTMSTMP_B))

I'm wondering if we want to hide this difference inside the register
macro, though.

Yes, it's the easy thing to do.

But PIPEDMC registers belong in intel_dmc_regs.h, and it's a bit
questionable to have something that looks like PIPE_FRMTMSTMP() suddenly
end up being PIPMEDMC_FRMTMSTMP.

BR,
Jani.


PS. It's absolutely disgusting that this is named "FRMTMSTMP" in
bspec. Vowels exist for a reason.

>  
>  /* g4x+, except vlv/chv! */
>  #define _PIPE_FLIPTMSTMP_A		0x7004C
> diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
> index 034fe199c2a1..004cbdb6be32 100644
> --- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
> @@ -34,9 +34,9 @@ void intel_initial_plane_vblank_wait(struct intel_crtc *crtc)
>  		return;
>  	}
>  
> -	start_ts = intel_de_read(display, PIPE_FRMTMSTMP(crtc->pipe));
> +	start_ts = intel_de_read(display, PIPE_FRMTMSTMP(display, crtc->pipe));
>  
> -	ret = poll_timeout_us(end_ts = intel_de_read(display, PIPE_FRMTMSTMP(crtc->pipe)),
> +	ret = poll_timeout_us(end_ts = intel_de_read(display, PIPE_FRMTMSTMP(display, crtc->pipe)),
>  			      end_ts != start_ts, 1000, 1000 * 1000, false);
>  	if (ret)
>  		drm_warn(display->drm, "[CRTC:%d:%s] early vblank wait timed out\n",
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 28d81199792e..52ff47936f9e 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -157,7 +157,7 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
>  		 * is sampled at every start of vertical blank.
>  		 */
>  		scan_prev_time = intel_de_read_fw(display,
> -						  PIPE_FRMTMSTMP(crtc->pipe));
> +						  PIPE_FRMTMSTMP(display, crtc->pipe));
>  
>  		/*
>  		 * The TIMESTAMP_CTR register has the current
> @@ -166,7 +166,7 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
>  		scan_curr_time = intel_de_read_fw(display, IVB_TIMESTAMP_CTR);
>  
>  		scan_post_time = intel_de_read_fw(display,
> -						  PIPE_FRMTMSTMP(crtc->pipe));
> +						  PIPE_FRMTMSTMP(display, crtc->pipe));
>  	} while (scan_post_time != scan_prev_time);
>  
>  	return div_u64(mul_u32_u32(scan_curr_time - scan_prev_time,

-- 
Jani Nikula, Intel
