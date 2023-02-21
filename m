Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED85C6379F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912910E398;
	Tue, 21 Feb 2023 23:34:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4210E398
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mVfizQGso/SDG0WGrUAwzr7p2hquWE+ptieUOrfEuog=;
 b=GAz0MOERiltPJqTnRjFvbrAECQeAHLbJ+m6VJnuWbrUbeh4K+pd/XHUg
 wOgXuA9JnCkFyYCguYDocZBZ4Yfkq6zaYSSAEXdU+CxFvZ7eCAwP/CdJT
 G0AEiev/xprxVnPzxiWi7KwaeBUMoU9g8xjTWYmiA6DS7JztYxb9k1bz6
 EF2XFDqDevHRmm/SKdvgzMjCZZPsu6Vu3+i8pTKeUFXRdzTotOEDDczQT
 Hn52kfLP1wntPK4M62MbyjBZOhH4H++XnjwwE6TZWP1NcIF3u39oiBkUs
 HsKOVoUl2dYtiJgHa9BIl3vSg5eaan58huvER464sUrGtKH8fCFoRLRC8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156246"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156246"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691833"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691833"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:43 -0800
Message-Id: <20230221233348.883897-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221233348.883897-1-lucas.demarchi@intel.com>
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe: Make local functions static
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A few static functions not being declared like that break the build with
W=1, like e.g.

	cc1: all warnings being treated as errors
	make[2]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_gt.o] Error 1
	../drivers/gpu/drm/xe/xe_guc.c:240:6: error: no previous prototype for ‘guc_write_params’ [-Werror=missing-prototypes]
	  240 | void guc_write_params(struct xe_guc *guc)
	      |      ^~~~~~~~~~~~~~~~

Make them static.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c              | 6 +++---
 drivers/gpu/drm/xe/xe_guc.c             | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c             | 2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c17279653561..809e9b14c314 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -218,7 +218,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
 
 static void gt_reset_worker(struct work_struct *w);
 
-int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
+static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 {
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
@@ -252,7 +252,7 @@ int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 	return 0;
 }
 
-int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
+static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 {
 	struct xe_reg_sr *sr = &e->hwe->reg_lrc;
 	struct xe_reg_sr_entry *entry;
@@ -609,7 +609,7 @@ int xe_gt_init(struct xe_gt *gt)
 	return 0;
 }
 
-int do_gt_reset(struct xe_gt *gt)
+static int do_gt_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5cdfdfd0de40..32bcc40463e1 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -237,7 +237,7 @@ static void guc_init_params(struct xe_guc *guc)
  * transfer. These parameters are read by the firmware on startup
  * and cannot be changed thereafter.
  */
-void guc_write_params(struct xe_guc *guc)
+static void guc_write_params(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	int i;
@@ -560,7 +560,7 @@ static void guc_handle_mmio_msg(struct xe_guc *guc)
 			"Received early GuC exception notification!\n");
 }
 
-void guc_enable_irq(struct xe_guc *guc)
+static void guc_enable_irq(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 events = xe_gt_is_media_type(gt) ?
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7b7ddd11c2b8..89401c663274 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -457,7 +457,7 @@ static void dg1_irq_reset(struct xe_gt *gt)
 	GEN3_IRQ_RESET(gt, GEN8_PCU_);
 }
 
-void xe_irq_reset(struct xe_device *xe)
+static void xe_irq_reset(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	u8 id;
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 8a8d814a0e7a..977c963a8cd0 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -56,9 +56,9 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
 	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
 };
 
-int check_hw_engines(struct xe_device *xe,
-		     struct drm_xe_engine_class_instance *eci,
-		     int num_engines)
+static int check_hw_engines(struct xe_device *xe,
+			    struct drm_xe_engine_class_instance *eci,
+			    int num_engines)
 {
 	int i;
 
-- 
2.39.0

