Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C161D10F5A
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 14:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E7710E63D;
	Wed, 26 Nov 2025 14:31:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F2110E63D;
 Wed, 26 Nov 2025 14:31:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM=5FRAS_using?=
 =?utf-8?q?_generic_netlink_for_RAS_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 14:31:53 -0000
Message-ID: <176416751392.30433.2156140139303661921@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126143652.2843242-6-riana.tauro@intel.com>
In-Reply-To: <20251126143652.2843242-6-riana.tauro@intel.com>
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

Series: Introduce DRM_RAS using generic netlink for RAS (rev2)
URL   : https://patchwork.freedesktop.org/series/155188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a8420b34170a39ae254d2f33aa3e070924d3d551
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Nov 26 20:06:47 2025 +0530

    drm/xe/xe_hw_error: Add support for PVC SOC errors
    
    Report the SOC nonfatal/fatal hardware error and update the counters.
    
    Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 13bec21f5f4cdabdf06725e5a8dee0b9b56ff671 drm-intel
b7afc1e1111f drm/ras: Introduce the DRM RAS infrastructure over generic netlink
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:792: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#792: FILE: drivers/gpu/drm/drm_ras_nl.c:13:
+static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {

-:797: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#797: FILE: drivers/gpu/drm/drm_ras_nl.c:18:
+static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 3 warnings, 0 checks, 896 lines checked
a56d90f0215a drm/xe/xe_drm_ras: Add support for drm ras
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 388 lines checked
cd80f8058d8e drm/xe/xe_hw_error: Add support for GT hardware errors
-:73: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#73: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						 ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:73: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#73: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						 ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:284: CHECK:LINE_SPACING: Please don't use multiple blank lines
#284: FILE: drivers/gpu/drm/xe/xe_hw_error.c:261:
+
+

total: 0 errors, 0 warnings, 3 checks, 261 lines checked
a8420b34170a drm/xe/xe_hw_error: Add support for PVC SOC errors
-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#33: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:70:
+#define SOC_GLOBAL_ERR_STAT_REG(base, x)	XE_REG(_PICK_EVEN((x), \
+								  (base) + SOC_GCOERRSTS, \
+								  (base) + SOC_GNFERRSTS))

-:41: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'slave_base' may be better as '(slave_base)' to avoid precedence issues
#41: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:78:
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)	XE_REG(_PICK_EVEN((x), \
+								  (base) + SOC_GSYSEVTCTL, \
+								  slave_base + SOC_GSYSEVTCTL))

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#47: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, x)		XE_REG(x == HARDWARE_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)

-:47: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#47: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, x)		XE_REG(x == HARDWARE_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)

total: 0 errors, 0 warnings, 4 checks, 280 lines checked


