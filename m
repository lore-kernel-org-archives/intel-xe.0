Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD422C25B5F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 16:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930F310E689;
	Mon,  6 May 2024 16:05:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB46F10E689;
 Mon,  6 May 2024 16:05:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Support_for_adverse?=
 =?utf-8?q?_events_notifications?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 16:05:29 -0000
Message-ID: <171501152976.1939724.15364309078664562048@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

Series: PF: Support for adverse events notifications
URL   : https://patchwork.freedesktop.org/series/133236/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5741bfb251c2a876b729da6fb0db678ed1984add
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 6 15:38:14 2024 +0200

    drm/xe/pf: Expose PF monitor details via debugfs
    
    For debug purposes we might want to view statistics maintained by
    the PF driver about VFs activity.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 5a59c9dd7c7b291d1c9e3c16dc77ae4d63b4e741 drm-intel
ad97623720d4 drm/xe/guc: Add more KLV helper macros
bc0e7f21d85c drm/xe/guc: Introduce GuC KLV thresholds set
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#55: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:30:
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

-:55: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#55: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:30:
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

-:55: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#55: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:30:
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);

-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:49:
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);

-:74: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#74: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:49:
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);

-:74: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#74: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h:49:
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);

-:117: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#117: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:28:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
+	define(CAT_ERR, cat_error_count)		\
+	define(ENGINE_RESET, engine_reset_count)	\
+	define(PAGE_FAULT, page_fault_count)		\
+	define(H2G_STORM, guc_time_us)			\
+	define(IRQ_STORM, irq_time_us)			\
+	define(DOORBELL_STORM, doorbell_time_us)	\
+	/* end */

-:117: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#117: FILE: drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h:28:
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
+	define(CAT_ERR, cat_error_count)		\
+	define(ENGINE_RESET, engine_reset_count)	\
+	define(PAGE_FAULT, page_fault_count)		\
+	define(H2G_STORM, guc_time_us)			\
+	define(IRQ_STORM, irq_time_us)			\
+	define(DOORBELL_STORM, doorbell_time_us)	\
+	/* end */

total: 1 errors, 5 warnings, 3 checks, 123 lines checked
0165117f37d5 drm/xe/guc: Add support for threshold KLVs in to_string() helper
-:30: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#30: FILE: drivers/gpu/drm/xe/xe_guc_klv_helpers.c:54:
+#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
+		return #NAME;

-:30: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#30: FILE: drivers/gpu/drm/xe/xe_guc_klv_helpers.c:54:
+#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
+		return #NAME;

total: 0 errors, 2 warnings, 0 checks, 21 lines checked
9629c30f0b4c drm/xe/pf: Introduce functions to configure VF thresholds
7dbd56e60bdd drm/xe/pf: Allow configuration of VF thresholds over debugfs
-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'INDEX' - possible side-effects?
#68: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:245:
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

-:83: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#83: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:260:
+#define define_threshold_attribute(TAG, NAME, ...) \
+	DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(NAME, MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG));

-:97: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#97: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:287:
+#define register_threshold_attribute(TAG, NAME, ...) \
+	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
+				   &NAME##_fops);

total: 0 errors, 2 warnings, 1 checks, 84 lines checked
9ad8e1fba9b9 drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
-:48: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_EVENT_MSG_n_DATAn>
#48: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:201:
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
59831a276003 drm/xe/pf: Track adverse events notifications from GuC
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
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

-:164: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#164: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c:135:
+#define __value(TAG, NAME, ...) , #NAME, data->guc.events[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]
                                 ^

-:164: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#164: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c:135:
+#define __value(TAG, NAME, ...) , #NAME, data->guc.events[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]

total: 2 errors, 1 warnings, 0 checks, 232 lines checked
5741bfb251c2 drm/xe/pf: Expose PF monitor details via debugfs


