Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF03C52CDA
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4D810E994;
	Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A05EWFCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0972710E93B
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045565; x=1753581565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AL2Va0hzj2hyOXdRlsNzIKE6RYW8QK7uR4nBoAGjQc=;
 b=A05EWFCsfqK3gPcuYoJLTdGfo/sBlk+BYqUbTw2sRVSLYmertirSqTOm
 6c9UmMR4gEw8bShfQjrHpPOFC8UcYrrtAfNEoyTNfh3+IxeAuhIIUaGSR
 pyaex0C66e/n2k2s/m/WPXKE+a8Z+ncSa643HEru3TwEaEcnr7xCzTRGK
 Sw0VLl9mmCwZCAhbskhj1erHXIbgXYQMVWRLIN1ON4rUR8mKBmeL39G8t
 jyrO2pZvRPT4KYEIOhVz68E9g0+7dA33EbRCovRtkKAVZXh/qcE3jvVqW
 VaGt7G2OJqQoYOEJwROmZJWSLGLj4xn5TZV1PUpbpO5dIx8rScLTR5zIb w==;
X-CSE-ConnectionGUID: TiCtp2OTTmGjxOpI/b4S9Q==
X-CSE-MsgGUID: LCKfT3XCQVmKyAwsoNCDew==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460262"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:25 -0700
X-CSE-ConnectionGUID: WMRzqouuRjWCq4NEHyEjFw==
X-CSE-MsgGUID: GwM+TfUiTamxBioWIwDoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108400"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 8/8] drm/xe: Migrate OOB WAs to OR rules
Date: Fri, 26 Jul 2024 18:59:07 -0700
Message-ID: <20240727015907.899192-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727015907.899192-1-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
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

Now that rtp has OR rules, it's not needed to extend it to process OOB
WAs. Previously if an entry had no name, it was considered as "a set of
rules OR'ed with the last named entry".

Instead of generating new entries, add OR rules. The syntax for
xe_wa_oob.rules remains the same, with xe_gen_wa_oob generating the
slightly different table. Object sizes delta are negligible, but having
just one logic makes it easier to maintain:

	add/remove: 0/0 grow/shrink: 1/2 up/down: 160/-269 (-109)
	Function                                     old     new   delta
	__compound_literal                          6104    6264    +160
	xe_wa_dump                                  1839    1810     -29
	oob_was                                      816     576    -240
	Total: Before=17257, After=17148, chg -0.63%

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 34 +++++++++++-------------
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 16 +++++++++---
 drivers/gpu/drm/xe/xe_rtp.c            | 36 +++++++-------------------
 3 files changed, 37 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 9ab3d5950d59..36a3b5420fef 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -401,16 +401,15 @@ static const struct rtp_test_case rtp_cases[] = {
 	},
 	{
 		.name = "inactive-1st_or_active-inactive",
-		.expected_active = BIT(1) | BIT(2) | BIT(3),
+		.expected_active = BIT(1),
 		.entries = (const struct xe_rtp_entry[]) {
 			{ XE_RTP_NAME("r1"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
 			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_yes)),
-			},
-			{ XE_RTP_RULES(FUNC(match_no)) },
-			{ XE_RTP_RULES(FUNC(match_no)) },
+			  XE_RTP_RULES(FUNC(match_yes), OR,
+				       FUNC(match_no), OR,
+				       FUNC(match_no)) },
 			{ XE_RTP_NAME("r3"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
@@ -419,16 +418,15 @@ static const struct rtp_test_case rtp_cases[] = {
 	},
 	{
 		.name = "inactive-2nd_or_active-inactive",
-		.expected_active = BIT(1) | BIT(2) | BIT(3),
+		.expected_active = BIT(1),
 		.entries = (const struct xe_rtp_entry[]) {
 			{ XE_RTP_NAME("r1"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
 			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_no)),
-			},
-			{ XE_RTP_RULES(FUNC(match_yes)) },
-			{ XE_RTP_RULES(FUNC(match_no)) },
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_yes), OR,
+				       FUNC(match_no)) },
 			{ XE_RTP_NAME("r3"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
@@ -437,16 +435,15 @@ static const struct rtp_test_case rtp_cases[] = {
 	},
 	{
 		.name = "inactive-last_or_active-inactive",
-		.expected_active = BIT(1) | BIT(2) | BIT(3),
+		.expected_active = BIT(1),
 		.entries = (const struct xe_rtp_entry[]) {
 			{ XE_RTP_NAME("r1"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
 			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_no)),
-			},
-			{ XE_RTP_RULES(FUNC(match_no)) },
-			{ XE_RTP_RULES(FUNC(match_yes)) },
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_no), OR,
+				       FUNC(match_yes)) },
 			{ XE_RTP_NAME("r3"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
@@ -461,10 +458,9 @@ static const struct rtp_test_case rtp_cases[] = {
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
 			{ XE_RTP_NAME("r2_or_conditions"),
-			  XE_RTP_RULES(FUNC(match_no)),
-			},
-			{ XE_RTP_RULES(FUNC(match_no)) },
-			{ XE_RTP_RULES(FUNC(match_no)) },
+			  XE_RTP_RULES(FUNC(match_no), OR,
+				       FUNC(match_no), OR,
+				       FUNC(match_no)) },
 			{ XE_RTP_NAME("r3"),
 			  XE_RTP_RULES(FUNC(match_no)),
 			},
diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 106ee2b027f0..904cf47925aa 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -97,19 +97,27 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 
 		if (name) {
 			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
-			fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_RULES(%s) },\n",
+
+			/* Close previous entry before starting a new one */
+			if (idx)
+				fprintf(csource, ") },\n");
+
+			fprintf(csource, "{ XE_RTP_NAME(\"%s\"),\n  XE_RTP_RULES(%s",
 				name, rules);
+			idx++;
 		} else {
-			fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RULES(%s) },\n",
-				rules);
+			fprintf(csource, ", OR,\n\t%s", rules);
 		}
 
