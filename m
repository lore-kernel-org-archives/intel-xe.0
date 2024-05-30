Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43175C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 10:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648A510E0FF;
	Thu, 30 May 2024 10:14:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13D10E0FF;
 Thu, 30 May 2024 10:14:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_identify_all_?=
 =?utf-8?q?platforms_in_display_probe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 10:14:01 -0000
Message-ID: <171706404163.2237379.11688950160428619018@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716399081.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716399081.git.jani.nikula@intel.com>
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

Series: drm/i915: identify all platforms in display probe (rev2)
URL   : https://patchwork.freedesktop.org/series/133931/
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
commit 35f4aa133e1687e75b4f816f7ce1614a347d234f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed May 22 20:33:47 2024 +0300

    drm/i915/display: add probe message
    
    Add an info message about which display device was probed.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
66e70a491436 drm/i915/display: move params copy at probe earlier
1ae2b5e164c5 drm/i915/display: change probe for no display case
1d41c33028e4 drm/i915/display: check platforms without display one level higher
8249492770f3 drm/i915/display: change GMD ID display ip ver propagation at probe
476fffc942f6 drm/i915/display: add platform descriptors
-:52: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:211:
+		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C), /* DVO A/B/C */

-:239: WARNING:LONG_LINE_COMMENT: line length of 117 exceeds 100 columns
#239: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:349:
+		.__runtime_defaults.port_mask = BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* SDVO/HDMI/DP B/C, DP D */

-:253: WARNING:LONG_LINE_COMMENT: line length of 117 exceeds 100 columns
#253: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:358:
+		.__runtime_defaults.port_mask = BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* SDVO/HDMI/DP B/C, DP D */

-:303: WARNING:LONG_LINE: line length of 142 exceeds 100 columns
#303: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:400:
+		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* DP A, SDVO/HDMI/DP B, HDMI/DP C/D */

-:329: WARNING:LONG_LINE: line length of 142 exceeds 100 columns
#329: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:416:
+		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* DP A, SDVO/HDMI/DP B, HDMI/DP C/D */

-:396: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#396: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:455:
+		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D) | BIT(PORT_E),

-:434: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#434: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:477:
+		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D) | BIT(PORT_E),

-:464: WARNING:LONG_LINE_COMMENT: line length of 108 exceeds 100 columns
#464: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:495:
+		.__runtime_defaults.port_mask = BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D), /* HDMI/DP B/C/D */

-:546: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#546: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:627:
+		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D) | BIT(PORT_E),

total: 0 errors, 9 warnings, 0 checks, 728 lines checked
5f089e2e4ffb drm/i915: add LNL PCI IDs
-:23: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#23: FILE: include/drm/i915_pciids.h:787:
+#define INTEL_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#23: FILE: include/drm/i915_pciids.h:787:
+#define INTEL_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 10 lines checked
54cbe94ed784 drm/i915/display: change display probe to identify GMD ID based platforms
-:109: ERROR:CODE_INDENT: code indent should use tabs where possible
#109: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:1044:
+        if (!info)$

-:109: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#109: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:1044:
+        if (!info)$

total: 1 errors, 1 warnings, 0 checks, 89 lines checked
8abb58ec2398 drm/i915/display: identify platforms with enum and name
cc560abd537e drm/i915/display: add support for subplatforms
35f4aa133e16 drm/i915/display: add probe message


