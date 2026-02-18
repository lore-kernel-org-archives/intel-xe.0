Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33028E9A04E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC7910E639;
	Wed, 18 Feb 2026 22:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1zACwV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0776910E630
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771452590; x=1802988590;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=oKk6HfRnzVjVrwwZhd6hT7VDRN8lfWT1ioBK+5PJQ2I=;
 b=d1zACwV85EI0nSoGKSYLUbBOOp/3q4V2DlWBofSi962TrS2Da24E2d6+
 DjweHccQwBnisTjV0JjWVIZnxPLh9z9M+9YV3DQW0uNCbqdz/jTp5ExSa
 P4CJF+6uJbJFQuqOoBuSInv72v8QtYnq5Y2dq06LQD/k21mRWlyZ05n/B
 s4porlD/aw8UCrZjafjc6+U8k2X6fSN0o2Y0DS2e7AinrS7wTHh6GBSnt
 hMEmjHdijW1o6FmuvXJSZFEwKn6zCRkDtFvfr4BubaHM5H93kHdGHcZwm
 jEjX0IE23lb4EVTNcuLLJwYb+o70rGQEqxvaw3dkypm+6w7+uDI2t1+g+ A==;
X-CSE-ConnectionGUID: mTgVICeERA6fl63LiqtWBw==
X-CSE-MsgGUID: zpncHj3wSjOnMMm9dr+p5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76399065"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76399065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
X-CSE-ConnectionGUID: oRlEIJdIRr6LXfCFPrAt/w==
X-CSE-MsgGUID: nkQhlz2qSV+NUd+0KNs44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214329409"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Feb 2026 14:09:12 -0800
Subject: [PATCH v4 1/4] drm/xe/reg_sr: Don't process gt/hwe lists in VF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sr_verify-v4-1-35d6deeb3421@intel.com>
References: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
In-Reply-To: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Harish Chegondi <harish.chegondi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10995;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=oKk6HfRnzVjVrwwZhd6hT7VDRN8lfWT1ioBK+5PJQ2I=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpljisqthUrPq4aFKxqwqtuNfZBZ3/XeYzLr6lf
 4kATEuyBA2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZY4rAAKCRBNeSQFyHKQ
 BDGqD/9VyI+xYoRuPsTkCLY3MaKPvgXPqIlx6ACQSlwmxjig1VNmAACC+wXXbzCzwPZjv361k6i
 jCbSSRjZTTgEhvbFewtte1CcxnBjgjd85skevZQhxXfew1rQNEcwNjnLrsbCC/7+yIzBEBiMy4P
 24FKkUVJ44SyEwYm7gyVVtfohBApwEQqzb5cG7rH+zM68iVKPpMshpgm2UvzdX1MuK/YLs/shUz
 G4U/yQwOEUtzmugQhFUfPat9b0pkZjzS2r5s5Zk8xblFXDYWebOpSJg9VSXhwwfvIR6t2+QJwvV
 p9BDJNjXUKMG34c/7CVsK3wT3JxmCjQRNZwh2lcMAUFoosVR8IWftLi/Qx9Rqq1v2w8poi0N+ZC
 Y2KWM0u4ceuRSSv9JpnkSeTh4ruGLDbjk3TqQ5VkddAH8NsPOFKTABo4BJXAQg/4LX3qu23Izmn
 xBF1TPKijLIxa2CMSTnHiiAIWzhSgqzh5TdWi+S+AOs90yIIm3isAJSYnzcRzPIh+XKynSnWkRD
 +gJMDJY7c8/fFJ40Fq2NdWZMBAaPB4Ej9d/Wqfgvng3uZ3jFPXXrJNsg+y0gnIN5nUjHBnx0mAT
 3NrnukVsHz92b69Ul4ddbaE7+JJ4U+JG4wSYyMYWrT7UFJUBxN2Jle4CQoawXcZ1P4+2ozvwlK0
 QSh5gKOBvjmTPzQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

