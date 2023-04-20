Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A93C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 08:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9FE10EBF7;
	Thu, 20 Apr 2023 08:49:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB0810EBF7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681980591; x=1713516591;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QrzYnTSmApUVFqYCuZzNGWqYZxu5aMiR9DEq2HKIySc=;
 b=XeVzv4r+Vuau8Vb2gBjN4JtZmDHlC9kNvKQbqmAuC/AOKBI3H8CcHI0i
 9nYK00XHFREWGdSHMd4JtkJ9Osidc6fm4YkeXxEszV6dhAlTG3l+T2XP9
 uBn1Ktw4liCYuQmnHToWOCAsERrPyLXxbz7z/n/cFaf4JFP6b6XtHmiEo
 w5OhppFqp3CnQigtJFcJ+/YcJNDzX0tlGetFKD/jbbUoCtVkzbhGmJzED
 wnWAlO8DCRXFVH/U5ftKN1ZJcAPhozEQcDBJVPOu5QFiegWDngkHthPid
 wNMOwsWvI47B1ai9sljDRQm9mMPEyLtven1vKsEfK/rWmlpps+sQMS/3i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345680275"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="345680275"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 01:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815932634"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="815932634"
Received: from agrische-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.85])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 01:49:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <nqx26axz3idy7up674v7i3nobnu5hjtwuyrn46ghdbzp7c2qo3@bjczno54ijhb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-2-jani.nikula@intel.com>
 <nqx26axz3idy7up674v7i3nobnu5hjtwuyrn46ghdbzp7c2qo3@bjczno54ijhb>
Date: Thu, 20 Apr 2023 11:49:46 +0300
Message-ID: <87sfcvvsyd.fsf@intel.com>
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

On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Apr 19, 2023 at 03:39:39PM +0300, Jani Nikula wrote:
>>Build the i915 display object files in i915-display sub-directory, to
>>increase clarity over what's coming from i915, and to simplify the rule
>>to build the object files.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> drivers/gpu/drm/xe/Makefile | 165 +++++++++++++++++-------------------
>> 1 file changed, 78 insertions(+), 87 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index aceca651de57..9fa4aaad6b8f 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -105,100 +105,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>> 	-Ddrm_i915_gem_object=xe_bo \
>> 	-Ddrm_i915_private=xe_device
>
> by leaving them on the same dir I was actually thinking if it would not
> be possible to add a display/Makefile  so these additional defines here
> are added as subdir-ccflags only there.

This is my understanding, I may be wrong:

* If you want subdir-ccflags-y to only apply within a subdirectory, you
  need to descend to the subdirectory using "obj-y += subdir" and have a
  standalone Makefile.

* If you use "include $(src)/subdir/Makefile", subdir-ccflags-y
  specified there applies to the parent directory.

* If you descend to the subdirectory using "obj-y += subdir", I don't
  think you can have the parent and subdirectory Makefiles add objects
  to the same module.

> could we still do something like that for both display/ and i915-display/?
>
>
> Also wondering if the part about being easy to track could be
> accomplished by just having 2 `xe-$(CONFIG_DRM_XE_DISPLAY) +=`
> with a comment above it or if being on separate dirs is a requirement.
>
>
> anyway.... I'm ok with this
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks,
Jani.

