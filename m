Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35785C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 20:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396410E4E9;
	Mon,  3 Mar 2025 20:19:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED0D10E1E6;
 Mon,  3 Mar 2025 20:19:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_different_GuCs_pe?=
 =?utf-8?q?r_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 20:19:37 -0000
Message-ID: <174103317771.231783.5554678693174890691@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
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

Series: Support different GuCs per GT
URL   : https://patchwork.freedesktop.org/series/145740/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 981d09028782604f3b3e14170796171f7759cdfa
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Mar 3 11:52:15 2025 -0800

    drm/xe/ptl: Define HuC FW version for PTL
    
    First HuC release for PTL. Note that the HuC team now only releases
    GSC-enabled blobs, so we don't need the "_gsc" postfix to identify
    the variant anymore. The driver can identify the type of binary at
    runtime no matter the name.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20241011163612.6558-1-matthew.s.atwood@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c55ef90b69d314c38a69d1e4b6caf1645ed5d53f drm-intel
05c20d8b644e Revert "drm/xe/ptl: Define HuC FW version for PTL"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
df500fcf0e27 Revert "drm/xe/ptl: Add GuC firmware definition"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
82e7dd88c70c Revert "drm/xe/pvc: Add GuC firmware definition"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
5d22acebc23f drm/xe/uc: Add support for different firmware files on each GT
-:68: WARNING:MACRO_ARG_UNUSED: Argument 'b' is not used in function-like macro
#68: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))

-:68: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#68: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))

-:84: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#84: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:84: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#84: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:84: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#84: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:84: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#84: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:149:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

total: 0 errors, 2 warnings, 8 checks, 106 lines checked
8a1ca25e2e60 drm/xe/pvc: Add GuC firmware definition
978e1c453031 drm/xe/ptl: Add GuC firmware definition
981d09028782 drm/xe/ptl: Define HuC FW version for PTL


