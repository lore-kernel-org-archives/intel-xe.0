Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A69C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 12:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4510E09E;
	Mon, 18 Sep 2023 12:22:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A610E09E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695039763; x=1726575763;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FuMnv/17qCzHNo2dnXS4+hQd+XmqN20yEqiXyhbjq7o=;
 b=XmUvF5Jew594S7aNcC1WT2NDEo1x/vUYjxj0s4wt1y0mKOyxFuFmx1ZI
 IZMtRUlydm1Kd8d0Z0392PWZR4hK5HjvvAowL7ZsZzXxHuUhLFIT1mgOu
 uSzmsWSjTE5fJfDU5ibJmDPvzYwbXlQpPctEZ8NEddF+/ZtEEDZz12REW
 I3sYD0fzFxzxqVik9LtOfktM3ou8jNMPKRn3xfWu2eKl7GHwOXC//dJ19
 x0AKZ1BHr8dUIludwJ4X9YUAHIwGawDphm2fjvvin+YNUd+gQOA1DJqKh
 zBBmK7f95hiwMyA2Z5yutCFImhCij85DI2dH4eCZS4z6Hb18SRspbqUu1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446099558"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="446099558"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 05:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745798408"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="745798408"
Received: from mkhokhlx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.60])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 05:22:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230915194700.184626-2-anusha.srivatsa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230915194700.184626-1-anusha.srivatsa@intel.com>
 <20230915194700.184626-2-anusha.srivatsa@intel.com>
Date: Mon, 18 Sep 2023 15:22:39 +0300
Message-ID: <87wmwnu0vk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
> i915 now uses full names for platforms. So we now have
> ALDERLAKE instead of ADL. Extend this to xe driver as well.
> This will make it easier for macro magic usages.
>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-

Please don't make changes to this file at the same time as the ones
below.

Regardless of whether it breaks the build at this time.

BR,
Jani.

>  drivers/gpu/drm/xe/xe_pci.c                       | 2 +-
>  drivers/gpu/drm/xe/xe_platform_types.h            | 2 +-
>  drivers/gpu/drm/xe/xe_step.c                      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 03ac39efba38..012d15565727 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -144,7 +144,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
>  #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
>  #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
> -#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> +#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
>  #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
>  #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
>  #define to_intel_bo(x) gem_to_xe_bo((x))
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index dc233a1226bd..96a34d9197a8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -241,7 +241,7 @@ static const struct xe_device_desc adl_p_desc = {
>  	.has_llc = true,
>  	.require_force_probe = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
> -		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
> +		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>  		{},
>  	},
>  };
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index e378a64a0f86..b6fe4342f9f6 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -27,7 +27,7 @@ enum xe_platform {
>  enum xe_subplatform {
>  	XE_SUBPLATFORM_UNINITIALIZED = 0,
>  	XE_SUBPLATFORM_NONE,
> -	XE_SUBPLATFORM_ADLP_RPLU,
> +	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
>  	XE_SUBPLATFORM_DG2_G10,
>  	XE_SUBPLATFORM_DG2_G11,
>  	XE_SUBPLATFORM_DG2_G12,
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 371cac951e0f..903c65405d3a 100644
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
Jani Nikula, Intel