>
> Lucas De Marchi
>
>>
>>-CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>>+CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>>
>>-$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
>>+# Rule to build display code shared with i915
>>+$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>> 	$(call cmd,force_checksrc)
>> 	$(call if_changed_rule,cc_o_c)
>>
>>-
>>-$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FORCE
>>-	$(call cmd,force_checksrc)
>>-	$(call if_changed_rule,cc_o_c)
>>-
>>-$(obj)/display/icl_dsi.o: $(srctree)/drivers/gpu/drm/i915/display/icl_dsi.c FORCE
>>-	$(call cmd,force_checksrc)
>>-	$(call if_changed_rule,cc_o_c)
>>-
>>-$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORCE
>>-	$(call cmd,force_checksrc)
>>-	$(call if_changed_rule,cc_o_c)
>>-
>>-# Display..
>>+# Display code specific to xe
>> xe-$(CONFIG_DRM_XE_DISPLAY) += \
>> 	xe_display.o \
>>-	display/icl_dsi.o \
>>-	display/intel_atomic.o \
>>-	display/intel_atomic_plane.o \
>>-	display/intel_audio.o \
>>-	display/intel_backlight.o \
>>-	display/intel_bios.o \
>>-	display/intel_bw.o \
>>-	display/intel_cdclk.o \
>>-	display/intel_color.o \
>>-	display/intel_combo_phy.o \
>>-	display/intel_connector.o \
>>-	display/intel_crtc_state_dump.o \
>>-	display/intel_crtc.o \
>>-	display/intel_cursor.o \
>>-	display/intel_ddi_buf_trans.o \
>>-	display/intel_ddi.o \
>>-	display/intel_display.o \
>>-	display/intel_display_debugfs.o \
>>-	display/intel_display_power.o \
>>-	display/intel_display_power_map.o \
>>-	display/intel_display_power_well.o \
>>-	display/intel_display_trace.o \
>>-	display/intel_dkl_phy.o \
>>-	display/intel_dmc.o \
>>-	display/intel_dp_aux_backlight.o \
>>-	display/intel_dp_aux.o \
>>-	display/intel_dp.o \
>>-	display/intel_dp_hdcp.o \
>>-	display/intel_dp_link_training.o \
>>-	display/intel_dp_mst.o \
>>-	display/intel_dpll.o \
>>-	display/intel_dpll_mgr.o \
>>-	display/intel_dpt.o \
>>-	display/intel_drrs.o \
>>-	display/intel_dsb.o \
>>-	display/intel_dsi.o \
>>-	display/intel_dsi_dcs_backlight.o \
>>-	display/intel_dsi_vbt.o \
>>-	display/intel_fb.o \
>>-	display/intel_fbc.o \
>>-	display/intel_fdi.o \
>>-	display/intel_fifo_underrun.o \
>>-	display/intel_frontbuffer.o \
>>-	display/intel_global_state.o \
>>-	display/intel_gmbus.o \
>>-	display/intel_hdcp.o \
>>-	display/intel_hdmi.o \
>>-	display/intel_hotplug.o \
>>-	display/intel_hti.o \
>>-	display/intel_lspcon.o \
>>-	display/intel_modeset_setup.o \
>>-	display/intel_modeset_verify.o \
>>-	display/intel_panel.o \
>>-	display/intel_pipe_crc.o \
>>-	display/intel_pps.o \
>>-	display/intel_psr.o \
>>-	display/intel_qp_tables.o \
>>-	display/intel_quirks.o \
>>-	display/intel_snps_phy.o \
>>-	display/intel_tc.o \
>>-	display/intel_vblank.o \
>>-	display/intel_vdsc.o \
>>-	display/intel_vga.o \
>>-	display/intel_vrr.o \
>>-	display/intel_wm.o \
>> 	display/xe_fb_pin.o \
>> 	display/xe_hdcp_gsc.o \
>> 	display/xe_plane_initial.o \
>> 	display/xe_display_rps.o \
>>-	display/skl_scaler.o \
>>-	display/skl_universal_plane.o \
>>-	display/skl_watermark.o \
>> 	display/ext/i915_irq.o \
>> 	display/ext/i9xx_wm.o \
>> 	display/ext/intel_device_info.o \
>>@@ -206,14 +126,85 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>> 	display/ext/intel_pch.o \
>> 	display/ext/intel_pm.o
>>
>>+# Display code shared with i915
>>+xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>+	i915-display/icl_dsi.o \
>>+	i915-display/intel_atomic.o \
>>+	i915-display/intel_atomic_plane.o \
>>+	i915-display/intel_audio.o \
>>+	i915-display/intel_backlight.o \
>>+	i915-display/intel_bios.o \
>>+	i915-display/intel_bw.o \
>>+	i915-display/intel_cdclk.o \
>>+	i915-display/intel_color.o \
>>+	i915-display/intel_combo_phy.o \
>>+	i915-display/intel_connector.o \
>>+	i915-display/intel_crtc.o \
>>+	i915-display/intel_crtc_state_dump.o \
>>+	i915-display/intel_cursor.o \
>>+	i915-display/intel_ddi.o \
>>+	i915-display/intel_ddi_buf_trans.o \
>>+	i915-display/intel_display.o \
>>+	i915-display/intel_display_debugfs.o \
>>+	i915-display/intel_display_power.o \
>>+	i915-display/intel_display_power_map.o \
>>+	i915-display/intel_display_power_well.o \
>>+	i915-display/intel_display_trace.o \
>>+	i915-display/intel_dkl_phy.o \
>>+	i915-display/intel_dmc.o \
>>+	i915-display/intel_dp.o \
>>+	i915-display/intel_dp_aux.o \
>>+	i915-display/intel_dp_aux_backlight.o \
>>+	i915-display/intel_dp_hdcp.o \
>>+	i915-display/intel_dp_link_training.o \
>>+	i915-display/intel_dp_mst.o \
>>+	i915-display/intel_dpll.o \
>>+	i915-display/intel_dpll_mgr.o \
>>+	i915-display/intel_dpt.o \
>>+	i915-display/intel_drrs.o \
>>+	i915-display/intel_dsb.o \
>>+	i915-display/intel_dsi.o \
>>+	i915-display/intel_dsi_dcs_backlight.o \
>>+	i915-display/intel_dsi_vbt.o \
>>+	i915-display/intel_fb.o \
>>+	i915-display/intel_fbc.o \
>>+	i915-display/intel_fdi.o \
>>+	i915-display/intel_fifo_underrun.o \
>>+	i915-display/intel_frontbuffer.o \
>>+	i915-display/intel_global_state.o \
>>+	i915-display/intel_gmbus.o \
>>+	i915-display/intel_hdcp.o \
>>+	i915-display/intel_hdmi.o \
>>+	i915-display/intel_hotplug.o \
>>+	i915-display/intel_hti.o \
>>+	i915-display/intel_lspcon.o \
>>+	i915-display/intel_modeset_setup.o \
>>+	i915-display/intel_modeset_verify.o \
>>+	i915-display/intel_panel.o \
>>+	i915-display/intel_pipe_crc.o \
>>+	i915-display/intel_pps.o \
>>+	i915-display/intel_psr.o \
>>+	i915-display/intel_qp_tables.o \
>>+	i915-display/intel_quirks.o \
>>+	i915-display/intel_snps_phy.o \
>>+	i915-display/intel_tc.o \
>>+	i915-display/intel_vblank.o \
>>+	i915-display/intel_vdsc.o \
>>+	i915-display/intel_vga.o \
>>+	i915-display/intel_vrr.o \
>>+	i915-display/intel_wm.o \
>>+	i915-display/skl_scaler.o \
>>+	i915-display/skl_universal_plane.o \
>>+	i915-display/skl_watermark.o
>>+
>> ifeq ($(CONFIG_ACPI),y)
>> 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>-		display/intel_acpi.o \
>>-		display/intel_opregion.o
>>+		i915-display/intel_acpi.o \
>>+		i915-display/intel_opregion.o
>> endif
>>
>> ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>-	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>+	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
>> endif
>>
>> obj-$(CONFIG_DRM_XE) += xe.o
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
