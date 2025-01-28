Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD542C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 18:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937310E125;
	Tue, 28 Jan 2025 18:16:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE5D10E125;
 Tue, 28 Jan 2025 18:16:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Display_Global_Histogram_?=
 =?utf-8?q?=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 18:16:57 -0000
Message-ID: <173808821789.2037814.11045337967671229400@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
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

Series: Display Global Histogram (rev9)
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
commit 11c787d7b474a8eacd12a7ba52c78590fa77dae5
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Jan 28 21:21:20 2025 +0530

    drm/i915/histogram: Enable pipe dithering
    
    Enable pipe dithering while enabling histogram to overcome some
    atrifacts seen on the screen.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 20759526c04a7f776f477bee66300dae33b51872 drm-intel
1e96d9ae129d drm: Define histogram structures exposed to user
c32855fe2924 drm: Define ImageEnhancemenT LUT structures exposed to user
620dabc74854 drm/crtc: Expose API to create drm crtc property for histogram
50570e8b7e7f drm/crtc: Expose API to create drm crtc property for IET LUT
a5a167aa1958 drm/i915/histogram: Define registers for histogram
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

-:20: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_histogram_regs.h', please use '/*' instead
#20: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:1:
+// SPDX-License-Identifier: MIT

-:20: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#20: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:1:
+// SPDX-License-Identifier: MIT

-:39: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:20:
+#define  DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)

-:46: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:27:
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)

-:47: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:28:
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)

-:53: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:34:
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)

-:57: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:38:
+#define  DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)

-:59: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:40:
+#define  DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)

total: 0 errors, 9 warnings, 0 checks, 48 lines checked
787b52847d5c drm/i915/histogram: Add support for histogram
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

-:214: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_histogram.h', please use '/*' instead
#214: FILE: drivers/gpu/drm/i915/display/intel_histogram.h:1:
+// SPDX-License-Identifier: MIT

-:214: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#214: FILE: drivers/gpu/drm/i915/display/intel_histogram.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 220 lines checked
a2678647014e drm/xe: Add histogram support to Xe builds
f772b6cae6ba drm/i915/histogram: histogram interrupt handling
-:6: WARNING:TYPO_SPELLING: 'trigerred' may be misspelled - perhaps 'triggered'?
#6: 
Upon enabling histogram an interrupt is trigerred after the generation
                                        ^^^^^^^^^

-:70: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#70: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:33:
+		if (!(dpstbin & DPST_BIN_BUSY)) {
[...]
+		} else
[...]

-:72: CHECK:BRACES: Unbalanced braces around else statement
#72: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:35:
+		} else

-:85: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#85: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:48:
+	char *histogram_event[] = { event, pipe_id, NULL };

-:107: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*hist)...) over kzalloc(sizeof(struct drm_histogram)...)
#107: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:70:
+			hist = kzalloc(sizeof(struct drm_histogram), GFP_KERNEL);

-:113: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#113: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:76:
+			/* TODO: fill the drm_histogram_config data back this drm_histogram struct */

-:115: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#115: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:78:
+			drm_property_replace_global_blob(display->drm,
+				&intel_crtc->base.state->histogram_data,

total: 0 errors, 4 warnings, 3 checks, 197 lines checked
ec9533731c23 drm/i915/histogram: Hook i915 histogram with drm histogram
6e73b10d47d1 drm/i915/iet: Add support to writing the IET LUT data
-:46: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 8)
#46: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:246:
+	if (!data) {
+	drm_err(display->drm, "enhancement LUT data is NULL");

-:62: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#62: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:262:
+	data = kzalloc(sizeof(data) * iet->nr_elements, GFP_KERNEL);

-:104: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#104: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:314:
+	iet_format = kzalloc(sizeof(u32)*iet_caps->nr_iet_sample_formats,
 	                                ^

-:104: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#104: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:314:
+	iet_format = kzalloc(sizeof(u32)*iet_caps->nr_iet_sample_formats,
+			     GFP_KERNEL);

total: 0 errors, 3 warnings, 1 checks, 117 lines checked
502c50b09d12 drm/i915/crtc: Hook i915 IET LUT with the drm IET properties
4600d99f4c78 drm/i915/histogram: histogram delay counter doesnt reset
-:4: WARNING:TYPO_SPELLING: 'doesnt' may be misspelled - perhaps 'doesn't'?
#4: 
Subject: [PATCH] drm/i915/histogram: histogram delay counter doesnt reset
                                                             ^^^^^^

-:43: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:103:
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */

-:62: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:20:
+#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY(val)	REG_FIELD_PREP(DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT, val)

total: 0 errors, 3 warnings, 0 checks, 34 lines checked
6d9d1e13e60e drm/i915/histogram: Histogram changes for Display 20+
-:39: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/i915/display/intel_histogram.c:37:
+static void write_iet(struct intel_display *display, enum pipe pipe,
+			      u32 *data)

-:198: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#198: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:53:
+#define DPST_HIST_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)

-:200: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:55:
+#define  DPST_HIST_BIN_INDEX(val)			REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)

-:204: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#204: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:59:
+#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)

-:210: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#210: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:65:
+#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_IE_BIN_A, _DPST_IE_BIN_B)

-:216: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#216: FILE: drivers/gpu/drm/i915/display/intel_histogram_regs.h:71:
+#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)

total: 0 errors, 5 warnings, 1 checks, 186 lines checked
11c787d7b474 drm/i915/histogram: Enable pipe dithering


