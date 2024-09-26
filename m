Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4535CDE00F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 15:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E66610EB79;
	Thu, 26 Sep 2024 15:01:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858F410EB92;
 Thu, 26 Sep 2024 15:01:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Display_Global_Histogram_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 15:01:11 -0000
Message-ID: <172736287154.1107857.10727764954353831305@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
In-Reply-To: <20240925150754.1876893-1-arun.r.murthy@intel.com>
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

Series: Display Global Histogram (rev2)
URL   : https://patchwork.freedesktop.org/series/138867/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eef32fdbf97bb5a662547ece2b0ff7aee4b0fe80
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Sep 25 20:37:54 2024 +0530

    drm/i915/histogram: Histogram changes for Display 20+
    
    In Display 20+, new registers are added for setting index, reading
    histogram and writing the IET.
    
    v2: Removed duplicate code (Jani)
    v3: Moved histogram core changes to earlier patches (Jani/Suraj)
    v4: Rebased after addressing comments on patch 1
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch ec87b409d3a9358c9a079186d528fad3f7d64334 drm-intel
a1c93bf7f9f4 drm/i915/histogram: Define registers for histogram
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

-:16: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_histogram_reg.h', please use '/*' instead
#16: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:1:
+// SPDX-License-Identifier: MIT

-:16: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#16: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:1:
+// SPDX-License-Identifier: MIT

-:35: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:20:
+#define DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)

-:42: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:27:
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)

-:43: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:28:
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)

-:49: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:34:
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)

-:53: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:38:
+#define DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)

-:55: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:40:
+#define DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)

total: 0 errors, 9 warnings, 0 checks, 54 lines checked
0d9157a51485 drm/i915/histogram: Add support for histogram
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

-:228: WARNING:BRACES: braces {} are not necessary for single statement blocks
#228: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:178:
+	if (!histogram) {
+		return -ENOMEM;
+	}

-:244: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_histogram.h', please use '/*' instead
#244: FILE: drivers/gpu/drm/i915/display/intel_histogram.h:1:
+// SPDX-License-Identifier: MIT

-:244: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#244: FILE: drivers/gpu/drm/i915/display/intel_histogram.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 4 warnings, 0 checks, 237 lines checked
f4b85fd46a5a drm/xe: Add histogram support to Xe builds
8e849547cd22 drm/i915/histogram: histogram interrupt handling
-:6: WARNING:TYPO_SPELLING: 'trigerred' may be misspelled - perhaps 'triggered'?
#6: 
Upon enabling histogram an interrupt is trigerred after the generation
                                        ^^^^^^^^^

-:109: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#109: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:75:
+	char *histogram_event[] = {"HISTOGRAM=1", NULL};

total: 0 errors, 2 warnings, 0 checks, 184 lines checked
fd4d62e4c563 drm/i915/histogram: Add crtc properties for global histogram
-:324: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#324: FILE: drivers/gpu/drm/i915/display/intel_display.c:7561:
+						    (u32 *)new_crtc_state->histogram.global_iet->data);

-:368: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#368: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:86:
+		drm_property_replace_global_blob(display->drm,
+				&intel_crtc->config->histogram.histogram,

total: 0 errors, 1 warnings, 1 checks, 320 lines checked
c4850813c833 drm/i915/histogram: histogram delay counter doesnt reset
-:4: WARNING:TYPO_SPELLING: 'doesnt' may be misspelled - perhaps 'doesn't'?
#4: 
Subject: [PATCH] drm/i915/histogram: histogram delay counter doesnt reset
                                                             ^^^^^^

-:35: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:104:
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */

-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:106:
+		intel_de_write(display, DPST_CTL(intel_crtc->pipe), intel_de_read(display,
+			       DPST_CTL(intel_crtc->pipe)) | DPST_CTL_RESTORE);

-:48: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:248:
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */

-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:250:
+		intel_de_write(display, DPST_CTL(intel_crtc->pipe), intel_de_read(display,
+			       DPST_CTL(intel_crtc->pipe)) | DPST_CTL_RESTORE);

total: 0 errors, 3 warnings, 2 checks, 42 lines checked
eef32fdbf97b drm/i915/histogram: Histogram changes for Display 20+
-:35: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#35: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:44:
+static void write_iet(struct intel_display *display, enum pipe pipe,
+			      u32 *data)

-:82: ERROR:CODE_INDENT: code indent should use tabs where possible
#82: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:93:
+^I^I^I^I^I^I^I        DPST_HIST_BIN_DATA_MASK :$

-:83: ERROR:CODE_INDENT: code indent should use tabs where possible
#83: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:94:
+^I^I^I^I^I^I^I        DPST_BIN_DATA_MASK);$

-:195: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:52:
+#define DPST_HIST_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)

-:197: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:54:
+#define DPST_HIST_BIN_INDEX(val)			REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)

-:201: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#201: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:58:
+#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)

-:207: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#207: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:64:
+#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_IE_BIN_A, _DPST_IE_BIN_B)

-:213: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#213: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:70:
+#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)

total: 2 errors, 5 warnings, 1 checks, 189 lines checked


