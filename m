Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7143AC7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 11:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3310E4A6;
	Mon, 24 Apr 2023 11:41:52 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B74110E4A6
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682336509; x=1713872509;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GyKuggr9R3Ol0Bl75GFH4Ihy+sGxdegmjaxsq0cvdPg=;
 b=lT3YVhlwOSnp+XzJIF6SVqIQZSychG57YTuEg4342TZ38b+LA2tYne62
 w+q9eGoSwsAqiIrtj4x7rl7mWxta3DbZToaK8e8QhmNVAKn7bc0mOPeby
 7tfaMq0L5ukcM+8vtubpw8TZ61ZuE1FhXI5qBGWRl0ZkQ8/DUhYmyY4rp
 bYaEgoBsw698+jKy5Ry4cYxmFdjHSo6AkNva5Z1fqJM6R0SrR+ztJDGFd
 ez5yDJCJZbizFgoROPMliBDO+LFE2DVSrrnepD6Ov+kfa9/5Q86F0lD1p
 QNqF8NNGQHZioPAnmfi6EsLJ6Hl6PFEG5avtCSqGW6LIAGlbOQvnu1k/o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348339421"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="348339421"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 04:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="725660013"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="725660013"
Received: from skumarbi-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 04:41:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <3tbvdpag33peyu4xechzmeagdokffu7keqjjrudsjjmwaduugx@gjodtnvlx4p3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-2-jani.nikula@intel.com>
 <nqx26axz3idy7up674v7i3nobnu5hjtwuyrn46ghdbzp7c2qo3@bjczno54ijhb>
 <87sfcvvsyd.fsf@intel.com>
 <3tbvdpag33peyu4xechzmeagdokffu7keqjjrudsjjmwaduugx@gjodtnvlx4p3>
Date: Mon, 24 Apr 2023 14:41:38 +0300
Message-ID: <87pm7t33t9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/9] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 21 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Apr 20, 2023 at 11:49:46AM +0300, Jani Nikula wrote:
>>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Wed, Apr 19, 2023 at 03:39:39PM +0300, Jani Nikula wrote:
>>>>Build the i915 display object files in i915-display sub-directory, to
>>>>increase clarity over what's coming from i915, and to simplify the rule
>>>>to build the object files.
>>>>
>>>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/Makefile | 165 +++++++++++++++++-------------------
>>>> 1 file changed, 78 insertions(+), 87 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>index aceca651de57..9fa4aaad6b8f 100644
>>>>--- a/drivers/gpu/drm/xe/Makefile
>>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>>@@ -105,100 +105,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>>> 	-Ddrm_i915_gem_object=xe_bo \
>>>> 	-Ddrm_i915_private=xe_device
>>>
>>> by leaving them on the same dir I was actually thinking if it would not
>>> be possible to add a display/Makefile  so these additional defines here
>>> are added as subdir-ccflags only there.
>>
>>This is my understanding, I may be wrong:
>>
>>* If you want subdir-ccflags-y to only apply within a subdirectory, you
>>  need to descend to the subdirectory using "obj-y += subdir" and have a
>>  standalone Makefile.
>>
>>* If you use "include $(src)/subdir/Makefile", subdir-ccflags-y
>>  specified there applies to the parent directory.
>>
>>* If you descend to the subdirectory using "obj-y += subdir", I don't
>>  think you can have the parent and subdirectory Makefiles add objects
>>  to the same module.
>
> true, but the snippet below does the trick for me. The problem is: it
> doesn't work due to the include dep:
>
> xe_device_types.h -> intel_display_core.h -> {the-display-world}.h

That's basically the same problem as i915_drv.h -> intel_display_core.h
in i915 land, and the solution is pretty much the same also: make the
display substruct member a pointer opaque to non-display code, and
allocate it dynamically.

That's what all the display header and include refactoring have
gradually been leading up to, but this one's just massively disruptive.


BR,
Jani.

>
> Anyway, here is what I used to remove the cflags from the !display
> sources:
>
> -------------------8<-----------------
> Subject: [PATCH] WIP cflags display removal
>
> ---
>   drivers/gpu/drm/xe/Makefile | 36 +++++++++++++++++++++---------------
>   1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ee4a95beec20..fea31cfc3de6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -96,24 +96,13 @@ xe-y += xe_bb.o \
>   	xe_wa.o \
>   	xe_wopcm.o
>   
> -# i915 Display compat #defines and #includes
> -subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> -	-I$(srctree)/$(src)/display/ext \
> -	-I$(srctree)/$(src)/compat-i915-headers \
> -	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> -	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> -	-Ddrm_i915_gem_object=xe_bo \
> -	-Ddrm_i915_private=xe_device
> -
> -CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> -
>   # Rule to build display code shared with i915
>   $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>   	$(call cmd,force_checksrc)
>   	$(call if_changed_rule,cc_o_c)
>   
>   # Display code specific to xe
> -xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +xe-display += \
>   	xe_display.o \
>   	display/xe_fb_pin.o \
>   	display/xe_hdcp_gsc.o \
> @@ -126,7 +115,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	display/ext/intel_pch.o
>   
>   # Display code shared with i915
> -xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +xe-display += \
>   	i915-display/icl_dsi.o \
>   	i915-display/intel_atomic.o \
>   	i915-display/intel_atomic_plane.o \
> @@ -197,15 +186,32 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/skl_watermark.o
>   
>   ifeq ($(CONFIG_ACPI),y)
> -	xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +	xe-display += \
>   		i915-display/intel_acpi.o \
>   		i915-display/intel_opregion.o
>   endif
>   
>   ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
> -	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
> +	xe-display += i915-display/intel_fbdev.o
>   endif
>   
> +# i915 Display compat #defines and #includes
> +xe-display-ccflags += \
> +	-I$(srctree)/$(src)/display/ext \
> +	-I$(srctree)/$(src)/compat-i915-headers \
> +	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> +	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> +	-Ddrm_i915_gem_object=xe_bo \
> +	-Ddrm_i915_private=xe_device
> +
> +CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> +
> +# Apply CFAGS to all display sources
> +$(foreach d,$(xe-display), \
> +	$(eval CFLAGS_$(d) += $(xe-display-ccflags)))
> +
> +xe-$(CONFIG_DRM_XE_DISPLAY) += $(xe-display)
> +
>   obj-$(CONFIG_DRM_XE) += xe.o
>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/

-- 
Jani Nikula, Intel Open Source Graphics Center
