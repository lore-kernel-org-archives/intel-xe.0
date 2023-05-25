Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC2BC7EE2F
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83610E788;
	Thu, 25 May 2023 21:34:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B1810E780
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRZq3OkN91Wj+GxKKaSSkjDOG4MfL3YsSp9xicte9GI=;
 b=KXochd3aT0QX8cKMjsC54wjFD/d4hwt5KtyKDdZcPwJYZ5ELmp+PWvbF
 lVtLg44Z6STlCfAxJYvYjjUCHHjzlTXhvwkLD6o7KgO6IUPWMWRom/Z42
 LJb0n6M4p6PP7yZ93FccEMim0fJzE0ZwiXh4FEWxz9EfraFUMN3ZLCDH9
 5OEltarValoXnYN5Pu4EMjdZP0zz2oNeZ/DN6rPh7Q44NGVjwrKdYUyJg
 X7H/k+QlgdUUhGTWswaAWCwUoN7iWXxrH8wTLKPL5AzcZRTtvO25TV8iU
 l7lWI077DxNWqsgT084Et1a84K8h45yN4n4YIZ1L4mk3XF+TF5rJdu1aK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377909"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970750"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970750"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:56 -0700
Message-Id: <20230525213407.3907094-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 10/21] drm/xe/rtp: Add support for entries
 with no action
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
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a separate struct to hold entries in a table that has no action
associated with each of them. The goal is that the caller in future can
set a per-context callback, or just use the active entry marking
feature.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 65 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_rtp.h       |  3 ++
 drivers/gpu/drm/xe/xe_rtp_types.h |  7 ++++
 3 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 70769852a93d..ebcfb04c391a 100644
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
@@ -122,7 +122,7 @@ static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 	u32 mmio_base;
 	unsigned int i;
 
-	if (!rule_matches(xe, gt, hwe, entry))
+	if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
 		return false;
 
 	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
@@ -178,15 +178,18 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 
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
@@ -228,11 +231,57 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
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
index d55701d2f39b..8581bd9b1426 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -384,6 +384,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
 			  struct xe_reg_sr *sr);
 
+void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
+		    const struct xe_rtp_entry *entries);
+
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index af49cbf98407..d170532a98a5 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -96,6 +96,13 @@ struct xe_rtp_entry_sr {
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
 	XE_RTP_PROCESS_TYPE_GT,
 	XE_RTP_PROCESS_TYPE_ENGINE,
-- 
2.40.1