-		idx++;
 		lineno++;
 		if (!is_continuation)
 			prev_name = name;
 	}
 
+	/* Close last entry */
+	if (idx)
+		fprintf(csource, ") },\n");
+
 	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 86727f34ca25..e78ba324dd18 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -221,15 +221,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_active_tracking);
 
 static void rtp_mark_active(struct xe_device *xe,
 			    struct xe_rtp_process_ctx *ctx,
-			    unsigned int first, unsigned int n_entries)
+			    unsigned int idx)
 {
 	if (!ctx->active_entries)
 		return;
 
-	if (drm_WARN_ON(&xe->drm, first + n_entries > ctx->n_entries))
+	if (drm_WARN_ON(&xe->drm, idx >= ctx->n_entries))
 		return;
 
-	bitmap_set(ctx->active_entries, first, n_entries);
+	bitmap_set(ctx->active_entries, idx, 1);
 }
 
 /**
@@ -274,7 +274,7 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 		}
 
 		if (match)
-			rtp_mark_active(xe, ctx, entry - entries, 1);
+			rtp_mark_active(xe, ctx, entry - entries);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
@@ -285,42 +285,26 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
  * @entries: Table with RTP definitions
  *
  * Walk the table pointed by @entries (with an empty sentinel), executing the
- * rules. A few differences from xe_rtp_process_to_sr():
- *
- * 1. There is no action associated with each entry since this uses
- *    struct xe_rtp_entry. Its main use is for marking active workarounds via
- *    xe_rtp_process_ctx_enable_active_tracking().
- * 2. There is support for OR operations by having entries with no name.
+ * rules. One difference from xe_rtp_process_to_sr(): there is no action
+ * associated with each entry since this uses struct xe_rtp_entry. Its main use
+ * is for marking active workarounds via
+ * xe_rtp_process_ctx_enable_active_tracking().
  */
 void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 		    const struct xe_rtp_entry *entries)
 {
-	const struct xe_rtp_entry *entry, *first_entry;
+	const struct xe_rtp_entry *entry;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
 	struct xe_device *xe;
 
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
-	first_entry = entries;
-	if (drm_WARN_ON(&xe->drm, !first_entry->name))
-		return;
-
 	for (entry = entries; entry && entry->rules; entry++) {
-		if (entry->name)
-			first_entry = entry;
-
 		if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
 			continue;
 
-		/* Fast-forward entry, eliminating the OR'ed entries */
-		for (entry++; entry && entry->rules; entry++)
-			if (entry->name)
-				break;
-		entry--;
-
-		rtp_mark_active(xe, ctx, first_entry - entries,
-				entry - first_entry + 1);
+		rtp_mark_active(xe, ctx, entry - entries);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
-- 
2.43.0

