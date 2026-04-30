Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8BCCD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84D10F462;
	Thu, 30 Apr 2026 20:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7xLYI4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E25610F457
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580498; x=1809116498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Ani7llusDWuDAdn9mLZwn9CqmODMkWIvmgXHIvW60Ic=;
 b=L7xLYI4CQssGYpi+W3xDds3BGaqzCgbZ9vBlvQAhUzgnRzUIlXTWlEDv
 dX3038++Rz36LUszhXW6n/SiaNOIP4e1AUwzHUs7QHVKOgV8ePjXKXmby
 FORhYrpnJtWUFM9idI8IYsR9oxH9JsbCZU2sJ4k2OSX8WpByMDbYLLXaV
 bx++IXnE0pyOLKhwrMUxMLTdMsj8uS5bVyNQdQdeOF33x2XZubP//4VZn
 BB1BV7KscdPNaPUv/qaw+ZD/7ubrQkSrSmmvR/MLeWBnd4i9jj6thUb/I
 LcraR373FXFkgyRm7U0UKgaeFNGhQQ8cPc8c4NmhScLSymBLCFCqDnhFC w==;
X-CSE-ConnectionGUID: tYOEpqlSSQy1FSyAoo5w3g==
X-CSE-MsgGUID: 2X6XYMN6Sryl86fENuAbwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150896"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:38 -0700
X-CSE-ConnectionGUID: bYmenyagShSt0dv1+wTT9w==
X-CSE-MsgGUID: FBc93BLTTPyGU3kM4lOmRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030502"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:37 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:03 -0300
Subject: [PATCH v2 2/7] drm/xe/rtp: Drop rule matching cases from
 rtp_to_sr_cases and rtp_cases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-rtp-rule-parser-v2-2-157e98b4ab51@intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
In-Reply-To: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

The kunit test cases for the RTP framework are currently separated into
three groups:

(1) rtp_rules_cases:
    Those to verify rule matching logic.

(2) rtp_to_sr_cases:
    Those to verify generation of save/restore tables from RTP tables.

(3) rtp_cases
    Those to verify processing of RTP tables without save/restore action
    associated, which are used for OOB workarounds.

Today we have some cases in (2) and (3) that are actually meant to
verify rule matching logic.  Now that we have (1), let's cleanup (2)
and (3) so that they become focused on their main objectives.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 122 ++-------------------------------
 1 file changed, 6 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 7df8f7857c49..7dce699991a1 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -234,80 +234,6 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 			{}
 		},
 	},
-	{
-		.name = "match-or",
-		.expected_reg = REGULAR_REG1,
-		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
-		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
-		.expected_active = BIT(0) | BIT(1) | BIT(2),
-		.expected_count_sr_entries = 1,
-		.entries = (const struct xe_rtp_entry_sr[]) {
-			{ XE_RTP_NAME("first"),
-			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
-			},
-			{ XE_RTP_NAME("middle"),
-			  XE_RTP_RULES(FUNC(match_no), FUNC(match_no), OR,
-				       FUNC(match_yes), OR,
-				       FUNC(match_no)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
-			},
-			{ XE_RTP_NAME("last"),
-			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
-			},
-			{ XE_RTP_NAME("no-match"),
-			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
-			},
-			{}
-		},
-	},
-	{
-		.name = "match-or-xfail",
-		.expected_reg = REGULAR_REG1,
-		.expected_count_sr_entries = 0,
-		.entries = (const struct xe_rtp_entry_sr[]) {
-			{ XE_RTP_NAME("leading-or"),
-			  XE_RTP_RULES(OR, FUNC(match_yes)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
-			},
-			{ XE_RTP_NAME("trailing-or"),
-			  /*
-			   * First condition is match_no, otherwise the failure
-			   * wouldn't really trigger as RTP stops processing as
-			   * soon as it has a matching set of rules
-			   */
-			  XE_RTP_RULES(FUNC(match_no), OR),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
-			},
-			{ XE_RTP_NAME("no-or-or-yes"),
-			  XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_yes)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
-			},
-			{}
-		},
-	},
-	{
-		.name = "no-match-no-add-multiple-rules",
-		.expected_reg = REGULAR_REG1,
-		.expected_set_bits = REG_BIT(0),
-		.expected_clr_bits = REG_BIT(0),
-		.expected_active = BIT(0),
-		.expected_count_sr_entries = 1,
-		/* Don't coalesce second entry due to one of the rules */
-		.entries = (const struct xe_rtp_entry_sr[]) {
-			{ XE_RTP_NAME("basic-1"),
-			  XE_RTP_RULES(FUNC(match_yes)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
-			},
-			{ XE_RTP_NAME("basic-2"),
-			  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
-			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
-			},
-			{}
-		},
-	},
 	{
 		.name = "two-regs-two-entries",
 		.expected_reg = REGULAR_REG1,
@@ -536,33 +462,15 @@ static const struct rtp_test_case rtp_cases[] = {
 		},
 	},
 	{
-		.name = "inactive-1st_or_active-inactive",
+		.name = "inactive-active-inactive",
 		.expected_active = BIT(1),
 		.entries = (const struct xe_rtp_entry[]) {
 			{ XE_RTP_NAME("r1"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
-			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_yes), OR,
-				       FUNC(match_no), OR,
-				       FUNC(match_no)) },
-			{ XE_RTP_NAME("r3"),
-			  XE_RTP_RULES(FUNC(match_no)),
-			},
-			{}
-		},
-	},
-	{
-		.name = "inactive-2nd_or_active-inactive",
-		.expected_active = BIT(1),
-		.entries = (const struct xe_rtp_entry[]) {
-			{ XE_RTP_NAME("r1"),
-			  XE_RTP_RULES(FUNC(match_no)),
+			{ XE_RTP_NAME("r2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
 			},
-			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_no), OR,
-				       FUNC(match_yes), OR,
-				       FUNC(match_no)) },
 			{ XE_RTP_NAME("r3"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
@@ -570,33 +478,15 @@ static const struct rtp_test_case rtp_cases[] = {
 		},
 	},
 	{
-		.name = "inactive-last_or_active-inactive",
-		.expected_active = BIT(1),
+		.name = "inactive-inactive-inactive",
+		.expected_active = 0,
 		.entries = (const struct xe_rtp_entry[]) {
 			{ XE_RTP_NAME("r1"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
-			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_no), OR,
-				       FUNC(match_no), OR,
-				       FUNC(match_yes)) },
-			{ XE_RTP_NAME("r3"),
-			  XE_RTP_RULES(FUNC(match_no)),
-			},
-			{}
-		},
-	},
-	{
-		.name = "inactive-no_or_active-inactive",
-		.expected_active = 0,
-		.entries = (const struct xe_rtp_entry[]) {
-			{ XE_RTP_NAME("r1"),
+			{ XE_RTP_NAME("r2"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
-			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_no), OR,
-				       FUNC(match_no), OR,
-				       FUNC(match_no)) },
 			{ XE_RTP_NAME("r3"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},

-- 
2.53.0

