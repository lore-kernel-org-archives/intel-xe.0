Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3263D3B7E1
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E71610E30D;
	Sat,  6 Dec 2025 23:10:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5539C10E30D;
 Sat,  6 Dec 2025 23:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_SRIOV_scheduler?=
 =?utf-8?q?_groups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Dec 2025 23:10:17 -0000
Message-ID: <176506261727.64503.7863567429691462211@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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

Series: Introduce SRIOV scheduler groups (rev2)
URL   : https://patchwork.freedesktop.org/series/158142/
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
commit 1f6e1f507cadef94aa53f2574ecf6b736545dc81
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Sat Dec 6 15:04:07 2025 -0800

    drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups
    
    Debugfs files are added to allow a user to provide a comma-separated list
    of values to assign to each group for each VF.
    
    v2: drop files for individual groups, check input length (Michal)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch db6505187efb9c255df1dd6e78c00d95fadfef79 drm-intel
c1478a9e936c drm/xe/gt: Add engine masks for each class
debfe37cf169 drm/xe/sriov: Initialize scheduler groups
3f3ff0982d59 drm/xe/sriov: Add support for enabling scheduler groups
74ac2637e362 drm/xe/sriov: Scheduler groups are incompatible with multi-lrc
2d345b7a1092 drm/xe/sriov: Add handling for MLRC adverse event threshold
-:71: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#71: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MIN_GUC_VER' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:71: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'MIN_GUC_VER' may be better as '(MIN_GUC_VER)' to avoid precedence issues
#71: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:71: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#71: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#102: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:102: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#102: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MIN_GUC_VER' - possible side-effects?
#102: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:102: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'MIN_GUC_VER' may be better as '(MIN_GUC_VER)' to avoid precedence issues
#102: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:102: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#102: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\

-:129: WARNING:MACRO_ARG_UNUSED: Argument 'TAG' is not used in function-like macro
#129: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MIN_GUC_VER' - possible side-effects?
#129: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:129: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'MIN_GUC_VER' may be better as '(MIN_GUC_VER)' to avoid precedence issues
#129: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:129: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#129: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:184: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#184: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:29:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
+	define(CAT_ERR, cat_error_count, 0)					\
+	define(ENGINE_RESET, engine_reset_count, 0)				\
+	define(PAGE_FAULT, page_fault_count, 0)					\
+	define(H2G_STORM, guc_time_us, 0)					\
+	define(IRQ_STORM, irq_time_us, 0)					\
+	define(DOORBELL_STORM, doorbell_time_us, 0)				\
+	define(MULTI_LRC_COUNT, multi_lrc_count, MAKE_GUC_VER(70, 53, 0))	\
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

-:184: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#184: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:29:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
+	define(CAT_ERR, cat_error_count, 0)					\
+	define(ENGINE_RESET, engine_reset_count, 0)				\
+	define(PAGE_FAULT, page_fault_count, 0)					\
+	define(H2G_STORM, guc_time_us, 0)					\
+	define(IRQ_STORM, irq_time_us, 0)					\
+	define(DOORBELL_STORM, doorbell_time_us, 0)				\
+	define(MULTI_LRC_COUNT, multi_lrc_count, MAKE_GUC_VER(70, 53, 0))	\
 	/* end */

-:196: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#196: 
new file mode 100644

total: 1 errors, 7 warnings, 8 checks, 176 lines checked
417297f80ac3 drm/xe/sriov: Add debugfs to enable scheduler groups
bdfbb4896c33 drm/xe/sriov: Add debugfs with scheduler groups information
185e7ae0c6f5 drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
b9b4bb1dc695 drm/xe/sriov: Add functions to set exec quantums for each group
264207e14aac drm/xe/sriov: Add functions to set preempt timeouts for each group
1f6e1f507cad drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups


