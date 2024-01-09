Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4919CC47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24D10E53E;
	Tue,  9 Jan 2024 23:50:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691710E53E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704844235; x=1736380235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mYMieUxaVea0IFmtVanu891+X9+S18qsW4qYHkQd8Jg=;
 b=j2k/UFjfDg0nvYYzkITaTBdj/u4SNWnYDBhdZHe13S4RL4J3VOnfov1u
 5QZ5g/J31xmdkJqoALI1g4TeBvrbMmBS4uKpRQovKcn4t9A5QMp42wTTL
 dwthE0ECe7Kg6BjdUZj4029OIco/uqA81Ioqr0FvF+hqAniapuvVuE2gU
 yiWbwC8HFG655zH5PqTeDpMim2fXWeaFaV6TSgxQnlE8+vLJO5tDPIL8+
 ee/nD+s7lcSoXQ0LxoZ2qEFh03dElq46o9d5p2yj1vwa6VH54gT9OKdwi
 /W5sp2keaGzMx2RAoG+Ydd/SDvh7BE2kEWbKJs4h46306Oca4zhyzA3WQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11845377"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11845377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="23742109"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa002.jf.intel.com with ESMTP; 09 Jan 2024 15:50:34 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/xe: Introduce xe_clos.c
Date: Wed, 10 Jan 2024 05:27:57 +0530
Message-Id: <20240109235758.1432987-3-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109235758.1432987-1-pallavi.mishra@intel.com>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
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

