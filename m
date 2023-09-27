Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C95E810D5
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC25510E4E4;
	Wed, 27 Sep 2023 11:43:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CD2D10E4E4;
 Wed, 27 Sep 2023 11:43:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D458AADDD;
 Wed, 27 Sep 2023 11:43:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 27 Sep 2023 11:43:32 -0000
Message-ID: <169581501264.20756.6745146059509883800@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Su?=
 =?utf-8?q?pporting_CSC_and_SOC_HARDWARE_ERROR_HANDLING_on_PVC?=
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

Series: Supporting CSC and SOC HARDWARE ERROR HANDLING on PVC
URL   : https://patchwork.freedesktop.org/series/124331/
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
commit 0709f8f34847542c9b558217fce47f40b36238c4
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Sep 27 17:16:27 2023 +0530

    drm/xe: Clear all SoC errors post warm reset.
    
    There are scenarios where there are no fatal errors reported
    but Non-fatal/correctable errors being reported from the SoC
    uncore to IEH and not propogated to SG unit. Clear all previous
    SoC errors post warm reset.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
edab64e93 drm/xe: Handle errors from various components.
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
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 351 lines checked
5531034ec drm/xe: Log and count the GT hardware errors.
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 204 lines checked
7fdc8cb45 drm/xe: Support GT hardware error reporting for PVC.
-:42: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#42: FILE: drivers/gpu/drm/xe/regs/xe_gt_error_regs.h:26:
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#42: FILE: drivers/gpu/drm/xe/regs/xe_gt_error_regs.h:26:
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))

total: 0 errors, 0 warnings, 2 checks, 216 lines checked
2be90df70 drm/xe: Process fatal hardware errors.
-:30: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#30: FILE: drivers/gpu/drm/xe/regs/xe_regs.h:97:
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)

total: 0 errors, 0 warnings, 1 checks, 69 lines checked
2557d92dc drm/xe: Support GSC hardware error reporting for PVC.
-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#24: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:20:
+#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
+								(base) + _GSC_HEC_CORR_ERR_STATUS, \
+								(base) + _GSC_HEC_UNCOR_ERR_STATUS))

total: 0 errors, 0 warnings, 1 checks, 149 lines checked
ab84692ac drm/xe: Notify userspace about GSC HW errors.
6c0ed0898 drm/xe: Support SOC FATAL error handling for PVC.
-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#24: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:28:
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#28: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:32:
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)

-:33: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'slave_base' may be better as '(slave_base)' to avoid precedence issues
#33: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:37:
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GSYSEVTCTL, \
+								slave_base + _SOC_GSYSEVTCTL))

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#39: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:43:
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:47:
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))

total: 0 errors, 0 warnings, 5 checks, 290 lines checked
fc4c1730f drm/xe: Support SOC NONFATAL error handling for PVC.
155799e73 drm/xe: Handle MDFI error severity.
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
5c92b3139 drm/xe: Clear SOC CORRECTABLE error registers.
0709f8f34 drm/xe: Clear all SoC errors post warm reset.


