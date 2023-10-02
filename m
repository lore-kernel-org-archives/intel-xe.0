Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5400AE784A4
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 07:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0955610E029;
	Mon,  2 Oct 2023 07:07:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB05410E029
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696230466; x=1727766466;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9XjGaB9sTHIjM8hql5GhVLP+8ASVVnJ4kD8OVUhmQkw=;
 b=AeCx41e8DhXvWwzZ3VvrNYJVNtsFJSCTkN/UtpkWIud3Gwl6KSuTPlKq
 TwCoGRf5xIFyk5jvehIZ82RmNIbat/PrPavhKXG0Qq9CP1JAwNlIv3KL7
 v019t49g1gEjp7VmT3Qz1KryPhl7B6suZBoEIn8OpRqI0V7Rsu2ncGppd
 k8n2wg1esG3FPRBqjaKWDtNrrlCh2Ch0hPmVKiU/5dV+tJ/7TpL5JdcHs
 T6khUv013cwkXdAITwfX/bGmq5b3nCNmmf4nZRj2JfXFtU7xfev5Vqtz0
 Okhr/SnbrlKR5JfjSUaFSOX02yi8wFbcGUVhqOQFb0HKnIqxRGEqBamj2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="4170613"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="4170613"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 00:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="753970090"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="753970090"
Received: from svandens-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.151])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 00:07:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230929201659.2840724-3-anusha.srivatsa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
 <20230929201659.2840724-3-anusha.srivatsa@intel.com>
Date: Mon, 02 Oct 2023 10:07:34 +0300
Message-ID: <87a5t1ijt5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: s/ADL_P/ALDERLAKE_P
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

On Fri, 29 Sep 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
> Extend the change introduced in the previous patch to xe
> driver.

Needs to be fixup! to the patch adding this header in the first place.

BR,
Jani.

>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

-- 
Jani Nikula, Intel
