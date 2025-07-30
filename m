Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F4C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5B610E365;
	Wed, 30 Jul 2025 05:57:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFD710E365;
 Wed, 30 Jul 2025 05:57:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Supporting_RAS_on_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 05:57:09 -0000
Message-ID: <175385502989.197930.9208672640506817500@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

Series: Supporting RAS on XE
URL   : https://patchwork.freedesktop.org/series/152251/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c594c627ca17d556e5fd8a5d085c093122916705
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Jul 30 11:18:14 2025 +0530

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
+ /mt/dim checkpatch 9378b693d04cb60c6d1b13150244c480a7cd2741 drm-intel
9a1d7207f375 drm/xe: Handle errors from various components.
-:91: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#91: FILE: drivers/gpu/drm/xe/regs/xe_regs.h:13:
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)

-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 418 lines checked
ce18b1e994f2 drm/xe: Add new helpers to log hardware errrors.
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_gt' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/xe_gt_printk.h:49:
+#define xe_gt_log_hw_err(_gt, _fmt, ...) \
+	drm_err_ratelimited(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, \
+			    (_gt)->info.id, ##__VA_ARGS__)

-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_gt' - possible side-effects?
#29: FILE: drivers/gpu/drm/xe/xe_gt_printk.h:53:
+#define xe_gt_log_hw_warn(_gt, _fmt, ...) \
+	drm_warn(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, (_gt)->info.id, ##__VA_ARGS__)

total: 0 errors, 0 warnings, 2 checks, 13 lines checked
3050818acb0d drm/xe: Log and count the GT hardware errors.
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 226 lines checked
2457d6639dc0 drm/xe: Support GT hardware error reporting for PVC.
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
6af1fcff5a4c drm/xe: Support GSC hardware error reporting for PVC.
-:30: CHECK:LINE_SPACING: Please don't use multiple blank lines
#30: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:8:
 
+

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#33: FILE: drivers/gpu/drm/xe/regs/xe_tile_error_regs.h:11:
+#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
+								(base) + _GSC_HEC_CORR_ERR_STATUS, \
+								(base) + _GSC_HEC_UNCOR_ERR_STATUS))

total: 0 errors, 0 warnings, 2 checks, 175 lines checked
23f0917684c9 drm/xe: Support SOC FATAL error handling for PVC.
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

-:248: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#248: FILE: drivers/gpu/drm/xe/xe_hw_error.c:574:
+		xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));

-:250: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#250: FILE: drivers/gpu/drm/xe/xe_hw_error.c:576:
+	mst_glb_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));

-:263: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#263: FILE: drivers/gpu/drm/xe/xe_hw_error.c:589:
+			lcl_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,

-:264: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#264: FILE: drivers/gpu/drm/xe/xe_hw_error.c:590:
+			lcl_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
+										      hw_err));

-:273: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#273: FILE: drivers/gpu/drm/xe/xe_hw_error.c:599:
+			xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),

-:286: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#286: FILE: drivers/gpu/drm/xe/xe_hw_error.c:612:
+		lcl_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));

-:295: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#295: FILE: drivers/gpu/drm/xe/xe_hw_error.c:621:
+		xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);

total: 0 errors, 6 warnings, 6 checks, 333 lines checked
aab28408ac84 drm/xe: Support SOC NONFATAL error handling for PVC.
1c82b61f7fe4 drm/xe: Handle MDFI error severity.
-:70: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#70: FILE: drivers/gpu/drm/xe/xe_hw_error.c:687:
+				ieh_header = xe_mmio_read32(&gt->tile->mmio, LOCAL_FIRST_IEH_HEADER_LOG_REG);

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
f4d5ad148f10 drm/xe: Clear SOC CORRECTABLE error registers.
c594c627ca17 drm/xe: Clear all SoC errors post warm reset.
-:54: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#54: FILE: drivers/gpu/drm/xe/xe_hw_error.c:534:
+				xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),

-:57: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#57: FILE: drivers/gpu/drm/xe/xe_hw_error.c:537:
+			xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),

-:59: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#59: FILE: drivers/gpu/drm/xe/xe_hw_error.c:539:
+			xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),

-:61: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#61: FILE: drivers/gpu/drm/xe/xe_hw_error.c:541:
+			xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),

-:63: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#63: FILE: drivers/gpu/drm/xe/xe_hw_error.c:543:
+			xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),

total: 0 errors, 5 warnings, 0 checks, 51 lines checked


