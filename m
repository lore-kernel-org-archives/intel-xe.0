Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19813C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 06:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B310E20F;
	Thu, 13 Jun 2024 06:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gr3/WnG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED3310E20F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 06:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718259912; x=1749795912;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=nuOHV8h/dFaPExFepx9EULltBOVekyLU8Zk5P7ZGgBs=;
 b=gr3/WnG0hsKiz0/NE8Xvdscr+NDaXIXYW9CMEz063h9o53mlO9+q8OX4
 lJTcoT2/1Az2ajWV7iLBTPqt5kesu8nQoBVW4gPqGg0dUE7Ed9GYs5sPv
 2iIgNldDubnKl9ZiAcQeJC5GlH2da7gxzC8bOLcXgsMTRzsKFQzCXZy37
 FeAjyDmbBUAr0FuKjUT6glcm7ZUFEmmrbFIEYU4X0jEWWuNnOg3n0nXLG
 THp56lSMKMc1UmZcW9jr0N9ZwCis9rtyKUY2KUKqMoabHJZLmfn1BnSKU
 IIX07IGjRFlWEZV9F5piAuykCfxkC+F7T895lRJMu6YyG2brgS5i3PnJm w==;
X-CSE-ConnectionGUID: KLEpCelFRCOlvQWm3nQskQ==
X-CSE-MsgGUID: CY47bmWbTLq22kBwQCHLHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="37575175"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="37575175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:25:11 -0700
X-CSE-ConnectionGUID: +p30oP39Tpa0ux0hyUSb1w==
X-CSE-MsgGUID: iOpYLxsBTriZ7Ybc00kHcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40143692"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:25:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Update vtotal math to address 32b build
In-Reply-To: <20240612062925.271213-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240612062925.271213-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 13 Jun 2024 09:25:06 +0300
Message-ID: <874j9xjr5p.fsf@intel.com>
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

On Wed, 12 Jun 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Fix vtotal division calculation which works for 32b systems.

This should be sent to intel-gfx (too).

BR,
Jani.

>
> Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 05f67dc9d98d..1e37383e14e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -149,7 +149,8 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
>  
>  	crtc_state->cmrr.cmrr_n =
>  		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
> -	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
> +	vtotal = DIV_ROUND_UP_ULL(adjusted_mode->crtc_clock * 1000 * multiplier_n,
> +				  crtc_state->cmrr.cmrr_n);
>  	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
>  	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);

-- 
Jani Nikula, Intel
