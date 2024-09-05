Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69166CD5BC9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 15:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227A010E8F6;
	Thu,  5 Sep 2024 15:00:53 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FD910E8F5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 15:00:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/4] drm/xe: Remove runtime argument from display s/r functions
Date: Thu,  5 Sep 2024 17:00:50 +0200
Message-ID: <20240905150052.174895-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
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

The previous change ensures that pm_suspend is only called when
suspending or resuming. This ensures no further bugs like those
in the previous commit.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 53 +++++++++++++++----------
 drivers/gpu/drm/xe/display/xe_display.h |  8 ++--
 drivers/gpu/drm/xe/xe_pm.c              |  6 +--
 3 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index c0e9aa7a274f1..33071ac3bc12d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -310,18 +310,7 @@ static void xe_display_flush_cleanup_work(struct xe_device *xe)
 }
 
 /* TODO: System and runtime suspend/resume sequences will be sanitized as a follow-up. */
-void xe_display_pm_runtime_suspend(struct xe_device *xe)
-{
-	if (!xe->info.probe_display)
-		return;
-
-	if (xe->d3cold.allowed)
-		xe_display_pm_suspend(xe, true);
-
-	intel_hpd_poll_enable(xe);
-}
-
-void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
+static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	struct intel_display *display = &xe->display;
 	bool s2idle = suspend_to_idle();
@@ -356,26 +345,31 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	intel_dmc_suspend(xe);
 }
 
-void xe_display_pm_suspend_late(struct xe_device *xe)
+void xe_display_pm_suspend(struct xe_device *xe)
+{
+	__xe_display_pm_suspend(xe, false);
+}
+
+void xe_display_pm_runtime_suspend(struct xe_device *xe)
 {
-	bool s2idle = suspend_to_idle();
 	if (!xe->info.probe_display)
 		return;
 
-	intel_power_domains_suspend(xe, s2idle);
+	if (xe->d3cold.allowed)
+		__xe_display_pm_suspend(xe, true);
 
-	intel_display_power_suspend_late(xe);
+	intel_hpd_poll_enable(xe);
 }
 
-void xe_display_pm_runtime_resume(struct xe_device *xe)
+void xe_display_pm_suspend_late(struct xe_device *xe)
 {
+	bool s2idle = suspend_to_idle();
 	if (!xe->info.probe_display)
 		return;
 
-	intel_hpd_poll_disable(xe);
+	intel_power_domains_suspend(xe, s2idle);
 
-	if (xe->d3cold.allowed)
-		xe_display_pm_resume(xe, true);
+	intel_display_power_suspend_late(xe);
 }
 
 void xe_display_pm_resume_early(struct xe_device *xe)
@@ -388,7 +382,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_power_domains_resume(xe);
 }
 
-void xe_display_pm_resume(struct xe_device *xe, bool runtime)
+static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
 	struct intel_display *display = &xe->display;
 
@@ -422,6 +416,23 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 	intel_power_domains_enable(xe);
 }
 
+void xe_display_pm_resume(struct xe_device *xe)
+{
+	__xe_display_pm_resume(xe, false);
+}
+
+void xe_display_pm_runtime_resume(struct xe_device *xe)
+{
+	if (!xe->info.probe_display)
+		return;
+
+	intel_hpd_poll_disable(xe);
+
+	if (xe->d3cold.allowed)
+		__xe_display_pm_resume(xe, true);
+}
+
+
 static void display_device_remove(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = arg;
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 53d727fd792b4..bed55fd26f304 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
-void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
+void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
-void xe_display_pm_resume(struct xe_device *xe, bool runtime);
+void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
 
@@ -65,10 +65,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
-static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
+static inline void xe_display_pm_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
-static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
+static inline void xe_display_pm_resume(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9b1204db12c3d..960ed50e3a41b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -123,7 +123,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
-	xe_display_pm_suspend(xe, false);
+	xe_display_pm_suspend(xe);
 
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
@@ -133,7 +133,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
-			xe_display_pm_resume(xe, false);
+			xe_display_pm_resume(xe);
 			goto err;
 		}
 	}
@@ -187,7 +187,7 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	xe_display_pm_resume(xe, false);
+	xe_display_pm_resume(xe);
 
 	err = xe_bo_restore_user(xe);
 	if (err)
-- 
2.45.2

