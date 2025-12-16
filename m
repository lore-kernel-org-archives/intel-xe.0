Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44B9D5B87A
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 00:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B03110E5DE;
	Tue, 16 Dec 2025 00:22:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A8310E5EF;
 Tue, 16 Dec 2025 00:22:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_handling_for_ne?=
 =?utf-8?q?w_adverse_event_thresholds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 00:22:01 -0000
Message-ID: <176584452197.91286.14322025980428780264@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215201806.196514-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251215201806.196514-1-michal.wajdeczko@intel.com>
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

Series: PF: Add handling for new adverse event thresholds (rev3)
URL   : https://patchwork.freedesktop.org/series/158874/
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
commit 2775f7109a4613861b39ceaef5d5d1880715ebe2
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Dec 15 21:18:04 2025 +0100

    drm/xe/pf: Add handling for MLRC adverse event threshold
    
    Since it is illegal to register a MLRC context when scheduler groups are
    enabled, the GuC consider the VF doing so as an adverse event. Like for
    other adverse event, there is a threshold for how many times the event
    can happen before the GuC throws an error, which we need to add support
    for.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 5dd9dbd1824c3a520036488257ff25a6495ac1fe drm-intel
336bdb733d60 drm/xe: Introduce IF_ARGS macro utility
-:29: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#29: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:85:
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

-:119: ERROR:SPACING: space required after that ',' (ctx:VxB)
#119: FILE: drivers/gpu/drm/xe/xe_args.h:140:
+#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)
                                 	                         ^

total: 2 errors, 0 warnings, 0 checks, 95 lines checked
0b27878d6889 drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
7be4cf6204f3 drm/xe/pf: Prepare for new threshold KLVs
-:36: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#36: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:36: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#36: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:307:
+#define encode_threshold_config(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
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

-:67: WARNING:MACRO_ARG_UNUSED: Argument 'NAME' is not used in function-like macro
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
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

-:67: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
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

-:67: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#67: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2557:
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

-:96: WARNING:MACRO_ARG_UNUSED: Argument 'TAG' is not used in function-like macro
#96: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, VER...) ({				\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

-:96: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#96: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:305:
+#define register_threshold_attribute(TAG, NAME, VER...) ({				\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});

total: 0 errors, 7 warnings, 1 checks, 85 lines checked
2775f7109a46 drm/xe/pf: Add handling for MLRC adverse event threshold


