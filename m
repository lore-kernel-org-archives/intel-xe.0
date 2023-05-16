Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE020C7EE2F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6F210E383;
	Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BFB10E37C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5zucznbyLJxgXOqEfYQ+Qe4vlkT+4X0i4t+NnWDZZE=;
 b=X1/m6XtMN6SBvQzlg8TA/0QLCNKHbl8UH/alVYx1gXkOU7HefFVIb/bW
 Hg4Fb8ki7zKQ4L4NlfIz43U4Bpefd9xrqlJjzU5REZ1lUj+z4Nlifr3Og
 g0o/QHKaVnpV2Z1u483p14SG5vpRUFpdmnTACNZXE7xA1QPbso/7yZYM4
 26i9iPd/PvHbRaYJEY9fp4SFBTQIT+KOEMZhD15ZkhQ8zdcCmV/3PT2Rd
 J385ykYWRe1i2j/FPh5gDIYqOB/S+s8mHFURKP6p3mr7LnAMsBgw6uyAC
 pc8Bqw5sVl1JTryh4syCZBZgNKmbIEmfjbf0bq5TXyi+DvhQkINa5jgEX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013390"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530870"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530870"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:48 -0700
Message-Id: <20230516221950.3512818-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 7/9] drm/xe/rtp: Add support for entries with
 no action
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a separate struct to hold entries in a table that has no action
associated with each of them. The goal is that the caller in future can
set a per-context callback, or just use the active entry marking
feature.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 65 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_rtp.h       |  3 ++
 drivers/gpu/drm/xe/xe_rtp_types.h |  7 ++++
 3 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index d20536625020..db0f9254efd2 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -26,14 +26,14 @@
 static bool rule_matches(const struct xe_device *xe,
 			 struct xe_gt *gt,
 			 struct xe_hw_engine *hwe,
-			 const struct xe_rtp_entry_sr *entry)
+			 const struct xe_rtp_rule *rules,
+			 unsigned int n_rules)
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i;
 	bool match;
 
-	for (r = entry->rules, i = 0; i < entry->n_rules;
-	     r = &entry->rules[++i]) {
+	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
 		switch (r->match_type) {
 		case XE_RTP_MATCH_PLATFORM:
 			match = xe->info.platform == r->platform;
@@ -121,7 +121,7 @@ static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 	u32 mmio_base;
 	unsigned int i;
 
-	if (!rule_matches(xe, gt, hwe, entry))
+	if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
 		return false;
 
 	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
@@ -182,15 +182,18 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 
 static void rtp_mark_active(struct xe_device *xe,
 			    struct xe_rtp_process_ctx *ctx,
-			    unsigned int bit)
+			    unsigned int first, unsigned int last)
 {
 	if (!ctx->active_entries)
 		return;
 
-	if (drm_WARN_ON(&xe->drm, bit > ctx->n_entries))
+	if (drm_WARN_ON(&xe->drm, last > ctx->n_entries))
 		return;
 
-	bitmap_set(ctx->active_entries, bit, 1);
+	if (first == last)
+		bitmap_set(ctx->active_entries, first, 1);
+	else
+		bitmap_set(ctx->active_entries, first, last - first + 2);
 }
 
 /**
@@ -232,11 +235,57 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 		}
 
 		if (match)
-			rtp_mark_active(xe, ctx, entry - entries);
+			rtp_mark_active(xe, ctx, entry - entries,
+					entry - entries);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
 
+/**
+ * xe_rtp_process - Process all rtp @entries, without running any action
+ * @ctx: The context for processing the table, with one of device, gt or hwe
+ * @entries: Table with RTP definitions
+ *
+ * Walk the table pointed by @entries (with an empty sentinel), executing the
+ * rules. A few differences from xe_rtp_process_to_sr():
+ *
+ * 1. There is no action associated with each entry since this uses
+ *    struct xe_rtp_entry. Its main use is for marking active workarounds via
+ *    xe_rtp_process_ctx_enable_active_tracking().
+ * 2. There is support for OR operations by having entries with no name.
+ */
+void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
+		    const struct xe_rtp_entry *entries)
+{
+	const struct xe_rtp_entry *entry, *first_entry;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+	struct xe_device *xe;
+
+	rtp_get_context(ctx, &hwe, &gt, &xe);
+
+	first_entry = entries;
+	if (drm_WARN_ON(&xe->drm, !first_entry->name))
+		return;
+
+	for (entry = entries; entry && entry->rules; entry++) {
+		if (entry->name)
+			first_entry = entry;
+
+		if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
+			continue;
+
+		/* Fast-forward entry, eliminating the OR'ed entries */
+		for (entry++; entry && entry->rules; entry++)
+			if (entry->name)
+				break;
+		entry--;
+
+		rtp_mark_active(xe, ctx, first_entry - entries,
+				entry - entries);
+	}
+}
+
 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 274bccaeb72d..0fa9b584ed92 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -371,6 +371,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
 			  struct xe_reg_sr *sr);
 
+void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
+		    const struct xe_rtp_entry *entries);
+
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index b1e77055f9cd..1091a79d0fe0 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -95,6 +95,13 @@ struct xe_rtp_entry_sr {
 	u8 flags;
 };
 
+/** struct xe_rtp_entry - Entry in an rtp table, with no action associated */
+struct xe_rtp_entry {
+	const char *name;
+	const struct xe_rtp_rule *rules;
+	u8 n_rules;
+};
+
 enum xe_rtp_process_type {
 	XE_RTP_PROCESS_TYPE_DEVICE,
 	XE_RTP_PROCESS_TYPE_GT,
-- 
2.40.1

