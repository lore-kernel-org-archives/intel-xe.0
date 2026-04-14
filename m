Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1376F9D0D3
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F09D10E0EA;
	Tue, 14 Apr 2026 15:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9Ln/5m8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C2410E0EA;
 Tue, 14 Apr 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776181371; x=1807717371;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/POnNeAxl1NYAfZ7rXYtPsivu8bHhWdV9fHCpdAkQGo=;
 b=W9Ln/5m8bmkLsBwWfOmMlefGSzJnVaQB/pQRYNOGagIdvVGgZzLuY40H
 DwkluBQiokg/4J056Fc+5OuC1T2tAhtG2EYDFgtLDzfpZdFPiacIjrxow
 xI4lCWFAoG+E20EMXHkzce2kSIIXrlvcurJABE83rLdcdAiJhnT5Ju3cP
 Hbevy4pUCGuea7nmWNmYFS7Fa+HbWEwxiUjp2FsaL6D8Ttub3IeY1JT1G
 UdN+0LDnTb1bDGAUkgCKmjdEvePAxLYUEDlT+eqyFCiuyAkyE/Hij2qAx
 S57wrvMrTW+pH4gz+ALzWL/kJGYCJV52bBVy8h7urN8QPzQ/8N+irv6o7 w==;
X-CSE-ConnectionGUID: 8Fp6bpgSR+WobCwea3PrYg==
X-CSE-MsgGUID: MnnVGp+LQVSapX7t+8uq7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88220893"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88220893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:42:50 -0700
X-CSE-ConnectionGUID: 6tO4LgJASeu6qRprgU7gOQ==
X-CSE-MsgGUID: GpzKIF0ETjKAakU1Z10rzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225412828"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:42:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: Re: [PATCH] [RFC]: drm/i915/display: Use ceiling division for NV12
 UV surface offset calculation
In-Reply-To: <20260411171521.162189-1-vidya.srinivas@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260411171521.162189-1-vidya.srinivas@intel.com>
Date: Tue, 14 Apr 2026 18:42:45 +0300
Message-ID: <bf735bb719753185479461767d7c077bd9c3bfda@intel.com>
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

On Sat, 11 Apr 2026, Vidya Srinivas <vidya.srinivas@intel.com> wrote:
> For LNL+, odd source size and panning for YUV 422/420 surfaces is
> supported. However, it requires the UV (chroma) surface Start X/Y and
> width/height to be calculated as ceiling(half of Y plane value) rather
> than floor. The current code uses (>> 17) which is floor division. For
> odd Y plane values this produces an off-by-one error in the UV plane
> offset.
>
> On Android systems we see PLANE ATS fault when NV12 overlays are
> used with odd source dimensions:
>
> [  126.854200] xe 0000:00:02.0: [drm:intel_atomic_setup_scaler [xe]] [CRTC:148:pipe A] attached scaler id 0.0 to PLANE:33
> [  126.854617] xe 0000:00:02.0: [drm:skl_update_scaler [xe]] [CRTC:148:pipe A] scaler_user index 0.0: staged scaling request for 1279x719->1340x753
> [  126.854837] xe 0000:00:02.0: [drm:intel_plane_atomic_check [xe]] UV plane [PLANE:33:plane 1A] using Y plane [PLANE:123:plane 4A]
> [  126.854926] xe 0000:00:02.0: [drm] *ERROR* [CRTC:148:pipe A] PLANE ATS fault
>
> With Y plane width 1279:
>   floor(1279/2) = 639 (current)
>   ceil(1279/2)  = 640 (required)
>
> Change the UV offset/size calculation to use ceiling division by adding
> (1 << 17) - 1 before shifting. This is a no-op for even values since
> ceiling and floor are equal when the dividend is even.
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 7a9d494334b5..c455bf92ae99 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2139,10 +2139,16 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>  	int min_height = intel_plane_min_height(plane, fb, uv_plane, rotation);
>  	int max_width = intel_plane_max_width(plane, fb, uv_plane, rotation);
>  	int max_height = intel_plane_max_height(plane, fb, uv_plane, rotation);
> -	int x = plane_state->uapi.src.x1 >> 17;
> -	int y = plane_state->uapi.src.y1 >> 17;
> -	int w = drm_rect_width(&plane_state->uapi.src) >> 17;
> -	int h = drm_rect_height(&plane_state->uapi.src) >> 17;
> +
> +	/*
> +	 * LNL+ UV surface start/size =
> +	 * ceiling(half of Y plane start/size). Use ceiling division
> +	 * unconditionally; it is a no-op for even values.
> +	 */
> +	int x = (plane_state->uapi.src.x1 + (1 << 17) - 1) >> 17;
> +	int y = (plane_state->uapi.src.y1 + (1 << 17) - 1) >> 17;
> +	int w = (drm_rect_width(&plane_state->uapi.src) + (1 << 17) - 1) >> 17;
> +	int h = (drm_rect_height(&plane_state->uapi.src) + (1 << 17) - 1) >> 17;

The problem I have with this is that the original >> 17 is already too
magic. It divides a U16.16 fixed point in half, and this is completely
non-obvious.

The commit message doesn't even mention this.

I think this needs a clean separation between the division and the
conversion to int.


BR,
Jani.


>  	u32 offset;
>  
>  	/* FIXME not quite sure how/if these apply to the chroma plane */

-- 
Jani Nikula, Intel
