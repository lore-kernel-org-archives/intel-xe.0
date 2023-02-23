Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F6C636D6
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D7A10E076;
	Thu, 23 Feb 2023 18:57:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DBC10E076
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178674; x=1708714674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IrBrri90y5tbP6NJYX1XNaaTqhGCEbsQeJB1t14p/K4=;
 b=OKilLs5BP64yldoVE9UhQEuy/V6BBPmetR0w/eADMEAlgvCfPwVUgLTD
 GE8Drw6AdbcMvwBpDdVPui0XrYtKxeftCbsWeUaXw0qYoptsH8onrNBsO
 Uu+3YPjKgWiUzr9t9XfRLyMVl73iIoPzfTJw9hSQ5ZIypkTneMS2v+PrE
 kJdeTvHgyK0CliJ8N93L0IX26lnFnRyJ7KyCk1raHd/86BWxW+Rl1QeIa
 In24NXbg0bTFIK1EMkRvxAuuepui+FY0di1+K4JlZvmvp1tC6T8ySIGq5
 qjWEQS4fb/JPCMPU83yVgwWSeaSWLiq+NPdHmM+mIbfhMj22RJ+7rHu/3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793756"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793756"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018615"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018615"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:39 -0800
Message-Id: <20230223185740.3356127-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/7] drm/xe/mocs: LNCF MOCS settings only need
 to be restored on pre-Xe_HP
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reprogramming the LNCF MOCS registers on render domain reset is not
intended to be regular driver programming, but rather the implementation
of a specific workaround (Wa_1607983814).  This workaround no longer
applies on Xe_HP any beyond, so we can expect that these registers, like
the rest of the LNCF/LBCF registers, will maintain their values through
all engine resets.  We should only add these registers to the GuC's
save/restore list on platforms that need the workaround.

Furthermore, xe_mocs_init_engine() appears to be another attempt to
satisfy this same workaround.  This is unnecessary on the Xe driver
since even on platforms where the workaround is necessary, all
single-engine resets are initiated by the GuC and thus the GuC will take
care of saving/restoring these registers.  The only host-initiated
resets we have in Xe are full GT resets which will already
(re)initialize these registers as part of the regular xe_mocs_init()
flow.

v2:
 - Add needs_wa_1607983814() so that calculate_regset_size() doesn't
   overallocate regset space when the workaround isn't needed.  (Lucas)
 - On platforms affected by Wa_1607983814, only add the LNCF MOCS
   registers to the render engine's GuC save/restore list; resets of
   other engines don't need to save/restore these.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c    | 20 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
 drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
 drivers/gpu/drm/xe/xe_mocs.h       |  1 -
 5 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index d555d77cbf49..fd0ebfe7cae3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -462,7 +462,7 @@ static void execlist_engine_suspend_wait(struct xe_engine *e)
 
 static void execlist_engine_resume(struct xe_engine *e)
 {
-	xe_mocs_init_engine(e);
+	/* NIY */
 }
 
 static const struct xe_engine_ops execlist_engine_ops = {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 0c08cecaca40..0a458c083db7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -206,6 +206,11 @@ static void guc_ads_fini(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(ads->bo);
 }
 
+static bool needs_wa_1607983814(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) < 1250;
+}
+
 static size_t calculate_regset_size(struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *sr_entry;
@@ -218,7 +223,10 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
-	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
+	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
+
+	if (needs_wa_1607983814(gt_to_xe(gt)))
+		count += LNCFCMOCS_REG_COUNT;
 
 	return count * sizeof(struct guc_mmio_reg);
 }
@@ -430,6 +438,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 					  struct iosys_map *regset_map,
 					  struct xe_hw_engine *hwe)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_hw_engine *hwe_rcs_reset_domain =
 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
 	struct xe_reg_sr_entry *entry;
@@ -464,9 +473,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 					  e->reg, e->flags, count++);
 	}
 
-	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
-		guc_mmio_regset_write_one(ads, regset_map,
-					  GEN9_LNCFCMOCS(i).reg, 0, count++);
+	/* Wa_1607983814 */
+	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
+		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
+			guc_mmio_regset_write_one(ads, regset_map,
+						  GEN9_LNCFCMOCS(i).reg, 0, count++);
+		}
 	}
 
 	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a54f7f82d04d..3766b77a0d90 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1267,7 +1267,6 @@ static void guc_engine_resume(struct xe_engine *e)
 
 	XE_BUG_ON(e->guc->suspend_pending);
 
-	xe_mocs_init_engine(e);
 	guc_engine_add_msg(e, msg, RESUME);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 1ede2d46e778..c019352ba7a8 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -517,19 +517,6 @@ static void init_l3cc_table(struct xe_gt *gt,
 	}
 }
 
-void xe_mocs_init_engine(const struct xe_engine *engine)
-{
-	struct xe_mocs_info table;
-	unsigned int flags;
-
-	flags = get_mocs_settings(engine->gt->xe, &table);
-	if (!flags)
-		return;
-
-	if (flags & HAS_RENDER_L3CC && engine->class == XE_ENGINE_CLASS_RENDER)
-		init_l3cc_table(engine->gt, &table);
-}
-
 void xe_mocs_init(struct xe_gt *gt)
 {
 	struct xe_mocs_info table;
diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index aba1abe216ab..63500a1d6660 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -11,7 +11,6 @@
 struct xe_engine;
 struct xe_gt;
 
-void xe_mocs_init_engine(const struct xe_engine *engine);
 void xe_mocs_init(struct xe_gt *gt);
 
 /**
-- 
2.39.1

