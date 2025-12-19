Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2468D7495A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 06:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B210E12F;
	Fri, 19 Dec 2025 06:23:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4FA10E12F;
 Fri, 19 Dec 2025 06:23:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prepare_GVT_for_display_m?=
 =?utf-8?q?odularization_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 06:23:24 -0000
Message-ID: <176612540463.104675.13407971653604495110@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
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

Series: Prepare GVT for display modularization (rev3)
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
commit 4b62b40ed299b3a119752e2b39bb5f1fd90657db
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Dec 19 11:32:59 2025 +0530

    drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
    
    Now that i915/display macros have been substituted with wrappers that call
    the new display-device helpers, we can drop the conflicting includes from
    GVT and remove the temporary #ifdef/#undef macro overrides.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 93db616df689a410d961e7c614c57e61d17a29a0 drm-intel
4280925b78a7 drm/i915/display: Abstract pipe/trans/cursor offset calculation
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
84da8be64b49 drm/i915/display: Add APIs to be used by gvt to get the register offsets
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

-:91: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_gvt_api.h', please use '/*' instead
#91: FILE: drivers/gpu/drm/i915/display/intel_gvt_api.h:1:
+// SPDX-License-Identifier: MIT

-:91: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#91: FILE: drivers/gpu/drm/i915/display/intel_gvt_api.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 63 lines checked
92d637de3e97 drm/i915/gvt: Add header to use display offset functions in macros
-:65: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#65: 
new file mode 100644

-:70: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/gvt/display_helpers.h', please use '/*' instead
#70: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:1:
+// SPDX-License-Identifier: MIT

-:70: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#70: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 73 lines checked
b33012939683 drm/i915/gvt: Change for_each_pipe to use pipe_valid API
-:112: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__p' - possible side-effects?
#112: FILE: drivers/gpu/drm/i915/gvt/display_helpers.h:45:
+#define gvt_for_each_pipe(display, __p) \
+	for ((__p) = PIPE_A; (__p) < I915_MAX_PIPES; (__p)++) \
+		for_each_if(intel_display_device_pipe_valid((display), (__p)))

total: 0 errors, 0 warnings, 1 checks, 62 lines checked
b664faebf1d9 drm/i915/gvt: Use the appropriate header for the DPLL macro
4b62b40ed299 drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs


