Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A2FC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 08:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646810E215;
	Mon, 29 May 2023 08:00:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF26810E215
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685347228; x=1716883228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4cTLBhDTG/jIClaODI1eA2W06Ef5WkO5edybTK4avCo=;
 b=ibahXS9Kd35le4VdKhR6mHe9H0Ey6XMx98rbjJgA+c5dzm5S2RMZSt4n
 DwRzWfH6bHMTZUH9PUtqIOPaqbqwRpXzkqSLReGtNcQitYJTtSFNfRGjf
 Z9AJWEcew82wMZiW+bB964im/w/N2vwWIFTDxs95yLUjWvMvP1dNkBRvu
 O8apGAsh5Rgu8NmIbb47PJWZskCEwEmvvjcuErgGGAQtcdy0kNVe2fjfe
 rvKw3bXWV1sXYIUznOfUmzn0hwG9+wVyFgTSEjlvlN/4wzRgJNqFarxZc
 666z8I2sT0bXGOG3nvS0eyTYJQN3oTt0e2Pvh7sTLq5M4n1XUdpuqK0Hs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353491488"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="353491488"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="739058803"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="739058803"
Received: from iswiersz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.191])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:00:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230526211730.2774851-2-anusha.srivatsa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
 <20230526211730.2774851-2-anusha.srivatsa@intel.com>
Date: Mon, 29 May 2023 11:00:23 +0300
Message-ID: <87a5xnin3c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe/adlp: s/ADLP/ALDERLAKE_P
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
> Inconsistent usage of platform names across the driver.
> Changing to use the name convention throughout - ALDERLAKE_P.
> This will make it easier for macro magic usages.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-

Changes to this file needs to be split up as fixup to xe display
enabling.

>  drivers/gpu/drm/xe/xe_pci.c                       | 2 +-
>  drivers/gpu/drm/xe/xe_platform_types.h            | 2 +-
>  drivers/gpu/drm/xe/xe_step.c                      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 74e6f063f741..9d212fbbce26 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -160,7 +160,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
>  #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
>  #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
> -#define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> +#define IS_ALDERLAKE_P_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
>  #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
>  #define HAS_LSPCON(xe) (xe && 0)
>  #define HAS_MSO(xe) (xe || 1)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d8f1213ae1d6..33027091cc30 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -213,7 +213,7 @@ static const struct xe_device_desc adl_p_desc = {
>  	.has_llc = true,
>  	.require_force_probe = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
> -		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
> +		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>  		{},
>  	},
>  };
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index abbb8a1f29a8..cb50e9b77816 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -26,7 +26,7 @@ enum xe_platform {
>  enum xe_subplatform {
>  	XE_SUBPLATFORM_UNINITIALIZED = 0,
>  	XE_SUBPLATFORM_NONE,
> -	XE_SUBPLATFORM_ADLP_RPLU,
> +	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
>  	XE_SUBPLATFORM_DG2_G10,
>  	XE_SUBPLATFORM_DG2_G11,
>  	XE_SUBPLATFORM_DG2_G12,
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 1baf79ba02ad..cb0811c8bf22 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -143,7 +143,7 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
>  	} else if (xe->info.platform == XE_ALDERLAKE_N) {
>  		revids = adln_revids;
>  		size = ARRAY_SIZE(adln_revids);
> -	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
> +	} else if (xe->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU) {
>  		revids = adlp_rpl_revids;
>  		size = ARRAY_SIZE(adlp_rpl_revids);
>  	} else if (xe->info.platform == XE_ALDERLAKE_P) {

-- 
Jani Nikula, Intel Open Source Graphics Center
