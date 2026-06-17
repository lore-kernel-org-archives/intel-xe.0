Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32497CD98F7
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D543D10F0F0;
	Wed, 17 Jun 2026 19:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG6xATPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC7710F0EB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781724395; x=1813260395;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=OMg1F7aAeOGjvfaetV+w4wrNI7F2tR/faeq1eh95+Ok=;
 b=cG6xATPPAq4krQ89GJSJHi6bJRQsiXOg3LBlLQUIekeMkZqgGMIEJLfm
 hu8CS7jQ6FFLhzE4q1OFzqsCXNiZNwiOi7GoMfamTrUd3hk6W5azyzCDJ
 CEEVwgfORgC847ZxPNxjyt3UUHK3WyS3gmkcbsUj4mjQihgYf/jFeOGqw
 4K0qm9BLZRZYfGn1wK3MZJFhkH+mzOwOvOy/k3G8I+tZcvgjkfP0X1dYU
 bjvTp/r0oDrrBiqaP9a5f3zxUrk7dSDJoOf/FaRkdJ18AzTUJBai4efiS
 eINU1o0lpNzuPvo7hjHwYm7lGdyQDTGjrLA42OSE1ysn9XnlMJomZb9B3 g==;
X-CSE-ConnectionGUID: qND+Gj25SdywD8Fng8E3zA==
X-CSE-MsgGUID: PL1WJkRaQJGwQYENjiwhjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105339758"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="105339758"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:47 -0700
X-CSE-ConnectionGUID: TZmPkc3bQoympMfn18EzMQ==
X-CSE-MsgGUID: UZELwzCXSeaQ0r8bB1scfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="278347310"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 17 Jun 2026 12:24:49 -0700
Subject: [PATCH v2 5/5] drm/xe/rtp: Add kunit tests to exercise
 FIELD_SET_FUNC action
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rtp_with_dynamic_vals-v2-5-3f4cb34c2ea1@intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=OMg1F7aAeOGjvfaetV+w4wrNI7F2tR/faeq1eh95+Ok=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMvS3SGtvk20FfetxE/kpAgRJxgNic+ka1miSO
 uym9eQPFKWJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajL0twAKCRBNeSQFyHKQ
 BMNAD/91szlYoELbneinWYVHZYOv9+FPd80W/4b4hFU0DPNTOmekZkkLhCkR06jYqa/sN5oe0sh
 eiLsPA2f0sfZNaRjZya0mYExF+wc8TqlJepm6JH2doqjRaUqYADI4tkJAsYpbIOKAaqMY9yYblz
 rHap9iP8sqXzWoala7qx1LlYbWufDAkXf1zHdlanUqQe4XWeDzOUISvKZUzS9dwUZRI66+sJ2ZF
 2zwUJ0FKQNnW4bRhaOKH7nyD6FGd1DtbrC1QwfWWdUfmZU8MZIJAFuloYCojVxWTJKMVMf8Nwt7
 aAu2rUiZhmXa/TyTYeS8mzekTYOyjt05wL7W6SJ/cgNnOO8phwL798RSkJYc/CMv5ksy1hfEhwC
 JZcjcd0g60XOUKEmSoJNqLwuHSntHxfwvngExV9OcoPSytjqtJSOvXMLqgHaQ/2APbTGrj5TWuQ
 5tqqJKoSwmpR117V9U4svpVOmxfPdhoJvyhQuKNxEwxiEvuVpHrwdAt97i9zGM4EFIJMtaXE5rC
 rfySwUkoU3ilhBj4rj4S9IyWoeLmQpDeeREGJOmvH2YSjjCeqN/wjUo6+07JYKwv6IHtGRwDVKB
 hLp2+cRYWIzCp/ikzLCneX8BztWX/uvUXnH8/Ku5T4f06EU2jJCfigwexrJWlPyqicKaObhQycZ
 UxGNh/WZJ/PIR8Q==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Add a couple additional tests to the RTP kunit suite that ensure
FIELD_SET_FUNC() actions are evaluated properly and the values properly
consolidate/conflict with values coming from other literal SET/FIELD_SET
rules.

Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 3d0688d058d9..367811621880 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -280,6 +280,11 @@ static void xe_rtp_rules_tests(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, err, param->expected_err);
 }
 
+static u32 bits_2_3_set(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	return REG_BIT(2) | REG_BIT(3);
+}
+
 static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 	{
 		.name = "coalesce-same-reg",
@@ -300,6 +305,29 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 			},
 		),
 	},
+	{
+		.name = "coalesce-same-reg-literal-and-func",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2) | REG_BIT(3),
+		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2) | REG_BIT(3),
+		.expected_active = BIT(0) | BIT(1),
+		.expected_count_sr_entries = 1,
+		/* Different bits on the same register: create a single entry */
+		.table = XE_RTP_TABLE_SR(
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
+						   REG_BIT(0) | REG_BIT(1),
+						   REG_BIT(0) | REG_BIT(1)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(FIELD_SET_FUNC(REGULAR_REG1,
+							REG_BIT(2) | REG_BIT(3),
+							bits_2_3_set))
+			},
+		),
+	},
 	{
 		.name = "no-match-no-add",
 		.expected_reg = REGULAR_REG1,
@@ -417,6 +445,30 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 			},
 		),
 	},
+	{
+		.name = "conflict-not-disjoint-literal-and-func",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(1) | REG_BIT(2),
+		.expected_clr_bits = REG_BIT(1) | REG_BIT(2),
+		.expected_active = BIT(0) | BIT(1),
+		.expected_count_sr_entries = 1,
+		.expected_sr_errors = 1,
+		.table = XE_RTP_TABLE_SR(
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
+						   REG_BIT(1) | REG_BIT(2),
+						   REG_BIT(1) | REG_BIT(2)))
+			},
+			/* drop: bits are not disjoint with previous entries */
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(FIELD_SET_FUNC(REGULAR_REG1,
+							REG_BIT(2) | REG_BIT(3),
+							bits_2_3_set))
+			},
+		),
+	},
 	{
 		.name = "conflict-reg-type",
 		.expected_reg = REGULAR_REG1,

-- 
2.54.0

