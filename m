Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159EBC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD8710E101;
	Wed, 29 May 2024 18:26:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E26E10E101;
 Wed, 29 May 2024 18:26:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915_and_drm/xe_displ?=
 =?utf-8?q?ay_and_compat_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 18:26:49 -0000
Message-ID: <171700720918.2234143.5593052737715953912@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1717004739.git.jani.nikula@intel.com>
In-Reply-To: <cover.1717004739.git.jani.nikula@intel.com>
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

Series: drm/i915 and drm/xe display and compat cleanups
URL   : https://patchwork.freedesktop.org/series/134197/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a2ed251053600725744a11abdb47ed76b40c62f6
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed May 29 20:48:14 2024 +0300

    drm/xe/display: drop i915_drv.h include from xe code
    
    Drop i915_drv.h include from xe display code as much as possible, and
    switch to xe types where necessary.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
912d23a10639 drm/i915/display: include gem/i915_gem_stolen.h where needed
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
rename from drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
c2e90e99af56 drm/i915/display: include gt/intel_gt_types.h where needed
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
rename from drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
c2bbae07d5a8 drm/i915/display: include i915_gpu_error.h where needed
8eb5b22f5350 drm/i915/display: include intel_uncore.h where needed
fa9d975b5289 drm/i915/display: include intel_step.h where needed
f3bc048987fc drm/i915/display: include xe_bo.h, gem_object_types etc. where needed
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:62: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#62: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
8f7023ce4e2b drm/xe/display: move compat uncore stubs to the correct file
-:34: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#34: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:175:
+#define intel_uncore_forcewake_get(x, y) do { } while (0)

-:34: WARNING:MACRO_ARG_UNUSED: Argument 'y' is not used in function-like macro
#34: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:175:
+#define intel_uncore_forcewake_get(x, y) do { } while (0)

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:176:
+#define intel_uncore_forcewake_put(x, y) do { } while (0)

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'y' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:176:
+#define intel_uncore_forcewake_put(x, y) do { } while (0)

-:37: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#37: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:178:
+#define intel_uncore_arm_unclaimed_mmio_detection(x) do { } while (0)

total: 0 errors, 5 warnings, 0 checks, 20 lines checked
5a08fe2863ab drm/xe/display: move compat runtime pm stubs to the correct file
-:146: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#146: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:60:
+#define assert_rpm_wakelock_held(x) do { } while (0)

-:147: WARNING:MACRO_ARG_UNUSED: Argument 'x' is not used in function-like macro
#147: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:61:
+#define assert_rpm_raw_wakeref_held(x) do { } while (0)

-:149: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'rpm' - possible side-effects?
#149: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:63:
+#define with_intel_runtime_pm(rpm, wf) \
+	for ((wf) = intel_runtime_pm_get(rpm); (wf); \
+	     intel_runtime_pm_put((rpm), (wf)), (wf) = 0)

-:149: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'wf' - possible side-effects?
#149: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:63:
+#define with_intel_runtime_pm(rpm, wf) \
+	for ((wf) = intel_runtime_pm_get(rpm); (wf); \
+	     intel_runtime_pm_put((rpm), (wf)), (wf) = 0)

total: 0 errors, 2 warnings, 2 checks, 130 lines checked
fae1a728106a drm/xe/display: reduce includes in compat i915_drv.h
a2ed25105360 drm/xe/display: drop i915_drv.h include from xe code
-:91: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#91: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:49:
+			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));

-:96: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#96: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:53:
+		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
 					  ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |

total: 0 errors, 1 warnings, 1 checks, 169 lines checked


