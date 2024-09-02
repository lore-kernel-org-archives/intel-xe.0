Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCD9CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 11:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDF010E29B;
	Mon,  2 Sep 2024 11:20:08 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC98810E29B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 11:20:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/xe: Fix merge fails related to display runtime PM
Date: Mon,  2 Sep 2024 13:20:02 +0200
Message-ID: <20240902112002.489225-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

The most recent merge commits introduced some fails to drm/drm-next,
I've noticed these when looking at the xe patches.

Solve it!

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 --
 drivers/gpu/drm/xe/xe_pm.c              | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 78a884ddd499a..710b1e2170c13 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -341,8 +341,6 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	xe_display_flush_cleanup_work(xe);
 
-	xe_display_flush_cleanup_work(xe);
-
 	intel_dp_mst_suspend(xe);
 
 	intel_hpd_cancel_work(xe);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 2e2accd76fb2b..39e0a8774a104 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -392,8 +392,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	xe_display_pm_runtime_suspend(xe);
 
 	if (xe->d3cold.allowed) {
-		xe_display_pm_suspend(xe, true);
-
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
@@ -411,7 +409,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		xe_display_pm_suspend_late(xe);
 out:
 	if (err)
-		xe_display_pm_resume(xe, true);
+		xe_display_pm_runtime_resume(xe);
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
-- 
2.45.2

