Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF253C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 18:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB7610E2A3;
	Mon, 19 Aug 2024 18:51:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C0010E2A3;
 Mon, 19 Aug 2024 18:51:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_platf?=
 =?utf-8?q?orm_identification_with_display-=3Eis=2E=3CPLATFORM=3E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 18:51:31 -0000
Message-ID: <172409349129.694904.11974959322265465893@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724092799.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724092799.git.jani.nikula@intel.com>
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

Series: drm/i915/display: platform identification with display->is.<PLATFORM> (rev2)
URL   : https://patchwork.freedesktop.org/series/135017/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c2cca2b86d7f03420f9e0ca3c4bc660b93cd90a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Aug 19 21:44:36 2024 +0300

    drm/i915/bios: use display->is.PLATFORM instead of IS_PLATFORM()
    
    Switch to using the new display->is.PLATFORM members.
    
    There are still cases like IS_G4X() which is trivial with macros, but
    not so with platform members. Ditto for IS_IRONLAKE_M() and IS_IVB_GT1()
    etc. although not used in this file.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 19d5b3fcc4a8dcf26076e522c794164f4d3e40c0 drm-intel
62bd10eaa937 drm/i915/display: use a macro to initialize subplatforms
19612413ed9f drm/i915/display: use a macro to define platform enumerations
-:20: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#20: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
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

-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
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
b39a7a6a9392 drm/i915/display: join the platform and subplatform enums
70afee7efb15 drm/i915/display: add display platforms structure with platform members
-:66: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#66: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:105:
+#define __MEMBER(name) unsigned long name:1;

-:67: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#67: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:106:
+#define __COUNT(x) 1 +

-:67: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#67: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:106:
+#define __COUNT(x) 1 +

total: 1 errors, 2 warnings, 0 checks, 59 lines checked
2bb7418542cd drm/i915/display: add platforms "is" member to struct intel_display
97ce05dd982c drm/i915/display: remove the display platform enum as unnecessary
643cc7e44020 drm/i915/display: consider HSW/BDW ULX to also be ULT
-:41: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:539:
+		{ SUBPLATFORM(BROADWELL, ULT), SUBPLATFORM(BROADWELL, ULX), .pciidlist = bdw_ulx_ids },

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
af046d381f57 drm/i915/display: keep subplatforms next to their platforms
2c2cca2b86d7 drm/i915/bios: use display->is.PLATFORM instead of IS_PLATFORM()


