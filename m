Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4008ECD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0135810E21C;
	Fri, 22 May 2026 08:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnT+3UpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F1610F4FD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779439568; x=1810975568;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=K5Uz8f7D5TQNPAId40yojEBait6n9d7YQjSDtpEm5Cw=;
 b=LnT+3UpU4GGxnq7FHyHrf58ZHa8wCeK59HckZAxtnRZMav6bKrAHjXGm
 7zy6v63NeF0jvFr9HqJK3HHVZ1pvdb7xYR33MlXhbZBXK8GzryAF9I7JG
 vpUaV91sBWXV2WpNaGMMxlzx5D2q5vC1eZPrNsWrIoD98pr9JrG6GCmCq
 RqyDrMvvuLTaG9UvAWh0TNI0Jbu5zzrT0IDltpIkma8/7ol9VemUGyjJ6
 BYnNXQBgCPJn47BLqei5i25j2UM4pTtC2L6EFeRexDNFeex0I/kXJyfy9
 b3/7gJrX+JfpY9dKSoeXHZOGrAWdnpChOjYV9HmNoGLhhiQU22SWF9L5w g==;
X-CSE-ConnectionGUID: GEuj8LuUTp2Ain4YjTDfzw==
X-CSE-MsgGUID: aVbnrI3iQHarOgYh+kFWag==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80220419"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80220419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:08 -0700
X-CSE-ConnectionGUID: NyAke60BQg+5Ts076Me9DQ==
X-CSE-MsgGUID: Qkk7y6gWROWA7PudYmnTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264679516"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.24])
 ([10.124.223.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:06 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 22 May 2026 05:45:22 -0300
Subject: [PATCH v3 7/7] drm/xe/rtp: Implement a structured parser for rule
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rtp-rule-parser-v3-7-0c51039899f4@intel.com>
References: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
In-Reply-To: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Violet Monti <violet.monti@intel.com>
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

The current unwritten grammar for RTP rules is as follows:

          rules = disjunction;
    disjunction = conjunction, { "OR", conjunction };
    conjunction = single_rule, { single_rule };
    			   (* the AND operator is implicit *)
    single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
                    FUNC(...), etc ?

While rule_matches() currently works for the grammar above, it doesn't
easily resemble it.  Let's replace it with an implementation that is
structured in a way to resemble the grammar.

Such a new implementation, although a bit more verbose, is arguably
easier to reason about and to adapt to any extension we do to the
grammer in the future.

Also take this opportunity to update the kernel-doc for XE_RTP_RULES()
to include the grammar, so that it is not unwritten anymore.

v2:
  - Include the grammar in the code documentation. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Violet Monti <violet.monti@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 138 ++++++++++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_rtp.h |  29 ++++++++--
 2 files changed, 113 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 976a2e1f5592..dec9d94e6fb0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -30,11 +30,28 @@ static bool has_samedia(const struct xe_device *xe)
 	return xe->info.media_verx100 >= 1300;
 }
 
-static bool rule_match_item(const struct xe_device *xe,
-			    struct xe_gt *gt,
-			    struct xe_hw_engine *hwe,
-			    const struct xe_rtp_rule *r)
+struct rule_match_ctx {
+	const struct xe_device *xe;
+	struct xe_gt *gt;
+	struct xe_hw_engine *hwe;
+	const struct xe_rtp_rule *rules;
+	const unsigned int n_rules;
+	unsigned int head;
+	int err;
+};
+
+static bool rule_is_item(const struct xe_rtp_rule *r)
+{
+	return r->match_type != XE_RTP_MATCH_OR;
+}
+
+static bool rule_match_item(struct rule_match_ctx *match_ctx)
 {
+	const struct xe_device *xe = match_ctx->xe;
+	struct xe_gt *gt = match_ctx->gt;
+	struct xe_hw_engine *hwe = match_ctx->hwe;
+	const struct xe_rtp_rule *r = &match_ctx->rules[match_ctx->head];
+
 	switch (r->match_type) {
 	case XE_RTP_MATCH_PLATFORM:
 		return xe->info.platform == r->platform;
@@ -120,6 +137,63 @@ static bool rule_match_item(const struct xe_device *xe,
 	}
 }
 
+/*
+ * Match a conjunctive set of rules (rules joined by an implicit "AND").
+ *
+ * Once one item evaluates to false, the remaining items are not evaluated
+ * anymore.  Nevetheless, all rules are consumed to allow detecting syntax
+ * errors.
+ */
+static bool rule_match_and(struct rule_match_ctx *match_ctx, bool parse_only)
+{
+	bool match = true;
+	unsigned int count = 0;
+
+	while (match_ctx->head < match_ctx->n_rules &&
+	       rule_is_item(&match_ctx->rules[match_ctx->head])) {
+		if (!parse_only)
+			match = rule_match_item(match_ctx);
+
+		if (!match)
+			parse_only = true;
+
+		match_ctx->head++;
+		count++;
+	}
+
+	if (drm_WARN_ON(&match_ctx->xe->drm, !count)) {
+		match_ctx->err = -EINVAL;
+
+		if (!parse_only)
+			match = false;
+	}
+
+	return match;
+}
+
+/*
+ * Match a disjunctive set of rules (subset of rules joined by
+ * "XE_RTP_MATCH_OR").
+ *
+ * Once one subset evaluates to true, the remaining items are not evaluated
+ * anymore. Nevetheless, all rules are consumed to allow detecting syntax
+ * errors.
+ */
+static bool rule_match_or(struct rule_match_ctx *match_ctx)
+{
+	bool match = rule_match_and(match_ctx, false);
+
+	while (match_ctx->head < match_ctx->n_rules &&
+	       match_ctx->rules[match_ctx->head].match_type == XE_RTP_MATCH_OR) {
+		/* Consume XE_RTP_MATCH_OR. */
+		match_ctx->head++;
+
+		match = rule_match_and(match_ctx, match);
+	}
+
+	return match;
+}
+
 static bool rule_matches_with_err(const struct xe_device *xe,
 				  struct xe_gt *gt,
 				  struct xe_hw_engine *hwe,
@@ -127,55 +201,19 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 				  unsigned int n_rules,
 				  int *err)
 {
-	const struct xe_rtp_rule *r;
-	unsigned int i, rcount = 0;
-	bool short_circuit_or = false;
+	struct rule_match_ctx match_ctx = {
+		.xe = xe,
+		.gt = gt,
+		.hwe = hwe,
+		.rules = rules,
+		.n_rules = n_rules,
+	};
+	bool match = rule_match_or(&match_ctx);
 
 	if (err)
-		*err = 0;
-
-	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
-		if (r->match_type == XE_RTP_MATCH_OR) {
-			if (drm_WARN_ON(&xe->drm, !rcount)) {
-				if (err)
-					*err = -EINVAL;
-				continue;
-			}
-
-			/*
-			 * This is only reached if a complete conjunction of
-			 * rules passed, in which case we short-circuit rule
-			 * evaluation, but still keep parsing to find any syntax
-			 * errors.
-			 */
-			short_circuit_or = true;
-			rcount = 0;
-			continue;
-		}
-
-		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
-			rcount++;
-		} else {
-			/*
-			 * Advance rules until we find XE_RTP_MATCH_OR to check
-			 * if there's another set of conditions to check
-			 */
-			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
-				;
-
-			if (i >= n_rules)
-				return false;
-
-			rcount = 0;
-		}
-	}
-
-	if (drm_WARN_ON(&xe->drm, !rcount)) {
-		if (err)
-			*err = -EINVAL;
-	}
+		*err = match_ctx.err;
 
-	return short_circuit_or || rcount;
+	return match;
 }
 
 static bool rule_matches(const struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 562082b18d7b..e4f1930ca1c3 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -394,18 +394,39 @@ struct xe_reg_sr;
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
  * @...: Rules
  *
- * At least one rule is needed and up to 12 are supported. Multiple rules are
- * AND'ed together, i.e. all the rules must evaluate to true for the entry to
- * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
+ * When an RTP table is being processed, the rules of each entry are evaluated
+ * to check if they match the target entity (platform, gt or hwe, depending on
+ * the specific RTP table).
+ *
+ * The sequence of arguments of this macro must follow the following eBNF
+ * grammar::
+ *
+ *            rules = disjunction;
+ *      disjunction = conjunction, { "OR", conjunction };
+ *      conjunction = single_rule, { single_rule };
+ *				   (* the AND operator is implicit *)
+ *      single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
+ *                      FUNC(...), etc ?
+ *
+ * Examples:
  *
  * .. code-block:: c
  *
  *	const struct xe_rtp_entry_sr wa_entries[] = {
  *		...
- *		{ XE_RTP_NAME("test-entry"),
+ *		{ XE_RTP_NAME("entry-a"),
+ *		  // Match DG2-G10 with graphics steppings A0 up-to B0
+ *		  // (exclusive).
  *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
  *		  ...
  *		},
+ *		{ XE_RTP_NAME("entry-b"),
+ *		  // Match graphics version 20 (all steppings) or graphics
+ *		  // version 30 steppings A0 up-to B0 (exclusive).
+ *		  XE_RTP_RULES(GRAPHICS_VERSION(2000), OR,
+ *			       GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0))
+ *		  ...
+ *		},
  *		...
  *	};
  */

-- 
2.53.0

