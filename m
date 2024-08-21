Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A4FC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 09:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51A610E5C9;
	Wed, 21 Aug 2024 09:56:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B905410E5C9;
 Wed, 21 Aug 2024 09:56:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_ident?=
 =?utf-8?q?ify_display_steppings_in_display_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 09:56:09 -0000
Message-ID: <172423416975.717750.17587386715648326898@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724180287.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724180287.git.jani.nikula@intel.com>
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

Series: drm/i915/display: identify display steppings in display code (rev2)
URL   : https://patchwork.freedesktop.org/series/137533/
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
commit dfa5a565bc4acfc614ede589d4021d45cf4e03a1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Aug 20 22:00:43 2024 +0300

    drm/xe: remove display stepping handling
    
    The code is now unused. Remove.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e455d7c00376d7a71e6fda6694d4e284ca1f70ab drm-intel
6fdd4ccd6607 drm/xe/display: fix compat IS_DISPLAY_STEP() range end
-:22: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#22: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:86:
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step < last; })

-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'first' may be better as '(first)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:86:
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step < last; })

-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'last' may be better as '(last)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:86:
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step < last; })

total: 0 errors, 1 warnings, 2 checks, 8 lines checked
8cdfa3651761 drm/xe/display: remove intel_display_step_name() to simplify
42ef911ba195 drm/xe/display: remove the unused compat HAS_GMD_ID()
119211fcdba4 drm/xe/step: define more steppings E-J
6bc6d1dcf11b drm/i915/display: rename IS_DISPLAY_IP_RANGE() to IS_DISPLAY_VER_FULL()
-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:164:
+#define IS_DISPLAY_VER_FULL(__i915, from, until) ( \
 	BUILD_BUG_ON_ZERO((from) < IP_VER(2, 0)) + \
 	(DISPLAY_VER_FULL(__i915) >= (from) && \
 	 DISPLAY_VER_FULL(__i915) <= (until)))

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'from' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:164:
+#define IS_DISPLAY_VER_FULL(__i915, from, until) ( \
 	BUILD_BUG_ON_ZERO((from) < IP_VER(2, 0)) + \
 	(DISPLAY_VER_FULL(__i915) >= (from) && \
 	 DISPLAY_VER_FULL(__i915) <= (until)))

total: 0 errors, 0 warnings, 2 checks, 24 lines checked
3b3a89402542 drm/i915/display: rename IS_DISPLAY_IP_STEP() to IS_DISPLAY_VER_STEP()
-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#29: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:184:
+#define IS_DISPLAY_VER_STEP(__i915, ipver, from, until) \
 	(IS_DISPLAY_VER_FULL((__i915), (ipver), (ipver)) && \
 	 IS_DISPLAY_STEP((__i915), (from), (until)))

-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ipver' - possible side-effects?
#29: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:184:
+#define IS_DISPLAY_VER_STEP(__i915, ipver, from, until) \
 	(IS_DISPLAY_VER_FULL((__i915), (ipver), (ipver)) && \
 	 IS_DISPLAY_STEP((__i915), (from), (until)))

total: 0 errors, 0 warnings, 2 checks, 78 lines checked
4ce3fd100b7d drm/i915/display: identify display steppings in display probe
-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_map' - possible side-effects?
#40: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:29:
+#define STEP_INFO(_map)				\
+	.step_info.map = _map,			\
+	.step_info.size = ARRAY_SIZE(_map)

total: 0 errors, 0 warnings, 1 checks, 416 lines checked
f4940e8f17a4 drm/i915/display: switch to display detected steppings
-:40: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#40: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:199:
+#define IS_DISPLAY_STEP(__i915, since, until) \
+	(drm_WARN_ON(__to_intel_display(__i915)->drm, INTEL_DISPLAY_STEP(__i915) == STEP_NONE), \
+	 INTEL_DISPLAY_STEP(__i915) >= (since) && INTEL_DISPLAY_STEP(__i915) < (until))

total: 0 errors, 0 warnings, 1 checks, 53 lines checked
095cf18b4496 drm/i915: remove display stepping handling
dfa5a565bc4a drm/xe: remove display stepping handling


