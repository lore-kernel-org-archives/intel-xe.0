Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AB4C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 18:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3D510E766;
	Thu, 13 Jul 2023 18:37:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02B2810E763;
 Thu, 13 Jul 2023 18:37:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F390AA7DFF;
 Thu, 13 Jul 2023 18:37:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 13 Jul 2023 18:37:33 -0000
Message-ID: <168927345399.14982.16788365810188666535@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230713150611.7-1-francois.dugast@intel.com>
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Code_cleanup?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Code cleanup
URL   : https://patchwork.freedesktop.org/series/120684/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1e4448730d14b62a7ae2d2a4b169674cb85d44f6
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Jul 13 15:06:11 2023 +0000

    drm/xe: Fix typos
    
    Fix minor issues: remove extra ';' and s/Initialise/Initialize/.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 17d3e3fbeb4ee15f7b89cedff2d1f2662dffbf97 drm-intel
f28501b6f drm/xe: Cleanup SPACING style issues
-:21: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:97:
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last; })

-:21: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'first' may be better as '(first)' to avoid precedence issues
#21: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:97:
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last; })

-:21: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'last' may be better as '(last)' to avoid precedence issues
#21: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:97:
+#define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last; })

-:22: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#22: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:98:
+#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last; })

-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'first' may be better as '(first)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:98:
+#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last; })

-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'last' may be better as '(last)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:98:
+#define IS_GRAPHICS_STEP(xe, first, last) ({u8 __step = (xe)->info.step.graphics; first <= __step && __step <= last; })

-:83: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 13)
#83: FILE: drivers/gpu/drm/xe/xe_gt.h:15:
 	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
+	     for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \

-:143: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#143: FILE: drivers/gpu/drm/xe/xe_rtp.h:376:
+	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\

-:144: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#144: FILE: drivers/gpu/drm/xe/xe_rtp.h:377:
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })

-:158: ERROR:SPACING: space required after that ',' (ctx:VxB)
#158: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:17:
+#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__, 5, 4, 3, 2, 1,))
                                                                               ^

-:175: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#175: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:62:
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))

-:175: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#175: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:62:
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))

total: 1 errors, 6 warnings, 5 checks, 139 lines checked
4d9cfb5de drm/xe: Cleanup OPEN_BRACE style issues
cb25af6c9 drm/xe: Cleanup POINTER_LOCATION style issues
b4229b375 drm/xe: Cleanup CODE_INDENT style issues
a272a7007 drm/xe: Cleanup TRAILING_WHITESPACE style issues
ea524e5b0 drm/xe: Cleanup COMPLEX_MACRO style issues
1e4448730 drm/xe: Fix typos


