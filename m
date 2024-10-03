Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC69CF34B9
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 15:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86C10E8A1;
	Thu,  3 Oct 2024 15:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/GM2KSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C444010E89F;
 Thu,  3 Oct 2024 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727971101; x=1759507101;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=51U0uize0zCeaJAFYofxwA/PElJiZ538xtwXh3swY0M=;
 b=Y/GM2KSZ2GM6/mBfL8gQXc5Lkq9E8ebKow7rh7y9tgGcYuzAlOchAP4h
 +sQrYeKShJZnb6DDU1qGg96vfA2qBjx0XnKVUicwzgTmsbCMa0uIYzZTK
 J0QNk2RACYg1AQfmzY7EKecxnSm3/EqlGKXD5009yWx14Icuua6YOOreh
 aSPf7OLUxEtaFX3kuqiVumyM8LVP6TnmF7/bSWqmOmetJiBXsRyXH1EKL
 3T9RrGRkuMMUsF7cZ2GDDj5Lm+aGB0Za9tMN7yHkGh9R0iFsnTUlXYu+Y
 jqM8SDzRi4YHbcnx34rnhGUCzxDRCZ7pBlVrYuq3uxbY7C1DrTQM7ys/u g==;
X-CSE-ConnectionGUID: IRzMqRajSgyWN5JFeJ6PhA==
X-CSE-MsgGUID: Tuw2aoGvR4SSO+2t6DIx+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27324892"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27324892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 08:58:18 -0700
X-CSE-ConnectionGUID: qP4fsvmySO+UKHuQSCeOOg==
X-CSE-MsgGUID: 51JR8i93Sy+GwR2EAzNMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="73982134"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.186])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 08:58:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 03/12] drm/i915/display: Use async flip when
 available for initial plane config
In-Reply-To: <20241003154421.33805-4-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241003154421.33805-1-maarten.lankhorst@linux.intel.com>
 <20241003154421.33805-4-maarten.lankhorst@linux.intel.com>
Date: Thu, 03 Oct 2024 18:58:12 +0300
Message-ID: <87plohrxez.fsf@intel.com>
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

On Thu, 03 Oct 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
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
> index fdb141cfa4274..73a3624e34098 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2800,7 +2800,7 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
>  		to_intel_plane_state(plane->base.state);
>  	enum plane_id plane_id = plane->id;
>  	enum pipe pipe = crtc->pipe;
> -	u32 base;
> +	u32 base, plane_ctl;
>  
>  	if (!plane_state->uapi.visible)
>  		return false;
> @@ -2814,7 +2814,16 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
>  	if (plane_config->base == base)
>  		return false;
>  
> +	/* Perform an async flip to the new surface. */
> +	plane_ctl = intel_read(i915, PLANE_CTL(pipe, plane_id));
> +	plane_ctl |= PLANE_CTL_ASYNC_FLIP;
> +
> +	intel_de_write(i915, PLANE_CTL(pipe, plane_id), plane_ctl);
>  	intel_de_write(i915, PLANE_SURF(pipe, plane_id), base);
>  
> -	return true;
> +	if (intel_de_wait_custom(i915, PLANE_SURFLIVE(pipe, plane_id), ~0U, base, 0, 40, NULL) < 0)

Why not just intel_de_wait()?

BR,
Jani.

> +		drm_warn(&i915->drm, "async flip timed out\n");
> +
> +	/* No need to vblank wait either */
> +	return false;
>  }

-- 
Jani Nikula, Intel
