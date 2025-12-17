Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFBBD609D5
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 02:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE0D10E1BF;
	Wed, 17 Dec 2025 02:54:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E6310E1BF;
 Wed, 17 Dec 2025 02:54:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_SRIOV_scheduler?=
 =?utf-8?q?_groups_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 02:54:06 -0000
Message-ID: <176594004674.95861.2085426255210157985@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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

Series: Introduce SRIOV scheduler groups (rev4)
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
commit 84ed7d49b2d0477822cf2a9bf926cbf6bc01d283
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Dec 16 17:26:33 2025 -0800

    drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups
    
    Debugfs files are added to allow a user to provide a comma-separated list
    of values to assign to each group for each VF.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 2eb2f8746a879f1c0e4c56b715c179424dafd8e0 drm-intel
bd884a59f045 DO_NOT_MERGE: PF: Add handling for new adverse event thresholds
-:55: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#55: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:85:
+#define foo	X, Y

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

-:147: ERROR:SPACING: space required after that ',' (ctx:VxB)
#147: FILE: drivers/gpu/drm/xe/xe_args.h:141:
+#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)
                                 	                         ^

-:153: WARNING:MACRO_ARG_UNUSED: Argument 'else' is not used in function-like macro
#153: FILE: drivers/gpu/drm/xe/xe_args.h:147:
+#define ___IF_ARG1(then, else)		then

-:154: WARNING:MACRO_ARG_UNUSED: Argument 'then' is not used in function-like macro
#154: FILE: drivers/gpu/drm/xe/xe_args.h:148:
+#define ___IF_ARG0(then, else)		else

-:181: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#181: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:181: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#181: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:212: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#212: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);

-:212: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#212: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);

-:212: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#212: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);

-:212: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#212: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);

-:241: WARNING:MACRO_ARG_UNUSED: Argument 'TAG' is not used in function-like macro
#241: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, VER...) ({				\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:241: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#241: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, VER...) ({				\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

total: 2 errors, 9 warnings, 1 checks, 273 lines checked
993fc3adcceb drm/xe/gt: Add engine masks for each class
6c0295aff7b6 drm/gt/guc: extract scheduler-related defines from guc_fwif.h
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 146 lines checked
a99c9b0aec0e drm/xe/sriov: Initialize scheduler groups
9f991af39c3b drm/xe/sriov: Add support for enabling scheduler groups
3d14499503e7 drm/xe/pf: Scheduler groups are incompatible with multi-lrc
a8bdbfd75045 drm/xe/vf: Check if scheduler groups are enabled
6487b3e357b6 drm/xe/sriov: Add debugfs to enable scheduler groups
a4c957eeec73 drm/xe/sriov: Add debugfs with scheduler groups information
ebe440c43797 drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
a3075ccab309 drm/xe/sriov: Add functions to set exec quantums for each group
291e30c9b895 drm/xe/sriov: Add functions to set preempt timeouts for each group
84ed7d49b2d0 drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups


