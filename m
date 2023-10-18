Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E6BCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 03:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4675710E365;
	Wed, 18 Oct 2023 03:58:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D30D10E365;
 Wed, 18 Oct 2023 03:57:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5E502AADEF;
 Wed, 18 Oct 2023 03:57:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 18 Oct 2023 03:57:58 -0000
Message-ID: <169760147838.15108.4585990644005097099@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Su?=
 =?utf-8?q?pporting_RAS_on_XE?=
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

Series: Supporting RAS on XE
URL   : https://patchwork.freedesktop.org/series/125266/
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
commit f50b67b7678490a906feefd1518d4ed0e9962c01
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Oct 18 09:30:33 2023 +0530

    drm/xe: Clear all SoC errors post warm reset.
    
    There are scenarios where there are errors being reported from the SoC
    uncore to IEH and not propagated to SG unit. Since these errors are not
    propagated to SG unit, driver won't be able to clean them as part of
    xe_process_hw_error. Hence clear all SoC register post xe_process_hw_error
    during the driver load.
    
    v2
    - Fix commit message.
    
    v3
    - Limit check to PVC.
    
    v4
    - Fix check
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 4d039d7be23937e2b498ed783aa5b0d8801b377b drm-intel
67c2c6c4b drm/xe: Handle errors from various components.
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
-:73: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#73: FILE: drivers/gpu/drm/xe/regs/xe_regs.h:61:
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)

-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 424 lines checked
36739d202 drm/xe: Log and count the GT hardware errors.
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 230 lines checked
ea7b166aa drm/xe: Support GT hardware error reporting for PVC.
-:49: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#49: FILE: drivers/gpu/drm/xe/regs/xe_gt_error_regs.h:26:
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))

-:49: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#49: FILE: drivers/gpu/drm/xe/regs/xe_gt_error_regs.h:26:
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))

total: 0 errors, 0 warnings, 2 checks, 245 lines checked
762168a05 drm/xe: Support GSC hardware error reporting for PVC.
-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#27: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:12:
+#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
+								(base) + _GSC_HEC_CORR_ERR_STATUS, \
+								(base) + _GSC_HEC_UNCOR_ERR_STATUS))

total: 0 errors, 0 warnings, 1 checks, 179 lines checked
1e23a4f22 drm/xe: Notify userspace about GSC HW errors.
b5f378886 drm/xe: Support SOC FATAL error handling for PVC.
-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#38: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:18:
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:23:
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))

-:49: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'slave_base' may be better as '(slave_base)' to avoid precedence issues
#49: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:29:
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GSYSEVTCTL, \
+								slave_base + _SOC_GSYSEVTCTL))

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#55: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:35:
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#58: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:38:
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)

total: 0 errors, 0 warnings, 5 checks, 348 lines checked
ad8becb0c drm/xe: Support SOC NONFATAL error handling for PVC.
7778561fb drm/xe: Handle MDFI error severity.
dd8487950 drm/xe: Clear SOC CORRECTABLE error registers.
f50b67b76 drm/xe: Clear all SoC errors post warm reset.


