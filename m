Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA829C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 12:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD7010E43F;
	Tue, 23 May 2023 12:45:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E56310E092;
 Tue, 23 May 2023 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684845942; x=1716381942;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t6h0FlAXJcvs3LOcWpJqIAzFkFt2smH2I4j7SSm9lgw=;
 b=PgDTiYP/QVgRoA+FDKx2PPewOwTvFv2ENvr3sPxJQaBsWJxNMpt08opN
 MqnGSFaZ8NhQBnqQRnjDh/EhMvLZ1qbd6doGoGDO7iIkw4zoReNdlr5Ni
 VZZC35aPXnvcv5vBFY3PEzXegfytvobf27xSrZ8v0gJzTaJGzN0xQXFz2
 emns/Ow9DMi4/TZ3cUdYbTU9b7erZoCxn9yTMCof7QB37AluohpQM8Okn
 NqJUht1JV9K2vn60xIT+N2CSKYP3VDEy87fJqItN02LCStolPQIm/MXRu
 otQuCqI5LsuMxW+rIRIhbWTbrojWEeq+OW555tEiBLIBFoZK6TOqTznja w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="332837721"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="332837721"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 05:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="950526864"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="950526864"
Received: from chauvina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 05:45:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20230522202314.3939499-4-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230522202314.3939499-1-matthew.d.roper@intel.com>
 <20230522202314.3939499-4-matthew.d.roper@intel.com>
Date: Tue, 23 May 2023 15:45:36 +0300
Message-ID: <87lehfkyhb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [Intel-gfx] [PATCH v2 3/6] drm/i915/display: Move
 display runtime info to display structure
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 22 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 9612c2ac4b00..7a8a12d12790 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -205,6 +205,7 @@ struct drm_i915_private {
>  
>  	const struct intel_device_info __info; /* Use INTEL_INFO() to access. */
>  	struct intel_runtime_info __runtime; /* Use RUNTIME_INFO() to access. */
> +	struct intel_display_runtime_info __display_runtime; /* Access with DISPLAY_RUNTIME_INFO() */

This could now live as a member of struct intel_display, dropping
another display only member from struct drm_i915_private.

AFAICT this can be a trivial movement patch on top, since almost all
access is via DISPLAY_RUNTIME_INFO().

> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index dd874a4db604..9c781b703c7b 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -41,10 +41,9 @@
>  #define PLATFORM(x) .platform = (x)
>  #define GEN(x) \
>  	.__runtime.graphics.ip.ver = (x), \
> -	.__runtime.media.ip.ver = (x), \
> -	.__runtime.display.ip.ver = (x)
> +	.__runtime.media.ip.ver = (x)
>  
> -#define NO_DISPLAY .__runtime.pipe_mask = 0
> +static const struct intel_display_device_info no_display = { 0 };

I think just {} is preferred for empty init, and dodges issues with some
verbose compiler warnings with sub-struct init. Can also be fixed
afterwards if there's no other need to do a respin.

Acked-by: Jani Nikula <jani.nikula@intel.com>

-- 
Jani Nikula, Intel Open Source Graphics Center
