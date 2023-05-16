Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B0DC7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD010E381;
	Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CB510E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PqrbhPGro0FKaNziDCPSHcN3nuWZYFObgDIxd56FTzQ=;
 b=OHd6R67piaMUyWl4GjiIrewWgALmoaqH+CicAC7zZPk4YmTiYSlNIM/c
 2p6yRiozW+uJXnX+ZfHQEdjSDVn2ycnpTgBGqt/FPy2kECOhRmNg5144c
 r8GLgiTOjDIL/rzFTf9+nfS67sh8agr+Z0tZn0AvDsv1EvTGD35mdjxFu
 iHhEjSh/9LvoFJzQuf45/u5LaF3eI1Y2QH/roJ/EwFIdTbDOxL3alEY4d
 nFV4zZWw5hvQZmct3bps3W7zqXNgp0xINUNBEXFlYOsMITGY7XaGA12M2
 Y+UzmzxJCyYiNmqtwGo4PC/hyCYclQqNHJt8cR4Af/m89eYZmsGgcLSv9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013386"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013386"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530860"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530860"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:45 -0700
Message-Id: <20230516221950.3512818-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/9] drm/xe/rtp: Allow to track active
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the metadata in struct xe_rtp_process_ctx, to be set by
xe_rtp_process_ctx_enable_active_tracking(), so rtp knows how to mark
the active entries while processing the table. This can be used by the
WA infra to record what are the active workarounds.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 48 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_rtp.h |  4 ++++
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 1485e53c1496..d20536625020 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -113,7 +113,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	xe_reg_sr_add(sr, &sr_entry);
 }
 
-static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
+static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 			       struct xe_device *xe, struct xe_gt *gt,
 			       struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
 {
@@ -122,7 +122,7 @@ static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 	unsigned int i;
 
 	if (!rule_matches(xe, gt, hwe, entry))
-		return;
+		return false;
 
 	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
 		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
@@ -133,6 +133,8 @@ static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 
 		rtp_add_sr_entry(action, gt, mmio_base, sr);
 	}
+
+	return true;
 }
 
 static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
@@ -159,6 +161,38 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
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
@@ -184,15 +218,21 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
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
index f2b31be294d6..274bccaeb72d 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -363,6 +363,10 @@ struct xe_reg_sr;
 	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
 	struct xe_device *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
 
+void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
+					       unsigned long *active_entries,
+					       size_t n_entries);
+
 void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
 			  struct xe_reg_sr *sr);
-- 
2.40.1

