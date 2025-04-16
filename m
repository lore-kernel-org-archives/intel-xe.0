Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD813C369C2
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 23:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7156510E9E9;
	Wed, 16 Apr 2025 23:37:57 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC9B10E9E9;
 Wed, 16 Apr 2025 23:37:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gsc=3A_test_new_GS?=
 =?utf-8?q?C_104=2E0=2E5=2E1429_for_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Apr 2025 23:37:56 -0000
Message-ID: <174484667630.12026.4597002062940569388@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: test new GSC 104.0.5.1429 for LNL
URL   : https://patchwork.freedesktop.org/series/147859/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0409b11c820ba1681a18146cc1aefaae0ad00511
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Apr 16 16:32:02 2025 -0700

    drm/xe/gsc: test new GSC 104.0.5.1429 for LNL
    
    This patch is for testing only. If the testing is ok, the current
    lnl_gsc_1.bin binary will be replaced with this one.
    
    Note that the GSC FW macros use the compatibility version, so we can't
    use them to produce the path of a binary based on the release version.
    Since this is a ci-only patch to test a specific FW release, instead
    of updating the macros we can just hardcode the path.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 969558ec21f119ddcd88d159e669dc1d5d2feea4 drm-intel
0409b11c820b drm/xe/gsc: test new GSC 104.0.5.1429 for LNL
-:26: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.5.1429.bin")) \
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw_def' - possible side-effects?
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.5.1429.bin")) \
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:27: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#27: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:143:
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.5.1429.bin")) \

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'a' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'b' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:172:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:172:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:172:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

total: 1 errors, 10 warnings, 1 checks, 42 lines checked


