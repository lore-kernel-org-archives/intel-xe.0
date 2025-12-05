Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12814D2F7C6
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 09:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAD510EA9B;
	Fri,  5 Dec 2025 09:40:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B610E26E;
 Fri,  5 Dec 2025 09:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM=5FRAS_using?=
 =?utf-8?q?_generic_netlink_for_RAS_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Dec 2025 09:40:28 -0000
Message-ID: <176492762821.60202.5456155014627670505@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205083934.3602030-6-riana.tauro@intel.com>
In-Reply-To: <20251205083934.3602030-6-riana.tauro@intel.com>
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

Series: Introduce DRM_RAS using generic netlink for RAS (rev3)
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
commit 2c6b954b514c7834bd06fc0e4660d864ccfe23e2
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Dec 5 14:09:36 2025 +0530

    drm/xe/xe_hw_error: Add support for PVC SOC errors
    
    Report the SOC nonfatal/fatal hardware error and update the counters.
    
    Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 0949b969da10a9fc389d255f398653eb9bc4ffaf drm-intel
2cb0846cd686 drm/ras: Introduce the DRM RAS infrastructure over generic netlink
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
8c989fcbf061 drm/xe/xe_drm_ras: Add support for drm ras
-:31: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#31: 
$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'

-:77: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#77: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 502 lines checked
91eb06e3f6c8 drm/xe/xe_hw_error: Add support for GT hardware errors
-:73: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hw_err' may be better as '(hw_err)' to avoid precedence issues
#73: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == DRM_XE_RAS_ERROR_CORRECTABLE ? \
+						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						 ERR_STAT_GT_FATAL_VECTOR_REG(x))

-:73: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#73: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:60:
+#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == DRM_XE_RAS_ERROR_CORRECTABLE ? \
+						 ERR_STAT_GT_COR_VECTOR_REG(x) : \
+						 ERR_STAT_GT_FATAL_VECTOR_REG(x))

total: 0 errors, 0 warnings, 2 checks, 274 lines checked
2c6b954b514c drm/xe/xe_hw_error: Add support for PVC SOC errors
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
+#define SOC_LOCAL_ERR_STAT_REG(base, x)		XE_REG(x == DRM_XE_RAS_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)

-:47: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#47: FILE: drivers/gpu/drm/xe/regs/xe_hw_error_regs.h:84:
+#define SOC_LOCAL_ERR_STAT_REG(base, x)		XE_REG(x == DRM_XE_RAS_ERROR_CORRECTABLE ? \
+						      (base) + SOC_LERRCORSTS : \
+						      (base) + SOC_LERRUNCSTS)

-:231: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#231: FILE: drivers/gpu/drm/xe/xe_hw_error.c:350:
+						      SOC_GLOBAL_ERR_STAT_REG(slave_base, severity));

total: 0 errors, 1 warnings, 4 checks, 266 lines checked


