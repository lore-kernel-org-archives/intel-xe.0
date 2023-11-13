Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9644BC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 22:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F4410E41B;
	Mon, 13 Nov 2023 22:14:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C524810E41B;
 Mon, 13 Nov 2023 22:14:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C3D56AADDA;
 Mon, 13 Nov 2023 22:14:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Mon, 13 Nov 2023 22:14:19 -0000
Message-ID: <169991365979.24210.3284465722735537023@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231113211938.2207870-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231113211938.2207870-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_mocs_kunit_=28rev12=29?=
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

Series: drm/xe: Add mocs kunit (rev12)
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
commit 47d9d80e926139321e709a7416045bebd194c746
Author: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Date:   Tue Nov 14 02:49:38 2023 +0530

    drm/xe: Add mocs kunit
    
    This kunit verifies the hardware values of mocs and
    l3cc registers with the KMD programmed values.
    
    v11: Add KUNIT_ASSERT_EQ_MSG for Forcewake.
    
    v9/v10: Add Forcewake Fail.
    
    v8: Remove xe_bo.h and xe_pm.h
        Remove mocs and l3cc from live_mocs.
        Pull debug and err msg for mocs/l3cc out of if else block.
        Add HAS_LNCF_MOCS.
    
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
+ /mt/dim checkpatch 7dc3dda9b2df5a5c8949532f254a0689de70f093 drm-intel
47d9d80e9 drm/xe: Add mocs kunit
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
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

-:122: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#122: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:64:
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			XELP_LNCFCMOCS(i).addr, reg_val, l3cc);

-:125: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#125: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:67:
+			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
+				XELP_LNCFCMOCS(i).addr);

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:75:
+static void read_mocs_table(struct xe_gt *gt,
+			      const struct xe_mocs_info *info)

-:156: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#156: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:98:
+	     i++) {
+

-:162: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#162: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:104:
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			XELP_GLOBAL_MOCS(i).addr, reg_val, mocs);

-:165: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#165: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:107:
+			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val.\n",
+				XELP_GLOBAL_MOCS(i).addr);

total: 0 errors, 1 warnings, 6 checks, 189 lines checked


