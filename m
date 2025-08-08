Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E39C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B5910E1D7;
	Fri,  8 Aug 2025 08:49:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B0910E1CE;
 Fri,  8 Aug 2025 08:49:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915=3A_Add_debugfs_?=
 =?utf-8?q?control_to_prefer_YCbCr_4=3A2=3A0_output_for_HDMI/DP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 08:49:20 -0000
Message-ID: <175464296080.221846.8740723947327528641@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808075351.304612-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250808075351.304612-1-dibin.moolakadan.subrahmanian@intel.com>
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

Series: drm/i915: Add debugfs control to prefer YCbCr 4:2:0 output for HDMI/DP
URL   : https://patchwork.freedesktop.org/series/152671/
State : warning

== Summary ==

+ trap cleanup EXIT
+ KERNEL=/kernel
+ MT=/root/linux/maintainer-tools
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
Cloning into '/root/linux/maintainer-tools'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ make -C /root/linux/maintainer-tools
make: Entering directory '/root/linux/maintainer-tools'
cc -O2 -g -Wextra -o remap-log remap-log.c
make: Leaving directory '/root/linux/maintainer-tools'
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ /root/linux/maintainer-tools/dim sparse --fast c59a466c9c1d514e151d30f0a66ce76ce8d21aef
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2024:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2037:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2037:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2037:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_hotplug.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


