Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA59AC7EE2C
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC1F10E37D;
	Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2931410E37D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=52HaOb2dNHs6WRJ+vSrMuTpITsVBSL1LhM+rTKCGAqY=;
 b=GFcFvRZKW3q5CLygm6mPMes1dcmxSy3+oMw64vuWQribnaV6KZ9CX461
 fuiQYSftQFSB1tkdaI84bYuiYBHYPpF9XRiu/5Ze7m/ieG95zRQ6liYz6
 ZlTvS3mglXLWODBUshUmBrCpfWehkbkMJSC2F5Zszxj5uDOPTYddwFByj
 kx/F1tUyN46YW7TslUdiiHKHFedFLGu1+nb8V2tNFXPvjjnspPfeeugPX
 XMA9MUMkOFtZOj9xiCv8EjS3CPArEOQdJLPuyvU2Tt9AKa7G6yvnrP01R
 0yK4rZOxYy2+RpWMGoB1AgPZeTPkA2Q/Oof8yStGHXyPNVJnoUjkwVOZe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013385"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530857"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530857"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:44 -0700
Message-Id: <20230516221950.3512818-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/9] drm/xe/rtp: Add "_sr" to entry/function
 names
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

The xe_rtp_process() function and xe_rtp_entry depend on the
save-restore struct. In future it will be desired to process rtp rules,
regardless of adding them to a save-restore. Rename the struct and
function so the intent is clear and the name is freed for future uses.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 22 +++++++++++-----------
 drivers/gpu/drm/xe/xe_hw_engine.c      |  8 ++++----
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++--
 drivers/gpu/drm/xe/xe_rtp.c            | 26 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_rtp.h            | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_rtp_types.h      |  4 ++--
 drivers/gpu/drm/xe/xe_tuning.c         |  8 ++++----
 drivers/gpu/drm/xe/xe_wa.c             | 12 ++++++------
 8 files changed, 53 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index f96ef1987719..ab6f7a47db50 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -36,7 +36,7 @@ struct rtp_test_case {
 	u32 expected_clr_bits;
 	unsigned long expected_count;
 	unsigned int expected_sr_errors;
-	const struct xe_rtp_entry *entries;
+	const struct xe_rtp_entry_sr *entries;
 };
 
 static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
@@ -57,7 +57,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
 		.expected_count = 1,
 		/* Different bits on the same register: create a single entry */
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -76,7 +76,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
 		/* Don't coalesce second entry since rules don't match */
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -95,7 +95,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
 		/* Don't coalesce second entry due to one of the rules */
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -114,7 +114,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 2,
 		/* Same bits on different registers are not coalesced */
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -133,7 +133,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
 		.expected_count = 1,
 		/* Check clr vs set actions on different bits */
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -154,7 +154,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = TEMP_MASK,
 		.expected_count = 1,
 		/* Check FIELD_SET works */
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
@@ -172,7 +172,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
 		.expected_sr_errors = 1,
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -192,7 +192,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
 		.expected_sr_errors = 1,
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -212,7 +212,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_clr_bits = REG_BIT(0),
 		.expected_count = 1,
 		.expected_sr_errors = 2,
