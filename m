Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB6C61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 14:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE51310E4B2;
	Tue, 21 Nov 2023 14:05:14 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1A410E02C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 14:05:07 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:04:59 +0100
Message-Id: <20231121140502.9793-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm: Add drm_vblank_work_flush_all().
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In some cases we want to flush all vblank work, right before vblank_off
for example. Add a simple function to make this possible.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_vblank_work.c | 22 ++++++++++++++++++++++
 include/drm/drm_vblank_work.h     |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index 43cd5c0f4f6f..ff86f2b2e052 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -232,6 +232,28 @@ void drm_vblank_work_flush(struct drm_vblank_work *work)
 }
 EXPORT_SYMBOL(drm_vblank_work_flush);
 
+/**
+ * drm_vblank_work_flush_all - flush all currently pending vblank work on crtc.
+ * @crtc: crtc for which vblank work to flush
+ *
+ * Wait until all currently queued vblank work on @crtc
+ * has finished executing once.
+ */
+void drm_vblank_work_flush_all(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(crtc)];
+
+	spin_lock_irq(&dev->event_lock);
+	wait_event_lock_irq(vblank->work_wait_queue,
+			    waitqueue_active(&vblank->work_wait_queue),
+			    dev->event_lock);
+	spin_unlock_irq(&dev->event_lock);
+
+	kthread_flush_worker(vblank->worker);
+}
+EXPORT_SYMBOL(drm_vblank_work_flush_all);
+
 /**
  * drm_vblank_work_init - initialize a vblank work item
  * @work: vblank work item
diff --git a/include/drm/drm_vblank_work.h b/include/drm/drm_vblank_work.h
index eb41d0810c4f..e04d436b7297 100644
--- a/include/drm/drm_vblank_work.h
+++ b/include/drm/drm_vblank_work.h
@@ -17,6 +17,7 @@ struct drm_crtc;
  * drm_vblank_work_init()
  * drm_vblank_work_cancel_sync()
  * drm_vblank_work_flush()
+ * drm_vblank_work_flush_all()
  */
 struct drm_vblank_work {
 	/**
@@ -67,5 +68,6 @@ void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
 			  void (*func)(struct kthread_work *work));
 bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work);
 void drm_vblank_work_flush(struct drm_vblank_work *work);
+void drm_vblank_work_flush_all(struct drm_crtc *crtc);
 
 #endif /* !_DRM_VBLANK_WORK_H_ */
-- 
2.40.1

