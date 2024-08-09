Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D7C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B218110E9A5;
	Fri,  9 Aug 2024 16:58:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3410E9A5;
 Fri,  9 Aug 2024 16:58:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Improve_VF_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 16:58:12 -0000
Message-ID: <172322269212.552689.16237318203095445297@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

Series: PF: Improve VF control
URL   : https://patchwork.freedesktop.org/series/137095/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd73c71c97fffd2bec57fd1668b358dabbc67ba7
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Aug 9 18:51:59 2024 +0200

    drm/xe/tests: Add KUnit tests for VF control GuC messages
    
    Add KUnit tests (~50) to cover all possible VF control messages
    that could be seen by the PF, either expected or corrupted.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fecad563ec6fa0d6c38ecd36d660a663ad390ea1 drm-intel
b5c32521ec62 drm/xe/pf: Add function to sanitize VF resources
7a34bbd55e9b drm/xe/pf: Fix documentation formatting
12c0de5efa95 drm/xe/pf: Drop GuC notifications for non-existing VF
26c80196d378 drm/xe/pf: Improve VF control
-:1368: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1368: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1449 lines checked
6badbd614dff drm/xe/tests: Allow deferred function call during KUnit test
-:228: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#228: FILE: drivers/gpu/drm/xe/tests/xe_kunit_helpers.h:47:
+#define xe_kunit_helper_delayed_call(test, delay, func, args...)	\
+	_Generic(func,							\
+		 void (*)(struct xe_device *) :				\
+			xe_kunit_helper_delayed_call_void_xe_device,	\
+		 void (*)(struct xe_gt *) :				\
+			xe_kunit_helper_delayed_call_void_xe_gt,	\
+		 int (*)(struct xe_gt *, unsigned int) :		\
+			xe_kunit_helper_delayed_call_int_xe_gt_uint	\
+	)(test, delay, func, args)

-:229: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#229: FILE: drivers/gpu/drm/xe/tests/xe_kunit_helpers.h:48:
+	_Generic(func,							\

-:230: CHECK:SPACING: No space is necessary after a cast
#230: FILE: drivers/gpu/drm/xe/tests/xe_kunit_helpers.h:49:
+		 void (*)(struct xe_device *) :				\

-:232: CHECK:SPACING: No space is necessary after a cast
#232: FILE: drivers/gpu/drm/xe/tests/xe_kunit_helpers.h:51:
+		 void (*)(struct xe_gt *) :				\

total: 0 errors, 0 warnings, 4 checks, 199 lines checked
4efcd1651e1e drm/xe/tests: Add helper macro to detect if KUnit is running
715a4af91bf4 drm/xe/tests: Add helpers to call stubs out of KUnit context
-:58: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#58: FILE: drivers/gpu/drm/xe/tests/xe_test.h:93:
+#define XE_TEST_REDIRECT(stub, args...)							\
+do {											\
+	typeof(stub) replacement = (stub);						\
+	if (XE_TEST_RUNNING()) {							\
+		if (unlikely(replacement)) {						\
+			pr_info(KUNIT_SUBTEST_INDENT "# %s: calling stub %ps\n",	\
+				__func__, replacement);					\
+			return replacement(args);					\
+		}									\
+	}										\
+} while (0)

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
2155fe82e6cd drm/xe/guc: Define stub for xe_guc_ct_send_recv()
d056743a5124 drm/xe/pf: Define stub for pf_sanitize_vf_resources()
1dc5182fd47d drm/xe/pf: Define stub for pf_send_vf_control_cmd()
a298f3076b50 drm/xe/tests: Add KUnit tests for VF control state machines
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

-:309: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'X' - possible side-effects?
#309: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:291:
+#define MAKE_STATE_PARAM(X) { .name = #X, .bits = X, .num_bits = ARRAY_SIZE(X) }

total: 0 errors, 1 warnings, 1 checks, 1382 lines checked
fd73c71c97ff drm/xe/tests: Add KUnit tests for VF control GuC messages
-:21: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#21: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:1362:
+#define PREP_MSG_0_VF_STATE_NOTIFY(mbz)							\
+	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |			\
+	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |			\
+	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_DATA0, (mbz)) |				\
+	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_ACTION, GUC_ACTION_GUC2PF_VF_STATE_NOTIFY)

-:27: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#27: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:1368:
+#define PREP_MSG_VF_STATE_NOTIFY(mbz, vfid, e)						\
+	PREP_MSG_0_VF_STATE_NOTIFY(mbz),						\
+	FIELD_PREP_CONST(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID, (vfid)),		\
+	FIELD_PREP_CONST(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT, (e))

-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'X' - possible side-effects?
#118: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:1459:
+#define MAKE_MSG_PARAM(X) { .name = #X, .msg = X, .len = ARRAY_SIZE(X) }

-:120: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#120: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:1461:
+#define LIST_MSG_PARAM_VALID			\
+	MAKE_MSG_PARAM(msg_pf_enable),		\
+	MAKE_MSG_PARAM(msg_vf_flr),		\
+	MAKE_MSG_PARAM(msg_vf_flr_done),	\
+	MAKE_MSG_PARAM(msg_vf_pause_done),	\
+	MAKE_MSG_PARAM(msg_vf_fixup)

-:127: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#127: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:1468:
+#define LIST_MSG_PARAM_INVALID			\
+	MAKE_MSG_PARAM(msg_no_data),		\
+	MAKE_MSG_PARAM(msg_pf_too_long),	\
+	MAKE_MSG_PARAM(msg_pf_too_short),	\
+	MAKE_MSG_PARAM(msg_pf_bad_mbz),		\
+	MAKE_MSG_PARAM(msg_pf_invalid_event),	\
+	MAKE_MSG_PARAM(msg_pf_unknown_event),	\
+	MAKE_MSG_PARAM(msg_vf_too_long),	\
+	MAKE_MSG_PARAM(msg_vf_too_short),	\
+	MAKE_MSG_PARAM(msg_vf_bad_mbz),		\
+	MAKE_MSG_PARAM(msg_vf_bad_vfid),	\
+	MAKE_MSG_PARAM(msg_vf_invalid_event),	\
+	MAKE_MSG_PARAM(msg_vf_unknown_event)

total: 4 errors, 0 warnings, 1 checks, 197 lines checked


