Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F5D3CC87
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778BE10E6A4;
	Wed, 14 Jan 2026 22:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aevA0pKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954A10E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768431035; x=1799967035;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xy4mW9L+4KaE6/0fZ6NZSSF6JO+27OcVf3b10+/cPGU=;
 b=aevA0pKFW8/hqUHkybRmBzbr2zgTR2J6bJ99bfVqr70U7mEczFYF/hID
 2g4iFa1ES2lNJUiIZ/VHchJgiXzyt0zouoG5+lzn6fJdpp4ZOFxSRVWj+
 nIHLZ9Cf7GCFnf4C7lYvt4NrDP1jlUYZIgw12P9iuE6PxV08H7s1LF/O3
 fuPBxdyrpKax10qZRxoeS5ZtBinddQ1oNnw8+/oAC1+JXImNizu87zGZ3
 o09zJRHL3z0nuFKBBoCf9xD1t1VWOmq8lj/+wepu9pUay0Tg187kxrSPd
 Y9Ia9eWurlQ5Wdpg+BBdJAewXxA31QStzGLEaharKLRQPEgAlo0FVuh24 g==;
X-CSE-ConnectionGUID: tl2n5J9jSUWjdlN6hqq76A==
X-CSE-MsgGUID: sgETtVYhQzi6+R/jL86xfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81184700"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="81184700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:35 -0800
X-CSE-ConnectionGUID: H7FLpQRjQ/iUICttQgJ8kQ==
X-CSE-MsgGUID: xDKYTPBrS/+C/O/YaF/tuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="235522093"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:34 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 14 Jan 2026 19:49:56 -0300
Subject: [PATCH 6/6] drm/xe/rtp: Implement a structured parser for rule
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-rtp-rule-parser-v1-6-fa9029586bff@intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
In-Reply-To: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
    disjunction = conjunction { "OR" conjunction };
    conjunction = single_rule { single_rule }
                              /* AND operator is implicit */;
    single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
                     FUNC(...), etc ?;

While rule_matches() currently works for the grammar above, it doesn't
easily resemble it.  Let's replace it with an implementation that is
structured in a way to resemble the grammar.

Such a new implementation, although a bit more verbose, is arguably
easier to reason about and to adapt to any extension we do to the
grammer in the future.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 134 ++++++++++++++++++++++++++++----------------
 1 file changed, 85 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 55df9c16a3cc..1e3d89e1f2a5 100644
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
@@ -114,65 +131,84 @@ static bool rule_match_item(const struct xe_device *xe,
 	}
 }
 
-static bool rule_matches_with_err(const struct xe_device *xe,
-				  struct xe_gt *gt,
-				  struct xe_hw_engine *hwe,
-				  const struct xe_rtp_rule *rules,
-				  unsigned int n_rules,
-				  int *err)
+/*
+ * Match a conjunctive set of rules (rules joined by an implicit "AND").
+ *
+ * Once one item evaluates to false, the remaining items are not evaluated
+ * anymore.  Nevetheless, all rules are consumed to allow detecting syntax
+ * errors.
+ */
+static bool rule_match_and(struct rule_match_ctx *match_ctx, bool parse_only)
 {
-	const struct xe_rtp_rule *r;
-	unsigned int i, rcount = 0;
-	bool parse_only = false;
-	bool match = false;
+	bool match = true;
+	unsigned int count = 0;
 
-	if (err)
-		*err = 0;
+	while (match_ctx->head < match_ctx->n_rules &&
+	       rule_is_item(&match_ctx->rules[match_ctx->head])) {
+		if (!parse_only)
+			match = rule_match_item(match_ctx);
 
-	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
-		if (r->match_type == XE_RTP_MATCH_OR) {
-			if (drm_WARN_ON(&xe->drm, !rcount)) {
-				parse_only = true;
-				match = false;
-				if (err)
-					*err = -EINVAL;
-			} else if (match) {
-				parse_only = true;
-			}
+		if (!match)
+			parse_only = true;
 
-			rcount = 0;
+		match_ctx->head++;
+		count++;
+	}
 
-			continue;
-		}
+	if (drm_WARN_ON(&match_ctx->xe->drm, !count))
+		match_ctx->err = -EINVAL;
 
-		rcount++;
+	return match;
+}
 
-		if (parse_only || !rule_match_item(xe, gt, hwe, r)) {
-			if (!parse_only)
-				match = false;
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
 
-			/*
-			 * Advance rules until we find XE_RTP_MATCH_OR to check
-			 * if there's another set of conditions to check
-			 */
-			while (i + 1 < n_rules && rules[i + 1].match_type != XE_RTP_MATCH_OR) {
-				i++;
-				rcount++;
-			}
-		} else {
-			match = true;
-		}
-	}
+	while (match_ctx->head < match_ctx->n_rules &&
+	       match_ctx->rules[match_ctx->head].match_type == XE_RTP_MATCH_OR) {
+		/* Consume XE_RTP_MATCH_OR. */
+		match_ctx->head++;
 
-	if (drm_WARN_ON(&xe->drm, !rcount)) {
-		match = false;
-		if (err)
-			*err = -EINVAL;
+		match = rule_match_and(match_ctx, match);
 	}
 
 	return match;
 }
 
+static bool rule_matches_with_err(const struct xe_device *xe,
+				  struct xe_gt *gt,
+				  struct xe_hw_engine *hwe,
+				  const struct xe_rtp_rule *rules,
+				  unsigned int n_rules,
+				  int *err)
+{
+	struct rule_match_ctx match_ctx = {
+		.xe = xe,
+		.gt = gt,
+		.hwe = hwe,
+		.rules = rules,
+		.n_rules = n_rules,
+	};
+	bool match = rule_match_or(&match_ctx);
+
+	if (err)
+		*err = match_ctx.err;
+
+	if (drm_WARN_ON(&xe->drm, match_ctx.err))
+		return false;
+
+	return match;
+}
+
 static bool rule_matches(const struct xe_device *xe,
 			 struct xe_gt *gt,
 			 struct xe_hw_engine *hwe,

-- 
2.52.0

