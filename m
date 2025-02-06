Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B2AC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 21:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEAC10E948;
	Thu,  6 Feb 2025 21:05:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79610E948;
 Thu,  6 Feb 2025 21:04:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_intel=5Fdispl?=
 =?utf-8?q?ay_conversions_and_some_debug_improvements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 21:04:14 -0000
Message-ID: <173887585457.2236925.3282474497714268886@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206185533.32306-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250206185533.32306-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: intel_display conversions and some debug improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/143941/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9c53e639fe5809485b561a5421adf39d93782bc
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Feb 6 20:55:33 2025 +0200

    drm/i915: Pimp plane debugs
    
    Include the standard "[PLANE:%d:s]" stuff in all plane debugs
    (or rather all I was able to find), to provide better information
    on which plane we're actually talking about.
    
    There are a few spots where we care about the CRTC as well, so
    include that where appropriate.
    
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f2401c718ce075408a723b147cac70aad2a8246f drm-intel
b4923a6abc46 drm/i915: Pass intel_display to intel_scanout_needs_vtd_wa()
0d191088473f drm/i915: Decouple i915_gem_dumb_create() from the display a bit
00a292a10f32 drm/i915: Decouple intel_fb_bo.h interfaces from driver specific types
95842c4f2a82 drm/i915: Convert intel_crtc.c to struct intel_display
33a25c519b3f drm/i915: Convert intel_fb.c to struct intel_display
-:416: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'var' - possible side-effects?
#416: FILE: drivers/gpu/drm/i915/display/intel_fb.c:1462:
+#define assign_chk_ovf(display, var, val) ({ \
+	drm_WARN_ON((display)->drm, overflows_type(val, var)); \
 	(var) = (val); \
 })

-:416: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#416: FILE: drivers/gpu/drm/i915/display/intel_fb.c:1462:
+#define assign_chk_ovf(display, var, val) ({ \
+	drm_WARN_ON((display)->drm, overflows_type(val, var)); \
 	(var) = (val); \
 })

-:422: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'var' - possible side-effects?
#422: FILE: drivers/gpu/drm/i915/display/intel_fb.c:1467:
+#define assign_bfld_chk_ovf(display, var, val) ({ \
 	(var) = (val); \
+	drm_WARN_ON((display)->drm, (var) != (val)); \
 	(var); \
 })

-:422: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#422: FILE: drivers/gpu/drm/i915/display/intel_fb.c:1467:
+#define assign_bfld_chk_ovf(display, var, val) ({ \
 	(var) = (val); \
+	drm_WARN_ON((display)->drm, (var) != (val)); \
 	(var); \
 })

total: 0 errors, 0 warnings, 4 checks, 871 lines checked
46125b3cdbea drm/i915: Convert intel_display_power_{get, put}*() to intel_display
-:1529: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#1529: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:299:
+#define with_intel_display_power(display, domain, wf) \
+	for ((wf) = intel_display_power_get((display), (domain)); (wf); \
+	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:1529: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'domain' - possible side-effects?
#1529: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:299:
+#define with_intel_display_power(display, domain, wf) \
+	for ((wf) = intel_display_power_get((display), (domain)); (wf); \
+	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:1529: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'wf' - possible side-effects?
#1529: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:299:
+#define with_intel_display_power(display, domain, wf) \
+	for ((wf) = intel_display_power_get((display), (domain)); (wf); \
+	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:1536: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#1536: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:303:
+#define with_intel_display_power_if_enabled(display, domain, wf) \
+	for ((wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \
+	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:1536: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'domain' - possible side-effects?
#1536: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:303:
+#define with_intel_display_power_if_enabled(display, domain, wf) \
+	for ((wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \
+	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

-:1536: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'wf' - possible side-effects?
#1536: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:303:
+#define with_intel_display_power_if_enabled(display, domain, wf) \
+	for ((wf) = intel_display_power_get_if_enabled((display), (domain)); (wf); \
+	     intel_display_power_put_async((display), (domain), (wf)), (wf) = NULL)

total: 0 errors, 0 warnings, 6 checks, 2373 lines checked
7e6f62dea069 drm/i915: Convert i9xx_plane.c to struct intel_display
96242b826af5 drm/i915: Finish intel_sprite.c struct intel_display conversion
87e9e463a842 drm/i915: Convert intel_cursor.c to struct intel_display
8e3036c77981 drm/i915: Convert skl_univeral_plane.c to struct intel_display
-:1134: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#1134: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2808:
+	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(to_i915(display->drm)))

total: 0 errors, 1 warnings, 0 checks, 1225 lines checked
5654709248eb drm/i915: Use DRM_RECT_FMT & co. for plane debugs
-:39: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:963:
+		drm_dbg_kms(&i915->drm, "Plane (" DRM_RECT_FMT ") must cover entire CRTC (" DRM_RECT_FMT ")\n",

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
b9c53e639fe5 drm/i915: Pimp plane debugs
-:81: CHECK:CONCATENATED_STRING: Concatenated strings should use spaces between elements
#81: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:949:
+			    "[PLANE:%d:%s] invalid scaling "DRM_RECT_FP_FMT " -> " DRM_RECT_FMT "\n",

-:92: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#92: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:966:
+			    "[PLANE:%d:%s] plane (" DRM_RECT_FMT ") must cover entire CRTC (" DRM_RECT_FMT ")\n",

total: 0 errors, 1 warnings, 1 checks, 378 lines checked


