Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5239C369DF
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 13:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724CC10E82B;
	Wed, 25 Sep 2024 13:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de4W/c9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F357610E82B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727269773; x=1758805773;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5zh0eCg/rdPLjpSXxIOb1Y2e8Q0yqkAcMt2m8R87Qoo=;
 b=de4W/c9NBqPxLmSesG60UltsCedbD005CCOF62qRnd5DuULc6JgWi64w
 XFg5sqYE4QR25Np9OpwioGrg5w2NYJkQSWy+xrEOo6P+1nECBSiSvGDbV
 gp2G1HzhEhnish4w1TELvYuBuRRAdSTyGGrBbpa4/lSER35ya+Jsz0sC4
 fKSznZ7HNRoMnndMcbaLWVjQGU0qfQ3bkLw8NVyT7dvq1mTBHDuz/suxU
 AfahnGPKw2HIT4KINQM78uKOBPrZms3QutKvffmnCxLfbrtp3KixViF7r
 oPoO3x+mVpFoKbYhQMexiWd8PKZGw8e0nC3DeDIhBC08iB8Akzg8gt6m9 g==;
X-CSE-ConnectionGUID: UZnj9Us6RXGZ33+8I2S0HA==
X-CSE-MsgGUID: uHRpGz4cRZWxIVQuDsT1Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36988981"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="36988981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:09:32 -0700
X-CSE-ConnectionGUID: a7ABOp+oRYCXxhQc12SwGw==
X-CSE-MsgGUID: FIF8zMh/Rs2M42gTEXLH9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71657166"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:09:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
In-Reply-To: <20240925122513.2455181-1-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240925122513.2455181-1-nemesa.garg@intel.com>
Date: Wed, 25 Sep 2024 16:09:28 +0300
Message-ID: <874j633mnr.fsf@intel.com>
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

On Wed, 25 Sep 2024, Nemesa Garg <nemesa.garg@intel.com> wrote:
> Disable the support for odd x pan for NV12 format as underrun
> issue is seen.
>
> WA: 16024459452
>
> v2: Replace HSD with WA in commit message [Suraj]
>     Modified the condition for handling odd panning
>
> v3: Simplified the condition for checking hsub
>     Using older framework for wa as rev1[Jani]
>
> v4: Modify the condition for hsub [Sai Teja]
>     Initialize hsub in else path [Dan]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index e979786aa5cf..dfe795b8e917 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1029,8 +1029,16 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>  		 * This allows NV12 and P0xx formats to have odd size and/or odd
>  		 * source coordinates on DISPLAY_VER(i915) >= 20
>  		 */

Okay, sorry, nitpicks galore. :/

> -		hsub = 1;
>  		vsub = 1;

If we are going to return with an error, why break the hsub/vsub
assignments apart? Maybe add the check as the first thing, and keep
these together?

> +		/*
> +		 * Wa_16023981245 for display version 20.
> +		 * Do not support odd x-panning for even xsize for NV12.
> +		 */
> +		if (IS_LUNARLAKE(i915) && fb->format->format == DRM_FORMAT_NV12

The comment and the code are contradictory. We're already in a display
version >= 20 block. Why do we have the separate IS_LUNARLAKE() check?
Should it be a version check for == 20, or nothing at all? Is the code
or the comment wrong?

> +		    && src_w % 2 == 0)

I kernel code the && usually belongs at the end of the previous line.

BR,
Jani.

> +			return -EINVAL;
> +
> +		hsub = 1;
>  	} else {
>  		hsub = fb->format->hsub;
>  		vsub = fb->format->vsub;

-- 
Jani Nikula, Intel
