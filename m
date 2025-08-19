Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D662CA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 10:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5811B10E28F;
	Tue, 19 Aug 2025 10:11:29 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B203210E14B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 10:11:27 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/6] drm/xe: Only have a single drmm release action.
Date: Tue, 19 Aug 2025 12:11:19 +0200
Message-ID: <20250819101119.511705-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819101119.511705-8-dev@lankhorst.se>
References: <20250819101119.511705-8-dev@lankhorst.se>
MIME-Version: 1.0
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

The broken action happened after ggtt_early_fini, so
it's safe to put the drain_workqueue in there instead of
creating a new place.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Fixes: 89d2835c3680 ("drm/xe: Process deferred GGTT node removals on device unwind")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e03222f5ac5a1..0c6aa3126b43a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -178,6 +178,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	drain_workqueue(ggtt->wq);
 	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
@@ -238,13 +239,6 @@ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
 
-static void dev_fini_ggtt(void *arg)
-{
-	struct xe_ggtt *ggtt = arg;
-
-	drain_workqueue(ggtt->wq);
-}
-
 /**
  * xe_ggtt_init_early - Early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -297,10 +291,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (err)
 		return err;
 
-	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
-	if (err)
-		return err;
-
 	if (IS_SRIOV_VF(xe)) {
 		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
 		if (err)
-- 
2.50.0

