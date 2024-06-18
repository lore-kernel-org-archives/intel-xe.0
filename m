Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C4C2BA1A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 22:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A683810E7DD;
	Tue, 18 Jun 2024 22:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OF2CxNvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E4C10E7DC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 22:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718748046; x=1750284046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQV7Z7xzrMr0KzzYoYkdIYIJKKZN7sdmtJ5/iU5J/7s=;
 b=OF2CxNvMrQSV0tAAQN2HaW7zs3nlxkJEWWa/SEsDLZqeTARM0E/iBMzi
 JC1u5sE3xpDz9HV2ETl/oa9N0cS6ZrKHsL1/AVIvPL0ll4k5bUYhZpEus
 c6Cvy8evDA3e/i/EwtOn2P1C/WnD9n7aDOgA4dRGOYjwouWoSypOzZCuQ
 orYq4JK/NqMGGl1TYxH7XRr7y0JocuclfdYzVEvZG6BroxdI+aUL5W9Wt
 I3cTOl/howPZ6kR/3d4seKNeAM3dGCHxYVVAVl57fXDJ1P678OTDfr2ci
 somn+B/jBZ0K0uyoMKByNU34AXKeqzNzOzQllRVO2sRxhF9KMGX1r/IsS w==;
X-CSE-ConnectionGUID: TdxBBt2USby4zgyjIBQ/3Q==
X-CSE-MsgGUID: rhmhWQfCSA68liwOrYQItw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15801661"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15801661"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:00:46 -0700
X-CSE-ConnectionGUID: TNZVHvoPSZCAYO5oK+8HsA==
X-CSE-MsgGUID: 5ZYSmWIfSxyx7XP4eFCctg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41794428"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:00:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/2] drm/xe/kunit: Update RTP test to check VF flags
Date: Wed, 19 Jun 2024 00:00:26 +0200
Message-Id: <20240618220026.773-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240618220026.773-1-michal.wajdeczko@intel.com>
References: <20240618220026.773-1-michal.wajdeczko@intel.com>
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

Add basic test cases that will verify VF_READY and VF_ONLY entries.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 119 +++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index f217445c246a..7ebf048d706b 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -285,6 +285,115 @@ static const struct rtp_test_case cases[] = {
 			{}
 		},
 	},
+	{
+		.name = "vf-ready",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		/* VF-ready does not impact native/PF */
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0))),
+			  XE_RTP_ENTRY_FLAG(VF_READY),
+			},
+			{}
+		},
+	},
+	{
+		.name = "vf-only",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(1),
+		.expected_clr_bits = REG_BIT(1),
+		.expected_count = 1,
+		/* VF-only is n/a for native/PF */
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0))),
+			  XE_RTP_ENTRY_FLAG(VF_ONLY),
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1))),
+			},
+			{}
+		},
+	},
+};
+
+static const struct rtp_test_case vf_cases[] = {
+	{
+		.name = "no-vf-no-match",
+		.expected_reg = REGULAR_REG1,
+		.expected_count = 0,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-vf-ready",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(1),
+		.expected_clr_bits = REG_BIT(1),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0))),
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1))),
+			  XE_RTP_ENTRY_FLAG(VF_READY),
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-vf-only",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(1),
+		.expected_clr_bits = REG_BIT(1),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0))),
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1))),
+			  XE_RTP_ENTRY_FLAG(VF_ONLY),
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-any-vf",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0) | REG_BIT(1),
+		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0))),
+			  XE_RTP_ENTRY_FLAG(VF_READY),
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1))),
+			  XE_RTP_ENTRY_FLAG(VF_ONLY),
+			},
+			{}
+		},
+	},
 };
 
 static void xe_rtp_process_tests(struct kunit *test)
@@ -319,12 +428,21 @@ static void xe_rtp_process_tests(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
 }
 
+static void xe_rtp_process_vf_tests(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	xe->sriov.__mode = XE_SRIOV_MODE_VF;
+	xe_rtp_process_tests(test);
+}
+
 static void rtp_desc(const struct rtp_test_case *t, char *desc)
 {
 	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
 KUNIT_ARRAY_PARAM(rtp, cases, rtp_desc);
+KUNIT_ARRAY_PARAM(rtp_vf, vf_cases, rtp_desc);
 
 static int xe_rtp_test_init(struct kunit *test)
 {
@@ -358,6 +476,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 
 static struct kunit_case xe_rtp_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_vf_tests, rtp_vf_gen_params),
 	{}
 };
 
-- 
2.43.0

