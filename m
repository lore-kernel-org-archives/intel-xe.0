Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB5EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 12:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BE010E67B;
	Fri, 21 Jul 2023 12:34:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259410E67B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689942876; x=1721478876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QZhjO9hp2yOLLekn/06FOteacX/YiweMc0tWa5VORuM=;
 b=TXZ6+Eb20YlbQepy2QOH+gRIuF1/6cXfzwJlp0O32K3SmDW4miRkDvw8
 PKkl4D1/4xM7wx3ontUoawE1pqLv1jypOfvU7ZqxVGbZ1ogDWPegGXPCA
 xZ7ivk1vSz8U5x5hFTkScAT5ptHu6Z1t7MMGi+X92CT3hJi2vvoY17cFR
 6jZdYG2FzHp10UFRG+/WimzD48od22Ry2RiwiAoJOogTJYfiNVwGNLX1J
 UzqBiSltM8UFa8I9l9wNHCOyUhJo2NagP9XGKE3VHoIzcZAjimR/jbv+t
 thYH/l0UvTdTJCOxoXyYtpOvpyw1X58qpcbNwnyEoeQ5wCdzYeMtDNkdE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364476298"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="364476298"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754445574"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="754445574"
Received: from rtrejoca-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.30.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:34:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 13:34:25 +0100
Message-ID: <20230721123424.473210-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: add lockdep annotation for
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +-
 drivers/gpu/drm/xe/xe_device.h |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c     | 24 ++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1c57944014e0..fed3015e2d96 100644
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
index 17a69b7af155..d1b2aa52ea03 100644
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
-- 
2.41.0

