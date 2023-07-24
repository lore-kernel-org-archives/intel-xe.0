Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F4BC0015E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 10:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329C10E2CC;
	Mon, 24 Jul 2023 10:47:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B555110E2CC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690195676; x=1721731676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UGcOAX5tz1ZJoGWa7M+P3JcnVxe8U7T2S4uOHZl2r4Q=;
 b=RLws6NSpW9PWYhIZxrhkXckb7g4pWXKBIceIFD7oMR+lMzv+ISnjMOKJ
 kJpzJcLe2pABGUQX9cQhVrDEG9/4pfMrKBkUcO88cDh6HxoHd9SkuZSXe
 4n9IJ9WiBLo1l33maSL0qHVwKhnEH/547dr0BeSxT9Oyx+FGqOlW+ayZO
 eis4QLKQ7brS1ApOT8Rr+2M8If/ZzsdQnX1T3CQxLbGXON2g4vDhgIkiH
 rq0FeLWPreDRlg1hnwiXLKVZqZBgN331+92JsnxQ4l+tzdlIlc1CAX3tY
 jN21GKfqFQSzY/5cddIE9RUucGjUDPy0NJjNEIF7WsfRXav96IbeSHhdi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398310478"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="398310478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 03:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="675786502"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="675786502"
Received: from dmansoco-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.189])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 03:47:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jul 2023 11:47:44 +0100
Message-ID: <20230724104743.27471-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: add lockdep annotation for
 xe_device_mem_access_put()
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The main motivation is with d3cold which will make the suspend and
resume callbacks even more scary, but is useful regardless. We already
have the needed annotation on the acquire side with
xe_device_mem_access_get(), and by adding the annotation on the release
side we should have a lot more confidence that our locking hierarchy is
correct.

v2:
  - Move the annotation into both callbacks for better symmetry. Also
    don't hold over the entire mem_access_get(); we only need to lockep
    to understand what is being held upon entering mem_access_get(), and
    how that matches up with locks in the callbacks.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 ++--
 drivers/gpu/drm/xe/xe_device.h |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c     | 27 +++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1c57944014e0..55d225e3a82a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -36,7 +36,7 @@
 #include "xe_wait_user_fence.h"
 
 #ifdef CONFIG_LOCKDEP
-static struct lockdep_map xe_device_mem_access_lockdep_map = {
+struct lockdep_map xe_device_mem_access_lockdep_map = {
 	.name = "xe_device_mem_access_lockdep_map"
 };
 #endif
@@ -479,13 +479,13 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	 * runtime_resume callback, lockdep should give us a nice splat.
 	 */
 	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_device_mem_access_lockdep_map);
 
 	xe_pm_runtime_get(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
 	XE_WARN_ON(ref == S32_MAX);
 
-	lock_map_release(&xe_device_mem_access_lockdep_map);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 8b085ffdc5f8..593accb68281 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -16,6 +16,10 @@ struct xe_file;
 #include "xe_force_wake.h"
 #include "xe_macros.h"
 
+#ifdef CONFIG_LOCKDEP
+extern struct lockdep_map xe_device_mem_access_lockdep_map;
+#endif
+
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 17a69b7af155..592765315f74 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -199,6 +199,29 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
+	/*
+	 * The actual xe_device_mem_access_put() is always async underneath, so
+	 * exactly where that is called should makes no difference to us. However
+	 * we still need to be very careful with the locks that this callback
+	 * acquires and the locks that are acquired and held by any callers of
+	 * xe_device_mem_access_get(). We already have the matching annotation
+	 * on that side, but we also need it here. For example lockdep should be
+	 * able to tell us if the following scenario is in theory possible:
+	 *
+	 * CPU0                          | CPU1 (kworker)
+	 * lock(A)                       |
+	 *                               | xe_pm_runtime_suspend()
+	 *                               |      lock(A)
+	 * xe_device_mem_access_get()    |
+	 *
+	 * This will clearly deadlock since rpm core needs to wait for
+	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
+	 * on CPU0 which prevents CPU1 making forward progress.  With the
+	 * annotation here and in xe_device_mem_access_get() lockdep will see
+	 * the potential lock inversion and give us a nice splat.
+	 */
+	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
@@ -213,6 +236,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_irq_suspend(xe);
 out:
+	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -226,6 +250,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
+	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
 	 * in gfx card soc would have blocked d3cold, therefore card has not
@@ -261,6 +287,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
+	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
-- 
2.41.0

