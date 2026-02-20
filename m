Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1190C55162
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EDA10E7A5;
	Fri, 20 Feb 2026 08:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Ev9nFH96";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A2510E7A2;
 Fri, 20 Feb 2026 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576629;
 bh=3DZgJsq9cXtJcxxoTli6qqSG9rAnN2F4n5NlIb7zR3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ev9nFH96B0fcrZCQaMktJQZ93UahbVulRs+oZwk0wGheiSa40qhf9WA8eT6oLEa0A
 T2oGwvKadV/9H8NjLGqpMf2nqGiIQXe94x/1/qK+nrsY1iCNkytRJ96knjIOy6uiMF
 tS9j00EUx51o+ySYcLjgjAtHA2x3RZIplySH+XGq4zXYOtYGUNCokiIVG75cM/0PFf
 fKhrTNTfcMMCNfRkVW6JdOkRQMXUZxhvfNmQFjwlnO3nljZt7wvMWbvXhpbcO6VeTO
 bcW0/UwGCqcTUE9xha6yYjWCNIJuVM6/EIY9+j+cmBRFUKb4W0Pkrkt+Xq6Ovhc3vz
 bYce+XaKjvGdg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 02/24] drm/vblank: Add a 2-stage version of
 drm_crtc_arm_vblank_event
Date: Fri, 20 Feb 2026 09:37:00 +0100
Message-ID: <20260220083657.28815-28-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220083657.28815-26-dev@lankhorst.se>
References: <20260220083657.28815-26-dev@lankhorst.se>
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

When trying to fix the hardware programming in intel/display, I had
to take all the vblank locks with local_irqs_disabled(). This
required converting the entire vblank code to raw spinlocks.

In the alternative approach, do all preparations in advance, and only
enable the vblank_event with interrupts disabled, this requires only
a simple write and prevents a complete re-architecture of the code.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_vblank.c | 61 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_vblank.h     | 14 ++++++++-
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 42fe11cc139b9..1a84a69e99810 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1118,12 +1118,68 @@ void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
 
 	assert_spin_locked(&dev->event_lock);
 
+	WARN_ON(e->postponed);
 	e->pipe = pipe;
 	e->sequence = drm_crtc_accurate_vblank_count(crtc) + 1;
 	list_add_tail(&e->base.link, &dev->vblank_event_list);
 }
 EXPORT_SYMBOL(drm_crtc_arm_vblank_event);
 
+/**
+ * drm_crtc_prepare_arm_vblank_event - arm vblank event *before* pageflip.
+ * @crtc: the source CRTC of the vblank event
+ * @e: the event to send
+ *
+ * See drm_crtc_arm_vblank_event(). This function is a 2-stage version of
+ * that call. This function is called *BEFORE* programming the hardware.
+ *
+ * After programming, call drm_crtc_arm_prepared_vblank_event() and the
+ * event will be scheduled on the next vblank.
+ *
+ * This is mainly useful for code that has to run on PREEMPT_RT kernels,
+ * with interrupts disabled, since all vblank spinlocks are converted to
+ * rtmutexes, and code running with irqs disabled cannot take any vblank lock.
+ *
+ * It also increases determinism for any hardware
+ * programming, since no vblank related locks are taking when arming.
+ */
+void drm_crtc_prepare_arm_vblank_event(struct drm_crtc *crtc,
+				       struct drm_pending_vblank_event *e)
+{
+	drm_crtc_arm_vblank_event(crtc, e);
+
+	/* Set the flag, so that the event is not fired yet */
+	e->postponed = true;
+}
+EXPORT_SYMBOL(drm_crtc_prepare_arm_vblank_event);
+
+/**
+ * drm_crtc_arm_prepared_vblank_event - arm prepared vblank event *after* pageflip.
+ * @crtc: the source CRTC of the vblank event
+ * @e: the event to send
+ *
+ * See drm_crtc_prepare_arm_vblank_event(). This function is a 2-stage version of
+ * that call. This function is called directly *AFTER* programming the hardware.
+ *
+ * Before this function is called, drm_crtc_prepare_arm_vblank_event() should be
+ * called instead.
+ *
+ * This is mainly useful for code that has to run on PREEMPT_RT kernels,
+ * with interrupts disabled, since all vblank spinlocks are converted to
+ * rtmutexes, and code running with irqs disabled cannot take any vblank lock.
+ *
+ * It also increases determinism for any hardware
+ * programming, since no vblank related locks are taking when arming.
+ */
+void drm_crtc_arm_prepared_vblank_event(struct drm_pending_vblank_event *e)
+{
+	WARN_ON(!e->postponed);
+
+	/* remove the flag to be processed as a normal event */
+	WRITE_ONCE(e->postponed, false);
+}
+EXPORT_SYMBOL(drm_crtc_arm_prepared_vblank_event);
+
 /**
  * drm_crtc_send_vblank_event - helper to send vblank event after pageflip
  * @crtc: the source CRTC of the vblank event
@@ -1381,6 +1437,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
 			continue;
+
+		WARN_ON(e->postponed);
 		drm_dbg_core(dev, "Sending premature vblank event on disable: "
 			     "wanted %llu, current %llu\n",
 			     e->sequence, seq);
@@ -1886,7 +1944,8 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 	seq = drm_vblank_count_and_time(dev, pipe, &now);
 
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
-		if (e->pipe != pipe)
+		/* Matches WRITE_ONCE in drm_crtc_arm_prepared_vblank_event() */
+		if (e->pipe != pipe || READ_ONCE(e->postponed))
 			continue;
 		if (!drm_vblank_passed(seq, e->sequence))
 			continue;
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 2fcef9c0f5b1b..956d5621eb7f9 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -53,6 +53,13 @@ struct drm_pending_vblank_event {
 	 * @sequence: frame event should be triggered at
 	 */
 	u64 sequence;
+
+	/**
+	 * @postponed: whether drm_crtc_prepare_arm_vblank_event() is called,
+	 * and drm_crtc_arm_prepared_vblank_event has yet to be called to arm.
+	 */
+	bool postponed;
+
 	/**
 	 * @event: Actual event which will be sent to userspace.
 	 */
@@ -294,7 +301,12 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-			      struct drm_pending_vblank_event *e);
+			       struct drm_pending_vblank_event *e);
+
+void drm_crtc_prepare_arm_vblank_event(struct drm_crtc *crtc,
+				       struct drm_pending_vblank_event *e);
+void drm_crtc_arm_prepared_vblank_event(struct drm_pending_vblank_event *e);
+
 void drm_vblank_set_event(struct drm_pending_vblank_event *e,
 			  u64 *seq,
 			  ktime_t *now);
-- 
2.51.0

