Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5358D2E008
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 01:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC510E341;
	Wed, 23 Oct 2024 01:54:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF5610E341;
 Wed, 23 Oct 2024 01:54:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gsc=3A_test_new_GS?=
 =?utf-8?q?C_1040=2E0=2E0=2E1263_for_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 01:54:51 -0000
Message-ID: <172964849104.1322011.7720758654562302759@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023014928.4183051-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241023014928.4183051-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: test new GSC 1040.0.0.1263 for LNL
URL   : https://patchwork.freedesktop.org/series/140342/
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
commit f9225d8e4a6853bfbd2287dda542d29ba2c964ba
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Oct 22 18:49:28 2024 -0700

    drm/xe/gsc: test new GSC 1040.0.0.1263 for LNL
    
    This patch is for testing only. If the testing is ok, the current
    lnl_gsc_1.bin binary will be replaced with this one.
    
    Note that the GSC FW macros use the compatibility version, so we can't
    use them to produce the path of a binary based on the release version.
    Since this is a ci-only patch to test a specific FW release, instead
    of updating the macros we can just hardcode the path.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 drm-intel
f9225d8e4a68 drm/xe/gsc: test new GSC 1040.0.0.1263 for LNL
-:26: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:135:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(LUNARLAKE,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.0.1263.bin")) \
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw_def' - possible side-effects?
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:135:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
+	fw_def(LUNARLAKE,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.0.1263.bin")) \
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:27: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#27: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:136:
+	fw_def(LUNARLAKE,	path_ver(xe,	gsc,	lnl,	104, 1, 0, "xe/lnl_gsc_104.0.0.1263.bin")) \

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'a' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'b' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:35: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+#define fw_filename_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	path_

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'dir_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:165:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'uc_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:165:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

-:44: WARNING:MACRO_ARG_UNUSED: Argument 'shortname_' is not used in function-like macro
#44: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:165:
+#define uc_fw_entry_gsc_path(dir_, uc_, shortname_, a, b, c, path_)		\
+	{ path_, a, b, c }

total: 1 errors, 10 warnings, 1 checks, 42 lines checked


