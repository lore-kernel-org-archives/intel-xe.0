Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3541E9B25E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 12:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9540410E568;
	Tue, 24 Feb 2026 12:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKdDBimx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051210E568;
 Tue, 24 Feb 2026 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771936383; x=1803472383;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rw47ML5VI41EI6n9hBvBEOrn5CJMIRIPb+YWimVZyuU=;
 b=VKdDBimxRhrdvAYMJ8vktqfV6nArzWZu7jQl7eZ3M8Yk6K9AYMgX0XRm
 f0iHLBQZhdK6r8iiChtuuDyjgNNOjXPdh+Gy1DM217GhJGgXpZsOBxD5W
 obBJJlMYH4mkX9He0q82ZwBj1rz2/CbwQSbp/rCxVcQDb4KaoRY9SAlcr
 M8eUk34kKCKgIESbyc4PPGlM+C/gTTvz27mGa251ESj/iZ9SsF2nxP1HQ
 RBcDWoCmUJ+EWEmF5AH0rOJplA2OO7wkEGITcoEzIIMs79Zud0EC+KXpI
 OcGQ5AvP7o6s60lTdPpDQUhIZNaWPQcVVjDYVO+k91neZYZYRZ6zlYvbA g==;
X-CSE-ConnectionGUID: q4ODy+nxQ/20bZdo8H63yA==
X-CSE-MsgGUID: rypE/ePhS1KMmZOTt5JhAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72859865"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72859865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:33:02 -0800
X-CSE-ConnectionGUID: N0E1kfpWRzmg0fLdSdyClQ==
X-CSE-MsgGUID: DXpT/57HRJWgE+vIwxAH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220882406"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:33:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v3 8/8] drm/i915/backlight: Use default/max brightness
 for INTEL AUX HDR backlight init
In-Reply-To: <20260224034526.2730130-9-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
 <20260224034526.2730130-9-suraj.kandpal@intel.com>
Date: Tue, 24 Feb 2026 14:32:57 +0200
Message-ID: <1989e10c76efdbd68bfa550525e828dbb64dbad7@intel.com>
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

On Tue, 24 Feb 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> If the brightness fetched from VBT/previous state is 0 on backlight
> initialization, then set the brightness to a default/max value.
> Whenever the minimum brightness is reported as 0 there are chances
> we maybe sometimes end up with blank screen. This confuses the user
> into thinking the display is acting weird. This occurs in eDP 1.4b
> when we use proprietary INTEL AUX HDR DPCD registers to manipulate
> brightness via luminance values.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
> v1 -> v2:
> - Let users set brightness to 0, make it so that it's just not
> done by default (Arun)
>
> v1 -> v2:
> - Update commit header & message (Arun)
>
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index aac6cdb5b69b..725370bcfa3b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -442,6 +442,8 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
>  
>  	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector, pipe);
>  	panel->backlight.enabled = panel->backlight.level != 0;
> +	if (!panel->backlight.level)
> +		panel->backlight.level = panel->backlight.max;

Same here, .enabled is still based on level != 0 above.

>  
>  	return 0;
>  }

-- 
Jani Nikula, Intel
