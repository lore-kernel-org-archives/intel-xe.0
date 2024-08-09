Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A2CC52D7F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64E10E9A4;
	Fri,  9 Aug 2024 16:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbfEB6wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F77A10E9A4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222354; x=1754758354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d4MX3QBftJOmevi7KSFpOa4or3G794ree3jT9sxD0jY=;
 b=GbfEB6wpbIeSM5feRTi6pOsmJS6TZjtFX+D1sXZ4ABcPevDkpWTFfE0+
 tPBrkE7euqqasB9ZBDBABfGje7unT8JmpYfPVfIKqZMMXxUmjzVvRMky5
 mpYngyk+xUcS9hFDiXK0F+Fa5NZ4aYDdJJKLvu/GxsIvvdr5jNsOxsvGz
 e74CrxKfMbvgpgj1da5m9kJ9Eu2u8aloy/13KHUiddkjthBSqSw84xmde
 AvenQVaL5iMRY3yqcHp4XMnk2ncMv6niO/Opz0UX/tzwHpgWn0j3TmEDT
 LhCjT9bRADWXjBGd9wgj321hPsnxm2JV+gdGQy2fVTwRyDiMRFDmNuWRj Q==;
X-CSE-ConnectionGUID: VjMpCjsWT4ayuQQw0xclkA==
X-CSE-MsgGUID: HuVs0bhQSdunAx0tCGk2RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379461"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:34 -0700
X-CSE-ConnectionGUID: 02qUeTweSjKmvh/Zfo0REw==
X-CSE-MsgGUID: PZRq73oFSyu0LA+oOKV1lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569370"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 12/12] drm/xe/tests: Add KUnit tests for VF control GuC
 messages
Date: Fri,  9 Aug 2024 18:51:59 +0200
Message-Id: <20240809165159.662-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Add KUnit tests (~50) to cover all possible VF control messages
that could be seen by the PF, either expected or corrupted.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_control_kunit.c   | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
index 4252577b4bbd..194fcf5687d1 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
@@ -1358,3 +1358,197 @@ static struct kunit_suite pf_control_suite = {
 };
 
 kunit_test_suite(pf_control_suite);
