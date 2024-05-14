Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992A5C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C9210E195;
	Tue, 14 May 2024 19:06:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234C10E136;
 Tue, 14 May 2024 19:06:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Support_for_adverse?=
 =?utf-8?q?_events_notifications_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 May 2024 19:06:51 -0000
Message-ID: <171571361166.2115985.15890157960021273914@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

Series: PF: Support for adverse events notifications (rev2)
URL   : https://patchwork.freedesktop.org/series/133236/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b666c49b377c049018e6e7f393bd9dd955cca494
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 14 21:00:15 2024 +0200

    drm/xe/pf: Expose PF monitor details via debugfs
    
    For debug purposes we might want to view statistics maintained by
    the PF driver about VFs activity.
    
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch a0c161037de0a89c0a9ea744f60099a4f94cc123 drm-intel
9b534b43ea6d drm/xe/guc: Add more KLV helper macros
8c9af9d2cf3c drm/xe/guc: Introduce GuC KLV thresholds set
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

-:59: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#59: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:30:
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+									\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

-:59: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#59: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:30:
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+									\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

-:59: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#59: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:30:
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+									\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

-:81: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#81: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:52:
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+									\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);

-:81: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#81: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:52:
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+									\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);

-:81: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#81: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:52:
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+									\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);

-:127: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#127: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:28:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
+	define(CAT_ERR, cat_error_count)		\
+	define(ENGINE_RESET, engine_reset_count)	\
+	define(PAGE_FAULT, page_fault_count)		\
+	define(H2G_STORM, guc_time_us)			\
+	define(IRQ_STORM, irq_time_us)			\
+	define(DOORBELL_STORM, doorbell_time_us)	\
+	/* end */

-:127: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#127: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:28:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
+	define(CAT_ERR, cat_error_count)		\
+	define(ENGINE_RESET, engine_reset_count)	\
+	define(PAGE_FAULT, page_fault_count)		\
+	define(H2G_STORM, guc_time_us)			\
+	define(IRQ_STORM, irq_time_us)			\
+	define(DOORBELL_STORM, doorbell_time_us)	\
+	/* end */

total: 1 errors, 5 warnings, 3 checks, 132 lines checked
baf37d960d51 drm/xe/guc: Add support for threshold KLVs in to_string() helper
-:34: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#34: FILE: drivers/gpu/drm/xe/xe_guc_klv_helpers.c:54:
+#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
+								\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
+		return #NAME;

-:34: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#34: FILE: drivers/gpu/drm/xe/xe_guc_klv_helpers.c:54:
+#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
+								\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
+		return #NAME;

total: 0 errors, 2 warnings, 0 checks, 24 lines checked
6f1ed57a8bcf drm/xe/pf: Introduce functions to configure VF thresholds
5ed9dd43466c drm/xe/pf: Allow configuration of VF thresholds over debugfs
-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'INDEX' - possible side-effects?
#72: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:245:
+#define DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(THRESHOLD, INDEX)		\
+										\
+static int THRESHOLD##_set(void *data, u64 val)					\
+{										\
+	return set_threshold(data, val, INDEX);					\
+}										\
+										\
+static int THRESHOLD##_get(void *data, u64 *val)				\
+{										\
+	return get_threshold(data, val, INDEX);					\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(THRESHOLD##_fops, THRESHOLD##_get, THRESHOLD##_set, "%llu\n")

-:87: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#87: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:260:
+#define define_threshold_attribute(TAG, NAME, ...) \
+	DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(NAME, MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG));

-:101: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#101: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:287:
+#define register_threshold_attribute(TAG, NAME, ...) \
+	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
+				   &NAME##_fops);

total: 0 errors, 2 warnings, 1 checks, 84 lines checked
08d49d16d9c5 drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
-:52: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_EVENT_MSG_n_DATAn>
#52: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:201:
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
e917288cf4e7 drm/xe/pf: Track adverse events notifications from GuC
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:172: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#172: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c:139:
+#define __value(TAG, NAME, ...) , #NAME, data->guc.events[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]
                                 ^

-:172: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#172: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c:139:
+#define __value(TAG, NAME, ...) , #NAME, data->guc.events[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]

total: 2 errors, 1 warnings, 0 checks, 236 lines checked
b666c49b377c drm/xe/pf: Expose PF monitor details via debugfs


