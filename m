Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CF7C00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 08:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71B10E301;
	Tue, 24 Oct 2023 08:55:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2631410E301;
 Tue, 24 Oct 2023 08:55:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 24424A0BA8;
 Tue, 24 Oct 2023 08:55:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Date: Tue, 24 Oct 2023 08:55:46 -0000
Message-ID: <169813774614.18362.13877783677708445593@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/125373/
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
commit 6ae6cf1c2f34190cc1ce2b1b59a9d3d1441d6283
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Oct 20 10:25:33 2023 +0530

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
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
87642805d drm/xe: Handle errors from various components.
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
-:79: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#79: FILE: drivers/gpu/drm/xe/regs/xe_regs.h:61:
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)

-:93: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#93: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 418 lines checked
2580170b2 drm/xe: Add new helpers to log hardware errrors.
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_gt' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/xe_gt_printk.h:46:
+#define xe_gt_log_hw_err(_gt, _fmt, ...) \
+	drm_err_ratelimited(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, \
+			    (_gt)->info.id, ##__VA_ARGS__)

-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_gt' - possible side-effects?
#29: FILE: drivers/gpu/drm/xe/xe_gt_printk.h:50:
+#define xe_gt_log_hw_warn(_gt, _fmt, ...) \
+	drm_warn(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, (_gt)->info.id, ##__VA_ARGS__)

total: 0 errors, 0 warnings, 2 checks, 11 lines checked
57c843121 drm/xe: Log and count the GT hardware errors.
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 225 lines checked
4c184c7e2 drm/xe: Support GT hardware error reporting for PVC.
-:54: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#54: FILE: drivers/gpu/drm/xe/regs/xe_gt_error_regs.h:26:
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))

-:54: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#54: FILE: drivers/gpu/drm/xe/regs/xe_gt_error_regs.h:26:
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))

total: 0 errors, 0 warnings, 2 checks, 241 lines checked
b1d82360e drm/xe: Support GSC hardware error reporting for PVC.
-:30: CHECK:LINE_SPACING: Please don't use multiple blank lines
#30: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:8:
 
+

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#33: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:11:
+#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
+								(base) + _GSC_HEC_CORR_ERR_STATUS, \
+								(base) + _GSC_HEC_UNCOR_ERR_STATUS))

total: 0 errors, 0 warnings, 2 checks, 177 lines checked
07c6a8f3a drm/xe: Rename XE_RESET_FAILED_UEVENT to XE_RESET_REQUIRED_UEVENT.
2785087c3 drm/xe: Notify userspace about GSC HW errors.
290b26ad1 drm/xe: Support SOC FATAL error handling for PVC.
-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#42: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:17:
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#47: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:22:
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))

-:54: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'slave_base' may be better as '(slave_base)' to avoid precedence issues
#54: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:29:
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GSYSEVTCTL, \
+								slave_base + _SOC_GSYSEVTCTL))

-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#60: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:35:
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#63: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:38:
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)

total: 0 errors, 0 warnings, 5 checks, 333 lines checked
23ce4af30 drm/xe: Support SOC NONFATAL error handling for PVC.
14fdf8911 drm/xe: Handle MDFI error severity.
69368ee8b drm/xe: Clear SOC CORRECTABLE error registers.
6ae6cf1c2 drm/xe: Clear all SoC errors post warm reset.


