Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DA7CF3942
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 13:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7B10E702;
	Thu, 19 Sep 2024 13:48:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155AE10E702;
 Thu, 19 Sep 2024 13:48:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Display_Global_Histogram?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 13:48:45 -0000
Message-ID: <172675372508.1046938.13438635232696705137@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
In-Reply-To: <20240919133140.1372663-1-arun.r.murthy@intel.com>
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

Series: Display Global Histogram
URL   : https://patchwork.freedesktop.org/series/138867/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5532ead69e0cbe791a52b471de410fbb749385a
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Sep 19 19:01:40 2024 +0530

    drm/i915/histogram: Histogram changes for Display 20+
    
    In Display 20+, new registers are added for setting index, reading
    histogram and writing the IET.
    
    v2: Removed duplicate code (Jani)
    v3: Moved histogram core changes to earlier patches (Jani/Suraj)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 348a931b4f156bca86f01cc6235f990fd009c4a2 drm-intel
f56c1ca6b89d drm/i915/histogram: Add support for histogram
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:239: WARNING:BRACES: braces {} are not necessary for single statement blocks
#239: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:191:
+	if (!histogram) {
+		return -ENOMEM;
+	}

-:255: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_histogram.h', please use '/*' instead
#255: FILE: drivers/gpu/drm/i915/display/intel_histogram.h:1:
+// SPDX-License-Identifier: MIT

-:255: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#255: FILE: drivers/gpu/drm/i915/display/intel_histogram.h:1:
+// SPDX-License-Identifier: MIT

-:296: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_histogram_reg.h', please use '/*' instead
#296: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:1:
+// SPDX-License-Identifier: MIT

-:296: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#296: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:1:
+// SPDX-License-Identifier: MIT

-:315: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#315: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:20:
+#define DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)

-:322: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#322: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:27:
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)

-:323: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#323: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:28:
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)

-:329: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#329: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:34:
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)

-:333: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#333: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:38:
+#define DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)

-:335: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#335: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:40:
+#define DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)

total: 0 errors, 12 warnings, 0 checks, 304 lines checked
710516d2aa50 drm/xe: Add histogram support to Xe builds
e2408a0f88c3 drm/i915/histogram: histogram interrupt handling
-:6: WARNING:TYPO_SPELLING: 'trigerred' may be misspelled - perhaps 'triggered'?
#6: 
Upon enabling histogram an interrupt is trigerred after the generation
                                        ^^^^^^^^^

-:108: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#108: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:75:
+	char *histogram_event[] = {"HISTOGRAM=1", NULL};

total: 0 errors, 2 warnings, 0 checks, 184 lines checked
285390ef64b3 drm/i915/histogram: Add crtc properties for global histogram
-:323: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#323: FILE: drivers/gpu/drm/i915/display/intel_display.c:7572:
+						    (u32 *)new_crtc_state->histogram.global_iet->data);

-:367: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#367: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:86:
+		drm_property_replace_global_blob(display->drm,
+				&intel_crtc->config->histogram.histogram,

total: 0 errors, 1 warnings, 1 checks, 320 lines checked
8a8f2456015d drm/i915/histogram: histogram delay counter doesnt reset
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
#48: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:261:
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */

-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:263:
+		intel_de_write(display, DPST_CTL(intel_crtc->pipe), intel_de_read(display,
+			       DPST_CTL(intel_crtc->pipe)) | DPST_CTL_RESTORE);

total: 0 errors, 3 warnings, 2 checks, 42 lines checked
a5532ead69e0 drm/i915/histogram: Histogram changes for Display 20+
-:22: WARNING:INLINE: plain inline is preferred over __inline__
#22: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:32:
+static __inline__ void set_bin_index_0(struct intel_display *display, enum pipe pipe)

-:33: WARNING:INLINE: plain inline is preferred over __inline__
#33: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:43:
+static __inline__ void write_iet(struct intel_display *display, enum pipe pipe,

-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:44:
+static __inline__ void write_iet(struct intel_display *display, enum pipe pipe,
+			      u32 *data)

-:56: WARNING:INLINE: plain inline is preferred over __inline__
#56: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:66:
+static __inline__ void set_histogram_index_0(struct intel_display *display, enum pipe pipe)

-:194: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:52:
+#define DPST_HIST_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)

-:196: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#196: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:54:
+#define DPST_HIST_BIN_INDEX(val)			REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)

-:200: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:58:
+#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)

-:206: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#206: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:64:
+#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_IE_BIN_A, _DPST_IE_BIN_B)

-:212: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#212: FILE: drivers/gpu/drm/i915/display/intel_histogram_reg.h:70:
+#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)

total: 0 errors, 8 warnings, 1 checks, 189 lines checked


