Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB8ED68BEE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 08:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24F610E399;
	Thu, 18 Dec 2025 08:43:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89D610E69D;
 Thu, 18 Dec 2025 08:43:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prepare_GVT_for_display_m?=
 =?utf-8?q?odularization_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 08:43:34 -0000
Message-ID: <176604741488.98733.7837968113922696487@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
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

Series: Prepare GVT for display modularization (rev2)
URL   : https://patchwork.freedesktop.org/series/159008/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5f54f403acc61a45ad2b4d68dfd74b336dce1968
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d384f744d1933b6ecba013d9753d890ba94d3149
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Dec 18 13:53:00 2025 +0530

    drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
    
    Now that i915/display macros have been substituted with wrappers that call
    the new display-device helpers, we can drop the conflicting includes from
    GVT and remove the temporary #ifdef/#undef macro overrides.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 44ada578e636e19936ed69ea73683ca275f4f0a7 drm-intel
a47014299652 drm/i915/display: Abstract pipe/trans/cursor offset calculation
-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#31: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:263:
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
+	(DISPLAY_INFO((display))->pipe_offsets[(pipe)] - \
+	 DISPLAY_INFO((display))->pipe_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE((display)))

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:268:
+#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
+	(DISPLAY_INFO((display))->trans_offsets[(trans)] - \
+	 DISPLAY_INFO((display))->trans_offsets[TRANSCODER_A] + \
+	 DISPLAY_MMIO_BASE((display)))

-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#41: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:273:
+#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
+	(DISPLAY_INFO((display))->cursor_offsets[(pipe)] - \
+	 DISPLAY_INFO((display))->cursor_offsets[PIPE_A] + \
+	 DISPLAY_MMIO_BASE((display)))

-:78: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:38:
+#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(INTEL_DISPLAY_DEVICE_PIPE_OFFSET((display), (pipe)) + (reg))

-:79: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:39:
+#define _MMIO_TRANS2(display, trans, reg)	_MMIO(INTEL_DISPLAY_DEVICE_TRANS_OFFSET((display), (trans)) + (reg))

-:80: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#80: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:40:
+#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(INTEL_DISPLAY_DEVICE_CURSOR_OFFSET((display), (pipe)) + (reg))

total: 0 errors, 3 warnings, 3 checks, 49 lines checked
718248dd57ec drm/i915/display: Add APIs to be used by gvt to get the register offsets
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

-:86: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_gvt_api.h', please use '/*' instead
#86: FILE: drivers/gpu/drm/i915/display/intel_gvt_api.h:1:
+// SPDX-License-Identifier: MIT

-:86: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#86: FILE: drivers/gpu/drm/i915/display/intel_gvt_api.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 61 lines checked
0e1ba9e25180 drm/i915/gvt: Add header to use display offset functions in macros
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

-:57: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/gvt/display_helpers.h', please use '/*' instead
#57: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:1:
+// SPDX-License-Identifier: MIT

-:57: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#57: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 63 lines checked
100526a3b4cf drm/i915/gvt/display_helpers: Cast argument to enum pipe for pipe-offset macro
a4b8b9d17335 drm/i915/gvt: Change for_each_pipe to use pipe_valid API
-:98: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__p' - possible side-effects?
#98: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:35:
+#define gvt_for_each_pipe(display, __p) \
+	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
+		for_each_if(intel_display_device_pipe_valid((display), (enum pipe)(__p)))

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
37f90e8f8c46 drm/i915/gvt: Use the appropriate header for the DPLL macro
d384f744d193 drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs


