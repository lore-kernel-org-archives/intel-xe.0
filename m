Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31ACCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 22:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09410E260;
	Wed, 11 Oct 2023 22:27:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5E2A10E260;
 Wed, 11 Oct 2023 22:27:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B3F7BAADF1;
 Wed, 11 Oct 2023 22:27:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Wed, 11 Oct 2023 22:27:37 -0000
Message-ID: <169706325773.26515.532486614011886377@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011163506.1747972-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231011163506.1747972-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_mocs_kunit_=28rev2=29?=
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

Series: drm/xe: Add mocs kunit (rev2)
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
commit 5ee5494f34094cbc93ba00a799cf4dea30b48d76
Author: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Date:   Wed Oct 11 22:05:06 2023 +0530

    drm/xe: add mocs kunit
    
    This kunit verifies the hardware values of the mocs and l3cc
        registers with the KMD programmed values.
    
        Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
        Cc: Mathew D Roper <matthew.d.roper@intel.com>
        Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
+ /mt/dim checkpatch fe4d6ceb20b5ebad356c722396c2c06d4485c359 drm-intel
5ee5494f3 drm/xe: add mocs kunit
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
-:9: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#9: 
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

-:10: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#10: 
    Cc: Mathew D Roper <matthew.d.roper@intel.com>

-:11: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#11: 
    Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>

-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:104: WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#104: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:74:
+			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val: \n",

-:105: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#105: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:75:
+			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val: \n",
+				LNCFCMOCS(i).addr);

-:112: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#112: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:82:
+}
+static void read_mocs_table(struct xe_gt *gt, const struct xe_mocs_info *info,

-:144: WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#144: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:114:
+			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val: \n",

-:145: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#145: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:115:
+			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val: \n",
+				reg.addr);

-:151: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#151: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:121:
+}
+static int mocs_kernel_test_run_device(struct xe_device *xe)

-:169: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#169: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:139:
+}
+void xe_live_mocs_kernel_kunit(struct kunit *test)

-:234: WARNING:MISSING_EOF_NEWLINE: adding a line without newline at end of file
#234: FILE: drivers/gpu/drm/xe/xe_mocs.c:585:
+#endif

total: 0 errors, 7 warnings, 5 checks, 194 lines checked


