Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08687CD68EC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 05:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD9110E165;
	Tue, 10 Oct 2023 05:21:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B733C10E165;
 Tue, 10 Oct 2023 05:21:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B5175AADD1;
 Tue, 10 Oct 2023 05:21:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Tue, 10 Oct 2023 05:21:48 -0000
Message-ID: <169691530873.28098.2318106910528693045@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231010051523.1635313-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231010051523.1635313-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_added_mocs_sefltest?=
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

Series: drm/xe: added mocs sefltest
URL   : https://patchwork.freedesktop.org/series/124872/
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
commit 44447e3c7ef364006ce5da1ad9694dd6e75d4b85
Author: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Date:   Tue Oct 10 10:45:23 2023 +0530

    drm/xe: added mocs sefltest
    
    This selftest verifies the hardware values of the mocs and l3cc registers with the KMD programmed values.
    
        Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
+ /mt/dim checkpatch 37b2d042c23ae6a10055ea92101a15083d64c718 drm-intel
44447e3c7 drm/xe: added mocs sefltest
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
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
This selftest verifies the hardware values of the mocs and l3cc registers with the KMD programmed values.

-:8: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#8: 
    Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>

-:23: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#23: 
new file mode 100644

-:59: WARNING:LINE_SPACING: Missing a blank line after declarations
#59: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:32:
+	struct kunit *test = xe_cur_kunit();
+	memset(arg, 0, sizeof(*arg));

-:100: WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#100: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:73:
+			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val: \n",

-:108: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#108: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:81:
+}
+static void read_mocs_table(struct xe_gt *gt, const struct xe_mocs_info *info,

-:140: WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#140: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:113:
+			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val: \n",

-:147: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#147: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:120:
+}
+static int mocs_kernel_test_run_device(struct xe_device *xe)

-:157: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#157: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:130:
+	for_each_gt(gt, xe, id)
+	{

-:166: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#166: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:139:
+}
+void xe_live_mocs_kernel_kunit(struct kunit *test)

-:231: WARNING:MISSING_EOF_NEWLINE: adding a line without newline at end of file
#231: FILE: drivers/gpu/drm/xe/xe_mocs.c:585:
+#endif

total: 1 errors, 7 warnings, 3 checks, 194 lines checked