+
+#define PREP_MSG_0_VF_STATE_NOTIFY(mbz)							\
+	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |			\
+	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |			\
+	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_DATA0, (mbz)) |				\
+	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_ACTION, GUC_ACTION_GUC2PF_VF_STATE_NOTIFY)
+
+#define PREP_MSG_VF_STATE_NOTIFY(mbz, vfid, e)						\
+	PREP_MSG_0_VF_STATE_NOTIFY(mbz),						\
+	FIELD_PREP_CONST(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID, (vfid)),		\
+	FIELD_PREP_CONST(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT, (e))
+
+static const u32 msg_pf_enable[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, 0, GUC_PF_NOTIFY_VF_ENABLE),
+};
+
+static const u32 msg_vf_flr[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FLR),
+};
+
+static const u32 msg_vf_flr_done[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FLR_DONE),
+};
+
+static const u32 msg_vf_pause_done[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_PAUSE_DONE),
+};
+
+static const u32 msg_vf_fixup[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FIXUP_DONE),
+};
+
+static const u32 msg_pf_bad_mbz[] = {
+	PREP_MSG_VF_STATE_NOTIFY(1, 0, GUC_PF_NOTIFY_VF_ENABLE),
+};
+
+static const u32 msg_pf_invalid_event[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, 0, 0),
+};
+
+static const u32 msg_pf_unknown_event[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, 0, GUC_PF_NOTIFY_VF_ENABLE + 1),
+};
+
+static const u32 msg_vf_bad_mbz[] = {
+	PREP_MSG_VF_STATE_NOTIFY(1, VFUT1, GUC_PF_NOTIFY_VF_FLR),
+};
+
+static const u32 msg_vf_bad_vfid[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFID(DUT_NUM_VFS + 1), GUC_PF_NOTIFY_VF_FLR),
+};
+
+static const u32 msg_vf_invalid_event[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, 0),
+};
+
+static const u32 msg_vf_unknown_event[] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FIXUP_DONE + 1),
+};
+
+static const u32 msg_no_data[GUC_HXG_EVENT_MSG_MIN_LEN] = {
+	PREP_MSG_0_VF_STATE_NOTIFY(0),
+	/* only header, missing both VFID and EVENT data */
+};
+
+static const u32 msg_pf_too_short[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN - 1] = {
+	PREP_MSG_0_VF_STATE_NOTIFY(0),
+	PFID,
+	/* missing EVENT data */
+};
+
+static const u32 msg_pf_too_long[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN + 1] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, 0, GUC_PF_NOTIFY_VF_ENABLE),
+	0, /* unexpected extra DATA */
+};
+
+static const u32 msg_vf_too_short[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN - 1] = {
+	PREP_MSG_0_VF_STATE_NOTIFY(0),
+	VFUT1,
+	/* missing EVENT data */
+};
+
+static const u32 msg_vf_too_long[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN + 1] = {
+	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FLR),
+	0, /* unexpected extra DATA */
+};
+
+struct msg_param {
+	const char *name;
+	const u32 *msg;
+	size_t len;
+};
+
+static void msg_param_get_desc(struct msg_param *p, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->name);
+}
+
+#define MAKE_MSG_PARAM(X) { .name = #X, .msg = X, .len = ARRAY_SIZE(X) }
+
+#define LIST_MSG_PARAM_VALID			\
+	MAKE_MSG_PARAM(msg_pf_enable),		\
+	MAKE_MSG_PARAM(msg_vf_flr),		\
+	MAKE_MSG_PARAM(msg_vf_flr_done),	\
+	MAKE_MSG_PARAM(msg_vf_pause_done),	\
+	MAKE_MSG_PARAM(msg_vf_fixup)
+
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
+
+static struct msg_param valid_messages[] = {
+	LIST_MSG_PARAM_VALID,
+};
+
+static struct msg_param invalid_messages[] = {
+	LIST_MSG_PARAM_INVALID,
+};
+
+static struct msg_param all_messages[] = {
+	LIST_MSG_PARAM_VALID,
+	LIST_MSG_PARAM_INVALID,
+};
+
+KUNIT_ARRAY_PARAM(valid_messages, valid_messages, msg_param_get_desc);
+KUNIT_ARRAY_PARAM(invalid_messages, invalid_messages, msg_param_get_desc);
+KUNIT_ARRAY_PARAM(all_messages, all_messages, msg_param_get_desc);
+
+static void xe_rejects_all_g2h(struct kunit *test)
+{
+	struct xe_device *xe = (xe_kunit_helper_xe_device_test_init(test), test->priv);
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	const struct msg_param *p = test->param_value;
+
+	KUNIT_EXPECT_FALSE(test, IS_SRIOV_PF(xe));
+	KUNIT_EXPECT_EQ(test, -EPROTO, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
+}
+
+static void vf_rejects_all_g2h(struct kunit *test)
+{
+	struct xe_device *xe = (xe_kunit_helper_xe_device_test_init(test), test->priv);
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	const struct msg_param *p = test->param_value;
+
+	KUNIT_EXPECT_FALSE(test, IS_SRIOV(xe));
+	xe->sriov.__mode = XE_SRIOV_MODE_VF;
+
+	KUNIT_EXPECT_TRUE(test, IS_SRIOV_VF(xe));
+	KUNIT_EXPECT_EQ(test, -EPROTO, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
+}
+
+static void pf_rejects_malformed_g2h(struct kunit *test)
+{
+	struct xe_gt *gt = (pf_control_test_init(test), test->priv);
+	const struct msg_param *p = test->param_value;
+
+	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
+}
+
+static void pf_accepts_valid_g2h(struct kunit *test)
+{
+	struct xe_gt *gt = (pf_control_test_init(test), test->priv);
+	const struct msg_param *p = test->param_value;
+
+	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
+			      send_vf_control_cmd_pass_no_reply);
+
+	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
+}
+
+static struct kunit_case pf_control_guc_test_cases[] = {
+	KUNIT_CASE_PARAM(xe_rejects_all_g2h, all_messages_gen_params),
+	KUNIT_CASE_PARAM(vf_rejects_all_g2h, all_messages_gen_params),
+	KUNIT_CASE_PARAM(pf_rejects_malformed_g2h, invalid_messages_gen_params),
+	KUNIT_CASE_PARAM(pf_accepts_valid_g2h, valid_messages_gen_params),
+	{}
+};
+
+static struct kunit_suite pf_control_guc_suite = {
+	.name = "pf_control_guc",
+	.test_cases = pf_control_guc_test_cases,
+};
+
+kunit_test_suite(pf_control_guc_suite);
-- 
2.43.0

