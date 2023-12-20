Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E05EC41535
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 01:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321EA10E0F9;
	Wed, 20 Dec 2023 01:19:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AEB10E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 01:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703035152; x=1734571152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mHUNiWzl5ILspSeT1msbdouLJ+tMTj3PuczHzwui9ls=;
 b=ZvEYh1uwFJswm9ogClW1395g23COgOIH2qqjKNA4au4N25GQE8aLTWKC
 TI50t1ySZtJzlMohMEttJ9eQxwMnjwbfBPoyFC+EJgCqc6dcrWhbP60te
 Ymmk9c2RDbLJjcJ8BApKzIFd9w1lYKms6K02LGOwtx6FZyBtvLfadty84
 CGiuoBGOAMwhjTL2cHfia3L6s7ojcvaWMLIBrdXFCv9UE4B4nCVyfL7GX
 M81tXUcbcdweIojIhoJJEiA9yn08fOtx2s1XouQt5kClJzgXJ7gV960Mk
 3jYEa6RA8EWCH0Sj0XqbLV7LOYswHkOeZAUCoHrKgI7bS+n9vrN8/JRBJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380735657"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="380735657"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 17:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866824192"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="866824192"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2023 17:19:08 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: CLOS Based Cache Reservation support.
Date: Wed, 20 Dec 2023 06:57:05 +0530
Message-Id: <20231220012705.3784972-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
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

Xe API supports an optional extension for allowing Apps to reserve
portions of the GPU Caches for exclusive use. This allows the App
to separate latency/bandwidth sensitive workloads from all other
workloads.

PVC and XE2 expose control over each Cache through the Class of Service (CLOS)
feature. CLOS allows XEKMD to define which portions of a cache may be
used for a given allocation through a set of Waymask controls grouped
into multiple sets.

For each CLOS set, and supported cache, there is a Waymask to configure
the Ways in that cache that may be used to cache memory requests for that
CLOS.

TODO:
  - Need to add sysfs for setting limits
  - Need to handle BO host cache type

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
 drivers/gpu/drm/xe/xe_clos.c                  | 268 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_clos.h                  |  36 +++
 drivers/gpu/drm/xe/xe_device.c                |  15 +
 drivers/gpu/drm/xe/xe_device_types.h          |  15 +
 drivers/gpu/drm/xe/xe_pat.c                   |  45 +++
 drivers/gpu/drm/xe/xe_pat.h                   |  10 +
 drivers/gpu/drm/xe/xe_pci.c                   |   4 +
 drivers/gpu/drm/xe/xe_vm.c                    |  11 +
 include/uapi/drm/xe_drm.h                     |  71 +++++
 11 files changed, 477 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_clos.c
 create mode 100644 drivers/gpu/drm/xe/xe_clos.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index df8601d6a59f..bc60708ba23c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -64,6 +64,7 @@ $(uses_generated_oob): $(generated_oob)
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_clos.o \
 	xe_debugfs.o \
 	xe_devcoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 5d2a77b52db4..27226c1efc5a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -104,6 +104,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 	 (xe)->info.graphics_verx100 <= (last*100 + 99))
 #define IS_MOBILE(xe) (xe && 0)
 #define HAS_LLC(xe) (!IS_DGFX((xe)))
+#define HAS_CLOS(xe) ((xe)->info.has_clos == true)
 
 #define HAS_GMD_ID(xe) GRAPHICS_VERx100(xe) >= 1270
 
