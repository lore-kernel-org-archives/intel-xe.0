Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBCC52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 16:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B6010E09E;
	Thu, 22 Aug 2024 16:11:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D2810E09E;
 Thu, 22 Aug 2024 16:11:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rsion_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 16:11:23 -0000
Message-ID: <172434308368.726612.7683564759377570212@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724342644.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724342644.git.jani.nikula@intel.com>
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

Series: drm/i915/display: conversion to struct intel_display
URL   : https://patchwork.freedesktop.org/series/137655/
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
commit 08f5e72c164a50e87503d334ac0124e86097369d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Aug 22 19:04:55 2024 +0300

    drm/i915/display: convert params to struct intel_display
    
    Going forward, struct intel_display shall replace struct
    drm_i915_private as the main display device data pointer type. Convert
    intel_display_params.[ch] and intel_display_debugfs_params.[ch] to
    struct intel_display.
    
    Some stragglers are left behind where needed.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 882c26c7017bdcc4eca493c7bf1ffb034d40be02 drm-intel
bbdf455fdd96 drm/i915/vblank: use drm_crtc_vblank_crtc() instead of open-coding
3df99bee84d9 drm/i915/vblank: fix context imbalance warnings
7331964bf9c5 drm/i915/vblank: convert to struct intel_display
-:204: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#204: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:398:
+		position = (intel_de_read_fw(display, PIPEFRAMEPIXEL(display, pipe)) & PIPE_PIXEL_MASK) >> PIPE_PIXEL_SHIFT;

total: 0 errors, 1 warnings, 0 checks, 291 lines checked
d3392a12520d drm/i915/vrr: convert to struct intel_display
-:296: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#296: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:413:
+							 TRANS_VRR_FLIPLINE(display, cpu_transcoder)) + 1;

total: 0 errors, 1 warnings, 0 checks, 289 lines checked
90eb850fc46e drm/i915/tv: convert to struct intel_display
-:349: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#349: FILE: drivers/gpu/drm/i915/display/intel_tv.c:1606:
+	save_tv_dac = tv_dac = intel_de_read(display, TV_DAC);

-:350: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#350: FILE: drivers/gpu/drm/i915/display/intel_tv.c:1607:
+	save_tv_ctl = tv_ctl = intel_de_read(display, TV_CTL);

total: 0 errors, 0 warnings, 2 checks, 514 lines checked
784630f00ffd drm/i915/sprite: convert to struct intel_display
08f5e72c164a drm/i915/display: convert params to struct intel_display
-:91: WARNING:MACRO_ARG_UNUSED: Argument 'T' is not used in function-like macro
#91: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:183:
+#define PRINT(T, x, ...) _param_print(p, display->drm->driver->name, #x, display->params.x);

-:91: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#91: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:183:
+#define PRINT(T, x, ...) _param_print(p, display->drm->driver->name, #x, display->params.x);

total: 0 errors, 2 warnings, 0 checks, 101 lines checked


