Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A1BCDD543
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5C010E5EA;
	Wed, 18 Sep 2024 16:29:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D5F10E5EA;
 Wed, 18 Sep 2024 16:29:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ultrajoiner_basic_functio?=
 =?utf-8?q?nality_series?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 16:29:17 -0000
Message-ID: <172667695769.1027304.3783374432030564857@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918144343.2876184-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240918144343.2876184-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series
URL   : https://patchwork.freedesktop.org/series/138827/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 752ac9b41b74d109b66b0fcd152adc784103b3d9
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Sep 18 20:13:43 2024 +0530

    drm/i915/intel_dp: Add support for forcing ultrajoiner
    
    Allow forcing ultrajoiner through debugfs.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 15aeb2cced25e1bfa15f1aa538247d79cf8b0a05 drm-intel
107526527df8 drm/i915: Add some essential functionality for joiners
222c9bf1beff drm/i915/display: Enhance iterators for modeset en/disable
-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#204: FILE: drivers/gpu/drm/i915/display/intel_display.h:395:
+#define for_each_crtc_in_masks(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = 0; \
+	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)++) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#204: FILE: drivers/gpu/drm/i915/display/intel_display.h:395:
+#define for_each_crtc_in_masks(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = 0; \
+	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)++) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:206: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#206: FILE: drivers/gpu/drm/i915/display/intel_display.h:397:
+	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \

-:210: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#210: FILE: drivers/gpu/drm/i915/display/intel_display.h:401:
+#define for_each_crtc_in_masks_reverse(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = (I915_MAX_PIPES * 2 - 1); \
+	     (i) >= 0 && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)--) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:210: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#210: FILE: drivers/gpu/drm/i915/display/intel_display.h:401:
+#define for_each_crtc_in_masks_reverse(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = (I915_MAX_PIPES * 2 - 1); \
+	     (i) >= 0 && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)--) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:216: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#216: FILE: drivers/gpu/drm/i915/display/intel_display.h:407:
+#define for_each_pipe_crtc_modeset_disable(display, crtc, crtc_state, i) \
+	for_each_crtc_in_masks(display, crtc, \
+			       _intel_modeset_primary_pipes(crtc_state), \
+			       _intel_modeset_secondary_pipes(crtc_state), \
+			       i)

-:222: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#222: FILE: drivers/gpu/drm/i915/display/intel_display.h:413:
+#define for_each_pipe_crtc_modeset_enable(display, crtc, crtc_state, i) \
+	for_each_crtc_in_masks_reverse(display, crtc, \
+				       _intel_modeset_primary_pipes(crtc_state), \
+				       _intel_modeset_secondary_pipes(crtc_state), \
+				       i)

total: 0 errors, 1 warnings, 6 checks, 234 lines checked
f7f686730874 drm/i915/display_debugfs: Allow force joiner only if supported
56d5dc08b85e drm/i915/display: Modify debugfs for joiner to force n pipes
ebfb0f28aa3d drm/i915/dp: Add helper to compute num pipes required
f39c51d8f2b3 drm/i915/display: Add debugfs support to avoid joiner
7e3a0379b190 drm/i915: Split current joiner hw state readout
586837744376 drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity checks
9cc9ba8df047 drm/i915/display: Add macro HAS_ULTRAJOINER()
-:18: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#18: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:157:
+#define HAS_ULTRAJOINER(i915)		((DISPLAY_VER(i915) == 14 && IS_DGFX(i915)) || DISPLAY_VER(i915) > 14)

-:18: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#18: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:157:
+#define HAS_ULTRAJOINER(i915)		((DISPLAY_VER(i915) == 14 && IS_DGFX(i915)) || DISPLAY_VER(i915) > 14)

total: 0 errors, 1 warnings, 1 checks, 7 lines checked
ff83b1db1152 drm/i915: Implement hw state readout and checks for ultrajoiner
85c63536497f drm/i915/display: Refactor enable_joiner_pipes
44d1775dea89 drm/i915/display/vdsc: Add ultrajoiner support with DSC
79c325c3fa67 drm/i915: Compute config and mode valid changes for ultrajoiner
0eeed7467b6b drm/i915/display: Consider ultrajoiner for computing maxdotclock
752ac9b41b74 drm/i915/intel_dp: Add support for forcing ultrajoiner


