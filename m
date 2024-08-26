Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A548C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 07:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387D510E109;
	Mon, 26 Aug 2024 07:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuNQ6/Sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB6C10E102
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724658692; x=1756194692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eq7Gc+VZVQNXQ9mcCayEAo5p4NI66vhxWODqexuJwas=;
 b=LuNQ6/SrS39NvOcl5npy2g8jfUnYNt1F1Ea2RD7Ds2e4TYhNqKBG6QXo
 xnRePziBC/30zZtuClIuQnaCFcyOobnTwxR3cn7UVTIq7Q4JQpFy3Xfww
 QuUl4qbmVLuI/bzXU4w4tlvncLPovuR/OrHeM6uKffKl1HbZaqiNJBvAM
 T5Acaaay9Y3T9xMKxL7jUth2KrQsddlb2Gg7oaN9U6sLwXUfQLUBoOviF
 RZw6drcNu0OPOMgnWVFHRKjz0QrInMHf5oUsig/HPI4yNAnyub/YAb2BF
 2TA2Xfc79cXVHOLME+frSZ8a2t35SGYD3wzHdcNT0HNoOBqH0BI/fYx3V g==;
X-CSE-ConnectionGUID: eGoj5FTqQ+Co7BIxx51J7Q==
X-CSE-MsgGUID: A/ol0QnHQveVWmn1IqtMVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22956567"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="22956567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 00:51:31 -0700
X-CSE-ConnectionGUID: LgxnNIjtTQ+F9UVTCWAtzA==
X-CSE-MsgGUID: J/ZxeHAcRd2QvlA8GM6EIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="93155018"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.245.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 00:51:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: [PATCH v3] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
Date: Mon, 26 Aug 2024 09:51:04 +0200
Message-ID: <20240826075104.2761-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

For non-d3cold-capable devices we'd like to be able to wake up the
device from reclaim. In particular, for Lunar Lake we'd like to be
able to blit CCS metadata to system at shrink time; at least from
kswapd where it's reasonable OK to wait for rpm resume and a
preceding rpm suspend.

Therefore use a separate lockdep map for such devices and prime it
reclaim-tainted.

v2:
- Rename lockmap acquire- and release functions. (Rodrigo Vivi).
- Reinstate the old xe_pm_runtime_lockdep_prime() function and
  rename it to xe_rpm_might_enter_cb(). (Matthew Auld).
- Introduce a separate xe_pm_runtime_lockdep_prime function
  called from module init for known required locking orders.
v3:
- Actually hook up the prime function at module init.

Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2.
---
 drivers/gpu/drm/xe/xe_module.c |  9 ++++
 drivers/gpu/drm/xe/xe_pm.c     | 79 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 75 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7bb99e451fcc..5fdcbfc06912 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
+#include "xe_pm.h"
 #include "xe_observation.h"
 #include "xe_sched_job.h"
 
@@ -69,6 +70,10 @@ struct init_funcs {
 	void (*exit)(void);
 };
 
+static void xe_dummy_exit(void)
+{
+}
+
 static const struct init_funcs init_funcs[] = {
 	{
 		.init = xe_hw_fence_module_init,
@@ -86,6 +91,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_observation_sysctl_register,
 		.exit = xe_observation_sysctl_unregister,
 	},
+	{
+		.init = xe_pm_module_init,
+		.exit = xe_dummy_exit,
+	},
 };
 
 static int __init xe_init(void)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9f3c14fd9f33..747fb96453d3 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -70,11 +70,29 @@
  */
 
 #ifdef CONFIG_LOCKDEP
