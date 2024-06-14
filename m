Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4302C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5507010E2AC;
	Fri, 14 Jun 2024 21:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiSV8KQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9423F10E2E0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401726; x=1749937726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1uSdkghU0qaaesVR5ho3rBzvMVaxlMQpcyGM1lakh8g=;
 b=jiSV8KQFcYXCtg84LihtWljTLC3RYQXy0HjAQ+cUCRwfSesFyX0MiPyS
 XRnebD6C8Ym1o6jrdyhIVPFowfiMWplbYHgJvT9e8A/WI4XEUvax3DHnb
 vKm8WbFQ6Sft9ZGAl23cplYOltsiLnb1iQAvBec9xrw6zY0SGTsZYF7xH
 z+sSeOYxXJ529PVi+nIYmxSYaPuvkOMpjXAyaWMz13XJ5GtkBfqkHMXS5
 8XNdyOZhG47qFrUWrNR+zbgwdNtZsC3DYtaUpY/yjp7qigiEtQBmg2LjD
 BJDlm28XcsEsZ3We9dU7edr76HehpoEE6eWs9DulEyVUpFC/XqzbW5oh+ Q==;
X-CSE-ConnectionGUID: CNHQyFYDTTWZBvICQXiz3g==
X-CSE-MsgGUID: 6kXsQKm2QiC1WUOu1TtphA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26728568"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="26728568"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:48:46 -0700
X-CSE-ConnectionGUID: ypcgaEs+QLCIiFlEt9gjcw==
X-CSE-MsgGUID: POnEdXqLTraPKokoQYm7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40579339"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:48:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe/kunit: Update RTP test to check VF rules
Date: Fri, 14 Jun 2024 23:48:21 +0200
Message-Id: <20240614214821.2252-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240614214821.2252-1-michal.wajdeczko@intel.com>
References: <20240614214821.2252-1-michal.wajdeczko@intel.com>
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

Add basic test cases that will verify VF_READY and VF_ONLY rules.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 118 ++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 06759d754783..0d8731e13217 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -232,6 +232,109 @@ static const struct rtp_test_case cases[] = {
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
+			  XE_RTP_RULES(FUNC(match_yes), VF_READY),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
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
+			  XE_RTP_RULES(FUNC(match_yes), VF_ONLY),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
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
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes), VF_READY),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
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
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes), VF_ONLY),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
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
+			  XE_RTP_RULES(FUNC(match_yes), VF_READY),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes), VF_ONLY),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+			},
+			{}
+		},
+	},
 };
 
 static void xe_rtp_process_tests(struct kunit *test)
@@ -254,19 +357,31 @@ static void xe_rtp_process_tests(struct kunit *test)
 		count++;
 	}
 
-	KUNIT_EXPECT_EQ(test, count, param->expected_count);
+	KUNIT_ASSERT_EQ(test, count, param->expected_count);
+	if (!param->expected_count)
+		return;
+	KUNIT_ASSERT_NOT_NULL(test, sr_entry);
 	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
 	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
 	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
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
@@ -300,6 +415,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 
 static struct kunit_case xe_rtp_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_vf_tests, rtp_vf_gen_params),
 	{}
 };
 
-- 
2.43.0

