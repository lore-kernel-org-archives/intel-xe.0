Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57D8C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5488110E1C8;
	Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afRKa7Iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB7310E1C8
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 05:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718686856; x=1750222856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8AJIN4zRCnH3Zm0m+36sUxQgOSprI/lFLVZQwLr8Cvw=;
 b=afRKa7IwnbUOnx302u4qZHwfgqzUnESZdTh8ZDuoP5dJ78A6/bYN6GKl
 HEvunoNI4UrZsEP/7/HmjNm1pYFb7KEZPqhKzhI/xAgPnRRoYDoh0DmfL
 gL5PVzTvXWkQEDJSrD2nbbG+TuA4mUHMUumvWeNBa0sPXqfrLMH8sxslp
 jIpIenc4Ky48O3CWPnmALAkpjwfFffwYv3+E7wKPgkrZBHFuWs2TeKPRO
 r7h2CIlt17kfo6Xvhetj7JbmVpoGOfUflfvKYmUkOII61IDyZwkOvA6Dm
 mWVGrEzO7wXCC7f2i95ggaSIGq9EVmA/eWkSf1RgLn3/2teptAOL3fI9R A==;
X-CSE-ConnectionGUID: haxBmpqgQ0Ws0xewzEGxXA==
X-CSE-MsgGUID: gOER6ljsT3GIUty9zgUOeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256602"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15256602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:55 -0700
X-CSE-ConnectionGUID: dthBBFQKRaODsO/ah2tOIA==
X-CSE-MsgGUID: 38IcZFCQRI60L37cHGUo/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41537741"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/5] drm/xe/rtp: Allow to OR rules
Date: Mon, 17 Jun 2024 22:00:42 -0700
Message-ID: <20240618050044.324454-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618050044.324454-1-lucas.demarchi@intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
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

Some workarounds started to depend on different set of conditions where
the action should be applied if any of them match. See e.g.
commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup Wa_14020756599"). Add
XE_RTP_MATCH_OR that allows to implement a logical OR for the rules.
Normal precedence applies:

	r1, r2, OR, r3

means

	(r1 AND r2) OR r3

The check is shortcut as soon as a set of conditions match.

v2: Do not match on empty number of rules-other-than-OR evaluated

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 53 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            | 30 +++++++++++++--
 drivers/gpu/drm/xe/xe_rtp.h            | 21 ++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h      |  1 +
 4 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 474a0b222ce1..f217445c246a 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -90,6 +90,59 @@ static const struct rtp_test_case cases[] = {
 			{}
 		},
 	},
+	{
+		.name = "match-or",
+		.expected_reg = REGULAR_REG1,
+		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
+		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
+		.expected_count = 1,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("first"),
+			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("middle"),
+			  XE_RTP_RULES(FUNC(match_no), FUNC(match_no), OR,
+				       FUNC(match_yes), OR,
+				       FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+			},
+			{ XE_RTP_NAME("last"),
+			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
+			},
+			{ XE_RTP_NAME("no-match"),
+			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "match-or-xfail",
+		.expected_reg = REGULAR_REG1,
+		.expected_count = 0,
+		.entries = (const struct xe_rtp_entry_sr[]) {
+			{ XE_RTP_NAME("leading-or"),
+			  XE_RTP_RULES(OR, FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("trailing-or"),
+			  /*
+			   * First condition is match_no, otherwise the failure
+			   * wouldn't really trigger as RTP stops processing as
+			   * soon as it has a matching set of rules
+			   */
+			  XE_RTP_RULES(FUNC(match_no), OR),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+			},
+			{ XE_RTP_NAME("no-or-or-yes"),
+			  XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
+			},
+			{}
+		},
+	},
 	{
 		.name = "no-match-no-add-multiple-rules",
 		.expected_reg = REGULAR_REG1,
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index eff1c9c2f5cc..dc315b8aae07 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -35,11 +35,18 @@ static bool rule_matches(const struct xe_device *xe,
 			 unsigned int n_rules)
 {
 	const struct xe_rtp_rule *r;
-	unsigned int i;
+	unsigned int i, rcount = 0;
 	bool match;
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
 		switch (r->match_type) {
+		case XE_RTP_MATCH_OR:
+			/*
+			 * This is only reached if a complete set of
+			 * rules passed or none were evaluated. For both cases,
+			 * shortcut the other rules and return the proper value.
+			 */
+			goto done;
 		case XE_RTP_MATCH_PLATFORM:
 			match = xe->info.platform == r->platform;
 			break;
@@ -102,10 +109,27 @@ static bool rule_matches(const struct xe_device *xe,
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
+
+			rcount = 0;
+		} else {
+			rcount++;
+		}
 	}
 
+done:
+	if (drm_WARN_ON(&xe->drm, !rcount))
+		return false;
+
 	return true;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 904c5156a7b1..bd5b5ba0fb31 100644
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

