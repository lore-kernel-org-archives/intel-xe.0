Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B86D59D99
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 11:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395410E3BD;
	Mon, 15 Dec 2025 11:38:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B735D10E3BD;
 Mon, 15 Dec 2025 11:38:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prepare_GVT_for_display_m?=
 =?utf-8?q?odularization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 11:38:30 -0000
Message-ID: <176579871064.88490.14659773725031749226@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
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

Series: Prepare GVT for display modularization
URL   : https://patchwork.freedesktop.org/series/159008/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a7146dcf2f3f791b9a1b75f0d7412e841045c533
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Dec 15 16:48:41 2025 +0530

    drm/i915/gvt/display_helpers: Cast argument to enum pipe for pipe-offset macro
    
    TRANSCONF() expands via _MMIO_PIPE2, i.e., it uses pipe-based addressing.
    In GVT, some call sites pass an enum transcoder to TRANSCONF(), which now
    routes through INTEL_DISPLAY_DEVICE_PIPE_OFFSET() and ultimately calls
    intel_display_device_pipe_offset(), whose parameter type is enum pipe.
    
    This results in -Werror=enum-conversion.
    
    To address this, cast the index to enum pipe in the GVT-side macro
    override.
    
    This works for all cases as TRANSCODER_{A,B,C,D} all have 1:1 mapping to
    PIPE_{A,B,C,D} except for TRANSCODER_EDP.
    
    There is one place which uses TRANSCONF() with TRANSCODER_EDP, which
    appears to be incorrect. In any case, the cast preserves the previous
    behaviour.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 05b7c58b3367dca84d4745dfcac3b5d4ee142404 drm-intel
0f61214c74ff drm/i915/display: Abstract pipe/trans/cursor offset calculation
-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:263:
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
+	(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
+	 DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE(display))

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#33: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:268:
+#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
+	(DISPLAY_INFO(display)->trans_offsets[(trans)] - \
+	 DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
+	 DISPLAY_MMIO_BASE(display))

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#38: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:273:
+#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
+	(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
+	 DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE(display))

-:75: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#75: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:38:
+#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) + (reg))

-:76: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#76: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:39:
+#define _MMIO_TRANS2(display, trans, reg)	_MMIO(INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) + (reg))

-:77: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:40:
+#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) + (reg))

total: 0 errors, 3 warnings, 3 checks, 49 lines checked
b5542f24bd33 drm/i915/display: Add APIs to be used by gvt to get the register offsets
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

-:85: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_gvt_api.h', please use '/*' instead
#85: FILE: drivers/gpu/drm/i915/display/intel_gvt_api.h:1:
+// SPDX-License-Identifier: MIT

-:85: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#85: FILE: drivers/gpu/drm/i915/display/intel_gvt_api.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 61 lines checked
ecd1eaf3058c drm/i915/gvt: Add header to use display offset functions in macros
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

-:50: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/gvt/display_helpers.h', please use '/*' instead
#50: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:1:
+// SPDX-License-Identifier: MIT

-:50: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#50: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 71 lines checked
6c05fae13196 drm/i915/gvt: Change for_each_pipe to use pipe_mask API
-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__p' - possible side-effects?
#51: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:42:
+#define for_each_pipe(display, __p) \
+	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
+		for_each_if(intel_display_runtime_info_pipe_mask((display)) & BIT(__p))

total: 0 errors, 0 warnings, 1 checks, 26 lines checked
a7146dcf2f3f drm/i915/gvt/display_helpers: Cast argument to enum pipe for pipe-offset macro


