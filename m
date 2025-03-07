Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8732BC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 04:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE6510EABF;
	Fri,  7 Mar 2025 04:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E59Sda46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4967A10EABE
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 04:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741320023; x=1772856023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jPV7kW8VL5OeW7puB5Nt9HpTfmCejTUM3oMnn+fgmOA=;
 b=E59Sda46AteoYg6pGj2n+HkhAm3kjburKM/+0GZ7jPpnHeE1aOC3G3dL
 vdNrAtme1ZKCSpekATwMrlqco/4cqlig1GibAF9eltC3+V9X9Obh/Ff7J
 MnlDdCAn2TvY5MBBSXQkiJk0wJY7VerQPklAGlfW5T5IFYq6OkEZTAGWn
 EUjHV7UwwKlngclxf0vLiz95BS1TRyZluSmH423A7WVZuznfaNs4oMTrZ
 qFBNq1SAKE22uKsPuj6Dfp7NjDVxCYUsVSHHD7NeENNRDmMTnoJlMggS8
 fWR9pSrW3FRo967Vcy5F1YjxTS4ZIcqubozFKbsAqmU9mg+L/e6eZ8SP0 g==;
X-CSE-ConnectionGUID: hWhB/amLSvqmb6AnNA65pA==
X-CSE-MsgGUID: 2LAwUVKAQm60/BgsvUHVMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42392329"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="42392329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 20:00:20 -0800
X-CSE-ConnectionGUID: JjzHEuUpQS2MwpWc+OILcA==
X-CSE-MsgGUID: UC3aJPahQLuQfvFRFtnzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="150007797"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 20:00:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH] drm/xe/rtp: Drop sentinel from xe_rtp_process_to_sr()
Date: Thu,  6 Mar 2025 20:00:04 -0800
Message-ID: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250306-fix-print-warning-43d20fc31309
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

There's a mismatch on API: while xe_rtp_process_to_sr() processes
entries until an entry without name, the active tracking with
xe_rtp_process_ctx_enable_active_tracking() needs to use the number of
elements. The number of elements is taken everywhere using ARRAY_SIZE(),
but that will have one entry too many. This leads to the following
warning, as reported by lkp:

   drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>> include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]
     228 |         drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
         |                               ^~~~~~
   drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 'drm_printf_indent'
     226 |                 drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
         |                 ^~~~~~~~~~~~~~~~~

That's because it will still process the last entry when tracking the
active tunings. The same issue exists in the WAs. Change
xe_rtp_process_to_sr() to also take the number of elements so the empty
entry can be removed and the warning should go away. Fixing on the
active-tracking side would more fragile as the it would need a `- 1`
everywhere and continue to use a different approach for number of
elements.

Aside from the warning, it's a non-issue as there would always be enough
bits allocated and the last entry would never be active since
xe_rtp_process_to_sr() stops on the sentinel.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK-lkp@intel.com/
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  6 ++----
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++--
 drivers/gpu/drm/xe/xe_rtp.c            |  6 +++++-
 drivers/gpu/drm/xe/xe_rtp.h            |  2 +-
 drivers/gpu/drm/xe/xe_tuning.c         | 12 ++++--------
 drivers/gpu/drm/xe/xe_wa.c             | 12 +++---------
 7 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 36a3b5420fef6a1977a04d169d4946f75ee523c4..b0254b014fe45013aa0c5b3fbbe7a58fe8584a31 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -320,7 +320,7 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
 		count_rtp_entries++;
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
-	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
+	xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries, reg_sr);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
 		if (idx == param->expected_reg.addr)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe786c0035d888047a856780a572e526..223b95de388cb8919a7d1ab52e1305be990672ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -400,10 +400,9 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
 		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
 		},
-		{}
 	};
 
-	xe_rtp_process_to_sr(&ctx, lrc_setup, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), &hwe->reg_lrc);
 }
 
 static void
@@ -459,10 +458,9 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
-		{}
 	};
 
