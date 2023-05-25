Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECA3C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF2410E785;
	Thu, 25 May 2023 21:34:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C627510E782
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050479; x=1716586479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5H+HGaRaFgYARDqm6R9EYwX/0jiUZSJ9rSQ40wYbYc=;
 b=fn3F/wWSA6HUPUBDZbS5z3by15qBlQq+Vhk/Q/oS7LVr9pwdrNjDeEu0
 GDP/r+J3mgl39YSUrt6+6YP+8X5WS73a7k59ybsCDu0hLqo/xOHV7pRTs
 lMCr/19ZKKRkHiVmDAxDATr0ZZxVQBm0z9RJPTK8O7Zen8E6e1sExOA/C
 11njN8mgQfoPiFb3V2o6Q595k50Suhth+BpfsMhoxydFCwWMhllrYxKxR
 seDs97leE9sV6gHuX+ZIZBCjNVxPET2vtVLdBU+70gwGAt5AkRuluQL2L
 AamAEJAKQZdUSFCcke+/Ui59+SqSqmNQjq/Trxn7ySY3BWgOw+V0ufFXp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377903"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377903"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970735"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970735"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:51 -0700
Message-Id: <20230525213407.3907094-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 05/21] drm/xe/rtp: Allow to track active
 workarounds
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

Add the metadata in struct xe_rtp_process_ctx, to be set by
xe_rtp_process_ctx_enable_active_tracking(), so rtp knows how to mark
the active entries while processing the table. This can be used by the
WA infra to record what are the active workarounds.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 48 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_rtp.h       |  4 +++
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 0be1f4cfc4d5..29cf92f9b7b3 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -112,7 +112,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	xe_reg_sr_add(sr, &sr_entry);
 }
 
-static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
+static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 			       struct xe_device *xe, struct xe_gt *gt,
 			       struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
 {
@@ -121,7 +121,7 @@ static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 	unsigned int i;
 
 	if (!rule_matches(xe, gt, hwe, entry))
-		return;
+		return false;
 
 	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
 		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
@@ -132,6 +132,8 @@ static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 
 		rtp_add_sr_entry(action, gt, mmio_base, sr);
 	}
+
+	return true;
 }
 
 static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
@@ -153,6 +155,38 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 	};
 }
 
+/**
+ * xe_rtp_process_ctx_enable_active_tracking - Enable tracking of active entries
+ *
+ * Set additional metadata to track what entries are considered "active", i.e.
+ * their rules match the condition. Bits are never cleared: entries with
+ * matching rules set the corresponding bit in the bitmap.
+ *
+ * @ctx: The context for processing the table
+ * @active_entries: bitmap to store the active entries
+ * @n_entries: number of entries to be processed
+ */
+void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
+					       unsigned long *active_entries,
+					       size_t n_entries)
+{
+	ctx->active_entries = active_entries;
+	ctx->n_entries = n_entries;
+}
+
+static void rtp_mark_active(struct xe_device *xe,
+			    struct xe_rtp_process_ctx *ctx,
+			    unsigned int bit)
+{
+	if (!ctx->active_entries)
+		return;
+
+	if (drm_WARN_ON(&xe->drm, bit > ctx->n_entries))
+		return;
+
+	bitmap_set(ctx->active_entries, bit, 1);
+}
+
 /**
  * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
  *                        the save-restore argument.
@@ -178,15 +212,21 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
 	for (entry = entries; entry && entry->name; entry++) {
+		bool match = false;
+
 		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
 			struct xe_hw_engine *each_hwe;
 			enum xe_hw_engine_id id;
 
 			for_each_hw_engine(each_hwe, gt, id)
-				rtp_process_one_sr(entry, xe, gt, each_hwe, sr);
+				match |= rtp_process_one_sr(entry, xe, gt,
+							    each_hwe, sr);
 		} else {
-			rtp_process_one_sr(entry, xe, gt, hwe, sr);
+			match = rtp_process_one_sr(entry, xe, gt, hwe, sr);
 		}
+
+		if (match)
+			rtp_mark_active(xe, ctx, entry - entries);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 179b497186d2..e69f514ee6c4 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -359,6 +359,10 @@ struct xe_reg_sr;
 	struct xe_hw_engine *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
 	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
 
+void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
+					       unsigned long *active_entries,
+					       size_t n_entries);
+
 void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
 			  struct xe_reg_sr *sr);
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 66d1cb0aaa08..03d97b666c64 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -106,6 +106,8 @@ struct xe_rtp_process_ctx {
 		struct xe_hw_engine *hwe;
 	};
 	enum xe_rtp_process_type type;
+	unsigned long *active_entries;
+	size_t n_entries;
 };
 
 #endif
-- 
2.40.1

