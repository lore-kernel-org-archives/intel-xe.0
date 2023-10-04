Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB327E7C4C5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAFA10E139;
	Wed,  4 Oct 2023 14:37:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC86510E139
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696430250; x=1727966250;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zvDXWkUhuMcfOPGxzr9+vIq6B8dPTMMjwe+rONw+bTM=;
 b=koICbw0Kxvci1ZwzhujkW6h7CGAralKOTnYJiHUQSZbboai/4F24kJNR
 TG3WzQbCW3dubj/mCS25aknpZSxnJd0lYKQwCGjLLqRL6hHR3qCx1LIPy
 OGyAkC5BzjI4WNnuSyUlwZmPp+/UvGriDZT/eSDQonPC0Gx5QwtIuSTMK
 fKBU9QtFc7k7W3EC/QtbZDu3Spqs4P0ebqDFjBL0EsuRIbIBuc1tXkCWS
 OzcOWrphGpcwhZgBzjG73bPuI3y84WKz6ZVH/eqpJur350XDZsU+JxhIv
 0ce0tic1xBcIdyVErXsgOgdXPXzdzGC6dqFUTdkpePpi2T39QbM9qGAgR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368241565"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368241565"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701125835"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="701125835"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:37:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZR11UUIaG8+ruSqS@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696343521.git.jani.nikula@intel.com>
 <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
 <ZR11UUIaG8+ruSqS@intel.com>
Date: Wed, 04 Oct 2023 17:37:10 +0300
Message-ID: <87o7hee9nt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 08/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 04 Oct 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Oct 03, 2023 at 05:34:55PM +0300, Jani Nikula wrote:
>> Turn the enable_display module parameter to the same thing as it is for
>> i915: assuming you have display hardware, take over it, put it to sleep,
>> and keep connectors disconnected.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  5 ++++-
>>  drivers/gpu/drm/xe/xe_display.c                   | 11 +++++------
>>  drivers/gpu/drm/xe/xe_module.c                    |  4 ----
>>  drivers/gpu/drm/xe/xe_module.h                    |  1 -
>>  drivers/gpu/drm/xe/xe_pci.c                       |  1 -
>>  5 files changed, 9 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> index e7c9b4ea2153..feaa1e244838 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> @@ -24,6 +24,9 @@
>>  #include "intel_runtime_pm.h"
>>  #include <linux/pm_runtime.h>
>>  
>> +/* For INTEL_DISPLAY_ENABLED() */
>> +extern bool enable_display;
>> +
>>  static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
>>  {
>>  	return container_of(dev, struct drm_i915_private, drm);
>> @@ -89,7 +92,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>>  
>>  #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
>>  
>> -#define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
>> +#define INTEL_DISPLAY_ENABLED(xe) (enable_display && !intel_opregion_headless_sku((xe)))
>>  #define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
>>  #define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
>>  				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 391f08c1caca..75054f78d7ae 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -29,6 +29,11 @@
>>  #include "intel_opregion.h"
>>  #include "xe_module.h"
>>  
>> +/* Only to be used for INTEL_DISPLAY_ENABLED() */
>> +bool enable_display = true;
>> +module_param_named(enable_display, enable_display, bool, 0444);
>> +MODULE_PARM_DESC(enable_display, "Enable display");
>
> there's a work in progress to create the unified extern mod_param struct.
> But this goes on the other way to split the mod_params...

There's *also* work in progress to split out i915 display related module
parameters. That would give us unified disable_display on both i915 and
xe, and we could just nuke xe.enable_display.

BR,
Jani.

>
>> +
>>  /* Xe device functions */
>>  
>>  static bool has_display(struct xe_device *xe)
>> @@ -45,9 +50,6 @@ static bool has_display(struct xe_device *xe)
>>   */
>>  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>>  {
>> -	if (!enable_display)
>> -		return 0;
>> -
>>  	return intel_display_driver_probe_defer(pdev);
>>  }
>>  
>> @@ -69,9 +71,6 @@ static void xe_display_last_close(struct drm_device *dev)
>>   */
>>  void xe_display_driver_set_hooks(struct drm_driver *driver)
>>  {
>> -	if (!enable_display)
>> -		return;
>> -
>>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>>  	driver->lastclose = xe_display_last_close;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 7194595e7f31..82817a46f887 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -19,10 +19,6 @@ bool force_execlist = false;
>>  module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
>>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>>  
>> -bool enable_display = true;
>> -module_param_named(enable_display, enable_display, bool, 0444);
>> -MODULE_PARM_DESC(enable_display, "Enable display");
>> -
>>  u32 xe_force_vram_bar_size;
>>  module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
>>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index e1da1e9ca5cb..58604ed161cc 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -7,7 +7,6 @@
>>  
>>  /* Module modprobe variables */
>>  extern bool force_execlist;
>> -extern bool enable_display;
>>  extern u32 xe_force_vram_bar_size;
>>  extern int xe_guc_log_level;
>>  extern char *xe_guc_firmware_path;
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index b19506fe3e18..8ee430c6f8b1 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -575,7 +575,6 @@ static int xe_info_init(struct xe_device *xe,
>>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>>  
>>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>> -				  enable_display &&
>>  				  desc->has_display;
>>  	/*
>>  	 * All platforms have at least one primary GT.  Any platform with media
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
