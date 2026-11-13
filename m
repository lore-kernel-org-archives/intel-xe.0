Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7A606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 20:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC51C10E4BA;
	Fri, 13 Nov 2026 20:20:19 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDFE10E4BA;
 Fri, 13 Nov 2026 20:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gsc=3A_Test_NVL_GS?=
 =?utf-8?q?C_108=2E0=2E0=2E1242?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 20:20:18 -0000
Message-ID: <179460121850.22309.17926324197676828691@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113192311.1455041-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261113192311.1455041-2-daniele.ceraolospurio@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe/gsc: Test NVL GSC 108.0.0.1242
URL   : https://patchwork.freedesktop.org/series/178530/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 59bebdc5cbe481df3014bfc2149a3d557e6cba10
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Nov 13 19:23:12 2026 +0000

    drm/xe/gsc: Test NVL GSC 108.0.0.1242
    
    This patch is for testing only. If the testing is ok, the current
    nvl_gsc_1.bin binary will be replaced with this one.
    
    Note that the GSC FW macros use the compatibility version, so we can't
    use them to produce the path of a binary based on the release version.
    Since this is a ci-only patch to test a specific FW release, instead
    of updating the macros we can just hardcode the path.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch ddc259b91140f0c62cb589c3f9101498db73133e drm-intel
59bebdc5cbe4 drm/xe/gsc: Test NVL GSC 108.0.0.1242
-:26: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	path_ver(xe,	gsc,	nvl,	108, 1, 0, "xe/nvl_gsc_108.0.0.1242.bin"))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
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
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	path_ver(xe,	gsc,	nvl,	108, 1, 0, "xe/nvl_gsc_108.0.0.1242.bin"))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'major_ver' - possible side-effects?
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	path_ver(xe,	gsc,	nvl,	108, 1, 0, "xe/nvl_gsc_108.0.0.1242.bin"))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:27: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#27: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	path_ver(xe,	gsc,	nvl,	108, 1, 0, "xe/nvl_gsc_108.0.0.1242.bin"))	\

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:166:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:166:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:166:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'a' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:166:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'b' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:166:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:166:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:181:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:181:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:181:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

total: 1 errors, 10 warnings, 2 checks, 42 lines checked


