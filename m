Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800A2C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 20:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203410E36E;
	Mon, 30 Oct 2023 20:35:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CFA510E36E;
 Mon, 30 Oct 2023 20:35:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29763AADED;
 Mon, 30 Oct 2023 20:35:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Mon, 30 Oct 2023 20:35:57 -0000
Message-ID: <169869815716.25482.17981503433179014866@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231030184030.1936233-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231030184030.1936233-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_mocs_kunit_=28rev7=29?=
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

Series: drm/xe: Add mocs kunit (rev7)
URL   : https://patchwork.freedesktop.org/series/124926/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8f33ce3f58a42c814bc3f6001d8f705abf4a22de
Author: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Date:   Tue Oct 31 00:10:30 2023 +0530

    drm/xe: Add mocs kunit
    
    This kunit verifies the hardware values of mocs and
    l3cc registers with the KMD programmed values.
    
    v7: correct checkpath
    v6: Change ssize_t type.
        Change forcewake domain to XE_FW_GT.
        Update change of MOCS registers are multicast on Xe_HP and beyond
        patch.
    
    v5: Release forcewake.
        Remove single statement braces.
        Fix debug statements.
    
    v4: Drop stratch and vaddr.
        Fix debug statements.
        Fix indentation.
    
    v3: Fix checkpath.
    
    v2: Fix checkpath.
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Mathew D Roper <matthew.d.roper@intel.com>
    Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
+ /mt/dim checkpatch 1e652bcf7cc139244f4f8c0cd1fc184029240050 drm-intel
8f33ce3f5 drm/xe: Add mocs kunit
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:120: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#120: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:72:
+			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i, reg_mcr.__reg.addr,
+			 reg_val, l3cc);

-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:75:
+				KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
+					reg_mcr.__reg.addr);

-:129: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#129: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:81:
+			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i, reg.addr,
+			 reg_val, l3cc);

-:132: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#132: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:84:
+				KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
+				   reg.addr);

-:135: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#135: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:87:
+
+	}

-:142: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#142: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:94:
+static void read_mocs_table(struct xe_gt *gt,
+			      const struct xe_mocs_info *info)

-:164: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#164: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:116:
+	     i++) {
+

-:170: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#170: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:122:
+			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			 reg_mcr.__reg.addr, reg_val, mocs);

-:173: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#173: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:125:
+				KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
+					reg_mcr.__reg.addr);

-:179: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#179: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:131:
+			mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			 reg.addr, reg_val, mocs);

-:182: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#182: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:134:
+				KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
+				   reg.addr);

total: 0 errors, 1 warnings, 11 checks, 216 lines checked


