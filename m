Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E7C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1278410E06D;
	Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D56810E37C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qTcpAkiLH5ksnPcZh2aaOHNRiQScazffIhQpmbsNLUE=;
 b=H2cykEGM8S9XPXSnwS+/RJFfHMvBBaNjumYVKTb16CdxznL9sJc51b1I
 iqzOsmYH9p0kUtXEg/7kGW8H5EUH+7la90yUdqEmwTHUqcqpTYyE6uxql
 odrkh3kKLMpiTs/jeMaiU/HZEJRaxQK/OpUNgEvBYPPNZSr7HrpET1gcS
 ICkM69MoCWSCipQnG/Ypq78z9lq+8Eo0/1CRW9MkCwwPVovfpp6WcxwiD
 ZY83tKLi5hTjJj1KLtIc7AWC5zAfzRVQhpC00F8Wte8WIMJ0jg1oz9WK/
 g3fla1y+rsn1VDh82XfY5bPOGvBRcIqMep2CTY9an+WslBYpuY9HF8UlN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013382"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530854"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530854"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:43 -0700
Message-Id: <20230516221950.3512818-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/9] drm/xe/rtp: Split rtp process
 initialization
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

The selection between hwe and gt is exposed to the outside of rtp, by
the xe_rtp_process() function. It doesn't make sense to pass a hwe and a
gt as argument since the gt should always be the one containing the hwe.

This clarifies the interface by separating the context creation into an
initializer. The initializer then passes the correct value and there
should never be a case with hwe and gt set. Internally the functions
continue receiving the argument separately.

Also, since most of the rtp rules match against device characteristics,
add support for processing rules based solely on the device. This will
be used by follow up commits to process some workarounds.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  8 +--
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 +-
 drivers/gpu/drm/xe/xe_rtp.c            | 71 ++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_rtp.h            | 10 +++-
 drivers/gpu/drm/xe/xe_rtp_types.h      | 15 ++++++
 drivers/gpu/drm/xe/xe_tuning.c         |  8 ++-
 drivers/gpu/drm/xe/xe_wa.c             | 12 +++--
 8 files changed, 102 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 4b2aac5ccf28..f96ef1987719 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -238,10 +238,11 @@ static void xe_rtp_process_tests(struct kunit *test)
 	struct xe_device *xe = test->priv;
 	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
 	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(&xe->gt[0]);
 	unsigned long idx, count = 0;
 
 	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
