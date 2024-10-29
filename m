Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE2D3A690
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E189B10E6DE;
	Tue, 29 Oct 2024 19:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN2NeCLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9031710E6DE
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730228937; x=1761764937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i8oneV8M+ZsH0l2J/eDqjtRf1pfcxHMQRK1AHHM0aFo=;
 b=EN2NeCLmYqavT04iK4SSWo4ba1ktXorF3JVTa2/hNlSIfZeXIeXHqmgY
 lVcljOrKrybiQvdoNPBQvfc82lQOllAl2bH6NqVIx9h5WgijWynwpr3KJ
 SPMIHRtyk1Fk6gKyJyLEiZNn8Qlh7j9Y11KBykAIbwKJCGx5DqeqwlDib
 bDluayB/0pjkASrXqlOH9DiQYTtS8yXgEpgBShmzkziShODcny6bHdH7y
 UPM4wibF4Bnpf5PSIuu12SefKqVonY66Hn7UuPcRvQL/OLecfcFY9sXgx
 cBe6t5pFQevGAm0F7w0zS1+apRfHqlXiV2p3iibZMFyWvFLLP1jP1rkO1 A==;
X-CSE-ConnectionGUID: RxhfQUWVTROWyMvfM55DSQ==
X-CSE-MsgGUID: yyZF26rRSmKNhj7i0pBoxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47375927"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="47375927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:08:57 -0700
X-CSE-ConnectionGUID: LuvzUbaaQ9qxdftiO51qlw==
X-CSE-MsgGUID: dUA8NTx5QiK+2IGJIMMBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82165710"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 29 Oct 2024 12:08:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Oct 2024 21:08:54 +0200
Date: Tue, 29 Oct 2024 21:08:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 resend 2/8] drm/i915/display: Use async flip when
 available for initial plane config
Message-ID: <ZyEyxuvKVtAWBFDc@intel.com>
References: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
 <20241029150005.68440-3-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029150005.68440-3-maarten.lankhorst@linux.intel.com>
X-Patchwork-Hint: comment
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

On Tue, Oct 29, 2024 at 03:59:59PM +0100, Maarten Lankhorst wrote:
> I'm planning to reorder readout in the Xe sequence in such a way that
> interrupts will not be available, so just use an async flip.
> 
> Since the new FB points to the same pages, it will not tear. It also
> has the benefit of perhaps being slightly faster.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index a0a7ed01415a5..6740c193920ff 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2902,7 +2902,7 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
>  		to_intel_plane_state(plane->base.state);
>  	enum plane_id plane_id = plane->id;
>  	enum pipe pipe = crtc->pipe;
> -	u32 base;
> +	u32 base, plane_ctl;
>  
>  	if (!plane_state->uapi.visible)
>  		return false;
> @@ -2916,7 +2916,16 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
>  	if (plane_config->base == base)
>  		return false;
>  
> +	/* Perform an async flip to the new surface. */
> +	plane_ctl = intel_de_read(i915, PLANE_CTL(pipe, plane_id));
> +	plane_ctl |= PLANE_CTL_ASYNC_FLIP;

Still NAK.

> +
> +	intel_de_write(i915, PLANE_CTL(pipe, plane_id), plane_ctl);
>  	intel_de_write(i915, PLANE_SURF(pipe, plane_id), base);
>  
> -	return true;
> +	if (intel_de_wait(i915, PLANE_SURFLIVE(pipe, plane_id), ~0U, base, 40) < 0)
> +		drm_warn(&i915->drm, "async flip timed out\n");
> +
> +	/* No need to vblank wait either */
> +	return false;
>  }
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