diff --git a/drivers/gpu/drm/xe/xe_clos.c b/drivers/gpu/drm/xe/xe_clos.c
new file mode 100644
index 000000000000..da56e52d25de
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_clos.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#include "i915_drv.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_clos.h"
+
+#include <drm/xe_drm.h>
+
+static void clos_update_ways(struct xe_gt *gt, u8 clos_index, u32 mask)
+{
+
+	DRM_DEBUG("clos index = %d mask = 0x%x", clos_index,  mask);
+	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(clos_index), mask);
+}
+
+static void update_l3cache_masks(struct xe_device *xe)
+{
+	u8 start_bits = 0;
+	int i;
+
+	for (i = 0; i < NUM_CLOS; i++) {
+		struct xe_gt *gt;
+		u32 mask = 0;
+		int j;
+
+		if (xe->cache_resv.ways[i]) {
+			// Assign contiguous span of ways
+			u8 ways = xe->cache_resv.ways[i];
+			mask = GENMASK(start_bits + ways - 1, start_bits);
+
+			DRM_DEBUG("start_bits = %d ways = %d mask= 0x%x\n",
+				  start_bits, ways, mask);
+			start_bits += ways;
+		}
+		for_each_gt(gt, xe, j)
+			clos_update_ways(gt, i, mask);
+	}
+}
+
+#define MAX_L3WAYS 32
+void init_device_clos(struct xe_device *xe)
+{
+	int i;
+
+	if (!(xe->info.has_clos))
+		return;
+
+	mutex_init(&xe->cache_resv.clos_mutex);
+	// CLOS1 and CLOS2 available for Reservation
+	xe->cache_resv.free_clos_mask = 0x6;
+
+	if (GRAPHICS_VER(xe) >= 20)
+		xe->cache_resv.free_clos_mask = 0xe;
+
+	// Shared set uses CLOS0 and initially gets all Ways
+	xe->cache_resv.ways[0] = MAX_L3WAYS;
+
+	for (i = 1; i < 3; i++)
+		xe->cache_resv.ways[i] = 0;
+
+	update_l3cache_masks(xe);
+}
+
+void uninit_device_clos(struct xe_device *xe)
+{
+	if (!(xe->info.has_clos))
+		return;
+
+	mutex_destroy(&xe->cache_resv.clos_mutex);
+}
+
+void init_client_clos(struct xe_file *file)
+{
+	if (!(file->xe->info.has_clos))
+		return;
+
+	file->clos_resv.clos_mask = 0;   // No CLOS reserved yet
+	file->clos_resv.l3_rsvd_ways = 0;
+}
+
+void uninit_client_clos(struct xe_file *file)
+{
+	if (!(file->xe->info.has_clos))
+		return;
+
+	while (file->clos_resv.clos_mask) {
+		u16 clos_index = ffs(file->clos_resv.clos_mask) - 1;
+
+		DRM_DEBUG("uninit release mask = 0x%x clos= %d\n",
+			  file->clos_resv.clos_mask, clos_index);
+		free_clos(file, clos_index);
+		file->clos_resv.clos_mask &= ~(1 << clos_index);
+	}
+}
+
+#define L3_GLOBAL_RESERVATION_LIMIT 16
+#define L3_CLIENT_RESERVATION_LIMIT 8
+static int reserve_l3cache_ways(struct xe_file *file,
+				u16 clos_index, u16 *num_ways)
+{
+	struct xe_device *xe = file->xe;
+	u8 global_limit = L3_GLOBAL_RESERVATION_LIMIT -
+		(MAX_L3WAYS - xe->cache_resv.ways[0]);
+	u8 client_limit = L3_CLIENT_RESERVATION_LIMIT -
+		file->clos_resv.l3_rsvd_ways;
+	u8 limit = min(global_limit, client_limit);
+
+	if (limit == 0)
+		return -ENOSPC;
+
+	if (*num_ways > limit) {
+		*num_ways = limit;
+		return -EAGAIN;
+	}
+
+	file->clos_resv.l3_rsvd_ways += *num_ways;
+
+	xe->cache_resv.ways[0] -= *num_ways;
+	xe->cache_resv.ways[clos_index] = *num_ways;
+
+	update_l3cache_masks(xe);
+
+	return 0;
+}
+
+static int
+free_l3cache_ways(struct xe_file *file, u16 clos_index)
+{
+	struct xe_device *xe = file->xe;
+
+	if (xe->cache_resv.ways[clos_index]) {
+		u8 num_ways = xe->cache_resv.ways[clos_index];
+
+		file->clos_resv.l3_rsvd_ways -= num_ways;
+
+		xe->cache_resv.ways[0] += num_ways;
+		xe->cache_resv.ways[clos_index] -= num_ways;
+
+		update_l3cache_masks(xe);
+	}
+
+	return 0;
+}
+
+static bool
+clos_is_reserved(struct xe_file *file, u16 clos_index)
+{
+	return file->clos_resv.clos_mask & (1 << clos_index);
+}
+
+int reserve_cache_ways(struct xe_file *file, u16 cache_level,
+		       u16 clos_index, u16 *num_ways)
+{
+	struct xe_device *xe = file->xe;
+	int ret = 0;
+
+	if (cache_level != 3)
+		return -EINVAL;
+
+	if ((clos_index >= NUM_CLOS) || !clos_is_reserved(file, clos_index))
+		return -EPERM;
+
+	mutex_lock(&xe->cache_resv.clos_mutex);
+
+	if (*num_ways)
+		ret = reserve_l3cache_ways(file, clos_index, num_ways);
+	else
+		ret = free_l3cache_ways(file, clos_index);
+
+	mutex_unlock(&xe->cache_resv.clos_mutex);
+	return ret;
+}
+
+int reserve_clos(struct xe_file *file, u16 *clos_index)
+{
+	struct xe_device *xe = file->xe;
+
+	mutex_lock(&xe->cache_resv.clos_mutex);
+
+	if (xe->cache_resv.free_clos_mask) {
+		u16 clos = ffs(xe->cache_resv.free_clos_mask) - 1;
+
+		file->clos_resv.clos_mask |= (1 << clos);
+		xe->cache_resv.free_clos_mask &= ~(1 << clos);
+
+		*clos_index = clos;
+	       xe->cache_resv.clos_index = clos;
+		mutex_unlock(&xe->cache_resv.clos_mutex);
+
+		return 0;
+	}
+	mutex_unlock(&xe->cache_resv.clos_mutex);
+
+	return -ENOSPC;
+}
+
+int free_clos(struct xe_file *file, u16 clos_index)
+{
+	struct xe_device *xe = file->xe;
+
+	mutex_lock(&xe->cache_resv.clos_mutex);
+
+	if (clos_is_reserved(file, clos_index)) {
+		struct xe_device *xe = file->xe;
+
+		free_l3cache_ways(file, clos_index);
+
+		file->clos_resv.clos_mask &= ~(1 << clos_index);
+		xe->cache_resv.free_clos_mask |= (1 << clos_index);
+
+		mutex_unlock(&xe->cache_resv.clos_mutex);
+
+		return 0;
+	}
+
+	mutex_unlock(&xe->cache_resv.clos_mutex);
+	return -EPERM;
+}
+
+int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file)
+{
+	struct xe_file *file_priv = file->driver_priv;
+	struct xe_device *xe = file_priv->xe;
+	struct drm_xe_clos_reserve *clos = data;
+
+	if (!HAS_CLOS(xe))
+		return -EOPNOTSUPP;
+
+	return reserve_clos(file_priv, &clos->clos_index);
+}
+
+int xe_clos_free_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file)
+{
+	struct xe_file *file_priv = file->driver_priv;
+	struct xe_device *xe = file_priv->xe;
+	struct drm_xe_clos_free *clos = data;
+
+	if (!HAS_CLOS(xe))
+		return -EOPNOTSUPP;
+
+	return free_clos(file_priv, clos->clos_index);
+}
+
+int xe_cache_reserve_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct xe_file *file_priv = file->driver_priv;
+	struct xe_device *xe = file_priv->xe;
+	struct drm_xe_cache_reserve *cache_reserve = data;
+
+	if (!HAS_CLOS(xe))
+		return -EOPNOTSUPP;
+
+	return reserve_cache_ways(file_priv,
+				  cache_reserve->cache_level,
+				  cache_reserve->clos_index,
+				  &cache_reserve->num_ways);
+}
+
+
diff --git a/drivers/gpu/drm/xe/xe_clos.h b/drivers/gpu/drm/xe/xe_clos.h
new file mode 100644
index 000000000000..41384028e670
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_clos.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef INTEL_CLOS_H
+#define INTEL_CLOS_H
+
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_file;
+
+struct drm_device;
+struct drm_file;
+
+void init_device_clos(struct xe_device *xe);
+void uninit_device_clos(struct xe_device *xe);
+
+void init_client_clos(struct xe_file *file);
+void uninit_client_clos(struct xe_file *file);
+
+int reserve_clos(struct xe_file *file, u16 *clos_index);
+int free_clos(struct xe_file *file, u16 clos_index);
+int reserve_cache_ways(struct xe_file *file, u16 cache_level,
+		       u16 clos_index, u16 *num_ways);
+
+int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file);
+int xe_clos_free_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file);
+int xe_cache_reserve_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file);
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86867d42d532..f4287db66ff7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -43,6 +43,7 @@
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
 #include "xe_hwmon.h"
