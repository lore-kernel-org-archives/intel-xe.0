Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A8D3E77C
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 02:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425D10E299;
	Thu, 11 Dec 2025 02:31:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5025910E299;
 Thu, 11 Dec 2025 02:31:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_SRIOV_scheduler?=
 =?utf-8?q?_groups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 02:31:24 -0000
Message-ID: <176542028431.75793.7730546701062046000@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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

Series: Introduce SRIOV scheduler groups (rev3)
URL   : https://patchwork.freedesktop.org/series/158142/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c98ca2da843f77cf021903220dde1c11422948f
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Dec 10 17:57:11 2025 -0800

    drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups
    
    Debugfs files are added to allow a user to provide a comma-separated list
    of values to assign to each group for each VF.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b drm-intel
826441cbf735 drm/xe/gt: Add engine masks for each class
78d7b46d0034 drm/gt/guc: extract scheduler-related defines from guc_fwif.h
-:23: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#23: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
04904f0d5691 drm/xe/sriov: Initialize scheduler groups
2093ec55d568 drm/xe/sriov: Add support for enabling scheduler groups
99bde56586e6 drm/xe/sriov: Scheduler groups are incompatible with multi-lrc
f3677f40a6b5 drm/xe/sriov: Add handling for MLRC adverse event threshold
-:67: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MAJ' - possible side-effects?
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:67: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'MAJ' may be better as '(MAJ)' to avoid precedence issues
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:67: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:98: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#98: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:98: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#98: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:98: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MAJ' - possible side-effects?
#98: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:98: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'MAJ' may be better as '(MAJ)' to avoid precedence issues
#98: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:98: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#98: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:125: WARNING:MACRO_ARG_UNUSED: Argument 'TAG' is not used in function-like macro
#125: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MAJ, MIN) ({				\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:125: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MAJ' - possible side-effects?
#125: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MAJ, MIN) ({				\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:125: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'MAJ' may be better as '(MAJ)' to avoid precedence issues
#125: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MAJ, MIN) ({				\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:125: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#125: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MAJ, MIN) ({				\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:151: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#151: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:28:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
+	define(CAT_ERR, cat_error_count, 0, 0)					\
+	define(ENGINE_RESET, engine_reset_count, 0, 0)				\
+	define(PAGE_FAULT, page_fault_count, 0, 0)				\
+	define(H2G_STORM, guc_time_us, 0, 0)					\
+	define(IRQ_STORM, irq_time_us, 0, 0)					\
+	define(DOORBELL_STORM, doorbell_time_us, 0, 0)				\
+	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)			\
 	/* end */

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#151: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:28:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
+	define(CAT_ERR, cat_error_count, 0, 0)					\
+	define(ENGINE_RESET, engine_reset_count, 0, 0)				\
+	define(PAGE_FAULT, page_fault_count, 0, 0)				\
+	define(H2G_STORM, guc_time_us, 0, 0)					\
+	define(IRQ_STORM, irq_time_us, 0, 0)					\
+	define(DOORBELL_STORM, doorbell_time_us, 0, 0)				\
+	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)			\
 	/* end */

total: 1 errors, 6 warnings, 8 checks, 117 lines checked
fe55f729c721 drm/xe/sriov: Add debugfs to enable scheduler groups
7feb8001d98f drm/xe/sriov: Add debugfs with scheduler groups information
11ef6da318fe drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
738511e1e18f drm/xe/sriov: Add functions to set exec quantums for each group
02c3bc8fc24b drm/xe/sriov: Add functions to set preempt timeouts for each group
2c98ca2da843 drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups


