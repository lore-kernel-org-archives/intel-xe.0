Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE61CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 10:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55F10E9B7;
	Fri, 12 Jun 2026 10:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etr7E4xQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A035B10E9B7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781259294; x=1812795294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1gnWvRk3SfM8Ug6hgSK790QIS/y54tszA2jOhpYjFns=;
 b=etr7E4xQmVpQXDcJ40lCPNZ6d5fSO8FXDfuJpDFNeacafd62Hq04rl4I
 Gm6dD4lO4y3LDcNxVbCK6PgGp1nPgC60dFoJS02U2ZLiIj7Z/VxczwmqF
 Xf22JGXlTAb1cWd+it+9dopSdHzPspf7E9BXDL6oAg4DL8YIAVoZKm1hY
 bVBB1vVLKQ/4MhZrTQsAG92OHwZubQcPpTSzH6pJrXVUqcqnNITCp5mKg
 hxAc89/MqzdZ+S3KLSOr2YP2/olpl0reZG1hMJ9IH88URQnUa3NG6q2+F
 H6TYjldnepN/mR2V4Q+PUGb86MIOACcLDyrkT4iZuvMXI3lAl85LiuIh2 A==;
X-CSE-ConnectionGUID: OSpfnx0EQ7i6gvUjcb/uGQ==
X-CSE-MsgGUID: NgcK//bzTOeMH8sUOZJ0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92765678"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="92765678"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 03:14:53 -0700
X-CSE-ConnectionGUID: jgCzTfNwQnWzKcPm16PSNA==
X-CSE-MsgGUID: AOqTabHuTtudopgIk4aQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251075510"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 03:14:51 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v3] drm/xe/guc: Hold device ref until queue teardown completes
Date: Fri, 12 Jun 2026 15:44:38 +0530
Message-ID: <20260612101438.2000346-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

GuC exec queue destruction can run asynchronously. During queue cleanup,
xe_exec_queue_fini() may drop the last references that eventually release
the DRM device and run drmm cleanup actions.

guc_submit_sw_fini(), registered as a drmm action, used to drain
xe->destroy_wq. If DRM device release happened from a worker on
xe->destroy_wq, teardown could end up draining the same workqueue from
within that worker, causing a self-deadlock.

Fix this by taking a drm_device reference when the queue is created and
dropping it after queue teardown completes. This prevents drmm cleanup
from running while queue destruction is still pending.

Since GuC queue destroy work no longer uses xe->destroy_wq, remove the
stale drain from guc_submit_sw_fini().

v2:
  - Rebase

v3:
  - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
  - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
  - Drop separate deferred drm_dev_put worker.
  - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().

Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 53 ++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b29cc08e6291..e1da53a58dd2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -10,6 +10,7 @@
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
@@ -227,7 +228,6 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
@@ -235,8 +235,6 @@ static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
 				 xa_empty(&guc->submission_state.exec_queue_lookup),
 				 HZ * 5);
 
-	drain_workqueue(xe->destroy_wq);
-
 	xe_gt_assert(gt, ret);
 
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
@@ -1661,6 +1659,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct drm_device *drm = &guc_to_xe(guc)->drm;
 
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
@@ -1679,36 +1678,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 	 * (timeline name).
 	 */
 	kfree_rcu(ge, rcu);
+
+	drm_dev_put(drm);
 }
 
-static void __guc_exec_queue_destroy_async(struct work_struct *w)
+static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
 {
-	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, destroy_async);
-	struct xe_exec_queue *q = ge->q;
+	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_device *drm = &xe->drm;
+
+	/*
+	 * guc_exec_queue_fini() drops the queue's drm_device ref.
+	 * Keep the device alive until the PM-runtime guard unwinds.
+	 */
+	drm_dev_get(drm);
+
+	scoped_guard(xe_pm_runtime, xe) {
+		trace_xe_exec_queue_destroy(q);
 
-	guard(xe_pm_runtime)(guc_to_xe(guc));
-	trace_xe_exec_queue_destroy(q);
+		/* Confirm no work left behind accessing device structures */
+		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 
-	/* Confirm no work left behind accessing device structures */
-	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
+		xe_exec_queue_fini(q);
+	}
 
-	xe_exec_queue_fini(q);
+	drm_dev_put(drm);
 }
 
-static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
+static void __guc_exec_queue_destroy_async(struct work_struct *w)
 {
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_guc_exec_queue *ge =
+		container_of(w, struct xe_guc_exec_queue, destroy_async);
+
+	guc_exec_queue_do_destroy(ge->q);
+}
 
+static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
+{
 	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
-		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
+		guc_exec_queue_do_destroy(q);
 	else
-		queue_work(xe->destroy_wq, &q->guc->destroy_async);
+		queue_work(system_dfl_wq, &q->guc->destroy_async);
 }
 
 static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -1903,6 +1918,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct drm_device *drm = &guc_to_xe(guc)->drm;
 	struct workqueue_struct *submit_wq = NULL;
 	struct xe_guc_exec_queue *ge;
 	long timeout;
@@ -1914,6 +1930,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (!ge)
 		return -ENOMEM;
 
+	drm_dev_get(drm);
+
 	q->guc = ge;
 	ge->q = q;
 	init_rcu_head(&ge->rcu);
@@ -1990,6 +2008,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	release_guc_id(guc, q);
 err_free:
 	kfree(ge);
+	drm_dev_put(drm);
 
 	return err;
 }
-- 
2.43.0