-		.entries = (const struct xe_rtp_entry[]) {
+		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
 			  XE_RTP_RULES(FUNC(match_yes)),
 			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
@@ -242,7 +242,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 	unsigned long idx, count = 0;
 
 	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
-	xe_rtp_process(&ctx, param->entries, reg_sr);
+	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
 		if (idx == param->expected_reg.addr)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1bf28b1ad319..b072682a6988 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -282,7 +282,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
 			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
-	const struct xe_rtp_entry lrc_was[] = {
+	const struct xe_rtp_entry_sr lrc_was[] = {
 		/*
 		 * Some blitter commands do not have a field for MOCS, those
 		 * commands will use MOCS index pointed by BLIT_CCTL.
@@ -300,7 +300,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		{}
 	};
 
-	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
 }
 
 static void
@@ -313,7 +313,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
 			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
-	const struct xe_rtp_entry engine_entries[] = {
+	const struct xe_rtp_entry_sr engine_entries[] = {
 		/*
 		 * RING_CMD_CCTL specifies the default MOCS entry that will be
 		 * used by the command streamer when executing commands that
@@ -334,7 +334,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		{}
 	};
 
-	xe_rtp_process(&ctx, engine_entries, &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
 }
 
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 98f678d74445..70892f134718 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -20,7 +20,7 @@ static bool match_not_render(const struct xe_gt *gt,
 	return hwe->class != XE_ENGINE_CLASS_RENDER;
 }
 
-static const struct xe_rtp_entry register_whitelist[] = {
+static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(PS_INVOCATION_COUNT,
@@ -65,7 +65,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
-	xe_rtp_process(&ctx, register_whitelist, &hwe->reg_whitelist);
+	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 648a38bf8f0c..1485e53c1496 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -26,7 +26,7 @@
 static bool rule_matches(const struct xe_device *xe,
 			 struct xe_gt *gt,
 			 struct xe_hw_engine *hwe,
-			 const struct xe_rtp_entry *entry)
+			 const struct xe_rtp_entry_sr *entry)
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i;
@@ -113,9 +113,9 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	xe_reg_sr_add(sr, &sr_entry);
 }
 
-static void rtp_process_one(const struct xe_rtp_entry *entry,
-			    struct xe_device *xe, struct xe_gt *gt,
-			    struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
+static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
+			       struct xe_device *xe, struct xe_gt *gt,
+			       struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
 {
 	const struct xe_rtp_action *action;
 	u32 mmio_base;
@@ -160,10 +160,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 }
 
 /**
- * xe_rtp_process - Process all rtp @entries, adding the matching ones to @sr
+ * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
+ *                        the save-restore argument.
  * @ctx: The context for processing the table, with one of device, gt or hwe
  * @entries: Table with RTP definitions
- * @sr: Where to add an entry to with the values for matching. This can be
+ * @sr: Save-restore struct where matching rules execute the action. This can be
  *      viewed as the "coalesced view" of multiple the tables. The bits for each
  *      register set are expected not to collide with previously added entries
  *
@@ -171,10 +172,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
  * entries with matching rules to @sr. If @hwe is not NULL, its mmio_base is
  * used to calculate the right register offset
  */
-void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
-		    const struct xe_rtp_entry *entries, struct xe_reg_sr *sr)
+void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
+			  const struct xe_rtp_entry_sr *entries,
+			  struct xe_reg_sr *sr)
 {
-	const struct xe_rtp_entry *entry;
+	const struct xe_rtp_entry_sr *entry;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
 	struct xe_device *xe;
@@ -187,13 +189,13 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 			enum xe_hw_engine_id id;
 
 			for_each_hw_engine(each_hwe, gt, id)
-				rtp_process_one(entry, xe, gt, each_hwe, sr);
+				rtp_process_one_sr(entry, xe, gt, each_hwe, sr);
 		} else {
-			rtp_process_one(entry, xe, gt, hwe, sr);
+			rtp_process_one_sr(entry, xe, gt, hwe, sr);
 		}
 	}
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
 
 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index e7f254fb1b31..f2b31be294d6 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -261,7 +261,7 @@ struct xe_reg_sr;
 #define XE_RTP_NAME(s_)	.name = (s_)
 
 /**
- * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry
+ * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry_sr
  * @f1_: Last part of a ``XE_RTP_ENTRY_FLAG_*``
  * @...: Additional flags, defined like @f1_
  *
@@ -270,7 +270,7 @@ struct xe_reg_sr;
  *
  * .. code-block:: c
  *
- *	const struct xe_rtp_entry wa_entries[] = {
+ *	const struct xe_rtp_entry_sr wa_entries[] = {
  *		...
  *		{ XE_RTP_NAME("test-entry"),
  *		  ...
@@ -293,7 +293,7 @@ struct xe_reg_sr;
  *
  * .. code-block:: c
  *
- *	const struct xe_rtp_entry wa_entries[] = {
+ *	const struct xe_rtp_entry_sr wa_entries[] = {
  *		...
  *		{ XE_RTP_NAME("test-entry"),
  *		  ...
@@ -307,7 +307,7 @@ struct xe_reg_sr;
 	.flags = (XE_RTP_PASTE_FOREACH(ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
 
 /**
- * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
+ * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
  * @r1: Last part of XE_RTP_MATCH_*
  * @...: Additional rules, defined like @r1
  *
@@ -317,7 +317,7 @@ struct xe_reg_sr;
  *
  * .. code-block:: c
  *
- *	const struct xe_rtp_entry wa_entries[] = {
+ *	const struct xe_rtp_entry_sr wa_entries[] = {
  *		...
  *		{ XE_RTP_NAME("test-entry"),
  *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
@@ -333,7 +333,7 @@ struct xe_reg_sr;
 	}
 
 /**
- * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry
+ * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
  * @...: Actions to be taken
  *
  * At least one rule is needed and up to 4 are supported. Multiple rules are
@@ -342,7 +342,7 @@ struct xe_reg_sr;
  *
  * .. code-block:: c
  *
- *	const struct xe_rtp_entry wa_entries[] = {
+ *	const struct xe_rtp_entry_sr wa_entries[] = {
  *		...
  *		{ XE_RTP_NAME("test-entry"),
  *		  XE_RTP_RULES(...),
@@ -363,9 +363,9 @@ struct xe_reg_sr;
 	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
 	struct xe_device *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
 
-void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
-		    const struct xe_rtp_entry *entries,
-		    struct xe_reg_sr *sr);
+void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
+			  const struct xe_rtp_entry_sr *entries,
+			  struct xe_reg_sr *sr);
 
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 6d9ab9eb91ba..a9e0153ff87d 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -84,8 +84,8 @@ struct xe_rtp_rule {
 	};
 };
 
-/** struct xe_rtp_entry - Entry in an rtp table */
-struct xe_rtp_entry {
+/** struct xe_rtp_entry_sr - Entry in an rtp table */
+struct xe_rtp_entry_sr {
 	const char *name;
 	const struct xe_rtp_action *actions;
 	const struct xe_rtp_rule *rules;
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index c2810ede3a65..412e59de9842 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -15,7 +15,7 @@
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
-static const struct xe_rtp_entry gt_tunings[] = {
+static const struct xe_rtp_entry_sr gt_tunings[] = {
 	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
@@ -27,7 +27,7 @@ static const struct xe_rtp_entry gt_tunings[] = {
 	{}
 };
 
-static const struct xe_rtp_entry lrc_tunings[] = {
+static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
 	  /* read verification is ignored due to 1608008084. */
@@ -61,7 +61,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
-	xe_rtp_process(&ctx, gt_tunings, &gt->reg_sr);
+	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
 
@@ -77,5 +77,5 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
-	xe_rtp_process(&ctx, lrc_tunings, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
 }
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 4b236b6f4c8e..557e90d79f0b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -93,7 +93,7 @@
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
-static const struct xe_rtp_entry gt_was[] = {
+static const struct xe_rtp_entry_sr gt_was[] = {
 	{ XE_RTP_NAME("14011060649"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
 		       ENGINE_CLASS(VIDEO_DECODE),
@@ -235,7 +235,7 @@ static const struct xe_rtp_entry gt_was[] = {
 	{}
 };
 
-static const struct xe_rtp_entry engine_was[] = {
+static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE,
@@ -490,7 +490,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	{}
 };
 
-static const struct xe_rtp_entry lrc_was[] = {
+static const struct xe_rtp_entry_sr lrc_was[] = {
 	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
@@ -581,7 +581,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
-	xe_rtp_process(&ctx, gt_was, &gt->reg_sr);
+	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 
@@ -597,7 +597,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
-	xe_rtp_process(&ctx, engine_was, &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
 }
 
 /**
@@ -612,5 +612,5 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
-	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
 }
-- 
2.40.1

