Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FC8CE8372
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 16:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747B710E549;
	Mon, 30 Sep 2024 16:27:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9834610E545;
 Mon, 30 Sep 2024 16:27:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_platf?=
 =?utf-8?q?orm_identification_with_display-=3Eplatform=2E=3Cplatform=3E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 16:27:41 -0000
Message-ID: <172771366161.1137522.1491750221919208524@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1727699233.git.jani.nikula@intel.com>
In-Reply-To: <cover.1727699233.git.jani.nikula@intel.com>
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

Series: drm/i915/display: platform identification with display->platform.<platform>
URL   : https://patchwork.freedesktop.org/series/139301/
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
commit 5406d8f97843e2624d63898d36a52e8fe537b26b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Sep 30 15:31:16 2024 +0300

    drm/i915/vblank: use display->platform.<platform> instead of IS_<PLATFORM>()
    
    Switch to using the new display->platform.<platform> members for
    platform identification in display code.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2a8d54969ceeb99f139f89f49e8fc25f71fa5bed drm-intel
ff6a5abb9c26 drm/i915/display: reindent subplatform initialization
70b85405c7e7 drm/i915/display: use a macro to initialize subplatforms
a84b29aa31b8 drm/i915/display: use a macro to define platform enumerations
-:19: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#19: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
+#define INTEL_DISPLAY_PLATFORMS(func) \
+	func(PLATFORM_UNINITIALIZED) \
+	/* Display ver 2 */ \
+	func(I830) \
+	func(I845G) \
+	func(I85X) \
+	func(I865G) \
+	/* Display ver 3 */ \
+	func(I915G) \
+	func(I915GM) \
+	func(I945G) \
+	func(I945GM) \
+	func(G33) \
+	func(PINEVIEW) \
+	/* Display ver 4 */ \
+	func(I965G) \
+	func(I965GM) \
+	func(G45) \
+	func(GM45) \
+	/* Display ver 5 */ \
+	func(IRONLAKE) \
+	/* Display ver 6 */ \
+	func(SANDYBRIDGE) \
+	/* Display ver 7 */ \
+	func(IVYBRIDGE) \
+	func(VALLEYVIEW) \
+	func(HASWELL) \
+	/* Display ver 8 */ \
+	func(BROADWELL) \
+	func(CHERRYVIEW) \
+	/* Display ver 9 */ \
+	func(SKYLAKE) \
+	func(BROXTON) \
+	func(KABYLAKE) \
+	func(GEMINILAKE) \
+	func(COFFEELAKE) \
+	func(COMETLAKE) \
+	/* Display ver 11 */ \
+	func(ICELAKE) \
+	func(JASPERLAKE) \
+	func(ELKHARTLAKE) \
+	/* Display ver 12 */ \
+	func(TIGERLAKE) \
+	func(ROCKETLAKE) \
+	func(DG1) \
+	func(ALDERLAKE_S) \
+	/* Display ver 13 */ \
+	func(ALDERLAKE_P) \
+	func(DG2) \
+	/* Display ver 14 (based on GMD ID) */ \
+	func(METEORLAKE) \
+	/* Display ver 20 (based on GMD ID) */ \
+	func(LUNARLAKE) \
+	/* Display ver 14.1 (based on GMD ID) */ \
+	func(BATTLEMAGE)

-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#19: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
+#define INTEL_DISPLAY_PLATFORMS(func) \
+	func(PLATFORM_UNINITIALIZED) \
+	/* Display ver 2 */ \
+	func(I830) \
+	func(I845G) \
+	func(I85X) \
+	func(I865G) \
+	/* Display ver 3 */ \
+	func(I915G) \
+	func(I915GM) \
+	func(I945G) \
+	func(I945GM) \
+	func(G33) \
+	func(PINEVIEW) \
+	/* Display ver 4 */ \
+	func(I965G) \
+	func(I965GM) \
+	func(G45) \
+	func(GM45) \
+	/* Display ver 5 */ \
+	func(IRONLAKE) \
+	/* Display ver 6 */ \
+	func(SANDYBRIDGE) \
+	/* Display ver 7 */ \
+	func(IVYBRIDGE) \
+	func(VALLEYVIEW) \
+	func(HASWELL) \
+	/* Display ver 8 */ \
+	func(BROADWELL) \
+	func(CHERRYVIEW) \
+	/* Display ver 9 */ \
+	func(SKYLAKE) \
+	func(BROXTON) \
+	func(KABYLAKE) \
+	func(GEMINILAKE) \
+	func(COFFEELAKE) \
+	func(COMETLAKE) \
+	/* Display ver 11 */ \
+	func(ICELAKE) \
+	func(JASPERLAKE) \
+	func(ELKHARTLAKE) \
+	/* Display ver 12 */ \
+	func(TIGERLAKE) \
+	func(ROCKETLAKE) \
+	func(DG1) \
+	func(ALDERLAKE_S) \
+	/* Display ver 13 */ \
+	func(ALDERLAKE_P) \
+	func(DG2) \
+	/* Display ver 14 (based on GMD ID) */ \
+	func(METEORLAKE) \
+	/* Display ver 20 (based on GMD ID) */ \
+	func(LUNARLAKE) \
+	/* Display ver 14.1 (based on GMD ID) */ \
+	func(BATTLEMAGE)

total: 1 errors, 0 warnings, 1 checks, 124 lines checked
65008a7d8a11 drm/i915/display: join the platform and subplatform enums
a8404e84e157 drm/i915/display: convert display platforms to lower case
151615cd2e36 drm/i915/display: add display platforms structure with platform members
-:64: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#64: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:108:
+#define __MEMBER(name) unsigned long name:1;

-:65: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#65: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:109:
+#define __COUNT(x) 1 +

-:65: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#65: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:109:
+#define __COUNT(x) 1 +

total: 1 errors, 2 warnings, 0 checks, 57 lines checked
e725abdf4d2b drm/i915/display: add platform member to struct intel_display
65bbf878646d drm/i915/display: remove the display platform enum as unnecessary
f6bf5948cc34 drm/i915/display: add platform group for g4x
694799d15aa8 drm/i915/display: add subplatform group for HSW/BDW ULT
8b37369d1a93 drm/i915/bios: use display->platform.<platform> instead of IS_<PLATFORM>()
a6037bf7d988 drm/i915/pps: use display->platform.<platform> instead of IS_<PLATFORM>()
42b179253d7d drm/i915/tv: use display->platform.<platform> instead of IS_<PLATFORM>()
d8f52f5f3bb8 drm/i915/vga: use display->platform.<platform> instead of IS_<PLATFORM>()
5406d8f97843 drm/i915/vblank: use display->platform.<platform> instead of IS_<PLATFORM>()


