Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B668CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 12:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F9510E1E6;
	Wed, 27 May 2026 12:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3yuhboO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674110E1E6;
 Wed, 27 May 2026 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779884812; x=1811420812;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7bz0QRNCMfdHGJrZxZMDPgyb+nfA4Mx+fFNhgSwajss=;
 b=h3yuhboOvZA1pPj0fBM/JhQSVfDltn8lKCPesCcYaYimHVWns7u5LeRy
 f9GewcHEeT1m2hLkyOO7BBqru/g3ej6Xpqy2o8mfjtZhMC0yqndICqTeq
 quqsFEswCgQ493pGchflJBTfEk+PQT5WY08q5o9qaEv/qzrewYDW9V7Yp
 MuVeOnm8Q2P/ECmpuOH+boX/iVATbVi2vZlq9TYrH+oks5ZqTXNvRVZlP
 IAIKO8KOACLCdg3VrtsrwRUT6Buz2rqMOoGeA/8A0cds+lMZ80Lzkv4p2
 kGOotc8WqL7F0pSYUhEanKi8xc1RRwiBxNHD2FtTyUAzxnzwMpAraIYhm g==;
X-CSE-ConnectionGUID: S9T/M6tATpKIGcX7j8ynZA==
X-CSE-MsgGUID: C7dwcUqGTZ6WAGMTTQWPJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92099490"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="92099490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:26:51 -0700
X-CSE-ConnectionGUID: Opo5iupISc+NRqPO6dOWAw==
X-CSE-MsgGUID: IHMrL3KiTBq6OIw3EgCjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="238055562"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.38])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 05:26:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v4 05/13] drm/i915/display: Add DC3CO support check
In-Reply-To: <20260526191826.3786009-6-dibin.moolakadan.subrahmanian@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
 <20260526191826.3786009-6-dibin.moolakadan.subrahmanian@intel.com>
Date: Wed, 27 May 2026 15:26:47 +0300
Message-ID: <7eb615966dca9c62be035f3270c756bcb49a7b27@intel.com>
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

On Wed, 27 May 2026, Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com> wrote:
> Add intel_display_power_dc3co_supported() helper to query DC3CO
> support from allowed_dc_mask.
>
> Changes in v2:
> - Squash "Add helper to check DC3CO support" patch into this patch
>
> Changes in v4:
> - Remove introduced dc state validation,as it may break
>   fall back mechanism (sashiko)
>
> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_display_power.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index c70971ffd9f0..4b91747b38f1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -302,6 +302,7 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
>  	struct i915_power_domains *power_domains = &display->power.domains;
>  
>  	mutex_lock(&power_domains->lock);
> +

Superfluous.

>  	power_well = lookup_power_well(display, SKL_DISP_DC_OFF);
>  
>  	if (drm_WARN_ON(display->drm, !power_well))
> @@ -358,6 +359,13 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
>  	return current_dc_state;
>  }
>  
> +bool intel_display_power_dc3co_supported(struct intel_display *display)

This should probably be static. See my other replies in the thread.

> +{
> +	struct i915_power_domains *power_domains = &display->power.domains;
> +
> +	return (power_domains->allowed_dc_mask & DC_STATE_EN_UPTO_DC3CO) == DC_STATE_EN_UPTO_DC3CO;
> +}
> +
>  static void __async_put_domains_mask(struct i915_power_domains *power_domains,
>  				     struct intel_power_domain_mask *mask)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
> index d616d5d09cbe..05880e9da89f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.h
> @@ -186,6 +186,7 @@ void intel_display_power_resume(struct intel_display *display);
>  void intel_display_power_set_target_dc_state(struct intel_display *display,
>  					     u32 state);
>  u32 intel_display_power_get_current_dc_state(struct intel_display *display);
> +bool intel_display_power_dc3co_supported(struct intel_display *display);
>  
>  bool intel_display_power_is_enabled(struct intel_display *display,
>  				    enum intel_display_power_domain domain);

-- 
Jani Nikula, Intel
