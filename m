Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5BAE7DEFC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 16:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21310E526;
	Mon,  2 Feb 2026 16:15:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD3010E529;
 Mon,  2 Feb 2026 16:15:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM=5FRAS_using?=
 =?utf-8?q?_generic_netlink_for_RAS_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 16:15:16 -0000
Message-ID: <177004891687.217225.3215056749919102439@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202064356.286243-7-riana.tauro@intel.com>
In-Reply-To: <20260202064356.286243-7-riana.tauro@intel.com>
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

Series: Introduce DRM_RAS using generic netlink for RAS (rev5)
URL   : https://patchwork.freedesktop.org/series/155188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcca046b31c2fcbb66c93b92a4dccfcfbb7ce6c2
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Feb 2 12:14:01 2026 +0530

    drm/xe/xe_hw_error: Add support for PVC SoC errors
    
    Report the SoC nonfatal/fatal hardware error and update the counters.
    
    $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":0, "error-id":2}'
    {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}
    
    Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 4af5aac5c903c12b53b9cab756c49496f595a27d drm-intel
47e5280eac8e drm/ras: Introduce the DRM RAS infrastructure over generic netlink
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:806: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#806: FILE: drivers/gpu/drm/drm_ras_nl.c:13:
+static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {

-:811: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#811: FILE: drivers/gpu/drm/drm_ras_nl.c:18:
+static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 3 warnings, 0 checks, 905 lines checked
3f3ad751454b drm/xe/xe_drm_ras: Add support for XE DRM RAS
-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'

-:73: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#73: 
new file mode 100644

-:277: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#277: FILE: drivers/gpu/drm/xe/xe_drm_ras.h:10:
+#define for_each_error_severity(i)	\
+	for (i = 0; i < DRM_XE_RAS_ERR_SEV_MAX; i++)

total: 0 errors, 2 warnings, 1 checks, 347 lines checked
eb45f7caee60 drm/xe/xe_hw_error: Integrate DRM RAS with hardware error handling
ad91cbc89f23 drm/xe/xe_hw_error: Add support for Core-Compute errors
-:66: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#66: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:40:
+									  DEV_ERR_STAT_CORRECTABLE, \

-:83: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:57:
+									  ERR_STAT_GT_COR_VECTOR_0, \

-:86: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#86: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							ERR_STAT_GT_COR_VECTOR_REG(x) : \
+							ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:86: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#86: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							ERR_STAT_GT_COR_VECTOR_REG(x) : \
+							ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:118: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#118: FILE: drivers/gpu/drm/xe/xe_hw_error.c:23:
+#define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
+	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
+	(BIT(err_bit) & PVC_FAT_ERR_MASK))

-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'err_bit' - possible side-effects?
#118: FILE: drivers/gpu/drm/xe/xe_hw_error.c:23:
+#define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
+	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
+	(BIT(err_bit) & PVC_FAT_ERR_MASK))

total: 0 errors, 2 warnings, 4 checks, 320 lines checked
fcca046b31c2 drm/xe/xe_hw_error: Add support for PVC SoC errors
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
$ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":0, "error-id":2}'

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#36: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:70:
+#define SOC_GLOBAL_ERR_STAT_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+									  (base) + SOC_GCOERRSTS, \
+									  (base) + SOC_GNFERRSTS))

-:45: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#45: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:79:
+									  (master) + SOC_GSYSEVTCTL, \

-:50: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#50: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \

-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#50: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							       (base) + SOC_LERRCORSTS : \
+							       (base) + SOC_LERRUNCSTS)

-:50: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#50: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							       (base) + SOC_LERRCORSTS : \
+							       (base) + SOC_LERRUNCSTS)

-:211: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#211: FILE: drivers/gpu/drm/xe/xe_hw_error.c:342:
+static void soc_slave_ieh_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 error_id)

-:222: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#222: FILE: drivers/gpu/drm/xe/xe_hw_error.c:353:
+		slave_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err));

-:283: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#283: FILE: drivers/gpu/drm/xe/xe_hw_error.c:414:
+		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err));

total: 0 errors, 6 warnings, 3 checks, 293 lines checked


