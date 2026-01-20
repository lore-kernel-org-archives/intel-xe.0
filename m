Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6788D2ED1C
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF810E5E9;
	Tue, 20 Jan 2026 13:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARs/yiE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CED10E5E9
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768916306; x=1800452306;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iIKWYdHEWFO4L+LAPKl+a+j+ZL724CHnYLDi3Ckacfw=;
 b=ARs/yiE9OXHugamlKoThkmBUtY1rEDnmZxGmPTr080qMAHpM+r55eiup
 uEjqq5Rjae+biEebK+b0/9HMfSpNdvfgznvZLDy9+p0tcgZ0OerBAwGHb
 nz0aA/9vhVR2Y3wV5vQZeoIhwCpJvCU2D1RonfKWbRwaIQFFUbuHCxZyA
 6sEueOKUktsZS/v/IfJ+rQfNSMUvbd0eBgCIcbiYc3khffej1Oj2z7jI6
 eEq0MfKS9VfR1da4PqQ7I+OVSd9cSNfu4aXb9+M5mbUKJ/0SBqtd0FfTs
 +Ve+GaXrhK7NZ0TgKh0b9NM+QD3QI3J857k+NSVyYN+AqBoiUH9N9g8lW g==;
X-CSE-ConnectionGUID: RXXKk3dBQX2YhsWJGW+cEg==
X-CSE-MsgGUID: Fz0l5AttSFCAuoy0jihkYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81495309"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81495309"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:38:25 -0800
X-CSE-ConnectionGUID: VBIV5dMeTU2i/3INNhcljg==
X-CSE-MsgGUID: hPty/qrQTb6PJsbFpVgAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210273063"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:38:23 -0800
Date: Tue, 20 Jan 2026 14:38:20 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH] drm/xe/hwmon: Prevent unintended VRAM channel creation
Message-ID: <aW-FTFpA7cvJOoMa@black.igk.intel.com>
References: <20260119143138.1362379-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119143138.1362379-1-karthik.poosa@intel.com>
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

On Mon, Jan 19, 2026 at 08:01:38PM +0530, Karthik Poosa wrote:
> Remove the unnecessary VRAM channel entry introduced in
> xe_hwmon_channel. Without this, adding any new hwmon channel
> causes an extra VRAM channel to appear. This remained unnoticed
> earlier because VRAM was the final xe hwmon channel.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 49a498338417 ("drm/xe/hwmon: Expose individual VRAM channel temperature")
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index baf277955b33..f614f1308dec 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -48,7 +48,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> -	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,

Can you also check in_range() logic and investigate how channel id greater
than CHANNEL_VRAM_N_MAX (for example 23) is delt with?

Raag

>  	CHANNEL_MAX,
>  };
>  
> -- 
> 2.25.1
> 
