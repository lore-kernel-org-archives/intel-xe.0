Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B74C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 10:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B18910E8CA;
	Thu, 11 Jan 2024 10:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130BF10E8CA
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704970107; x=1736506107;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LxI13HEX9wXoeeuz9a0gOQR4ri8sFrFx0zHLsytncH4=;
 b=jnNYI2c9Ho0pmWUMg+oyiZhhAXC1sZNww6tksw1SOq4RiwaahnDTf50m
 1Lt1wDvatl9IUSKp71GTy0f6m7iJ7sAuypnNSuFkyTasrXpMLRASk8Oay
 iLOoRoDzei0CiPzNGjzK0gyRXnwvl2Bl8DbW1obmUyrpqCYusugocZjjC
 dThBXm6cIm/Qg6IMaskPQ/jVJHlQHKm4zt2/TTvmxJ+pIWsorTQsRI/Ko
 xTJtG8Ny81QiIgJyH13czT4EsqzqU8cAH2y6ao0gQkEVDuSPsNmg2jrC4
 SJ9hFunON2Ybdgpdg1Pm7zkTlIAlzjWMD1MofuhrnJwTbgLRRsVtVtV3u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="6167511"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="6167511"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="872985095"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="872985095"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:48:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: display support should not depend on EXPERT
In-Reply-To: <20240111104716.3548744-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111104716.3548744-1-jani.nikula@intel.com>
Date: Thu, 11 Jan 2024 12:48:22 +0200
Message-ID: <87wmsgtabt.fsf@intel.com>
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Remove the DRM_XE_DISPLAY config dependency on EXPERT. I can only
> presume the idea was only experts should be able to disable it, but the
> effect is the opposite.

Forgot to add,

Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1cced50d8d8c..e36ae1f0d885 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -47,7 +47,7 @@ config DRM_XE
>  
>  config DRM_XE_DISPLAY
>  	bool "Enable display support"
> -	depends on DRM_XE && EXPERT && DRM_XE=m
> +	depends on DRM_XE && DRM_XE=m
>  	select FB_IOMEM_HELPERS
>  	select I2C
>  	select I2C_ALGOBIT

-- 
Jani Nikula, Intel