There are a few different reg_sr lists managed by the driver for
workarounds/tuning:

 - gt->reg_sr
 - hwe->reg_sr
 - hwe->reg_lrc

The first two are not relevant to SRIOV VFs; a VF KMD does not have
access to the registers that appear on this list and it is the PF KMD's
responsibility to apply such programming on behalf of the entire system.
However the third list contains per-client values that the VF KMD needs
to ensure are incorporated whenever a new LRC is created.

Handling of reg_sr lists comes in two steps: processing an RTP table to
build a reg_sr from the relevant entries, and then applying the contents
of the reg_sr.  Skipping the RTP processing (resulting in an empty
reg_sr) or skipping the application of a reg_sr are both valid ways to
avoid having a VF accidentally try to write registers it doesn't have
access to.  In commit c19e705ec981 ("drm/xe/vf: Stop applying
save-restore MMIOs if VF") and commit 92a5bd302458 ("drm/xe/vf: Unblock
xe_rtp_process_to_sr for VFs") we adjusted the drivers behavior to
always process the RTP table into a reg_sr and just skipped the
application step.  This works fine functionally, but can lead to
confusion during debugging since facilities like the debugfs
'register-save-restore' will still report a bunch of registers that the
VF KMD isn't actually trying to handle.  It will also mislead other
upcoming debug changes.

Let's go back to skipping the RTP => reg_sr processing step, but only
for GT / hwe tables this time.  This will allow LRC reg_sr handling to
continue to work, but will ensure that gt->reg_sr and hwe->reg_sr remain
empty and that debugfs reporting more accurately reflects the KMD's
behavior.

v2:
 - Also skip the hwe processing in hw_engine_setup_default_state() and
   xe_reg_whitelist_process_engine().

v3:
 - Handle skipping via an additional parameter passed to
   xe_rtp_process_to_sr() rather than adding conditions at each
   callsite.  (Ashutosh)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 3 ++-
 drivers/gpu/drm/xe/xe_hw_engine.c      | 6 ++++--
 drivers/gpu/drm/xe/xe_reg_sr.c         | 8 ++++++--
 drivers/gpu/drm/xe/xe_reg_whitelist.c  | 2 +-
 drivers/gpu/drm/xe/xe_rtp.c            | 8 +++++++-
 drivers/gpu/drm/xe/xe_rtp.h            | 3 ++-
 drivers/gpu/drm/xe/xe_tuning.c         | 9 ++++++---
 drivers/gpu/drm/xe/xe_wa.c             | 9 ++++++---
 8 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index d2255a59e58f919fa9a09e8a383a29d60dab9527..e5a0f985a700b8b69024c1f3ddec267f45cf7ddc 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -322,7 +322,8 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
 		count_rtp_entries++;
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
-	xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries, reg_sr);
+	xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries,
+			     reg_sr, false);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
 		if (idx == param->expected_reg.addr)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4d3ee5226e3ac7f2d539f9aac0df9f2b16410a8d..05810428236e8ceddad2e13e28b42daa4790b6c3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -408,7 +408,8 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		},
 	};
 
-	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup),
+			     &hwe->reg_lrc, true);
 }
 
 static void
@@ -472,7 +473,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		},
 	};
 
-	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries),
+			     &hwe->reg_sr, false);
 }
 
 static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index d3e13ea33123c2030eb3d16d9b8da00b081441db..1ac911fc6e943ce05b8ac7cef33bc23d872d5ec4 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -13,6 +13,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
@@ -169,8 +170,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	if (xa_empty(&sr->xa))
 		return;
 
-	if (IS_SRIOV_VF(gt_to_xe(gt)))
-		return;
+	/*
+	 * We don't process non-LRC reg_sr lists in VF, so they should have
+	 * been empty in the check above.
+	 */
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 728aba8dbd958740b1711db9a1aa78fe2efc8d43..80577e4b7437ca2e65d1a94f6869446a3de0b4b0 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -189,7 +189,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
 	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
