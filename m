Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B3BC52D6F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 15:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138B510E221;
	Mon,  5 Aug 2024 15:13:02 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEDE10E217
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 15:13:00 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/2] drm/xe/display: Make display suspend/resume work on
 discrete
Date: Mon,  5 Aug 2024 17:13:09 +0200
Message-ID: <20240805151309.461021-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
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

We should unpin before evicting all memory, and repin after GT resume.
This way, we preserve the contents of the framebuffers, and won't hang
on resume due to migration engine not being restored yet.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/display/xe_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.c              | 11 ++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 44405f17c1d28..3ff7ed278e08b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -283,6 +283,27 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
+static void xe_display_flush_cleanup_work(struct xe_device *xe)
+{
+	struct intel_crtc *crtc;
+
+	for_each_intel_crtc(&xe->drm, crtc) {
+		struct drm_crtc_commit *commit;
+
+		spin_lock(&crtc->base.commit_lock);
+		commit = list_first_entry_or_null(&crtc->base.commit_list,
+						  struct drm_crtc_commit, commit_entry);
+		if (commit)
+			drm_crtc_commit_get(commit);
+		spin_unlock(&crtc->base.commit_lock);
+
+		if (commit) {
+			wait_for_completion(&commit->cleanup_done);
+			drm_crtc_commit_put(commit);
+		}
+	}
+}
+
 void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	bool s2idle = suspend_to_idle();
@@ -304,6 +325,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	if (!runtime)
 		intel_display_driver_suspend(xe);
 
+	xe_display_flush_cleanup_work(xe);
+
 	intel_dp_mst_suspend(xe);
 
 	intel_hpd_cancel_work(xe);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9f3c14fd9f337..fcfb49af8c891 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -93,13 +93,13 @@ int xe_pm_suspend(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
+	xe_display_pm_suspend(xe, false);
+
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
 		goto err;
 
-	xe_display_pm_suspend(xe, false);
-
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
@@ -154,11 +154,11 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	xe_display_pm_resume(xe, false);
-
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
+	xe_display_pm_resume(xe, false);
+
 	err = xe_bo_restore_user(xe);
 	if (err)
 		goto err;
@@ -367,10 +367,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
 	if (xe->d3cold.allowed) {
+		xe_display_pm_suspend(xe, true);
+
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
-		xe_display_pm_suspend(xe, true);
 	}
 
 	for_each_gt(gt, xe, id) {
-- 
2.45.2

