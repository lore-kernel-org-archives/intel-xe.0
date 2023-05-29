Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A17C7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 08:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D8D10E061;
	Mon, 29 May 2023 08:01:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B0210E061
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685347307; x=1716883307;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+ZNprfPErc7zZX5Flr+Sw2yNy5hu9sD4MCvOdjLdPp4=;
 b=e1Y6B7saPTiSRA3iJnNGJXaS9SB/K1uy2FP7KbeM2K2epC58LMe5wQK9
 g+Mpd5YGQp+U8KtWvoU2kb4VyaOTm6nC6kykWTPen7oRuWtQPSrS5WYq0
 QRLReMZ36Rd+Znq08zXDyBn6PF53kT2slR1fY4fJGDyOTDv+pdJGjDfzb
 V4w+CkWEN92YmXbDgGKN0SKszre6MKiZIvt122isq7x9Yeu8AV42VAWA+
 FiMxI7IRKm34T3JHCWAJmYladANx1NSB8aNX0krvV/QZ63TjSDClOGaz4
 jH7jouXEjV7VTwXL6Lp9N23DvJJFJcp8AWzEDbNePaWzPV0+2wVJuO5Nc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353491798"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="353491798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="739058963"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="739058963"
Received: from iswiersz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.191])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:01:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230526211730.2774851-3-anusha.srivatsa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
 <20230526211730.2774851-3-anusha.srivatsa@intel.com>
Date: Mon, 29 May 2023 11:01:42 +0300
Message-ID: <877csrin15.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/5] drm/i915/adlp: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 26 May 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
> Refer to platform with the same consistent name.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

Send this first to intel-gfx, get it merged to i915, and then
cherry-pick -x backport it to xe.

Otherwise, please avoid i915 changes in the xe branch.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h            | 2 +-
>  drivers/gpu/drm/i915/intel_step.c          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index f6223d8f13b8..bb0d8cd7034e 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -3409,7 +3409,7 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
>  		/* Wa_22011320316:adl-p[a0] */
>  		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
>  			dev_priv->display.cdclk.table = adlp_a_step_cdclk_table;
> -		else if (IS_ADLP_RPLU(dev_priv))
> +		else if (IS_ALDERLAKE_P_RPLU(dev_priv))
>  			dev_priv->display.cdclk.table = rplu_cdclk_table;
>  		else
>  			dev_priv->display.cdclk.table = adlp_cdclk_table;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 14c5338c96a6..e870dd412a75 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -578,7 +578,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL)
>  #define IS_ADLP_N(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_N)
> -#define IS_ADLP_RPLP(i915) \
> +#define IS_ALDERLAKE_P_RPLU(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPL)
>  #define IS_ADLP_RPLU(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index 84a6fe736a3b..6a8816fbc15a 100644
> --- a/drivers/gpu/drm/i915/intel_step.c
> +++ b/drivers/gpu/drm/i915/intel_step.c
> @@ -191,7 +191,7 @@ void intel_step_init(struct drm_i915_private *i915)
>  	} else if (IS_ADLP_N(i915)) {
>  		revids = adlp_n_revids;
>  		size = ARRAY_SIZE(adlp_n_revids);
> -	} else if (IS_ADLP_RPLP(i915)) {
> +	} else if (IS_ALDERLAKE_P_RPLU(i915)) {
>  		revids = adlp_rplp_revids;
>  		size = ARRAY_SIZE(adlp_rplp_revids);
>  	} else if (IS_ALDERLAKE_P(i915)) {

-- 
Jani Nikula, Intel Open Source Graphics Center