-			     &hwe->reg_whitelist);
+			     &hwe->reg_whitelist, false);
 	whitelist_apply_to_hwe(hwe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b7c26e2fb411ea75fbd484b55f48019fc09f0581..7bfdc6795ce6fd3d2c8c9d1398c7b72ff476b96d 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -270,6 +270,8 @@ static void rtp_mark_active(struct xe_device *xe,
  * @sr: Save-restore struct where matching rules execute the action. This can be
  *      viewed as the "coalesced view" of multiple the tables. The bits for each
  *      register set are expected not to collide with previously added entries
+ * @process_in_vf: Whether this RTP table should get processed for SR-IOV VF
+ *      devices.  Should generally only be 'true' for LRC tables.
  *
  * Walk the table pointed by @entries (with an empty sentinel) and add all
  * entries with matching rules to @sr. If @hwe is not NULL, its mmio_base is
@@ -278,7 +280,8 @@ static void rtp_mark_active(struct xe_device *xe,
 void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
 			  size_t n_entries,
-			  struct xe_reg_sr *sr)
+			  struct xe_reg_sr *sr,
+			  bool process_in_vf)
 {
 	const struct xe_rtp_entry_sr *entry;
 	struct xe_hw_engine *hwe = NULL;
@@ -287,6 +290,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
+	if (!process_in_vf && IS_SRIOV_VF(xe))
+		return;
+
 	xe_assert(xe, entries);
 
 	for (entry = entries; entry - entries < n_entries; entry++) {
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index ba5f940c0a961e10effd457c6d631de2170aa39e..be4195264286378d390540fea97b030166df4172 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -431,7 +431,8 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 
 void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 			  const struct xe_rtp_entry_sr *entries,
-			  size_t n_entries, struct xe_reg_sr *sr);
+			  size_t n_entries, struct xe_reg_sr *sr,
+			  bool process_in_vf);
 
 void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 		    const struct xe_rtp_entry *entries);
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 316f5e2b2e481e5ef0502001ba9ffb9bb0e8abcb..ea90e8c9975488dc191aca87047e79bac86346f1 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -15,6 +15,7 @@
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
+#include "xe_sriov.h"
 
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
@@ -200,7 +201,8 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  gt->tuning_active.gt,
 						  ARRAY_SIZE(gt_tunings));
-	xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings), &gt->reg_sr);
+	xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings),
+			     &gt->reg_sr, false);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
 
@@ -212,7 +214,7 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
 						  hwe->gt->tuning_active.engine,
 						  ARRAY_SIZE(engine_tunings));
 	xe_rtp_process_to_sr(&ctx, engine_tunings, ARRAY_SIZE(engine_tunings),
-			     &hwe->reg_sr);
+			     &hwe->reg_sr, false);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
 
@@ -231,7 +233,8 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  hwe->gt->tuning_active.lrc,
 						  ARRAY_SIZE(lrc_tunings));
-	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings),
+			     &hwe->reg_lrc, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 61c4187dc0aee2e86010af36536eff56041f982f..e6b7f65f2fc1105966064567930ede100341709d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -1005,7 +1005,8 @@ void xe_wa_process_gt(struct xe_gt *gt)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
 						  ARRAY_SIZE(gt_was));
-	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt->reg_sr);
+	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was),
+			     &gt->reg_sr, false);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 
@@ -1023,7 +1024,8 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
 						  ARRAY_SIZE(engine_was));
-	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), &hwe->reg_sr);
+	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was),
+			     &hwe->reg_sr, false);
 }
 
 /**
@@ -1040,7 +1042,8 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
 						  ARRAY_SIZE(lrc_was));
-	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was),
+			     &hwe->reg_lrc, true);
 }
 
 /**

-- 
2.53.0

