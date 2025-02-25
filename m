Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2EFC021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 02:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C80210E55A;
	Tue, 25 Feb 2025 02:45:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975DE10E54C;
 Tue, 25 Feb 2025 02:45:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uc=3A_Add_support_?=
 =?utf-8?q?for_different_firmware_files_on_each_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 02:45:49 -0000
Message-ID: <174045154961.1811542.14850837151087071790@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224222124.59345-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250224222124.59345-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/uc: Add support for different firmware files on each GT
URL   : https://patchwork.freedesktop.org/series/145355/
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
commit 2f6e0df531e50b458f2c128c277330cdb044597b
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon Feb 24 14:21:24 2025 -0800

    drm/xe/uc: Add support for different firmware files on each GT
    
    The different GTs on a device can be very different. So add support
    for being able to load a different GuC firmware image that is tailored
    to the specific GT type.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 9f112b86fd27ff7de2ce09718596cfefd71ee41f drm-intel
2f6e0df531e5 drm/xe/uc: Add support for different firmware files on each GT
-:76: WARNING:MACRO_ARG_UNUSED: Argument 'b' is not used in function-like macro
#76: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:145:
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))

-:76: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#76: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:145:
+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))

-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#92: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#92: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#92: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#92: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:152:
+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, true, t }

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:155:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:155:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:155:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:155:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
+	  a, b, c, false, t }

total: 0 errors, 2 warnings, 8 checks, 114 lines checked


