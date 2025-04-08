Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D787C369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0006310E6AB;
	Tue,  8 Apr 2025 13:45:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D249410E6AB;
 Tue,  8 Apr 2025 13:45:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/wm=3A_convert_to?=
 =?utf-8?q?_struct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 13:45:42 -0000
Message-ID: <174411994285.48413.18235449528658400886@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744119460.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744119460.git.jani.nikula@intel.com>
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

Series: drm/i915/wm: convert to struct intel_display (rev2)
URL   : https://patchwork.freedesktop.org/series/147192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5c0fd6e0e36ed17c7bce4cca45b22e2968640ae
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 8 16:38:41 2025 +0300

    drm/i915/wm: convert i9xx_wm.c internally to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert as much as possible of i9xx_wm.c to struct
    intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 584c899a45c35cc0467bb1ef3b4234b6cbea2736 drm-intel
4d7a18c54e36 drm/i915/wm: convert intel_wm.h external interfaces to struct intel_display
2f5df66a3cd9 drm/i915/wm: convert intel_wm.c internally to struct intel_display
d2d3f45bfa3a drm/i915/wm: convert skl_watermark.h external interfaces to struct intel_display
454b5d87f759 drm/i915/wm: convert skl_watermarks.c internally to struct intel_display
da78487c50d7 drm/i915/wm: convert i9xx_wm.h external interfaces to struct intel_display
-:170: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#170: FILE: drivers/gpu/drm/i915/display/i9xx_wm.h:25:
 }
+static inline void ilk_wm_sanitize(struct intel_display *display)

-:174: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#174: FILE: drivers/gpu/drm/i915/display/i9xx_wm.h:28:
 }
+static inline bool intel_set_memory_cxsr(struct intel_display *display, bool enable)

-:179: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#179: FILE: drivers/gpu/drm/i915/display/i9xx_wm.h:32:
 }
+static inline void i9xx_wm_init(struct intel_display *display)

total: 0 errors, 0 warnings, 3 checks, 217 lines checked
cd56dc56895e drm/i915/wm: convert i9xx_wm.c to intel_de_*() register interface
b5c0fd6e0e36 drm/i915/wm: convert i9xx_wm.c internally to struct intel_display


