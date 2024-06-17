Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E433C2BC81
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E54910E4B6;
	Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYQnDS1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068410E4B7
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648735; x=1750184735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aujCLNtiKtExp9BZtLX+gdVudFMCpzWN/2MRG3gRoPs=;
 b=TYQnDS1yq5HlWKMXoRDcVWjVYAIm2moBNbOL2btwFo/tiEC0b08GG497
 Nf3Jt92T/kOzZ5uJTIXqvymsmpYDNKRGnCbD5tlFEyFVgvw+1t/mbhqGk
 R6w0kCw8IvWXiERrlCror71mWQNU1g1aOBXiz3NGWDeTjqQ6Y737vaNfz
 TRmH61j6o0sXxjYoRMbTzqh4L4KoU3N7liD1XO6Nfi8RYjYchrNEFHslC
 jKghExzsA20DbLLK/FQmNudH2F5AVMH3N0O22lkalqC9MqOU1/I58GMQf
 dreGpbaV/BPIwrcl3mAZq9q20lOF2VnjhATNYv/NUHuiV9cFwNhVMtj08 g==;
X-CSE-ConnectionGUID: UnpTeHd3R5mWLErV6zTWUQ==
X-CSE-MsgGUID: pkssMf5yQbK016Auw8Ig/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19276231"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19276231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:35 -0700
X-CSE-ConnectionGUID: sfIiej0gQbabFqaQj2SAPA==
X-CSE-MsgGUID: BNpgEbulTn2PjyJHOTqgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45642436"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/5] drm/xe/rtp: Allow to OR rules
Date: Mon, 17 Jun 2024 11:25:15 -0700
Message-ID: <20240617182518.280975-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617182518.280975-1-lucas.demarchi@intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
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

Some workarounds started to depend in different set of conditions where
the action should be applied if any of them match. See e.g.
commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup Wa_14020756599"). Add
XE_RTP_MATCH_OR that allows to implement a logical OR for the rules.
Normal precedence applies:

	r1, r2, OR, r3

means

	(r1 AND r2) OR r3

The check is shortcut as soon as a set of conditions match.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 54 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            | 20 +++++++++-
 drivers/gpu/drm/xe/xe_rtp.h            | 21 ++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h      |  1 +
 4 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 474a0b222ce1..bf7fee9b20cc 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -90,6 +90,60 @@ static const struct rtp_test_case cases[] = {
 			{}
 		},
 	},
+	{
+		.name = "match-or-first",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("first"),
+			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-or-last",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("last"),
+			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-or-empty",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("empty-matches-ok"),
+			  XE_RTP_RULES(OR, FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-or-none",
+		.expected_reg = REGULAR_REG1,
+		.expected_count = 0,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("none"),
+			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{}
+		},
+	},
 	{
 		.name = "no-match-no-add-multiple-rules",
 		.expected_reg = REGULAR_REG1,
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index eff1c9c2f5cc..66ca58fa5739 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -40,6 +40,13 @@ static bool rule_matches(const struct xe_device *xe,
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
 		switch (r->match_type) {
+		case XE_RTP_MATCH_OR:
+			/*
+			 * This is only reached if a complete set of required
+			 * rules passed, so return success: the remaining rules
+			 * do not matter
+			 */
+			return true;
 		case XE_RTP_MATCH_PLATFORM:
 			match = xe->info.platform == r->platform;
 			break;
@@ -102,8 +109,17 @@ static bool rule_matches(const struct xe_device *xe,
 			match = false;
 		}
 
-		if (!match)
-			return false;
+		if (!match) {
+			/*
+			 * Advance rules until we find XE_RTP_MATCH_OR to check
+			 * if there's another set of conditions to check
+			 */
+			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
+				;
+
+			if (i >= n_rules)
+				return false;
+		}
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 337b1ef1959c..5a6b112a8be6 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -179,6 +179,27 @@ struct xe_reg_sr;
 #define XE_RTP_RULE_IS_DISCRETE							\
 	{ .match_type = XE_RTP_MATCH_DISCRETE }
 
+/**
+ * XE_RTP_RULE_OR - Create an OR condition for rtp rules
+ *
+ * RTP rules are AND'ed when evaluated and all of them need to match.
+ * XE_RTP_RULE_OR allows to create set of rules where any of them matching is
+ * sufficient for the action to trigger. Example:
+ *
+ * .. code-block:: c
+ *
+ *	const struct xe_rtp_entry_sr entries[] = {
+ *		...
+ *		{ XE_RTP_NAME("test-entry"),
+ *		  XE_RTP_RULES(PLATFORM(DG2), OR, PLATFORM(TIGERLAKE)),
+ *		  ...
+ *		},
+ *		...
+ *	};
+ */
+#define XE_RTP_RULE_OR								\
+	{ .match_type = XE_RTP_MATCH_OR }
+
 /**
  * XE_RTP_ACTION_WR - Helper to write a value to the register, overriding all
  *                    the bits
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 637acc7626a4..10150bc22ccd 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -51,6 +51,7 @@ enum {
 	XE_RTP_MATCH_ENGINE_CLASS,
 	XE_RTP_MATCH_NOT_ENGINE_CLASS,
 	XE_RTP_MATCH_FUNC,
+	XE_RTP_MATCH_OR,
 };
 
 /** struct xe_rtp_rule - match rule for processing entry */
-- 
2.43.0

