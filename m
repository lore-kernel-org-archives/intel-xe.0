Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A013C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 11:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106910E111;
	Thu,  2 Mar 2023 11:56:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0610E111
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677758169; x=1709294169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KSvJR4IMyUGiRL4/Gc9E8odebLYonFcnAUp/hT4/sNc=;
 b=BZDhhou5Qy1zEDXqkZUO7zI5uPFdTejy2UfT5b0ovM9ZYZ+g4vK333io
 3scz8IohajK2LCeL05Uh8mgraY7LxrX2ItRodMnLmJGtRR2nILNroChRL
 R4h5yy6Nwhp64vEwFU89vbNCxZA5sBEFyVaFzSqH6BrMqbEKE395ItU+w
 0p/XjysuEC/mo3nJQZcOO1YApmVouAYlMfrn6xskGHFNimYcHHE4GcrkJ
 qeUtbXVczb392MWjW8kJoGmRo5WW+XhWnrTov9XkOWkgj+TpiLnABqSvB
 K29ZpB9355AlIqDugkRUiV4ia6bZU2Jxwdkjvkm4qxITCiFIpR5QrE/Y8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362290324"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="362290324"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 03:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652385498"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="652385498"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO [10.251.217.60])
 ([10.251.217.60])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 03:56:07 -0800
Message-ID: <bf9c5689-faa7-61c6-e903-02cedaa08331@intel.com>
Date: Thu, 2 Mar 2023 12:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
 <20230302013411.3262608-8-lucas.demarchi@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <20230302013411.3262608-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Remove i915 header dependency
 when building without display
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Series looks good.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2023-03-02 02:34, Lucas De Marchi wrote:
> If xe is built without support for driving display, it shouldn't need
> the i915 headers. As a consequence the build system shouldn't be passing
> the additional CFLAGS to include the i915 directories. However as the
> display structs were needed in other compilation units, it was not
> possible to remove, leading to every single file indirectly including
> the i915 headers via xe_device_types.h.
>
> The Makefile had a note about i915 register definitions, but missed the
> display dependencies.
>
> Now that the display substruct from xe_device and the info substruct
> from xe->info are initialized by display-only files, it's possible to
> shield the rest of the driver with some additional ifdefs. Ideally the
> structs should be made opaque and only defined in the display
> compilation units: this would allow removing the includes from
> xe_device_types.h even when building with display. However this needs
> more refactors and cleanups because the i915 files expect the info and
> display substruct to be available from drm_i915_private that is aliased
> by xe_device when building xe.  So, to avoid future dependencies on the
> i915 headers, just add a few more ifdefs in the header so a build
> without display breaks if this is attempted.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          | 3 ---
>   drivers/gpu/drm/xe/xe_device_types.h | 9 ++++++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index d1d255df74a1..5489d761f6f6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -104,9 +104,6 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
>   	-Ddrm_i915_gem_object=xe_bo \
>   	-Ddrm_i915_private=xe_device
>   
> -# XXX: Needed for i915 register definitions. Will be removed after xe-regs.
> -subdir-ccflags-y += -I$(srctree)/drivers/gpu/drm/i915/
> -
>   CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>   
>   $(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ec36cedb87cc..199bd37fce9a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,10 +16,11 @@
>   #include "xe_platform_types.h"
>   #include "xe_step_types.h"
>   
> -/* For display substruct */
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   #include "display/ext/intel_device_info.h"
>   #include "display/ext/intel_pch.h"
>   #include "display/intel_display_core.h"
> +#endif
>   
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
> @@ -97,6 +98,7 @@ struct xe_device {
>   		/** @enable_display: display enabled */
>   		bool enable_display;
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   		struct xe_device_display_info {
>   			u8 ver;
>   
> @@ -147,6 +149,7 @@ struct xe_device {
>   			u8 num_scalers[I915_MAX_PIPES];
>   			u32 rawclk_freq;
>   		} display;
> +#endif
>   	} info;
>   
>   	/** @irq: device interrupt state */
> @@ -241,8 +244,7 @@ struct xe_device {
>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>   	bool d3cold_allowed;
>   
> -	/* private: */
> -
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   	/*
>   	 * Any fields below this point are the ones used by display.
>   	 * They are temporarily added here so xe_device can be desguised as
> @@ -308,6 +310,7 @@ struct xe_device {
>   		const char *vbt_firmware;
>   		u32 lvds_channel_mode;
>   	} params;
> +#endif
>   };
>   
>   /**