+#include "xe_clos.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
@@ -82,6 +83,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	spin_unlock(&xe->clients.lock);
 
 	file->driver_priv = xef;
+	init_client_clos(xef);
 	return 0;
 }
 
@@ -101,6 +103,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
+
+	uninit_client_clos(xef);
+
 	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
@@ -138,6 +143,12 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
+        DRM_IOCTL_DEF_DRV(XE_CLOS_RESERVE, xe_clos_reserve_ioctl,
+			  DRM_RENDER_ALLOW),
+        DRM_IOCTL_DEF_DRV(XE_CLOS_FREE, xe_clos_free_ioctl,
+			  DRM_RENDER_ALLOW),
+        DRM_IOCTL_DEF_DRV(XE_CACHE_RESERVE, xe_cache_reserve_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
@@ -538,6 +549,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
+	init_device_clos(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
@@ -570,6 +583,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_heci_gsc_fini(xe);
 
+	uninit_device_clos(xe);
+
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e6..1f823c3136c4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -281,6 +281,8 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
+                /** @has_clos: device supports clos reservation */
+                u8 has_clos:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
@@ -440,6 +442,14 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+#define NUM_CLOS 4
+        struct cache_reservation {
+                u32 free_clos_mask;    // Mask of CLOS sets that have not been reserved
+                struct mutex clos_mutex;
+                u8 ways[NUM_CLOS];
+		u8 clos_index;
+        } cache_resv;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
@@ -545,6 +555,11 @@ struct xe_file {
 
 	/** @client: drm client */
 	struct xe_drm_client *client;
+
+        struct clos_reservation {
+                u32 clos_mask;         // Mask of CLOS sets reserved by client
+                u8 l3_rsvd_ways;      // Number of L3 Ways reserved by client, across all CLOS
+        } clos_resv;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1ff6bc79e7d4..f1a6175930f7 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -148,6 +148,51 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 	return xe->pat.table[pat_index].coh_mode;
 }
 
+int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index)
+{
+        WARN_ON(pat_index >= xe->pat.n_entries);
+
+	int err = 0;
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		switch (clos_index) {
+		case 1:
+			if (!(pat_index >= 20 && pat_index < 24))
+				err = -EINVAL;
+			break;
+		case 2:
+			if (!(pat_index >= 24 && pat_index < 28))
+				err = -EINVAL;
+			break;
+		case 3:
+			if (!(pat_index >= 28 && pat_index <= 31))
+				err = -EINVAL;
+			break;
+		default:
+			drm_err(&xe->drm, "Unsupported CLOS value\n");
+				err = -EINVAL;
+		}
+	}
+
+	if (xe->info.platform == XE_PVC) {
+		switch (clos_index) {
+		case 1:
+			if (!(pat_index == 4 || pat_index == 5))
+				err = -EINVAL;
+			break;
+		case 2:
+			if (!(pat_index == 6 || pat_index == 7))
+				err = -EINVAL;
+			break;
+		default:
+			drm_err(&xe->drm, "Unsupported CLOS value\n");
+				err = -EINVAL;
+		}
+	}
+
+        return err;
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index fa0dfbe525cd..fa4dbfd89496 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
  */
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_index_clos_check - check whether clos has been reserved for
+ * chosen pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ * @clos_index: clos index to compare
+ */
+int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index);
+
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1f997353a78f..5896a1dc46d1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
+	u8 has_clos:1;
 	u8 has_display:1;
 	u8 has_heci_gscfi:1;
 	u8 has_llc:1;
