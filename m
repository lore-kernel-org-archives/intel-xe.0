Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7478CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948CE10EBF6;
	Fri, 10 Oct 2025 12:42:16 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A8A10EBF5;
 Fri, 10 Oct 2025 12:42:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_128-b?=
 =?utf-8?q?yte_Y-tiling_and_flat_CCS_feature_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 12:42:15 -0000
Message-ID: <176010013547.294.10648130793110255696@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1760094361.git.jani.nikula@intel.com>
In-Reply-To: <cover.1760094361.git.jani.nikula@intel.com>
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

Series: drm/i915/display: 128-byte Y-tiling and flat CCS feature checks
URL   : https://patchwork.freedesktop.org/series/155739/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8bfae57eb6e1a9e33d46f3ae9f80a4a2408307aa
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Oct 10 14:07:53 2025 +0300

    drm/i915/display: add HAS_AUX_CCS() feature check
    
    We should try to get rid of checks that depend on struct
    drm_i915_private (or struct xe_device) in display code. HAS_FLAT_CCS()
    is one of them. In the interest of simplicity, add a reversed
    HAS_AUX_CCS() feature check macro, as that's we mostly use it for in
    display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a83c7590b57a56cfc1f4d9e1c07948643c9ed165 drm-intel
0b7ccc5b100f drm/i915: include gen 2 in HAS_128_BYTE_Y_TILING()
-:59: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#59: FILE: drivers/gpu/drm/i915/i915_drv.h:605:
+#define HAS_128_BYTE_Y_TILING(i915) (!IS_I915G(i915) && !IS_I915GM(i915))

total: 0 errors, 0 warnings, 1 checks, 28 lines checked
f7cbc1999dca drm/i915/display: duplicate 128-byte Y-tiling feature check
-:23: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:145:
+#define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:145:
+#define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)

total: 0 errors, 1 warnings, 1 checks, 28 lines checked
8bfae57eb6e1 drm/i915/display: add HAS_AUX_CCS() feature check
-:22: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_AUX_CCS(__display)		(DISPLAY_VER(__display) < 13 || (__display)->platform.meteorlake)

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_AUX_CCS(__display)		(DISPLAY_VER(__display) < 13 || (__display)->platform.meteorlake)

-:66: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#66: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2933:
+	if (!IS_ENABLED(I915) && HAS_AUX_CCS(display))

total: 0 errors, 2 warnings, 1 checks, 45 lines checked


