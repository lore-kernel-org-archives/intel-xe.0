Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C78C636D7
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1512210E39F;
	Thu, 16 Feb 2023 23:17:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6C10E39F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589460; x=1708125460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=opASuS4lW7/g4jthw0L+4FcdN4gn/5BwNdEKFXfNvz0=;
 b=Sdo1LwYk+GiNgjKcHPf5NHMC6P7eqwk6G/m+ek29lEyryuRaXTfZ7Hwi
 qT9kXQQOkrzYBzgj9vSCfdOoc08njE6LiPikDFvAmOzKdMTncnONj2GNx
 mviDovW3o68JVml8R3mer1w7KAHSzk1wsp+UZcTjiV/XsYu7eIOmCEZPJ
 2CZNJELiy5/532rw71chQee2gD9FmUxdKcXcKUy5fV2LG+9SS5fqHjvLU
 mzvkRL3er+VOO+exT+j6EwBTcv3FUlYfc4vwuKbuE92ApTfgV9wRMW5Kq
 m2+2sA2/FoG+Bv0Unp2iT1qV8pHWRJMKKkrQ20cWxLD/XanCpiskg830z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220840"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169223"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169223"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:17:24 -0800
Message-Id: <20230216231724.2246534-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216231724.2246534-1-matthew.d.roper@intel.com>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe/mocs: LNCF MOCS settings only need to
 be restored on pre-Xe_HP
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c    | 10 +++++++---
 drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
 drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
 drivers/gpu/drm/xe/xe_mocs.h       |  1 -
 5 files changed, 8 insertions(+), 19 deletions(-)

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
index 0c08cecaca40..a233023a6616 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -430,6 +430,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 					  struct iosys_map *regset_map,
 					  struct xe_hw_engine *hwe)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_hw_engine *hwe_rcs_reset_domain =
 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
 	struct xe_reg_sr_entry *entry;
@@ -464,9 +465,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 					  e->reg, e->flags, count++);
 	}
 
-	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
-		guc_mmio_regset_write_one(ads, regset_map,
-					  GEN9_LNCFCMOCS(i).reg, 0, count++);
+	/* Wa_1607983814 */
+	if (GRAPHICS_VER(xe) == 12 && GRAPHICS_VERx100(xe) < 1250) {
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
index 3b48934d99d4..7e495d699295 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -507,19 +507,6 @@ static void init_l3cc_table(struct xe_gt *gt,
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

