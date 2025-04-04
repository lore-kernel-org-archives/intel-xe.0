Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7888CC36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 05:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4082A10E2E7;
	Fri,  4 Apr 2025 05:09:21 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F2910E25D;
 Fri,  4 Apr 2025 05:09:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/wm=3A_convert_to?=
 =?utf-8?q?_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 05:09:19 -0000
Message-ID: <174374335994.37371.7720038634994377156@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1743671373.git.jani.nikula@intel.com>
In-Reply-To: <cover.1743671373.git.jani.nikula@intel.com>
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

Series: drm/i915/wm: convert to struct intel_display
URL   : https://patchwork.freedesktop.org/series/147192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 354a1b2e53d57817a46d8f4108f3a52e541c8aff
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Apr 3 12:11:39 2025 +0300

    drm/i915/wm: convert i9xx_wm.c internally to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert as much as possible of i9xx_wm.c to struct
    intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
092e6e286606 drm/i915/wm: convert intel_wm.h external interfaces to struct intel_display
a76e96758e1c drm/i915/wm: convert intel_wm.c internally to struct intel_display
0050a7d5e6c9 drm/i915/wm: convert skl_watermark.h external interfaces to struct intel_display
b097254df723 drm/i915/wm: convert skl_watermarks.c internally to struct intel_display
12aa0d66617f drm/i915/wm: convert intel_wm.h external interfaces to struct intel_display
-:166: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#166: FILE: drivers/gpu/drm/i915/display/i9xx_wm.h:25:
 }
+static inline void ilk_wm_sanitize(struct intel_display *display)

-:170: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#170: FILE: drivers/gpu/drm/i915/display/i9xx_wm.h:28:
 }
+static inline bool intel_set_memory_cxsr(struct intel_display *display, bool enable)

-:175: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#175: FILE: drivers/gpu/drm/i915/display/i9xx_wm.h:32:
 }
+static inline void i9xx_wm_init(struct intel_display *display)

total: 0 errors, 0 warnings, 3 checks, 205 lines checked
bbbde3cf4c33 drm/i915/wm: convert i9xx_wm.c to intel_de_*() register interface
354a1b2e53d5 drm/i915/wm: convert i9xx_wm.c internally to struct intel_display


