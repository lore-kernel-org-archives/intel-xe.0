Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC52CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 15:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F88B10E127;
	Mon, 13 Oct 2025 15:11:57 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A52510E127;
 Mon, 13 Oct 2025 15:11:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_128-b?=
 =?utf-8?q?yte_Y-tiling_and_flat_CCS_feature_checks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 15:11:56 -0000
Message-ID: <176036831643.6232.8298299049051644887@97596180aaec>
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

Series: drm/i915/display: 128-byte Y-tiling and flat CCS feature checks (rev2)
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
commit b5328b25d63833976b8b38519b370e2568ff3a65
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Oct 13 17:45:52 2025 +0300

    drm/i915/display: add HAS_AUX_CCS() feature check
    
    We should try to get rid of checks that depend on struct
    drm_i915_private (or struct xe_device) in display code. HAS_FLAT_CCS()
    is one of them. In the interest of simplicity, add a reversed
    HAS_AUX_CCS() feature check macro, as that's we mostly use it for in
    display.
    
    v2: include adl-p (Ville)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 61b16793c3bbb8e740cf9afb36258dee61346626 drm-intel
2e43e4772821 drm/i915: include gen 2 in HAS_128_BYTE_Y_TILING()
-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#60: FILE: drivers/gpu/drm/i915/i915_drv.h:605:
+#define HAS_128_BYTE_Y_TILING(i915) (!IS_I915G(i915) && !IS_I915GM(i915))

total: 0 errors, 0 warnings, 1 checks, 28 lines checked
e8d53c6ef3c6 drm/i915/display: duplicate 128-byte Y-tiling feature check
-:27: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:145:
+#define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)

-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:145:
+#define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)

total: 0 errors, 1 warnings, 1 checks, 28 lines checked
b5328b25d638 drm/i915/display: add HAS_AUX_CCS() feature check
-:24: WARNING:LONG_LINE: line length of 147 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)

-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#24: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:147:
+#define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)

-:68: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#68: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2933:
+	if (!IS_ENABLED(I915) && HAS_AUX_CCS(display))

total: 0 errors, 2 warnings, 1 checks, 45 lines checked


