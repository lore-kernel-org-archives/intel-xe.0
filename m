Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A4AC98315
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 03:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC87C10E345;
	Mon, 19 Jan 2026 03:36:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B39A10E340;
 Mon, 19 Jan 2026 03:36:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM=5FRAS_using?=
 =?utf-8?q?_generic_netlink_for_RAS_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jan 2026 03:36:08 -0000
Message-ID: <176879376843.165563.10544299907406496861@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119040023.2821518-6-riana.tauro@intel.com>
In-Reply-To: <20260119040023.2821518-6-riana.tauro@intel.com>
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

Series: Introduce DRM_RAS using generic netlink for RAS (rev4)
URL   : https://patchwork.freedesktop.org/series/155188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e8649becc11e54d51a4d464dfb18ce00b93b8915
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jan 19 09:30:26 2026 +0530

    drm/xe/xe_hw_error: Add support for PVC SOC errors
    
    Report the SOC nonfatal/fatal hardware error and update the counters.
    
    Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch af18785a6a8621b1a5805ba8a1b35d290cb4bcac drm-intel
a0c8c3d0add5 drm/ras: Introduce the DRM RAS infrastructure over generic netlink
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

-:805: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#805: FILE: drivers/gpu/drm/drm_ras_nl.c:13:
+static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {

-:810: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#810: FILE: drivers/gpu/drm/drm_ras_nl.c:18:
+static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 3 warnings, 0 checks, 905 lines checked
b59f1bb3a603 drm/xe/xe_drm_ras: Add support for drm ras
-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":0}'

-:73: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#73: 
new file mode 100644

-:269: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#269: FILE: drivers/gpu/drm/xe/xe_drm_ras.h:10:
+#define for_each_error_severity(i)	\
+	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++)

total: 0 errors, 2 warnings, 1 checks, 474 lines checked
c0b38ced1943 drm/xe/xe_hw_error: Add support for GT hardware errors
-:83: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#83: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:61:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:83: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#83: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:61:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:106: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#106: FILE: drivers/gpu/drm/xe/xe_hw_error.c:20:
+#define  HEC_UNCORR_FW_ERR_BITS ^I4$

total: 0 errors, 1 warnings, 2 checks, 299 lines checked
e8649becc11e drm/xe/xe_hw_error: Add support for PVC SOC errors
-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#33: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:71:
+#define SOC_GLOBAL_ERR_STAT_REG(base, x)	XE_REG(_PICK_EVEN((x), \
+								  (base) + SOC_GCOERRSTS, \
+								  (base) + SOC_GNFERRSTS))

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'base' - possible side-effects?
#47: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:85:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)	XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)

-:47: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#47: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:85:
+#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)	XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)

-:60: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#60: FILE: drivers/gpu/drm/xe/xe_hw_error.c:22:
+#define  XE_SOC_NUM_IEH ^I^I2$

total: 0 errors, 1 warnings, 3 checks, 272 lines checked


