Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17D0E98DE1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 05:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2E710E225;
	Mon, 23 Feb 2026 05:40:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541E910E225;
 Mon, 23 Feb 2026 05:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM=5FRAS_using?=
 =?utf-8?q?_generic_netlink_for_RAS_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 05:40:11 -0000
Message-ID: <177182521132.273416.2106830345119895930@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223060541.526397-7-riana.tauro@intel.com>
In-Reply-To: <20260223060541.526397-7-riana.tauro@intel.com>
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

Series: Introduce DRM_RAS using generic netlink for RAS (rev8)
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
commit dbdf54996568bbb2f5189b2b38b43ff0e493ead9
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Feb 23 11:35:45 2026 +0530

    drm/xe/xe_hw_error: Add support for PVC SoC errors
    
    Report the SoC nonfatal/fatal hardware error and update the counters.
    
    $ sudo ynl --family drm_ras --do get-error-counter \
    --json '{"node-id":0, "error-id":2}'
    {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}
    
    Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 05fc8dd26df5c1cae18b1d5b9de791a9a332433c drm-intel
35aba7c32a4b drm/ras: Introduce the DRM RAS infrastructure over generic netlink
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:791: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#791: FILE: drivers/gpu/drm/drm_ras_nl.c:14:
+static const struct nla_policy drm_ras_get_error_counter_do_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

-:797: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#797: FILE: drivers/gpu/drm/drm_ras_nl.c:20:
+static const struct nla_policy drm_ras_get_error_counter_dump_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {

total: 0 errors, 3 warnings, 0 checks, 890 lines checked
9a7cc02d40ce drm/xe/xe_drm_ras: Add support for XE DRM RAS
-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
    $ sudo ynl --family drm_ras --dump get-error-counter --json '{"node-id":0}'

-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

-:181: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#181: FILE: drivers/gpu/drm/xe/xe_drm_ras.c:103:
+static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)

-:280: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#280: FILE: drivers/gpu/drm/xe/xe_drm_ras.h:10:
+#define for_each_error_severity(i)	\
+	for (i = 0; i < DRM_XE_RAS_ERR_SEV_MAX; i++)

total: 0 errors, 3 warnings, 1 checks, 349 lines checked
556326372930 drm/xe/xe_hw_error: Integrate DRM RAS with hardware error handling
dd89cbb3ca1d drm/xe/xe_hw_error: Add support for Core-Compute errors
-:73: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#73: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:40:
+									  DEV_ERR_STAT_CORRECTABLE, \

-:83: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:50:
+									  ERR_STAT_GT_FATAL_VECTOR_0, \

-:84: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#84: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:51:
+									  ERR_STAT_GT_FATAL_VECTOR_1))

-:90: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#90: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:57:
+									  ERR_STAT_GT_COR_VECTOR_0, \

-:93: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#93: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+							 ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:93: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#93: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+							 ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:118: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#118: FILE: drivers/gpu/drm/xe/xe_hw_error.c:23:
+#define PVC_ERROR_MASK_SET(hw_err, err_bit)	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
+						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
+						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))

-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'err_bit' - possible side-effects?
#118: FILE: drivers/gpu/drm/xe/xe_hw_error.c:23:
+#define PVC_ERROR_MASK_SET(hw_err, err_bit)	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
+						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
+						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))

-:148: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#148: FILE: drivers/gpu/drm/xe/xe_hw_error.c:54:
+#define PVC_GT_VECTOR_LEN(hw_err)	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
+					 ERR_STAT_GT_VECTOR4 : ERR_STAT_GT_VECTOR_MAX)

total: 0 errors, 4 warnings, 5 checks, 315 lines checked
dbdf54996568 drm/xe/xe_hw_error: Add support for PVC SoC errors
-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#39: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:70:
+#define SOC_GLOBAL_ERR_STAT_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+									  (base) + SOC_GCOERRSTS, \
+									  (base) + SOC_GNFERRSTS))

-:48: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#48: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:79:
+									  (master) + SOC_GSYSEVTCTL, \

-:53: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#53: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \

-:53: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#53: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							       (base) + SOC_LERRCORSTS : \
+							       (base) + SOC_LERRUNCSTS)

-:53: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#53: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+							       (base) + SOC_LERRCORSTS : \
+							       (base) + SOC_LERRUNCSTS)

-:102: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#102: FILE: drivers/gpu/drm/xe/xe_hw_error.c:88:
+};
+static_assert(ARRAY_SIZE(pvc_master_global_err_reg) == XE_RAS_REG_SIZE);

-:126: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#126: FILE: drivers/gpu/drm/xe/xe_hw_error.c:112:
+};
+static_assert(ARRAY_SIZE(pvc_slave_global_err_reg) == XE_RAS_REG_SIZE);

-:137: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#137: FILE: drivers/gpu/drm/xe/xe_hw_error.c:123:
+};
+static_assert(ARRAY_SIZE(pvc_slave_local_fatal_err_reg) == XE_RAS_REG_SIZE);

-:158: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#158: FILE: drivers/gpu/drm/xe/xe_hw_error.c:144:
+};
+static_assert(ARRAY_SIZE(pvc_master_local_fatal_err_reg) == XE_RAS_REG_SIZE);

-:171: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#171: FILE: drivers/gpu/drm/xe/xe_hw_error.c:157:
+};
+static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);

-:173: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#173: FILE: drivers/gpu/drm/xe/xe_hw_error.c:159:
+#define PVC_MASTER_LOCAL_REG_INFO(hw_err)	((hw_err == HARDWARE_ERROR_FATAL) ? \
+						 pvc_master_local_fatal_err_reg : \
+						 pvc_master_local_nonfatal_err_reg)

-:211: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#211: FILE: drivers/gpu/drm/xe/xe_hw_error.c:337:
+static void soc_slave_ieh_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 error_id)

-:281: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#281: FILE: drivers/gpu/drm/xe/xe_hw_error.c:407:
+			log_soc_error(tile, PVC_MASTER_LOCAL_REG_INFO(hw_err), severity, regbit, error_id);

total: 0 errors, 4 warnings, 9 checks, 279 lines checked


