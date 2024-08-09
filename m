Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6539EC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 17:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127BA10E9AD;
	Fri,  9 Aug 2024 17:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZxKBuB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B5C10E9AD
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723224213; x=1754760213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tk8M7eXvOfDU4dI7JnHfkX0SUPOGFGmVydIKkSzlM3s=;
 b=iZxKBuB4mNdnRNeOw1e6Uj7Z4zgnnp4aOhhLXp5Pw6sWxavBCCRLtMvd
 QIZp4v2ojJHv0xXWZRwUQX0HrnqhF2T8FDOgBBMNj3DpLHPtbVgELgpRc
 4SJkaym3npkRtyT74SmtXdy7IC7Y916eWz7k+YN96FIM1Ch5xdBadSsUq
 k083Qk/FfJaSXR2We7Zbvh3QRfjWqGLQcsuSUi+ll6ZkcAIVqdH34Bwx5
 MODqrOMMCGiEOq7gpikzstOCl/Xu0JixY+n8MFFmHHwCMQwhYRzw7PjjP
 B3DFBSYaNQVQArexgCX2AxS99drktw9l94/dAmoHvSJtjm5shndh4yV19 A==;
X-CSE-ConnectionGUID: Zy1FNASYSD6ZVbQW/6DwYQ==
X-CSE-MsgGUID: eJ1SbnCDRqWTTa9qsqiebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21568850"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21568850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:23:32 -0700
X-CSE-ConnectionGUID: Ync+sUGxSLiDEXbmfRYV8A==
X-CSE-MsgGUID: BNfYOZJRQESibcOS37EU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61754252"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:23:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 11/12] drm/xe/tests: Add KUnit tests for VF control state
 machines
Date: Fri,  9 Aug 2024 19:23:15 +0200
Message-Id: <20240809172315.749-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-12-michal.wajdeczko@intel.com>
References: <20240809165159.662-12-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add KUnit tests (~200) for all VF control state machines (FLR,
PAUSE, STOP and RESUME) to make sure they work as expected and
will not be broken while extending them with new functionality.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
Test file named according to the new best practices [1]
[1] https://lore.kernel.org/linux-hardening/20240724201354.make.730-kees@kernel.org/
---
v2: fix kunit build break due last-minute change in .c
---
 .../xe/tests/xe_gt_sriov_pf_control_kunit.c   | 1360 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |    7 +
 2 files changed, 1367 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
