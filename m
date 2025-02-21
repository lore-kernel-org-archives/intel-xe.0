Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C439C021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409010E2FB;
	Fri, 21 Feb 2025 19:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv8AdEk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB9910E2EF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 19:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740164464; x=1771700464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmHTpb3L3bu+A97wmTOIxBOgH9+GUzhn7ERsRxFsuUE=;
 b=Vv8AdEk3b0CHSYyc/ngpeqXRlRpTtwZd5O5VewyLCb7+40iH0YkEkZQ7
 Nli5vIpZX8tKLN11xkZgiPEO40+isNV4R4tLM52S5NSpgqbIYtqUJr0+6
 6HU50yDuZmlmB8vPqDnd9BbnU5cLDCAiUov+OT+C0QvAVS9Pxthyg1tmv
 wJ2QxOz1KwY9MyaHopRwvsssL8DChQrpT25iJGGkpuRvc6aj5GRS8NtYV
 hRetcb0NZMxRx36773X4YGU4oW1KCNTY04a+gfS1DCUDxSidEe3d9WOfL
 mofJOoVQ2DmWOOOJFuUQaiU2abFHs7FsDjwnFPtoL3YYG1spy73zF0OII A==;
X-CSE-ConnectionGUID: HLFtTg0vTw++Uwb7zkKjGA==
X-CSE-MsgGUID: rav8BLwWTB2G6p+R5EGFNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41257648"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41257648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:04 -0800
X-CSE-ConnectionGUID: 99WhQtVrS7SmMvjW0pOx/A==
X-CSE-MsgGUID: Sn1jyK1zTnaZPQ32I7Ojfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120549689"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.217])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:02 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/4] drm/xe/kunit: Update RTP tests with SR-IOV rules
Date: Fri, 21 Feb 2025 20:00:37 +0100
Message-Id: <20250221190038.1734-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250221190038.1734-1-michal.wajdeczko@intel.com>
References: <20250221190038.1734-1-michal.wajdeczko@intel.com>
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

Add more test cases that verifies use of RTP SRIOV() rules in
driver running as native, PF and VF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 36a3b5420fef..b21474df933e 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -45,6 +45,8 @@ struct rtp_to_sr_test_case {
 struct rtp_test_case {
 	const char *name;
 	unsigned long expected_active;
+	unsigned long expected_active_pf;
+	unsigned long expected_active_vf;
 	const struct xe_rtp_entry *entries;
 };
 
@@ -469,6 +471,89 @@ static const struct rtp_test_case rtp_cases[] = {
 	},
 };
 
+static const struct rtp_test_case sriov_cases[] = {
+	{
+		.name = "non_vf",
+		.expected_active = BIT(0) | BIT(1),
+		.expected_active_pf = BIT(0) | BIT(1),
+		.expected_active_vf = 0,
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("and"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{ XE_RTP_NAME("or"),
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_yes)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "vf_ready",
+		.expected_active = BIT(0) | BIT(1),
+		.expected_active_pf = BIT(0) | BIT(1),
+		.expected_active_vf = BIT(0) | BIT(1),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("and"),
+			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_READY)),
+			},
+			{ XE_RTP_NAME("or"),
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_yes), SRIOV(VF_READY)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "vf_only",
+		.expected_active = 0,
+		.expected_active_pf = 0,
+		.expected_active_vf = BIT(0) | BIT(1),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("and"),
+			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_ONLY)),
+			},
+			{ XE_RTP_NAME("or"),
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_yes), SRIOV(VF_ONLY)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "pf_only",
+		.expected_active = 0,
+		.expected_active_pf = BIT(0) | BIT(1),
+		.expected_active_vf = 0,
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("and"),
+			  XE_RTP_RULES(FUNC(match_yes), SRIOV(PF_ONLY)),
+			},
+			{ XE_RTP_NAME("or"),
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_yes), SRIOV(PF_ONLY)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "sriov_only",
+		.expected_active = 0,
+		.expected_active_pf = BIT(0) | BIT(1),
+		.expected_active_vf = BIT(0) | BIT(1),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("and"),
+			  XE_RTP_RULES(FUNC(match_yes), SRIOV(ONLY)),
+			},
+			{ XE_RTP_NAME("or"),
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_yes), SRIOV(ONLY)),
+			},
+			{}
+		},
+	},
+};
+
 static void xe_rtp_process_tests(struct kunit *test)
 {
 	const struct rtp_test_case *param = test->param_value;
@@ -483,7 +568,28 @@ static void xe_rtp_process_tests(struct kunit *test)
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
 	xe_rtp_process(&ctx, param->entries);
 
-	KUNIT_EXPECT_EQ(test, active, param->expected_active);
+	if (IS_SRIOV_PF(xe))
+		KUNIT_EXPECT_EQ(test, active, param->expected_active_pf);
+	else if (IS_SRIOV_VF(xe))
+		KUNIT_EXPECT_EQ(test, active, param->expected_active_vf);
+	else
+		KUNIT_EXPECT_EQ(test, active, param->expected_active);
+}
+
+static void xe_rtp_process_tests_pf(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	xe->sriov.__mode = XE_SRIOV_MODE_PF;
+	xe_rtp_process_tests(test);
+}
+
+static void xe_rtp_process_tests_vf(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	xe->sriov.__mode = XE_SRIOV_MODE_VF;
+	xe_rtp_process_tests(test);
 }
 
 static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
@@ -499,6 +605,7 @@ static void rtp_desc(const struct rtp_test_case *t, char *desc)
 }
 
 KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
+KUNIT_ARRAY_PARAM(sriov, sriov_cases, rtp_desc);
 
 static int xe_rtp_test_init(struct kunit *test)
 {
@@ -533,6 +640,9 @@ static void xe_rtp_test_exit(struct kunit *test)
 static struct kunit_case xe_rtp_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_tests, sriov_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_tests_pf, sriov_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_tests_vf, sriov_gen_params),
 	{}
 };
 
-- 
2.47.1

