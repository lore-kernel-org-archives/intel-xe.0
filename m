Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A92CCD13DF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3827A10F46D;
	Thu, 30 Apr 2026 20:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTHgdOZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CAA10F468
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580504; x=1809116504;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ngZIJ/PeCYXIpT8QRd6Xf+6xk9icpOFHdPbQK3M5RDA=;
 b=dTHgdOZRKamFwQfNNxnHDDUWcMy+BUjv8P4wEwyOHopgAafqRspHFJr6
 WZdXPliOz9VyFU2k0hTM3LisDu6XiCi4kl1nNbptT9UhemtWRYiEQTWH4
 dDy9HYrc+ODu0LFWVvBwoHcaNwQfu13lh33PC6dvPHEWMNjDb+yE1mBiC
 GdPYScC3KYEuWO8EuB/9AM6X13Nhk07M7Lpxr6Nvdc6DvttycVbQ5Dvlh
 mKedDI6XKEpd3HIsWBV4LrnLs/gAHCgup0Mx0K46zPQPPcGXAOlZoLwPi
 BCCcBsH7FY2FiMVleGGdcPLw6Uw/ezR2AwWPO7OZWMCVV09KTqa4Bt6Na Q==;
X-CSE-ConnectionGUID: s3JRLjlYTN+Id9wadhdIaw==
X-CSE-MsgGUID: QyZ+LRnzRKKhYQiUSHgI8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150916"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:44 -0700
X-CSE-ConnectionGUID: sSbsWqyFQm23c1mZ+bzNFA==
X-CSE-MsgGUID: sGjmUr3rQTu/WdTk6gT3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030540"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:08 -0300
Subject: [PATCH v2 7/7] drm/xe/rtp: Implement a structured parser for rule
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
In-Reply-To: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
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
 drivers/gpu/drm/xe/xe_rtp.c | 138 ++++++++++++++++++++++++++++----------------
 1 file changed, 88 insertions(+), 50 deletions(-)

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

-- 
2.53.0