@@ -319,6 +320,7 @@ static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
+	.has_clos = true,
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -333,6 +335,7 @@ static const struct xe_device_desc mtl_desc = {
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(XE_LUNARLAKE),
+	.has_clos = true,
 	.require_force_probe = true,
 };
 
@@ -548,6 +551,7 @@ static int xe_info_init_early(struct xe_device *xe,
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
 	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_clos = desc->has_clos;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mmio_ext = desc->has_mmio_ext;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ca917b8315c..1841f2af74c1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2800,6 +2800,17 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		/* check whether Clos has been reserved for chosen pat */
+		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {
+			mutex_lock(&xe->cache_resv.clos_mutex);
+			err = xe_pat_index_clos_check(xe, pat_index, xe->cache_resv.clos_index);
+				if (err) {
+					mutex_unlock(&xe->cache_resv.clos_mutex);
+					goto free_bind_ops;
+				}
+			mutex_unlock(&xe->cache_resv.clos_mutex);
+		}
 	}
 
 	return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9fa3ae324731..47d9d23e0bb0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -100,6 +100,10 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_CLOS_RESERVE		0x0b
+#define DRM_XE_CLOS_FREE		0x0c
+#define DRM_XE_CACHE_RESERVE		0x0d
+
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +117,10 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_CLOS_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)
+#define DRM_IOCTL_XE_CLOS_FREE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)
+#define DRM_IOCTL_XE_CACHE_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CACHE_RESERVE, struct drm_xe_cache_reserve)
+
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1340,6 +1348,69 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_clos_reserve
+ *
+ * Allows clients to request reservation of one free CLOS, to use in subsequent
+ * Cache Reservations.
+ *
+ */
+struct drm_xe_clos_reserve {
+	/** @clos_index: clos index for reservation */
+	__u16 clos_index;
+
+       /** @pad: MBZ */
+	__u16 pad16;
+};
+
+/**
+ * struct drm_xe_clos_free
+ *
+ * Free off a previously reserved CLOS set. Any corresponding Cache Reservations
+ * that are active for the CLOS are automatically dropped and returned to the
+ * Shared set.
+ *
+ * The clos_index indicates the CLOS set which is being released and must
+ * correspond to a CLOS index previously reserved.
+ *
+ */
+struct drm_xe_clos_free {
+	/** clos_index: free clos index */
+	__u16 clos_index;
+
+       /** @pad: MBZ */
+	__u16 pad16;
+};
+
+/**
+ * struct drm_xe_cache_reserve
+ * 
+ * Allows clients to request, or release, reservation of one or more cache ways,
+ * within a previously reserved CLOS set.
+ *
+ * If num_ways = 0, KMD will drop any existing Reservation for the specified
+ * clos_index and cache_level. The requested clos_index and cache_level Waymasks
+ * will then track the Shared set once again.
+ *
+ * Otherwise, the requested number of Ways will be removed from the Shared set
+ * for the requested cache level, and assigned to the Cache and CLOS specified
+ * by cache_level/clos_index.
+ *
+ */
+struct drm_xe_cache_reserve {
+	/** @clos_index: reserved clos index */
+	__u16 clos_index;
+
+       /** @cache_level: level of cache  */
+	__u16 cache_level; /* e.g. 3 for L3 */
+
+       /** @num_ways: cache ways */
+	__u16 num_ways;
+
+       /** @pad: MBZ */
+	__u16 pad16;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

