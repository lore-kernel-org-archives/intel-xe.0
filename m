Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AE7D5B154
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 21:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE5B10E581;
	Mon, 28 Oct 2024 21:44:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BF010E581;
 Mon, 28 Oct 2024 21:44:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_platf?=
 =?utf-8?q?orm_identification_with_display-=3Eplatform=2E=3Cplatform=3E_=28r?=
 =?utf-8?q?ev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 21:44:12 -0000
Message-ID: <173015185273.1357055.7187119108113498844@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730144869.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730144869.git.jani.nikula@intel.com>
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

Series: drm/i915/display: platform identification with display->platform.<platform> (rev4)
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
commit 81150cceefa09126cb767e6f2b0cb0428ff87c49
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Oct 28 21:48:49 2024 +0200

    drm/i915/vblank: use display->platform.<platform> instead of IS_<PLATFORM>()
    
    Switch to using the new display->platform.<platform> members for
    platform identification in display code.
    
    v2: Split out an unrelated hunk to a separate patch (Rodrigo)
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 810b65a3bab4c67517ef050df06dcf998d66b664 drm-intel
62388da5acf7 drm/i915/display: reindent subplatform initialization
6f414599f6eb drm/i915/display: use a macro to initialize subplatforms
150ad3679427 drm/i915/display: use a macro to define platform enumerations
-:22: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
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
+	func(BATTLEMAGE) \
+	/* Display ver 30 (based on GMD ID) */ \
+	func(PANTHERLAKE)

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
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
+	func(BATTLEMAGE) \
+	/* Display ver 30 (based on GMD ID) */ \
+	func(PANTHERLAKE)

total: 1 errors, 0 warnings, 1 checks, 128 lines checked
9cd87ee3cbc1 drm/i915/display: join the platform and subplatform enums
43301309fffd drm/i915/display: convert display platforms to lower case
e6d35039a7d9 drm/i915/display: add display platforms structure with platform members
-:67: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#67: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:110:
+#define __MEMBER(name) unsigned long name:1;

-:68: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#68: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:111:
+#define __COUNT(x) 1 +

-:68: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#68: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:111:
+#define __COUNT(x) 1 +

total: 1 errors, 2 warnings, 0 checks, 57 lines checked
0e06fe31e143 drm/i915/display: add platform member to struct intel_display
e797d30bcad2 drm/i915/display: remove the display platform enum as unnecessary
38206d15b61a drm/i915/display: add platform group for g4x
236b6abc17b1 drm/i915/display: add subplatform group for HSW/BDW ULT
35fa67722295 drm/i915/bios: use display->platform.<platform> instead of IS_<PLATFORM>()
211963831f76 drm/i915/pps: use display->platform.<platform> instead of IS_<PLATFORM>()
c2a869970a17 drm/i915/tv: use display->platform.<platform> instead of IS_<PLATFORM>()
23279c73f198 drm/i915/vga: use display->platform.<platform> instead of IS_<PLATFORM>()
d5a09f1c2cc9 drm/i915/vblank: drop unnecessary i915 local variable
81150cceefa0 drm/i915/vblank: use display->platform.<platform> instead of IS_<PLATFORM>()