-static struct lockdep_map xe_pm_runtime_lockdep_map = {
-	.name = "xe_pm_runtime_lockdep_map"
+static struct lockdep_map xe_pm_runtime_d3cold_map = {
+	.name = "xe_rpm_d3cold_map"
+};
+
+static struct lockdep_map xe_pm_runtime_nod3cold_map = {
+	.name = "xe_rpm_nod3cold_map"
 };
 #endif
 
+static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
+{
+	lock_map_acquire(xe->d3cold.capable ?
+			 &xe_pm_runtime_d3cold_map :
+			 &xe_pm_runtime_nod3cold_map);
+}
+
+static void xe_rpm_lockmap_release(const struct xe_device *xe)
+{
+	lock_map_release(xe->d3cold.capable ?
+			 &xe_pm_runtime_d3cold_map :
+			 &xe_pm_runtime_nod3cold_map);
+}
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 * annotation here and in xe_pm_runtime_get() lockdep will see
 	 * the potential lock inversion and give us a nice splat.
 	 */
-	lock_map_acquire(&xe_pm_runtime_lockdep_map);
+	xe_rpm_lockmap_acquire(xe);
 
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
@@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 out:
 	if (err)
 		xe_display_pm_resume(xe, true);
-	lock_map_release(&xe_pm_runtime_lockdep_map);
+	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_pm_runtime_lockdep_map);
+	xe_rpm_lockmap_acquire(xe);
 
 	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
@@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
-	lock_map_release(&xe_pm_runtime_lockdep_map);
+	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -451,15 +469,37 @@ int xe_pm_runtime_resume(struct xe_device *xe)
  * stuff that can happen inside the runtime_resume callback by acquiring
  * a dummy lock (it doesn't protect anything and gets compiled out on
  * non-debug builds).  Lockdep then only needs to see the
- * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
- * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
+ * xe_pm_runtime_xxx_map -> runtime_resume callback once, and then can
+ * hopefully validate all the (callers_locks) -> xe_pm_runtime_xxx_map.
  * For example if the (callers_locks) are ever grabbed in the
  * runtime_resume callback, lockdep should give us a nice splat.
  */
-static void pm_runtime_lockdep_prime(void)
+static void xe_rpm_might_enter_cb(const struct xe_device *xe)
+{
+	xe_rpm_lockmap_acquire(xe);
+	xe_rpm_lockmap_release(xe);
+}
+
+/*
+ * Prime the lockdep maps for known locking orders that need to
+ * be supported but that may not always occur on all systems.
+ */
+static void xe_pm_runtime_lockdep_prime(void)
 {
-	lock_map_acquire(&xe_pm_runtime_lockdep_map);
-	lock_map_release(&xe_pm_runtime_lockdep_map);
+	struct dma_resv lockdep_resv;
+
+	dma_resv_init(&lockdep_resv);
+	lock_map_acquire(&xe_pm_runtime_d3cold_map);
+	/* D3Cold takes the dma_resv locks to evict bos */
+	dma_resv_lock(&lockdep_resv, NULL);
+	dma_resv_unlock(&lockdep_resv);
+	lock_map_release(&xe_pm_runtime_d3cold_map);
+
+	/* Shrinkers might like to wake up the device under reclaim. */
+	fs_reclaim_acquire(GFP_KERNEL);
+	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
+	lock_map_release(&xe_pm_runtime_nod3cold_map);
+	fs_reclaim_release(GFP_KERNEL);
 }
 
 /**
@@ -474,7 +514,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	pm_runtime_lockdep_prime();
+	xe_rpm_might_enter_cb(xe);
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -506,7 +546,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
-	pm_runtime_lockdep_prime();
+	xe_rpm_might_enter_cb(xe);
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
@@ -574,7 +614,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 		return true;
 	}
 
-	pm_runtime_lockdep_prime();
+	xe_rpm_might_enter_cb(xe);
 	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
 }
 
@@ -666,3 +706,14 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	drm_dbg(&xe->drm,
 		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
 }
+
+/**
+ * xe_pm_module_init() - Perform xe_pm specific module initialization.
+ *
+ * Return: 0 on success. Currently doesn't fail.
+ */
+int __init xe_pm_module_init(void)
+{
+	xe_pm_runtime_lockdep_prime();
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 104a21ae6dfd..9aef673b1c8a 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -32,5 +32,6 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
+int xe_pm_module_init(void);
 
 #endif
-- 
2.44.0

