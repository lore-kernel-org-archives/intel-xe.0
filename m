Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E6DC021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11510E996;
	Wed, 12 Feb 2025 20:33:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A629910E996;
 Wed, 12 Feb 2025 20:33:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rsions_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 20:33:33 -0000
Message-ID: <173939241367.1417151.10883616676673921140@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1739378095.git.jani.nikula@intel.com>
In-Reply-To: <cover.1739378095.git.jani.nikula@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/display: conversions to struct intel_display
URL   : https://patchwork.freedesktop.org/series/144749/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5f913a0f834843e837392c7da955ee7fe12604d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Feb 12 18:36:43 2025 +0200

    drm/i915/display: convert i915_pipestat_enable_mask() to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert i915_pipestat_enable_mask() to struct intel_display,
    allowing further conversions elsewhere.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 1e935d0d289627796230e9e1ca1451647fe9a2ad drm-intel
309e6045bdfc drm/i915/dp: convert g4x_dp.[ch] to struct intel display
-:349: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#349: FILE: drivers/gpu/drm/i915/display/g4x_dp.h:32:
 }
+static inline bool g4x_dp_port_enabled(struct intel_display *display,

-:356: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#356: FILE: drivers/gpu/drm/i915/display/g4x_dp.h:38:
 }
+static inline bool g4x_dp_init(struct intel_display *display,

total: 0 errors, 0 warnings, 2 checks, 431 lines checked
9fb9a895a185 drm/i915/hdmi: convert g4x_hdmi.[ch] to struct intel_display
6dbf2bf737db drm/i915/ips: convert hsw_ips.c to struct intel_display
7b731afcb780 drm/i915/display: convert assert_transcoder*() to struct intel_display
9b541f288b4c drm/i915/display: convert assert_port_valid() to struct intel_display
98bfb0c0314a drm/i915/hpd: drop dev_priv parameter from intel_hpd_pin_default()
b727af307b1a drm/i915/display: convert intel_set_{cpu, pch}_fifo_underrun_reporting() to intel_display
e60d6897f59d drm/i915/sdvo: convert intel_sdvo.[ch] to struct intel_display
-:960: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#960: FILE: drivers/gpu/drm/i915/display/intel_sdvo.c:3170:
+			drm_property_create_range(display->drm, 0, "right_margin", 0, data_value[0]);

-:1157: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1157: FILE: drivers/gpu/drm/i915/display/intel_sdvo.h:28:
 }
+static inline bool intel_sdvo_init(struct intel_display *display,

total: 0 errors, 1 warnings, 1 checks, 1036 lines checked
dd9f14206d5b drm/i915/display: convert intel_cpu_transcoder_mode_valid() to intel_display
d64e5e5d69be drm/i915/display: convert intel_mode_valid_max_plane_size() to intel_display
a3ee93c2794a drm/i915/dsi: convert platform checks to display->platform.<platform> style
b2d07622452e drm/i915/combo-phy: convert intel_combo_phy.[ch] to struct intel_display
-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__phy' - possible side-effects?
#61: FILE: drivers/gpu/drm/i915/display/intel_combo_phy.c:13:
+#define for_each_combo_phy(__display, __phy) \
 	for ((__phy) = PHY_A; (__phy) < I915_MAX_PHYS; (__phy)++)	\
+		for_each_if(intel_phy_is_combo(__display, __phy))

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__phy' - possible side-effects?
#67: FILE: drivers/gpu/drm/i915/display/intel_combo_phy.c:17:
+#define for_each_combo_phy_reverse(__display, __phy) \
 	for ((__phy) = I915_MAX_PHYS; (__phy)-- > PHY_A;) \
+		for_each_if(intel_phy_is_combo(__display, __phy))

total: 0 errors, 0 warnings, 2 checks, 531 lines checked
f25b223c0326 drm/i915/display: convert intel_fifo_underrun.[ch] to struct intel_display
e5f913a0f834 drm/i915/display: convert i915_pipestat_enable_mask() to struct intel_display


