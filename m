Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC615CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A7D10E481;
	Thu, 12 Oct 2023 09:56:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3458E10E492
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697104611; x=1728640611;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RVu7gRtcuP7LKP3JPvfF7Xq2IjAd210UgrRseibGqzk=;
 b=RymcyNx/JSO8T1Xm0yi9+K5KIuK+ZNLVC2NZDzRAorjfB4s28XRf6duR
 1tMPm0F8BRmybbBR8mUnnFIScZ5ysPlXcjqhE8YNLL/qdbZSzI8xDmgIG
 kkzQuVm8CHiWktZmiMYfgFvxa2Orps+xb7EUtdufQzJUeZ5CRPW24Wnqo
 FI0L6GUHtWwoWs/uYYdfc7ins1zZz+XggSkN39Kj5W+WEKgSEKF50scUJ
 HF7+iC1ugLWyVN2aXzD8xFVqXhg2TYUDBgagUiQVaKgS7FrdAafkUEukC
 qgZ6ltK+GYnTxztirWN46a0T79XLhOeSiaCjGGGvPHIG89xRpFGEjAh6u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="382119730"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="382119730"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927925653"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="927925653"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:56:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 uma.shankar@intel.com
In-Reply-To: <20231012093446.1332238-1-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231012093446.1332238-1-arun.r.murthy@intel.com>
Date: Thu, 12 Oct 2023 12:56:45 +0300
Message-ID: <877cns2mg2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 12 Oct 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> The modparam fastboot is removed from i915.
>
> This reverts commit 3c73fdaf8f58b55b0e292fec0929b6502c2b3a3e.

Acked-by: Jani Nikula <jani.nikula@intel.com>

on both

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 4b73db93d23d..e876fa6db285 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4988,7 +4988,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
>  
>  static bool fastboot_enabled(struct drm_i915_private *dev_priv)
>  {
> -#ifdef I915
>  	if (dev_priv->params.fastboot != -1)
>  		return dev_priv->params.fastboot;
>  
> @@ -5002,9 +5001,6 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
>  
>  	/* Disabled by default on all others */
>  	return false;
> -#else
> -	return true;
> -#endif
>  }
>  
>  bool

-- 
Jani Nikula, Intel