-	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
+	xe_rtp_process(&ctx, param->entries, reg_sr);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
 		if (idx == param->expected_reg.addr)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 751f6c3bba17..1bf28b1ad319 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -281,6 +281,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 	const u8 mocs_read_idx = gt->mocs.uc_index;
 	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
 			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 	const struct xe_rtp_entry lrc_was[] = {
 		/*
 		 * Some blitter commands do not have a field for MOCS, those
@@ -299,7 +300,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		{}
 	};
 
-	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
+	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
 }
 
 static void
@@ -311,7 +312,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	const u8 mocs_read_idx = gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
 			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
-	const struct xe_rtp_entry engine_was[] = {
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+	const struct xe_rtp_entry engine_entries[] = {
 		/*
 		 * RING_CMD_CCTL specifies the default MOCS entry that will be
 		 * used by the command streamer when executing commands that
@@ -332,7 +334,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		{}
 	};
 
-	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
+	xe_rtp_process(&ctx, engine_entries, &hwe->reg_sr);
 }
 
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 7a2bb60ebd85..98f678d74445 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -63,7 +63,9 @@ static const struct xe_rtp_entry register_whitelist[] = {
  */
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 {
-	xe_rtp_process(register_whitelist, &hwe->reg_whitelist, hwe->gt, hwe);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+
+	xe_rtp_process(&ctx, register_whitelist, &hwe->reg_whitelist);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 0c6a23e14a71..648a38bf8f0c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -23,11 +23,11 @@
  * the values to the registers that have matching rules.
  */
 
-static bool rule_matches(struct xe_gt *gt,
+static bool rule_matches(const struct xe_device *xe,
+			 struct xe_gt *gt,
 			 struct xe_hw_engine *hwe,
 			 const struct xe_rtp_entry *entry)
 {
-	const struct xe_device *xe = gt_to_xe(gt);
 	const struct xe_rtp_rule *r;
 	unsigned int i;
 	bool match;
@@ -62,22 +62,30 @@ static bool rule_matches(struct xe_gt *gt,
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end;
 			break;
+		case XE_RTP_MATCH_INTEGRATED:
+			match = !xe->info.is_dgfx;
+			break;
+		case XE_RTP_MATCH_DISCRETE:
+			match = xe->info.is_dgfx;
+			break;
 		case XE_RTP_MATCH_ENGINE_CLASS:
+			if (drm_WARN_ON(&xe->drm, !hwe))
+				return false;
+
 			match = hwe->class == r->engine_class;
 			break;
 		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
+			if (drm_WARN_ON(&xe->drm, !hwe))
+				return false;
+
 			match = hwe->class != r->engine_class;
 			break;
 		case XE_RTP_MATCH_FUNC:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = r->match_func(gt, hwe);
 			break;
-		case XE_RTP_MATCH_INTEGRATED:
-			match = !xe->info.is_dgfx;
-			break;
-		case XE_RTP_MATCH_DISCRETE:
-			match = xe->info.is_dgfx;
-			break;
-
 		default:
 			XE_WARN_ON(r->match_type);
 		}
@@ -105,14 +113,15 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	xe_reg_sr_add(sr, &sr_entry);
 }
 
-static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
+static void rtp_process_one(const struct xe_rtp_entry *entry,
+			    struct xe_device *xe, struct xe_gt *gt,
 			    struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
 {
 	const struct xe_rtp_action *action;
 	u32 mmio_base;
 	unsigned int i;
 
-	if (!rule_matches(gt, hwe, entry))
+	if (!rule_matches(xe, gt, hwe, entry))
 		return;
 
 	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
@@ -126,23 +135,51 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
 	}
 }
 
+static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
+			    struct xe_hw_engine **hwe,
+			    struct xe_gt **gt,
+			    struct xe_device **xe)
+{
+	switch (ctx->type) {
+	case XE_RTP_PROCESS_TYPE_DEVICE:
+		*hwe = NULL;
+		*gt = NULL;
+		*xe = ctx->xe;
+		break;
+	case XE_RTP_PROCESS_TYPE_GT:
+		*hwe = NULL;
+		*gt = ctx->gt;
+		*xe = gt_to_xe(*gt);
+		break;
+	case XE_RTP_PROCESS_TYPE_ENGINE:
+		*hwe = ctx->hwe;
+		*gt = (*hwe)->gt;
+		*xe = gt_to_xe(*gt);
+		break;
+	};
+}
+
 /**
  * xe_rtp_process - Process all rtp @entries, adding the matching ones to @sr
+ * @ctx: The context for processing the table, with one of device, gt or hwe
  * @entries: Table with RTP definitions
  * @sr: Where to add an entry to with the values for matching. This can be
  *      viewed as the "coalesced view" of multiple the tables. The bits for each
  *      register set are expected not to collide with previously added entries
- * @gt: The GT to be used for matching rules
- * @hwe: Engine instance to use for matching rules and as mmio base
  *
  * Walk the table pointed by @entries (with an empty sentinel) and add all
  * entries with matching rules to @sr. If @hwe is not NULL, its mmio_base is
  * used to calculate the right register offset
  */
-void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
-		    struct xe_gt *gt, struct xe_hw_engine *hwe)
+void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
+		    const struct xe_rtp_entry *entries, struct xe_reg_sr *sr)
 {
 	const struct xe_rtp_entry *entry;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+	struct xe_device *xe;
+
+	rtp_get_context(ctx, &hwe, &gt, &xe);
 
 	for (entry = entries; entry && entry->name; entry++) {
 		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
@@ -150,9 +187,9 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 			enum xe_hw_engine_id id;
 
 			for_each_hw_engine(each_hwe, gt, id)
-				rtp_process_one(entry, gt, each_hwe, sr);
+				rtp_process_one(entry, xe, gt, each_hwe, sr);
 		} else {
-			rtp_process_one(entry, gt, hwe, sr);
+			rtp_process_one(entry, xe, gt, hwe, sr);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 8bc946694bfc..e7f254fb1b31 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -358,8 +358,14 @@ struct xe_reg_sr;
 		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
 	}
 
-void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
-		    struct xe_gt *gt, struct xe_hw_engine *hwe);
+#define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
+	struct xe_hw_engine *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
+	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
+	struct xe_device *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
+
+void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
+		    const struct xe_rtp_entry *entries,
+		    struct xe_reg_sr *sr);
 
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 12df8a9e9c45..6d9ab9eb91ba 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -95,4 +95,19 @@ struct xe_rtp_entry {
 	u8 flags;
 };
 
+enum xe_rtp_process_type {
+	XE_RTP_PROCESS_TYPE_DEVICE,
+	XE_RTP_PROCESS_TYPE_GT,
+	XE_RTP_PROCESS_TYPE_ENGINE,
+};
+
+struct xe_rtp_process_ctx {
+	union {
+		struct xe_device *xe;
+		struct xe_gt *gt;
+		struct xe_hw_engine *hwe;
+	};
+	enum xe_rtp_process_type type;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 5fc6a408429b..c2810ede3a65 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -59,7 +59,9 @@ static const struct xe_rtp_entry lrc_tunings[] = {
 
 void xe_tuning_process_gt(struct xe_gt *gt)
 {
-	xe_rtp_process(gt_tunings, &gt->reg_sr, gt, NULL);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
+
+	xe_rtp_process(&ctx, gt_tunings, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
 
@@ -73,5 +75,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
  */
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
 {
-	xe_rtp_process(lrc_tunings, &hwe->reg_lrc, hwe->gt, hwe);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+
+	xe_rtp_process(&ctx, lrc_tunings, &hwe->reg_lrc);
 }
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b0bb2f4438f4..4b236b6f4c8e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -579,7 +579,9 @@ __diag_pop();
  */
 void xe_wa_process_gt(struct xe_gt *gt)
 {
-	xe_rtp_process(gt_was, &gt->reg_sr, gt, NULL);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
+
+	xe_rtp_process(&ctx, gt_was, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 
@@ -593,7 +595,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
  */
 void xe_wa_process_engine(struct xe_hw_engine *hwe)
 {
-	xe_rtp_process(engine_was, &hwe->reg_sr, hwe->gt, hwe);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+
+	xe_rtp_process(&ctx, engine_was, &hwe->reg_sr);
 }
 
 /**
@@ -606,5 +610,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
  */
 void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
-	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+
+	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
 }
-- 
2.40.1

