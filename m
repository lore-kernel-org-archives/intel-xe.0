Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C57C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E3310E4B1;
	Wed,  7 Jun 2023 10:05:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D22610E4BC
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686132325; x=1717668325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZWPWxOi0lAuOMaw0scUtdPaO1ozq5gYoxCQDxEPUNGA=;
 b=a5gscCFeGqatjwSCsMFNMPUE9n7M5E8HUKap3neDu54rkh5P7TPXQdVN
 O16T2mlpdLuD/uRD/CbEhXWCM/u2AzIyE2bKniNmtPbuLASBZCKvXlRK1
 jh8NNgihNbCbhbEGdVNwUveiU6L06t9jVhGDKofF97/xYBVNDiQoMbAg1
 netoGEn7c2rA3BwSSX37ZYfXiNf6W6IcmNwoxpHZxqpcBFsSsW5/60Vhu
 wBJ/CEx72WFEzSQc4cYH7L2Br2vgpXt6vNcD7w5PCDv2uhydRyOHOdHcP
 CKxKXH85MeSp65jk0fGOsw3SCgsaN7/kPTANcCCFthjqbzC7IoocT5nEe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356954274"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="356954274"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039539869"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="1039539869"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 03:05:23 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 15:41:01 +0530
Message-Id: <20230607101103.2127088-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 1/3] drm/xe: Add sysfs entry for tile
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

We have recently introduced tile for each gpu,
so lets add sysfs entry per tile for userspace
to provide required information specific to tile.

V2:
  - Add logs in failure path

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |  1 +
 drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_tile.c             |  3 ++
 drivers/gpu/drm/xe/xe_tile.h             |  2 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c       | 65 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 +++++++
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++++
 7 files changed, 120 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f34d4bdd510b..41a6c0d0dee7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
+	xe_tile_sysfs.o \
 	xe_trace.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 17b6b1cc5adb..db61da4d6212 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -150,6 +150,9 @@ struct xe_tile {
 
 	/** @migrate: Migration helper for vram blits and clearing */
 	struct xe_migrate *migrate;
+
+	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
+	struct kobject *sysfs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6414aa810355..ac70486d09c3 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -10,6 +10,7 @@
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_tile.h"
+#include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 
 /**
@@ -142,6 +143,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (IS_ERR(tile->mem.kernel_bb_pool))
 		err = PTR_ERR(tile->mem.kernel_bb_pool);
 
+	xe_tile_sysfs_init(tile);
+
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 33bf41292195..782c47f8bd45 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -6,6 +6,8 @@
 #ifndef _XE_TILE_H_
 #define _XE_TILE_H_
 
+#include "xe_device_types.h"
+
 struct xe_tile;
 
 int xe_tile_alloc(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
new file mode 100644
index 000000000000..09a4a8342aec
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_tile_sysfs.h"
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <drm/drm_managed.h>
+
+#include "xe_tile.h"
+
+static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static struct kobj_type xe_tile_sysfs_kobj_type = {
+	.release = xe_tile_sysfs_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static void tile_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_tile *tile = arg;
+
+	kobject_put(tile->sysfs);
+}
+
+int xe_tile_sysfs_init(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct device *dev = xe->drm.dev;
+	struct kobj_tile *kg;
+	int err;
+
+	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
+	if (!kg) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return -ENOMEM;
+	}
+
+	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
+	kg->tile = tile;
+
+	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
+	if (err) {
+		kobject_put(&kg->base);
+		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
+		return err;
+	}
+
+	tile->sysfs = &kg->base;
+
+	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
+	if (err) {
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+		return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.h b/drivers/gpu/drm/xe/xe_tile_sysfs.h
new file mode 100644
index 000000000000..54a2ba8ba533
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_TILE_SYSFS_H_
+#define _XE_TILE_SYSFS_H_
+
+#include "xe_tile_sysfs_types.h"
+
+int xe_tile_sysfs_init(struct xe_tile *tile);
+
+static inline struct xe_tile *
+kobj_to_tile(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_tile, base)->tile;
+}
+
+#endif /* _XE_TILE_SYSFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs_types.h b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
new file mode 100644
index 000000000000..75906ba11a9e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_TILE_SYSFS_TYPES_H_
+#define _XE_TILE_SYSFS_TYPES_H_
+
+#include <linux/kobject.h>
+
+struct xe_tile;
+
+/**
+ * struct kobj_tile - A tile's kobject struct that connects the kobject
+ * and the TILE
+ *
+ * When dealing with multiple TILEs, this struct helps to understand which
+ * TILE needs to be addressed on a given sysfs call.
+ */
+struct kobj_tile {
+	/** @base: The actual kobject */
+	struct kobject base;
+	/** @tile: A pointer to the tile itself */
+	struct xe_tile *tile;
+};
+
+#endif	/* _XE_TILE_SYSFS_TYPES_H_ */
-- 
2.25.1

