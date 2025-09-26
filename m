Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92930CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 10:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596D910E349;
	Fri, 26 Sep 2025 10:16:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB8E10E346;
 Fri, 26 Sep 2025 10:16:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_dupli?=
 =?utf-8?q?cate_128-byte_Y-tiling_feature_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Sep 2025 10:16:24 -0000
Message-ID: <175888178477.370490.14392991210524466619@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250926090538.1117038-1-jani.nikula@intel.com>
In-Reply-To: <20250926090538.1117038-1-jani.nikula@intel.com>
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

Series: drm/i915/display: duplicate 128-byte Y-tiling feature check
URL   : https://patchwork.freedesktop.org/series/155090/
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
commit 95d55d31e83dfe304fb7b74975f65e7116e8fffb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 26 12:05:38 2025 +0300

    drm/i915/display: duplicate 128-byte Y-tiling feature check
    
    We should try to get rid of checks that depend on struct
    drm_i915_private (or struct xe_device) in display
    code. HAS_128_BYTE_Y_TILING() is one of them. In the interest of
    simplicity, just duplicate the check as HAS_128B_Y_TILING() in display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d557b14c00c4ab027e66c1c7bf512cf479ff8c24 drm-intel
95d55d31e83d drm/i915/display: duplicate 128-byte Y-tiling feature check
-:21: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:145:
+#define HAS_128B_Y_TILING(__display)	(DISPLAY_VER(__display) != 2 && !(__display)->platform.i915g && !(__display)->platform.i915gm)

-:21: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:145:
+#define HAS_128B_Y_TILING(__display)	(DISPLAY_VER(__display) != 2 && !(__display)->platform.i915g && !(__display)->platform.i915gm)

total: 0 errors, 1 warnings, 1 checks, 28 lines checked


