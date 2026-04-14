Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533AEF531F8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 07:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCC010E28D;
	Tue, 14 Apr 2026 07:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PttRayvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A1410E28D;
 Tue, 14 Apr 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150693; x=1807686693;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qikQXaGbZvdnq4j0UxiQwv7MsRkCWG6yfLD4cegGwjw=;
 b=PttRayvpjPanVLtLeYAZ0VV6qJMavl19Ck5wRrcaMndTv3gEwmrsvPi8
 vQfz+gZXg6zyRoEbLh7u3AtOnSRuMmkHUqwzUiAjvzQO7+zcJhseR+HrG
 rUEpIQvMUVo/sJ8Ux5KfXRogozt2RIiYLbsChhuGoi9uj1qukuzG99J0r
 1wBMu6h4EtUP+4XPe1qHI/Mh9F1R/kPnOukYewL64/nsCy7crfv+ugP5d
 rtRalcVPZd8G7P6OpbSJXh/B0T7wb/pkAcrQktZrq2Lt6ofy06uPjbbAS
 p9XKeLGoxVxCtYDedgb5TV5baPkjcLXzNjpPNE9Nn/UK+twU6mU+VtDlT A==;
X-CSE-ConnectionGUID: h0BYDC0JQ1y2X1ne00uizw==
X-CSE-MsgGUID: jhm6Ae0sTiyrpZKEc93fEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88546232"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88546232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:11:33 -0700
X-CSE-ConnectionGUID: NBmAB8fJQBm4l/7rIsqa7A==
X-CSE-MsgGUID: AqGsDuOMTYKpKowmMmm9TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="267995636"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:11:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: Re: [PATCH 06/19] drm/i915/display: Fix HAS_DC3CO() and add DC3CO
 trigger enum
In-Reply-To: <20260326171557.2065632-7-dibin.moolakadan.subrahmanian@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
 <20260326171557.2065632-7-dibin.moolakadan.subrahmanian@intel.com>
Date: Tue, 14 Apr 2026 10:11:26 +0300
Message-ID: <e33134612d3185542c50bf82063227755355cefb@intel.com>
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

On Thu, 26 Mar 2026, Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com> wrote:
> Fix HAS_DC3CO() based on display version and introduce an enum to
> track DC3CO enabling triggers.
>
> BSpec: 75253
> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_device.h   |  2 +-
>  .../gpu/drm/i915/display/intel_display_power.h    | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 35e06fcf794d..002fe0ce951a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -189,7 +189,7 @@ struct intel_display_platforms {
>  #define HAS_LRR(__display)		(DISPLAY_VER(__display) >= 12)
>  #define HAS_LSPCON(__display)		(IS_DISPLAY_VER(__display, 9, 10))
>  #define HAS_LT_PHY(__display)		((__display)->platform.novalake)
> -#define HAS_DC3CO(__display)		((__display)->platform.novalake)
> +#define HAS_DC3CO(__display)		(DISPLAY_VER(__display) >= 35)
>  #define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)
>  #define HAS_MSO(__display)		(DISPLAY_VER(__display) >= 12)
>  #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
> index d616d5d09cbe..3fb45154864e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.h
> @@ -131,6 +131,21 @@ struct intel_power_domain_mask {
>  	DECLARE_BITMAP(bits, POWER_DOMAIN_NUM);
>  };
>  
> +/*
> + * DC3CO enabling triggers (bitmask).
> + * DC3CO may be enabled when at least one of these triggers is active.
> + * Additional constraints may still apply.
> + */
> +enum intel_dc3co_trigger {
> +	DC3CO_TRIGGER_NONE	     = 0,
> +	DC3CO_TRIGGER_PSR2	     = BIT(0),
> +	DC3CO_TRIGGER_LOBF	     = BIT(1),
> +	DC3CO_TRIGGER_PANEL_REPLAY   = BIT(2),
> +	DC3CO_TRIGGER_ALL  = DC3CO_TRIGGER_PSR2 |
> +			     DC3CO_TRIGGER_LOBF |
> +			     DC3CO_TRIGGER_PANEL_REPLAY,
> +};

Enumerations are enumerations and bitmasks are bitmasks, and I don't
think they should be mixed like this.

Moreover, the enum as a type isn't even used anywhere.

BR,
Jani.


> +
>  struct i915_power_domains {
>  	/*
>  	 * Power wells needed for initialization at driver init and suspend

-- 
Jani Nikula, Intel