Add CLOS specific operations in a new file.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_clos.c         | 264 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_clos.h         |  31 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  22 +++
 drivers/gpu/drm/xe/xe_pci.c          |   4 +
 5 files changed, 322 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_clos.c
 create mode 100644 drivers/gpu/drm/xe/xe_clos.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6952da8979ea..d85a252e404b 100644
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
diff --git a/drivers/gpu/drm/xe/xe_clos.c b/drivers/gpu/drm/xe/xe_clos.c
new file mode 100644
index 000000000000..e51dba96e2c0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_clos.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/xe_drm.h>
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_clos.h"
+
+static void clos_update_ways(struct xe_device *xe, struct xe_gt *gt, u8 clos_index, u32 mask)
+{
+
+	drm_dbg(&xe->drm, "clos index = %d mask = 0x%x", clos_index,  mask);
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
+			/* Assign contiguous span of ways */
+			u8 ways = xe->cache_resv.ways[i];
+			mask = GENMASK(start_bits + ways - 1, start_bits);
+
+			drm_dbg(&xe->drm, "start_bits = %d ways = %d mask= 0x%x\n",
+				  start_bits, ways, mask);
+			start_bits += ways;
+		}
+		for_each_gt(gt, xe, j)
+			clos_update_ways(xe, gt, i, mask);
+	}
+}
+
+#define MAX_L3WAYS 32
+void init_device_clos(struct xe_device *xe)
+{
+	if (!(xe->info.has_clos))
+		return;
+
+	mutex_init(&xe->cache_resv.clos_mutex);
+
+	/* CLOS1 and CLOS2 available for Reservation */
+	xe->cache_resv.free_clos_mask = 0x6;
+
+	if (GRAPHICS_VER(xe) >= 20)
+		xe->cache_resv.free_clos_mask = 0xe;
+
+	/* Shared set uses CLOS0 and initially gets all Ways */
+	xe->cache_resv.ways[0] = MAX_L3WAYS;
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
+	file->clos_resv.clos_mask = 0;   /* No CLOS reserved yet */
+	file->clos_resv.l3_rsvd_ways = 0;
+}
+
+static bool
+clos_is_reserved(struct xe_file *file, u16 clos_index)
+{
+        return file->clos_resv.clos_mask & (1 << clos_index);
+}
+
+static int
+free_l3cache_ways(struct xe_file *file, u16 clos_index)
+{
+        struct xe_device *xe = file->xe;
+
+        if (xe->cache_resv.ways[clos_index]) {
+                u8 num_ways = xe->cache_resv.ways[clos_index];
+
+                file->clos_resv.l3_rsvd_ways -= num_ways;
+
+                xe->cache_resv.ways[0] += num_ways;
+                xe->cache_resv.ways[clos_index] -= num_ways;
+
+                update_l3cache_masks(xe);
+        }
+
+        return 0;
+}
+
+static int free_clos(struct xe_file *file, u16 clos_index)
+{
+        struct xe_device *xe = file->xe;
+
+        mutex_lock(&xe->cache_resv.clos_mutex);
+
+        if (clos_is_reserved(file, clos_index)) {
+                struct xe_device *xe = file->xe;
+
+                free_l3cache_ways(file, clos_index);
+
+                file->clos_resv.clos_mask &= ~(1 << clos_index);
+                xe->cache_resv.free_clos_mask |= (1 << clos_index);
+
+                mutex_unlock(&xe->cache_resv.clos_mutex);
+
+                return 0;
+        }
+
+        mutex_unlock(&xe->cache_resv.clos_mutex);
+        return -EPERM;
+}
+
+void uninit_client_clos(struct xe_file *file)
+{
+	u16 clos_index;
+	struct xe_device *xe = file->xe;
+	if (!(file->xe->info.has_clos))
+		return;
+
+	for_each_set_bit(clos_index, &file->clos_resv.clos_mask, NUM_CLOS) {
+
+		drm_dbg(&xe->drm, "uninit release mask = 0x%lu clos= %d\n",
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
+reserve_cache_ways(struct xe_file *file, u16 cache_level,
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
+static int reserve_clos(struct xe_file *file, u16 *clos_index)
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
+		xe->cache_resv.clos_index = clos;
+		mutex_unlock(&xe->cache_resv.clos_mutex);
+
+		return 0;
+	}
+	mutex_unlock(&xe->cache_resv.clos_mutex);
+
+	return -ENOSPC;
+}
+
+int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file)
+{
+	struct xe_file *file_priv = file->driver_priv;
+	struct xe_device *xe = file_priv->xe;
+	struct drm_xe_clos_reserve *clos = data;
+
+	if (!(xe->info.has_clos))		
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
+	if (!(xe->info.has_clos))	
+		return -EOPNOTSUPP;
+
+	return free_clos(file_priv, clos->clos_index);
+}
+
+int xe_clos_set_ways_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct xe_file *file_priv = file->driver_priv;
+	struct xe_device *xe = file_priv->xe;
+	struct drm_xe_clos_set_ways *set_ways = data;
+
+	if (!(xe->info.has_clos))		
+		return -EOPNOTSUPP;
+
+	return reserve_cache_ways(file_priv,
+				  set_ways->cache_level,
+				  set_ways->clos_index,
+				  &set_ways->num_ways);
+}
diff --git a/drivers/gpu/drm/xe/xe_clos.h b/drivers/gpu/drm/xe/xe_clos.h
new file mode 100644
index 000000000000..9df0febbff48
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_clos.h
@@ -0,0 +1,31 @@
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
+int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file);
+int xe_clos_free_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file);
+int xe_clos_set_ways_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file);
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8404685b2418..b2f1ba77595f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -257,6 +257,8 @@ struct xe_device {
 		u8 is_dgfx:1;
 		/** @has_asid: Has address space ID */
 		u8 has_asid:1;
+		/** @has_clos: device supports clos reservation */
+		u8 has_clos:1;
 		/** @force_execlist: Forced execlist submission */
 		u8 force_execlist:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
@@ -458,6 +460,18 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+#define NUM_CLOS 4
+	struct cache_reservation {
+		/** Mask of CLOS sets that have not been reserved */
+		u32 free_clos_mask;
+		/** lock to protect cache_reservation */
+		struct mutex clos_mutex;
+		/** number of cache ways */
+		u8 ways[NUM_CLOS];
+		/** clos index */
+		u8 clos_index;
+	} cache_resv;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
@@ -563,6 +577,14 @@ struct xe_file {
 
 	/** @client: drm client */
 	struct xe_drm_client *client;
+
+	struct clos_reservation {
+		/** Mask of CLOS sets reserved by client */
+		unsigned long clos_mask;
+		/** Number of L3 Ways reserved by client, across all CLOS */
+		u8 l3_rsvd_ways;
+	} clos_resv;
+
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4de79a7c5dc2..5922a94a3e6f 100644
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
-- 
2.25.1

