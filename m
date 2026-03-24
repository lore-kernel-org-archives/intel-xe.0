Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94725E9A75D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 10:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261AE10E12B;
	Tue, 24 Mar 2026 10:17:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F313110E12B;
 Tue, 24 Mar 2026 10:17:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gsc=3A_test_new_GS?=
 =?utf-8?q?C_105=2E0=2E2=2E1397_for_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Mar 2026 10:17:17 -0000
Message-ID: <177434743798.389881.2205030472633754018@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260323181645.3013877-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260323181645.3013877-2-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: test new GSC 105.0.2.1397 for PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/163726/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dc148104484356212de0b53868369de123003fa6
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Mar 23 11:16:46 2026 -0700

    drm/xe/gsc: test new GSC 105.0.2.1397 for PTL
    
    This patch is for testing only. If the testing is ok, the current
    ptl_gsc_1.bin binary will be replaced with this one.
    
    Note that the GSC FW macros use the compatibility version, so we can't
    use them to produce the path of a binary based on the release version.
    Since this is a ci-only patch to test a specific FW release, instead
    of updating the macros we can just hardcode the path.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 4b7edcc15b85ee23b9928da304c47cc1cdb30e87 drm-intel
dc1481044843 drm/xe/gsc: test new GSC 105.0.2.1397 for PTL
-:26: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:147:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	ptl,	105, 1, 0, "xe/ptl_gsc_105.0.2.1397.bin"))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw_def' - possible side-effects?
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:147:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	ptl,	105, 1, 0, "xe/ptl_gsc_105.0.2.1397.bin"))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'major_ver' - possible side-effects?
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:147:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	ptl,	105, 1, 0, "xe/ptl_gsc_105.0.2.1397.bin"))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:27: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#27: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:148:
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	ptl,	105, 1, 0, "xe/ptl_gsc_105.0.2.1397.bin"))	\

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:163:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:163:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:163:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'a' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:163:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'b' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:163:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:163:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:178:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:178:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:178:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

total: 1 errors, 10 warnings, 2 checks, 42 lines checked


