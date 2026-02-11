Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA11E9E2E4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 11:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A55910E048;
	Wed, 11 Feb 2026 11:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrgnEpqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2252910E048
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770808630; x=1802344630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xk3CAUiLFy2MOeSgmOqKcBhy0dspAiMRLqhOjjTfqTM=;
 b=hrgnEpqUs+eDaPl/mlg2VS/hor8A0LSTgnF5VEw7EzBHSY0kNPsFlG0P
 6uI9UZEJok9tGBf5K09mskkBAK4PYv8odvW390NM5H4m92+E2voZQPfm1
 ssVuYoJx2YmgwDIYyVWGomkHojJP+DG8gGhUNhMV3chNrOOocLKCaYptA
 Q5B42T4vgtdhAmMcwdgR5NWasM7+1hnoGp151kAd0q4ta+CXCJMNmjsNX
 rD/PYc5vGLFP6uOGUbbTkq+V/1hiCNlux2VGdbsyEMzq7nzKS28lrK69f
 /P8xdrCEZ4knGWcj61y937SrJ61NjVx/tzmlztC9YSBSNvtmyvJhxYKj1 Q==;
X-CSE-ConnectionGUID: /RWxMzXBR2eEmo1gMvgxRA==
X-CSE-MsgGUID: C5a0sTCnQFmAPqKPX3047g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71996733"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71996733"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:17:09 -0800
X-CSE-ConnectionGUID: lRaeN4XWTmOipRL77apTjw==
X-CSE-MsgGUID: 07kmEfXWQ6GmDQH33Jz/vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212252894"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:17:08 -0800
Date: Wed, 11 Feb 2026 12:17:04 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH] drm/xe/hwmon: Prevent unintended VRAM channel creation
Message-ID: <aYxlMOmslu34lfqD@black.igk.intel.com>
References: <20260206081655.2115439-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206081655.2115439-1-karthik.poosa@intel.com>
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

On Fri, Feb 06, 2026 at 01:46:55PM +0530, Karthik Poosa wrote:
> Remove the unnecessary VRAM channel entry introduced in xe_hwmon_channel.
> Without this, adding any new hwmon channel causes extra VRAM channel
> to appear. This remained unnoticed earlier because VRAM was the
> final xe hwmon channel.
> 
> v2: Use MAX_VRAM_CHANNELS with in_range() instead of
>     CHANNEL_VRAM_N_MAX. (Raag)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 49a498338417 ("drm/xe/hwmon: Expose individual VRAM channel temperature")

Fixes tag usually goes first, but perhaps it can be re-ordered while
applying. In any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index baf277955b33..0fd4d4f1014a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -48,7 +48,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> -	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>  	CHANNEL_MAX,
>  };
>  
> @@ -264,7 +264,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> +			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
> @@ -1427,7 +1427,7 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> +		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>  		return 0;
>  	case hwmon_power:
> -- 
> 2.25.1
> 
