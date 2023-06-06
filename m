Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64502C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E28410E21F;
	Tue,  6 Jun 2023 11:07:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305C010E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049637; x=1717585637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fjgFmERkNJvGqPXhI8jbTKnXRsur4Pfv9ev3kGfI/uc=;
 b=VmCzuFX+dOTgJ0so8wWV51M/BTPt8/JZNhvdluDl2/exZSocGPbzKJX5
 2FpRE8tMa4aG+9ONodMgcDwrNfnmUcFXL+8ZDSwpAz+7cZM/xB336WNyx
 S+C7KA3BDwMdrvH45mDVFqMga0JSOs5gF7e4g0Jbey+OrqrTS7c7gQhbC
 pulv7aCmBXaWTe4oRS1Iq3Q39yR3/ywJEs6nepFMhlvmVj/apZ40AiOyF
 BG0XcDG+NBsN8DKXoJGV7x2Q8jsFJV5G4pLy8vk23DLLWR2KMY+gIeDc0
 tcJoSyOhuxDDQUig8c+lk6PYVrhsuCV7a9v3KLxdoPYoU5FUAKp5FiWDG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443013961"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443013961"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955711820"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955711820"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 04:07:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:42:53 +0530
Message-Id: <20230606111255.2072426-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |  1 +
 drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_tile.c             |  3 ++
 drivers/gpu/drm/xe/xe_tile.h             |  2 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c       | 58 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 +++++++++++
 7 files changed, 113 insertions(+)
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
index 000000000000..821bd49de277
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -0,0 +1,58 @@
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
+	struct device *dev = tile_to_xe(tile)->drm.dev;
+	struct kobj_tile *kg;
+	int err;
+
+	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
+	if (!kg)
+		return -ENOMEM;
+
+	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
+	kg->tile = tile;
+
+	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
+	if (err) {
+		kobject_put(&kg->base);
+		return err;
+	}
+
+	tile->sysfs = &kg->base;
+
+	err = drmm_add_action_or_reset(&tile_to_xe(tile)->drm, tile_sysfs_fini, tile);
+	if (err)
+		return err;
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