new file mode 100644
index 000000000000..3061099ad35a
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
@@ -0,0 +1,1360 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/static_stub.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_pci_test.h"
+
+#include "xe_gt_sriov_pf.h"
+
+static const unsigned int DUT_NUM_VFS = 2;
+static const unsigned int VFUT1 = VFID(1);
+static const unsigned int VFUT2 = VFID(2);
+
+static void dump_state(void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	pf_dump_vf_state(gt, VFUT1);
+}
+
+static unsigned long replacement_timeout(enum xe_gt_sriov_control_bits bit)
+{
+	return HZ;
+}
+
+static int pf_control_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	struct xe_device *xe;
+	struct xe_gt *gt;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	xe = test->priv;
+	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
+
+	xe->sriov.pf.driver_max_vfs = DUT_NUM_VFS;
+	KUNIT_EXPECT_NE(test, xe_sriov_pf_get_totalvfs(xe), 0);
+
+	gt = xe_device_get_gt(xe, 0);
+	KUNIT_ASSERT_EQ(test, xe_gt_sriov_pf_init_early(gt), 0);
+
+	KUNIT_ASSERT_EQ(test, 0ul, *pf_peek_vf_state(gt, VFUT1));
+	KUNIT_ASSERT_EQ(test, 0ul, *pf_peek_vf_state(gt, VFUT2));
+
+	KUNIT_EXPECT_EQ(test, 0, kunit_add_action_or_reset(test, dump_state, gt));
+
+	kunit_activate_static_stub(test, pf_get_default_timeout, replacement_timeout);
+
+	test->priv = gt;
+	return 0;
+}
+
+static int sanitize_vf_resources_fail(struct xe_gt *gt, u32 vfid, long timeout)
+{
+	return -ETIMEDOUT;
+}
+
+static int send_vf_control_cmd_reject(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	return -EIO;
+}
+
+static int send_vf_control_cmd_fail(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	return -ENODEV;
+}
+
+static int send_vf_control_cmd_pass_no_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	return 0;
+}
+
+static int send_vf_control_cmd_pass_and_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	switch (cmd) {
+	case GUC_PF_TRIGGER_VF_PAUSE:
+		pf_handle_vf_event(gt, vfid, GUC_PF_NOTIFY_VF_PAUSE_DONE);
+		break;
+	case GUC_PF_TRIGGER_VF_FLR_START:
+		pf_handle_vf_event(gt, vfid, GUC_PF_NOTIFY_VF_FLR_DONE);
+		break;
+	case GUC_PF_TRIGGER_VF_RESUME:
+	case GUC_PF_TRIGGER_VF_STOP:
+	case GUC_PF_TRIGGER_VF_FLR_FINISH:
+		break;
+	default:
+		return -EPROTO;
+	}
+	return 0;
+}
+
+static int send_vf_control_cmd_busy_wait(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	schedule_timeout_interruptible(HZ / 20);
+	return -EBUSY;
+}
+
+static int send_vf_control_cmd_pass_but_reply_flr_only(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	return cmd == GUC_PF_TRIGGER_VF_FLR_START ?
+		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
+		send_vf_control_cmd_pass_no_reply(gt, vfid, cmd);
+}
+
+static int send_vf_control_cmd_busy_except_flr(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	return cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH ?
+		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
+		send_vf_control_cmd_busy_wait(gt, vfid, cmd);
+}
+
+static int send_vf_control_cmd_busy_except_stop(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	return cmd == GUC_PF_TRIGGER_VF_STOP ?
+		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
+		send_vf_control_cmd_busy_wait(gt, vfid, cmd);
+}
+
+static int BUSY_MAGIC = 3;
+
+static int send_vf_control_cmd_busy_no_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	static int counter;
+
+	return ++counter % BUSY_MAGIC ? -EBUSY : 0;
+}
+
+static int send_vf_control_cmd_busy_and_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	static int counter;
+
+	return ++counter % BUSY_MAGIC ? -EBUSY :
+		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd);
+}
+
+static const enum xe_gt_sriov_control_bits ready[] = {
+};
+
+static const enum xe_gt_sriov_control_bits flr_starting[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_SEND_START,
+};
+
+static const enum xe_gt_sriov_control_bits flr_starting_paused[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_SEND_START,
+	XE_GT_SRIOV_STATE_PAUSED,
+};
+
+static const enum xe_gt_sriov_control_bits flr_starting_stopped[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_SEND_START,
+	XE_GT_SRIOV_STATE_STOPPED,
+};
+
+static const enum xe_gt_sriov_control_bits flr_waiting[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
+};
+
+static const enum xe_gt_sriov_control_bits flr_guc_done[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
+};
+
+static const enum xe_gt_sriov_control_bits flr_resetting[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
+};
+
+static const enum xe_gt_sriov_control_bits flr_finishing[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_FLR_WIP,
+	XE_GT_SRIOV_STATE_FLR_SEND_FINISH,
+};
+
+static const enum xe_gt_sriov_control_bits flr_failed[] = {
+	XE_GT_SRIOV_STATE_FLR_FAILED,
+};
+
+static const enum xe_gt_sriov_control_bits stopping[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_STOP_WIP,
+	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
+};
+
+static const enum xe_gt_sriov_control_bits stopping_paused[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_STOP_WIP,
+	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
+	XE_GT_SRIOV_STATE_PAUSED,
+};
+
+static const enum xe_gt_sriov_control_bits stop_failed[] = {
+	XE_GT_SRIOV_STATE_STOP_FAILED,
+};
+
+static const enum xe_gt_sriov_control_bits stop_rejected[] = {
+	XE_GT_SRIOV_STATE_STOP_FAILED,
+	XE_GT_SRIOV_STATE_MISMATCH,
+};
+
+static const enum xe_gt_sriov_control_bits stopped[] = {
+	XE_GT_SRIOV_STATE_STOPPED,
+};
+
+static const enum xe_gt_sriov_control_bits pausing[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_PAUSE_WIP,
+	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
+};
+
+static const enum xe_gt_sriov_control_bits pausing_wait_guc[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_PAUSE_WIP,
+	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
+};
+
+static const enum xe_gt_sriov_control_bits pausing_guc_done[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_PAUSE_WIP,
+	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
+};
+
+static const enum xe_gt_sriov_control_bits pause_failed[] = {
+	XE_GT_SRIOV_STATE_PAUSE_FAILED,
+};
+
+static const enum xe_gt_sriov_control_bits pause_rejected[] = {
+	XE_GT_SRIOV_STATE_PAUSE_FAILED,
+	XE_GT_SRIOV_STATE_MISMATCH,
+};
+
+static const enum xe_gt_sriov_control_bits paused[] = {
+	XE_GT_SRIOV_STATE_PAUSED,
+};
+
+static const enum xe_gt_sriov_control_bits resuming[] = {
+	XE_GT_SRIOV_STATE_WIP,
+	XE_GT_SRIOV_STATE_PAUSED,
+	XE_GT_SRIOV_STATE_RESUME_WIP,
+	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
+};
+
+static const enum xe_gt_sriov_control_bits resume_failed[] = {
+	XE_GT_SRIOV_STATE_PAUSED,
+	XE_GT_SRIOV_STATE_RESUME_FAILED,
+};
+
+static const enum xe_gt_sriov_control_bits resume_rejected[] = {
+	XE_GT_SRIOV_STATE_PAUSED,
+	XE_GT_SRIOV_STATE_RESUME_FAILED,
+	XE_GT_SRIOV_STATE_MISMATCH,
+};
+
+static const enum xe_gt_sriov_control_bits resumed[] = {
+	XE_GT_SRIOV_STATE_RESUMED,
+};
+
+static const enum xe_gt_sriov_control_bits mismatch[] = {
+	XE_GT_SRIOV_STATE_MISMATCH,
+};
+
+struct state_param {
+	const char *name;
+	const enum xe_gt_sriov_control_bits *bits;
+	size_t num_bits;
+};
+
+static void state_param_get_desc(struct state_param *p, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->name);
+}
+
+#define MAKE_STATE_PARAM(X) { .name = #X, .bits = X, .num_bits = ARRAY_SIZE(X) }
+
+/*
+ * Due to the test case logic the all "must_pass" params include "_rejected" states
+ * since our "GuC" calls by default will not complain again about the INVALID_STATE
+ * thus our state machine is able to fully recover.
+ */
+
+static struct state_param flr_must_pass_from[] = {
+	MAKE_STATE_PARAM(ready),
+	MAKE_STATE_PARAM(flr_starting),
+	MAKE_STATE_PARAM(flr_starting_paused),
+	MAKE_STATE_PARAM(flr_starting_stopped),
+	MAKE_STATE_PARAM(flr_waiting),
+	MAKE_STATE_PARAM(flr_guc_done),
+	MAKE_STATE_PARAM(flr_resetting),
+	MAKE_STATE_PARAM(flr_finishing),
+	MAKE_STATE_PARAM(flr_failed),
+	MAKE_STATE_PARAM(stopping),
+	MAKE_STATE_PARAM(stop_failed),
+	MAKE_STATE_PARAM(stop_rejected),
+	MAKE_STATE_PARAM(stopped),
+	MAKE_STATE_PARAM(pausing),
+	MAKE_STATE_PARAM(pausing_wait_guc),
+	MAKE_STATE_PARAM(pausing_guc_done),
+	MAKE_STATE_PARAM(pause_failed),
+	MAKE_STATE_PARAM(pause_rejected),
+	MAKE_STATE_PARAM(paused),
+	MAKE_STATE_PARAM(resuming),
+	MAKE_STATE_PARAM(resume_failed),
+	MAKE_STATE_PARAM(resume_rejected),
+	MAKE_STATE_PARAM(resumed),
+	MAKE_STATE_PARAM(mismatch),
+};
+
+static struct state_param stop_must_pass_from[] = {
+	MAKE_STATE_PARAM(ready),
+	MAKE_STATE_PARAM(stop_failed),
+	MAKE_STATE_PARAM(stop_rejected),
+	MAKE_STATE_PARAM(pausing),
+	MAKE_STATE_PARAM(pausing_wait_guc),
+	MAKE_STATE_PARAM(pausing_guc_done),
+	MAKE_STATE_PARAM(pause_failed),
+	MAKE_STATE_PARAM(pause_rejected),
+	MAKE_STATE_PARAM(paused),
+	MAKE_STATE_PARAM(resuming),
+	MAKE_STATE_PARAM(resume_failed),
+	MAKE_STATE_PARAM(resume_rejected),
+	MAKE_STATE_PARAM(resumed),
+	MAKE_STATE_PARAM(mismatch),
+	MAKE_STATE_PARAM(flr_failed),
+};
+
+static struct state_param stop_must_cancel_from[] = {
+	MAKE_STATE_PARAM(flr_starting),
+	MAKE_STATE_PARAM(flr_starting_paused),
+	MAKE_STATE_PARAM(flr_waiting),
+	MAKE_STATE_PARAM(flr_guc_done),
+	MAKE_STATE_PARAM(flr_resetting),
+	MAKE_STATE_PARAM(flr_finishing),
+};
+
+static struct state_param stop_must_fail_from[] = {
+	MAKE_STATE_PARAM(stopping),
+	MAKE_STATE_PARAM(stopping_paused),
+	MAKE_STATE_PARAM(stopped),
+	MAKE_STATE_PARAM(flr_starting_stopped),
+};
+
+static struct state_param pause_must_pass_from[] = {
+	MAKE_STATE_PARAM(ready),
+	MAKE_STATE_PARAM(pause_failed),
+	MAKE_STATE_PARAM(pause_rejected),
+	MAKE_STATE_PARAM(resumed),
+	MAKE_STATE_PARAM(mismatch),
+	MAKE_STATE_PARAM(stop_failed),
+	MAKE_STATE_PARAM(stop_rejected),
+	MAKE_STATE_PARAM(flr_failed),
+};
+
+static struct state_param pause_must_cancel_from[] = {
+	MAKE_STATE_PARAM(flr_starting),
+	MAKE_STATE_PARAM(flr_waiting),
+	MAKE_STATE_PARAM(flr_guc_done),
+	MAKE_STATE_PARAM(flr_resetting),
+	MAKE_STATE_PARAM(flr_finishing),
+	MAKE_STATE_PARAM(stopping),
+};
+
+static struct state_param pause_must_fail_from[] = {
+	MAKE_STATE_PARAM(pausing),
+	MAKE_STATE_PARAM(pausing_wait_guc),
+	MAKE_STATE_PARAM(pausing_guc_done),
+	MAKE_STATE_PARAM(paused),
+	MAKE_STATE_PARAM(resuming),
+	MAKE_STATE_PARAM(resume_failed),
+	MAKE_STATE_PARAM(resume_rejected),
+	MAKE_STATE_PARAM(stopped),
+};
+
+static struct state_param resume_must_pass_from[] = {
+	MAKE_STATE_PARAM(paused),
+	MAKE_STATE_PARAM(resume_failed),
+	MAKE_STATE_PARAM(resume_rejected),
+};
+
+static struct state_param resume_must_cancel_from[] = {
+	MAKE_STATE_PARAM(flr_starting_paused),
+	MAKE_STATE_PARAM(stopping_paused),
+};
+
+static struct state_param resume_must_fail_from[] = {
+	MAKE_STATE_PARAM(ready),
+	MAKE_STATE_PARAM(pausing),
+	MAKE_STATE_PARAM(pausing_wait_guc),
+	MAKE_STATE_PARAM(pausing_guc_done),
+	MAKE_STATE_PARAM(pause_failed),
+	MAKE_STATE_PARAM(pause_rejected),
+	MAKE_STATE_PARAM(resuming),
+	MAKE_STATE_PARAM(resumed),
+	MAKE_STATE_PARAM(stopping),
+	MAKE_STATE_PARAM(stop_failed),
+	MAKE_STATE_PARAM(stop_rejected),
+	MAKE_STATE_PARAM(stopped),
+	MAKE_STATE_PARAM(flr_starting),
+	MAKE_STATE_PARAM(flr_waiting),
+	MAKE_STATE_PARAM(flr_guc_done),
+	MAKE_STATE_PARAM(flr_resetting),
+	MAKE_STATE_PARAM(flr_finishing),
+	MAKE_STATE_PARAM(flr_failed),
+	MAKE_STATE_PARAM(mismatch),
+};
+
+KUNIT_ARRAY_PARAM(flr_must_pass_from, flr_must_pass_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(stop_must_pass_from, stop_must_pass_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(stop_must_fail_from, stop_must_fail_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(stop_must_cancel_from, stop_must_cancel_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(pause_must_pass_from, pause_must_pass_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(pause_must_fail_from, pause_must_fail_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(pause_must_cancel_from, pause_must_cancel_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(resume_must_pass_from, resume_must_pass_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(resume_must_fail_from, resume_must_fail_from, state_param_get_desc);
+KUNIT_ARRAY_PARAM(resume_must_cancel_from, resume_must_cancel_from, state_param_get_desc);
+
+static int mimic_pf_handle_vf_flr_done(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_handle_vf_flr_done(gt, vfid);
+	return 0;
+}
+
+static int mimic_pf_handle_vf_pause_done(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_handle_vf_pause_done(gt, vfid);
+	return 0;
+}
+
+static void prepare_state(struct kunit *test, unsigned int vfid,
+			  const enum xe_gt_sriov_control_bits *bits, size_t num_bits)
+{
+	struct xe_gt *gt = test->priv;
+	size_t n;
+
+	for (n = 0; n < num_bits; n++) {
+		enum xe_gt_sriov_control_bits bit = bits[n];
+
+		KUNIT_ASSERT_TRUE(test, pf_enter_vf_state(gt, vfid, bit));
+
+		if (bit == XE_GT_SRIOV_STATE_WIP) {
+			pf_queue_vf(gt, vfid);
+		} else if (bit == XE_GT_SRIOV_STATE_FLR_WAIT_GUC) {
+			xe_kunit_helper_delayed_call(test, HZ / 100,
+						     mimic_pf_handle_vf_flr_done, gt, vfid);
+		} else if (bit == XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC) {
+			xe_kunit_helper_delayed_call(test, HZ / 100,
+						     mimic_pf_handle_vf_pause_done, gt, vfid);
+		}
+	}
+}
+
+static void prepare_state_from_param(struct kunit *test)
+{
+	const struct state_param *p = test->param_value;
+
+	prepare_state(test, VFUT1, p->bits, p->num_bits);
+}
+
+static void expect_not_pausing(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE));
+}
+
+static void expect_not_in_pause(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	expect_not_pausing(test);
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+}
+
+static void expect_not_resuming(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME));
+}
+
+static void expect_not_in_resume(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	expect_not_resuming(test);
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
+}
+
+static void expect_not_stopping(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_WIP));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_SEND_STOP));
+}
+
+static void expect_not_in_stop(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	expect_not_stopping(test);
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
+}
+
+static void expect_not_in_flr(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_SEND_START));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WAIT_GUC));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_GUC_DONE));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_SEND_FINISH));
+	KUNIT_EXPECT_TRUE(test,
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+}
+
+static void expect_not_in_wip(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void expect_not_in_mismatch(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+}
+
+static void try_flr_vf(struct kunit *test, bool mimic_busy, bool late_reply)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      mimic_busy ? late_reply ? send_vf_control_cmd_busy_no_reply :
+			      send_vf_control_cmd_busy_and_reply :
+			      late_reply ? send_vf_control_cmd_pass_no_reply :
+			      send_vf_control_cmd_pass_and_reply);
+
+	if (late_reply)
+		xe_kunit_helper_delayed_call(test, HZ / 10,
+					     mimic_pf_handle_vf_flr_done, gt, VFUT1);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+
+	expect_not_in_flr(test);
+	expect_not_in_pause(test);
+	expect_not_in_resume(test);
+	expect_not_in_stop(test);
+	expect_not_in_mismatch(test);
+	expect_not_in_wip(test);
+}
+
+static void flr_vf_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_flr_vf(test, false, false);
+}
+
+static void flr_vf_needs_retry_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_flr_vf(test, true, false);
+}
+
+static void flr_vf_needs_retry_late_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_flr_vf(test, true, true);
+}
+
+static void flr_vf_fails_on_send(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_fail);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void flr_vf_fails_on_reset(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.vfs[VFUT1].config.sanitize,
+			      sanitize_vf_resources_fail);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void flr_vf_rejected_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_reject);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void flr_vf_unconfirmed_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, err, -ETIMEDOUT);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+}
+
+static void flr_vf_confirmed_early_continue_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, flr_starting, ARRAY_SIZE(flr_starting));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	pf_handle_vf_flr_done(gt, VFUT1);
+
+	/*
+	 * make sure SEND_START completes;
+	 * successful reply from cmd_pass_no_reply should exit mismatch state
+	 */
+	flush_work(&gt->sriov.pf.control.worker);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+}
+
+static void flr_vf_confirmed_early_reject_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, flr_starting, ARRAY_SIZE(flr_starting));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_reject);
+
+	pf_handle_vf_flr_done(gt, VFUT1);
+
+	/*
+	 * make sure SEND_START completes;
+	 * error from send_vf_control_cmd_reject should keep mismatch state
+	 */
+	flush_work(&gt->sriov.pf.control.worker);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void flr_vf_confirmed_twice_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, flr_guc_done, ARRAY_SIZE(flr_guc_done));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	pf_handle_vf_flr_done(gt, VFUT1);
+
+	/* this is fully recoverable */
+	KUNIT_EXPECT_EQ(test, 0, pf_wait_vf_wip_done(gt, VFUT1, HZ));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+}
+
+static void flr_vf_confirmed_too_late_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, flr_failed, ARRAY_SIZE(flr_failed));
+
+	pf_handle_vf_flr_done(gt, VFUT1);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void flr_vf_unsolicited_confirmation_from_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+
+	pf_handle_vf_flr_done(gt, VFUT1);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
+}
+
+static void flr_vf_wrong_confirmation_from_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, flr_waiting, ARRAY_SIZE(flr_waiting));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	pf_handle_vf_pause_done(gt, VFUT1);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+}
+
+static void flr_vf_canceled_by_restart(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_busy_wait);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	expect_not_in_flr(test);
+}
+
+static void try_stop_vf(struct kunit *test, bool mimic_busy)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
+	expect_not_stopping(test);
+	expect_not_in_pause(test);
+	expect_not_in_resume(test);
+	expect_not_in_mismatch(test);
+}
+
+static void stop_vf_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_stop_vf(test, false);
+}
+
+static void stop_vf_needs_retry_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_stop_vf(test, true);
+}
+
+static void stop_vf_refused_from(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	prepare_state_from_param(test);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
+}
+
+static void stop_vf_fails_on_send(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_fail);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
+	expect_not_stopping(test);
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void stop_vf_rejected_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_reject);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	expect_not_stopping(test);
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void stop_vf_canceled_from(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state_from_param(test);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
+}
+
+static void stop_vf_canceled_by_restart(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_busy_except_flr);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+	expect_not_in_stop(test);
+}
+
+static void stop_vf_canceled_by_flr(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_busy_except_flr);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10,
+				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+	expect_not_in_stop(test);
+}
+
+static void try_pause_vf(struct kunit *test, bool mimic_busy)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+	expect_not_pausing(test);
+	expect_not_in_mismatch(test);
+}
+
+static void pause_vf_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_pause_vf(test, false);
+}
+
+static void pause_vf_needs_retry_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_pause_vf(test, true);
+}
+
+static void pause_vf_canceled_from(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state_from_param(test);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	expect_not_in_pause(test);
+}
+
+static void pause_vf_refused_from(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	prepare_state_from_param(test);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -ECANCELED);
+
+	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
+}
+
+static void pause_vf_rejected_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_reject);
+
+	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void pause_vf_fails_on_send(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_fail);
+
+	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
+}
+
+static void pause_vf_unconfirmed_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, err, -ETIMEDOUT);
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
+}
+
+static void pause_vf_canceled_by_restart(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	expect_not_in_pause(test);
+}
+
+static void pause_vf_canceled_by_flr(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_but_reply_flr_only);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10,
+				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	expect_not_in_pause(test);
+}
+
+static void pause_vf_canceled_by_stop(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10,
+				     xe_gt_sriov_pf_control_stop_vf, gt, VFUT1);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	expect_not_in_pause(test);
+}
+
+static void try_resume_vf(struct kunit *test, bool mimic_busy)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
+	expect_not_resuming(test);
+	expect_not_in_pause(test);
+	expect_not_in_mismatch(test);
+	expect_not_in_wip(test);
+}
+
+static void resume_vf_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_resume_vf(test, false);
+}
+
+static void resume_vf_needs_retry_from(struct kunit *test)
+{
+	prepare_state_from_param(test);
+	try_resume_vf(test, true);
+}
+
+static void resume_vf_fails_on_send(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_fail);
+
+	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
+
+	expect_not_resuming(test);
+	expect_not_in_mismatch(test);
+	expect_not_in_wip(test);
+}
+
+static void resume_vf_rejected_by_guc(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_reject);
+
+	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
+
+	expect_not_resuming(test);
+	expect_not_in_wip(test);
+}
+
+static void resume_vf_canceled_from(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state_from_param(test);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
+	expect_not_resuming(test);
+}
+
+static void resume_vf_refused_from(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	int err;
+
+	prepare_state_from_param(test);
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+	KUNIT_EXPECT_NE(test, err, -EIO);
+
+	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
+			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
+}
+
+static void resume_vf_canceled_by_restart(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_busy_except_flr);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
+}
+
+static void resume_vf_canceled_by_flr(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_busy_except_flr);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10,
+				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
+}
+
+static void resume_vf_canceled_by_stop(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_busy_except_stop);
+
+	xe_kunit_helper_delayed_call(test, HZ / 10,
+				     xe_gt_sriov_pf_control_stop_vf, gt, VFUT1);
+
+	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
+	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
+}
+
+static void basic_pause_and_resume_vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_ASSERT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
+}
+
+static void basic_pause_and_stop_vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_ASSERT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+}
+
+static void basic_stop_and_flr_vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+}
+
+static void basic_flr_and_flr_vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+}
+
+static void basic_flr_vfs(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_and_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT2));
+}
+
+static struct kunit_case pf_control_test_cases[] = {
+	KUNIT_CASE(basic_pause_and_resume_vf),
+	KUNIT_CASE(basic_pause_and_stop_vf),
+	KUNIT_CASE(basic_stop_and_flr_vf),
+	KUNIT_CASE(basic_flr_and_flr_vf),
+	KUNIT_CASE(basic_flr_vfs),
+
+	KUNIT_CASE_PARAM(flr_vf_from, flr_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(flr_vf_needs_retry_from, flr_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(flr_vf_needs_retry_late_from, flr_must_pass_from_gen_params),
+	KUNIT_CASE(flr_vf_fails_on_send),
+	KUNIT_CASE(flr_vf_fails_on_reset),
+	KUNIT_CASE(flr_vf_rejected_by_guc),
+	KUNIT_CASE_SLOW(flr_vf_unconfirmed_by_guc),
+	KUNIT_CASE(flr_vf_confirmed_early_continue_by_guc),
+	KUNIT_CASE(flr_vf_confirmed_early_reject_by_guc),
+	KUNIT_CASE(flr_vf_confirmed_twice_by_guc),
+	KUNIT_CASE(flr_vf_confirmed_too_late_by_guc),
+	KUNIT_CASE(flr_vf_wrong_confirmation_from_guc),
+	KUNIT_CASE(flr_vf_unsolicited_confirmation_from_guc),
+	KUNIT_CASE(flr_vf_canceled_by_restart),
+
+	KUNIT_CASE_PARAM(stop_vf_from, stop_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(stop_vf_needs_retry_from, stop_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(stop_vf_refused_from, stop_must_fail_from_gen_params),
+	KUNIT_CASE_PARAM(stop_vf_canceled_from, stop_must_cancel_from_gen_params),
+	KUNIT_CASE(stop_vf_fails_on_send),
+	KUNIT_CASE(stop_vf_rejected_by_guc),
+	KUNIT_CASE(stop_vf_canceled_by_flr),
+	KUNIT_CASE(stop_vf_canceled_by_restart),
+
+	KUNIT_CASE_PARAM(pause_vf_from, pause_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(pause_vf_needs_retry_from, pause_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(pause_vf_refused_from, pause_must_fail_from_gen_params),
+	KUNIT_CASE_PARAM(pause_vf_canceled_from, pause_must_cancel_from_gen_params),
+	KUNIT_CASE(pause_vf_fails_on_send),
+	KUNIT_CASE(pause_vf_rejected_by_guc),
+	KUNIT_CASE_SLOW(pause_vf_unconfirmed_by_guc),
+	KUNIT_CASE(pause_vf_canceled_by_flr),
+	KUNIT_CASE(pause_vf_canceled_by_stop),
+	KUNIT_CASE(pause_vf_canceled_by_restart),
+
+	KUNIT_CASE_PARAM(resume_vf_from, resume_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(resume_vf_needs_retry_from, resume_must_pass_from_gen_params),
+	KUNIT_CASE_PARAM(resume_vf_refused_from, resume_must_fail_from_gen_params),
+	KUNIT_CASE_PARAM(resume_vf_canceled_from, resume_must_cancel_from_gen_params),
+	KUNIT_CASE(resume_vf_fails_on_send),
+	KUNIT_CASE(resume_vf_rejected_by_guc),
+	KUNIT_CASE(resume_vf_canceled_by_flr),
+	KUNIT_CASE(resume_vf_canceled_by_stop),
+	KUNIT_CASE(resume_vf_canceled_by_restart),
+
+	{}
+};
+
+static struct kunit_suite pf_control_suite = {
+	.name = "pf_control",
+	.test_cases = pf_control_test_cases,
+	.init = pf_control_test_init,
+};
+
+kunit_test_suite(pf_control_suite);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index e91c71d768ff..4863d79f72e0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <kunit/static_stub.h>
 
 #include "abi/guc_actions_sriov_abi.h"
 
@@ -196,6 +197,8 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 
 static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 {
+	KUNIT_STATIC_STUB_REDIRECT(pf_get_default_timeout, bit);
+
 	switch (bit) {
 	case XE_GT_SRIOV_STATE_FLR_WAIT_GUC:
 	case XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC:
@@ -1458,3 +1461,7 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt)
 	for (n = 1; n <= totalvfs; n++)
 		pf_enter_vf_ready(gt, n);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_pf_control_kunit.c"
+#endif
-- 
2.43.0

