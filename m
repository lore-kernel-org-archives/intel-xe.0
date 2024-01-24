Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB8C47E49
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 21:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0D110EA75;
	Wed, 24 Jan 2024 21:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D706F10EA6C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=YrNW8zzAMGjx4vBY5DdLvNd2jS5vGdHh9SM56Zdrp/s=; b=PwGUli+iRNd1MGUlPfUMfDvdCH
 hHKcVRmZLUl0yt4I1R7Mmm0FjM04Ofdp30WOz9RiOjJPA33pmLBRqoLRo5NLmHiVwwzN5UPyhTh+U
 6EJ/RraKfeFORzCuEmodmPENSEOLoxFrnhJ6AGz52vsHjF6w6QmZZWc3HQqWZtnHlqtKEAHs+CxND
 g2dMiDKhUQQaZ/T3/RTZhLeq9S2m8+1lml7QhfCo7OLiJ92YIY0NPYtkNbRV/oT4tJwe+dW4vUeM2
 5UHLTZHqbJa2CmO8DTUucPvZ7WTo9MWDeX8G/XJONQTeiMLeo3StX5EoyigJqsl0R05/Lbs27DTfZ
 C8dB671w==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rSku6-005ALU-1v; Wed, 24 Jan 2024 21:35:26 +0000
Message-ID: <ee182014-8dc8-40dc-bbdb-bbd90c7783c3@infradead.org>
Date: Wed, 24 Jan 2024 13:35:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20240124090515.3363901-1-jani.nikula@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240124090515.3363901-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/24/24 01:05, Jani Nikula wrote:
> If we unconditionally build the debugfs files, we'll get both the static
> inline stubs from the headers and the real functions for
> CONFIG_DEBUG_FS=n. Avoid building the debugfs files with that config.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/r/152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/xe/Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index fe8b266a9819..abb2be8268d0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -222,8 +222,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_ddi.o \
>  	i915-display/intel_ddi_buf_trans.o \
>  	i915-display/intel_display.o \
> -	i915-display/intel_display_debugfs.o \
> -	i915-display/intel_display_debugfs_params.o \
>  	i915-display/intel_display_device.o \
>  	i915-display/intel_display_driver.o \
>  	i915-display/intel_display_irq.o \
> @@ -267,7 +265,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_modeset_setup.o \
>  	i915-display/intel_modeset_verify.o \
>  	i915-display/intel_panel.o \
> -	i915-display/intel_pipe_crc.o \
>  	i915-display/intel_pmdemand.o \
>  	i915-display/intel_pps.o \
>  	i915-display/intel_psr.o \
> @@ -294,6 +291,13 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
>  endif
>  
> +ifeq ($(CONFIG_DEBUG_FS),y)
> +	xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +		i915-display/intel_display_debugfs.o \
> +		i915-display/intel_display_debugfs_params.o \
> +		i915-display/intel_pipe_crc.o
> +endif
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  

-- 
#Randy