-	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
 }
 
 static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index edab5d4e3ba5e7708565f8bc51df50c0b4a46f39..23f6c81d99946f97413e411289116aaa10365f3f 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -88,7 +88,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
-	{}
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
@@ -137,7 +136,8 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
-	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
+	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
+			     &hwe->reg_whitelist);
 	whitelist_apply_to_hwe(hwe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 7a1c78fdfc92ee9a7e8862c2a65ce99b1f2a5ff1..13bb62d3e615e89d1e996692732b1859561ac55e 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -237,6 +237,7 @@ static void rtp_mark_active(struct xe_device *xe,
  *                        the save-restore argument.
  * @ctx: The context for processing the table, with one of device, gt or hwe
  * @entries: Table with RTP definitions
+ * @n_entries: Number of entries to process, usually ARRAY_SIZE(entries)
  * @sr: Save-restore struct where matching rules execute the action. This can be
  *      viewed as the "coalesced view" of multiple the tables. The bits for each
  *      register set are expected not to collide with previously added entries
@@ -247,6 +248,7 @@ static void rtp_mark_active(struct xe_device *xe,
  */
 void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
+			  size_t n_entries,
 			  struct xe_reg_sr *sr)
 {
 	const struct xe_rtp_entry_sr *entry;
@@ -259,7 +261,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 	if (IS_SRIOV_VF(xe))
 		return;
 
-	for (entry = entries; entry && entry->name; entry++) {
+	xe_assert(xe, entries);
+
+	for (entry = entries; entry - entries < n_entries; entry++) {
 		bool match = false;
 
 		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 38b9f13bba5e54f9c6e863bb578c00fce7a8c452..4fe736a11c42b954c2256fa21a49b0c2e39901e2 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -430,7 +430,7 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 
 void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
-			  struct xe_reg_sr *sr);
+			  size_t n_entries, struct xe_reg_sr *sr);
 
 void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 		    const struct xe_rtp_entry *entries);
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 77bc958f5a42cd017d3c363825dfd05cd73f872e..49ddbda7cdef66da49469b687b2296cc2d00b283 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -85,8 +85,6 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(MEDIA_VERSION(2000)),
 	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
 	},
-
-	{}
 };
 
 static const struct xe_rtp_entry_sr engine_tunings[] = {
@@ -100,7 +98,6 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
-	{}
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
@@ -138,8 +135,6 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
 				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
 	},
-
-	{}
 };
 
 /**
@@ -180,7 +175,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  gt->tuning_active.gt,
 						  ARRAY_SIZE(gt_tunings));
-	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
+	xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings), &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
 
@@ -191,7 +186,8 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  hwe->gt->tuning_active.engine,
 						  ARRAY_SIZE(engine_tunings));
-	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_tunings, ARRAY_SIZE(engine_tunings),
+			     &hwe->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
 
@@ -210,7 +206,7 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  hwe->gt->tuning_active.lrc,
 						  ARRAY_SIZE(lrc_tunings));
-	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), &hwe->reg_lrc);
 }
 
 void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 55eb453f4b1fb39d4127609a28e4a5ebe9b5a051..a25afb757f7088c7f831867717b42982e9ea754c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -279,8 +279,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-
-	{}
 };
 
 static const struct xe_rtp_entry_sr engine_was[] = {
@@ -624,8 +622,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
-
-	{}
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
@@ -825,8 +821,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
-
-	{}
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
@@ -868,7 +862,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
 						  ARRAY_SIZE(gt_was));
-	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
+	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt->reg_sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 
@@ -886,7 +880,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
 						  ARRAY_SIZE(engine_was));
-	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), &hwe->reg_sr);
 }
 
 /**
@@ -903,7 +897,7 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
 						  ARRAY_SIZE(lrc_was));
-	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
 }
 
 /**

---
base-commit: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
change-id: 20250306-fix-print-warning-43d20fc31309

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
