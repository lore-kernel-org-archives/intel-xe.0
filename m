Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC30E8FDD9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 07:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC110E342;
	Wed,  4 Oct 2023 07:58:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A429B10E342
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696406297; x=1727942297;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zpm/BqwLSE/F7m766Lg1gCyCtoMn+5qGRLu8os87tdk=;
 b=kXXSgBjYVfuy+nsjz50oK86NGqv1qOck0cZol6qUIzlanXQJafeNMe/H
 B26roWw0C/OcSH4n1YZ86tNtR13S1VIQ4n022ZXKbtlTBwLAa2eyMkIsK
 lZYcJb/VliQEOOpVhgcKhOP2kkSKsnY5EDUbLN/y9C+yGvSuEpTILCQdJ
 NypxlUi/v3GfWOdgFle34fM/WY7JksIzTWXORJs+2Dx5b29jUlzFcJmuF
 BVLhNQk+4x0aJScL9phMrDglGf0sav7zsQrgmWQ0J2073Ztv7mFtD3Gzj
 Inj51/w+kD4Qsus5qEBm2X7+n4+4eU4HPq4eK+jKnIMFRrMOJ8YvFOocy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386960281"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="386960281"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 00:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727920994"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="727920994"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 00:58:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231003203716.108979-3-anusha.srivatsa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-3-anusha.srivatsa@intel.com>
Date: Wed, 04 Oct 2023 10:58:05 +0300
Message-ID: <87fs2qg6pe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/5] fixup! drm/xe/rplu: s/ADLP/ALDERLAKE_P
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

On Tue, 03 Oct 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
> Extend the change introduced in the previous patch to xe
> driver.

This is not a fixup to the previous patch. This needs to be a fixup to
the commit that added the file to begin with.

The order of the patches will be changed to add display enabling last.

BR,
Jani.

>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 7c825f129166..918dd27868fa 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -146,7 +146,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
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
