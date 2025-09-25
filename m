Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2693CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66A910E9C4;
	Thu, 25 Sep 2025 22:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaMKvKRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DF410E9C4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758837896; x=1790373896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3F6cnulpMjyjYRKyzl7Tsl49k56rhRWJIRq9LUDv6I=;
 b=XaMKvKRR3eA4uB+zOffVabTJHGwpKhlIRfPScDt33InfW+ByKsjwGt3t
 TX3npyDJjuDs/svGjC7seoFzBqIb8gb2xLvMwImVKoHLiZqqjXG+R8ABF
 gtfu1JAgE5hs4jh1H0x2sivIHeJ4WsR3drpeVqqCsFCHprCnyKi5Bpcfz
 gH7eygviiYRw97C6kLG18Pn3nFuV6uIXfrL5V+ZCU7RVvy/BEDrWiwrFC
 BwIRwzHGWWHQaNCEwcyecgc92f4oRAcA/dkLG7gfnRMjFfz2PElgymoNV
 hDrDpcSn8+RPZBE5axxnSy2sLskgWTGra4lEGoXmELgGG9IvzRrzxutJw Q==;
X-CSE-ConnectionGUID: cB1KKq6PSpO1tihqbAE3NQ==
X-CSE-MsgGUID: 5BLE3/NPR6uu5UDvAP2iJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61222125"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61222125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:55 -0700
X-CSE-ConnectionGUID: C3Wby9C+T4euvJx7vmftRQ==
X-CSE-MsgGUID: Gf3q5QbMT9+UZAjCXx6uuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="201129434"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/6] drm/xe/pf: Populate SR-IOV debugfs tree with tiles
Date: Fri, 26 Sep 2025 00:04:20 +0200
Message-ID: <20250925220425.196860-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925220425.196860-1-michal.wajdeczko@intel.com>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
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

Populate new per SR-IOV function debugfs directories with next
level directories that represent tiles. There are no files yet,
but we will continue updating that tree in upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  3 +-
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 14 +++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 98 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h | 15 +++
 4 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 534355c23e80..00f7ce8e926d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -175,7 +175,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o \
 	xe_sriov_pf_debugfs.o \
-	xe_sriov_pf_service.o
+	xe_sriov_pf_service.o \
+	xe_tile_sriov_pf_debugfs.o
 
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index b2088b6dc23f..291960c23507 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -6,12 +6,14 @@
 #include <linux/debugfs.h>
 #include <drm/drm_debugfs.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
+#include "xe_tile_sriov_pf_debugfs.h"
 
 static int simple_show(struct seq_file *m, void *data)
 {
@@ -37,6 +39,15 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
 	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
 }
 
+static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+
+	for_each_tile(tile, xe, id)
+		xe_tile_sriov_pf_debugfs_populate(tile, dent, vfid);
+}
+
 static void pf_debugfs_available(struct xe_device *xe, struct dentry *dent)
 {
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -89,6 +100,7 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
 	pfdent->d_inode->i_private = xe;
 
 	pf_populate_pf(xe, pfdent);
+	pf_populate_with_tiles(xe, pfdent, PFID);
 
 	/*
 	 *      /sys/kernel/debug/dri/BDF/
@@ -103,6 +115,8 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
 		if (IS_ERR(vfdent))
 			return;
 		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
+
+		pf_populate_with_tiles(xe, vfdent, VFID(n));
 	}
 
 	return pf_debugfs_available(xe, dent);
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
new file mode 100644
index 000000000000..4445824499ad
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <drm/drm_debugfs.h>
+
+#include "xe_device_types.h"
+#include "xe_tile_sriov_pf_debugfs.h"
+#include "xe_sriov.h"
+
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov		# d_inode->i_private = (xe_device*)
+ *      │   ├── pf		# d_inode->i_private = (xe_device*)
+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
+ *      │   │   ├── tile1
+ *      │   │   │   :
+ *      │   ├── vf1		# d_inode->i_private = VFID(1)
+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
+ *      │   │   ├── tile1
+ *      │   │   :   :
+ *      │   ├── vfN		# d_inode->i_private = VFID(N)
+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
+ *      │   │   ├── tile1
+ *      :   :   :   :
+ */
+
+static void *extract_priv(struct dentry *d)
+{
+	return d->d_inode->i_private;
+}
+
+__maybe_unused
+static struct xe_tile *extract_tile(struct dentry *d)
+{
+	return extract_priv(d);
+}
+
+static struct xe_device *extract_xe(struct dentry *d)
+{
+	return extract_priv(d->d_parent->d_parent);
+}
+
+__maybe_unused
+static unsigned int extract_vfid(struct dentry *d)
+{
+	void *pp = extract_priv(d->d_parent);
+
+	return pp == extract_xe(d) ? PFID : (uintptr_t)pp;
+}
+
+/**
+ * xe_tile_sriov_pf_debugfs_populate() - Populate SR-IOV debugfs tree with tile files.
+ * @tile: the &xe_tile to register
+ * @parent: the parent &dentry that represents the SR-IOV @vfid function
+ * @vfid: the VF identifier
+ *
+ * Add to the @parent directory new debugfs directory that will represent a @tile and
+ * populate it with files that are related to the SR-IOV @vfid function.
+ *
+ * This function can only be called on PF.
+ */
+void xe_tile_sriov_pf_debugfs_populate(struct xe_tile *tile, struct dentry *parent,
+				       unsigned int vfid)
+{
+	struct xe_device *xe = tile->xe;
+	struct dentry *dent;
+	char name[10]; /* should be enough up to "tile%u\0" for 2^16 - 1 */
+
+	xe_tile_assert(tile, IS_SRIOV_PF(xe));
+	xe_tile_assert(tile, extract_priv(parent->d_parent) == xe);
+	xe_tile_assert(tile, extract_priv(parent) == tile->xe ||
+		       (uintptr_t)extract_priv(parent) == vfid);
+
+	/*
+	 *      /sys/kernel/debug/dri/BDF/
+	 *      ├── sriov
+	 *      │   ├── pf		# parent, d_inode->i_private = (xe_device*)
+	 *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
+	 *      │   │   ├── tile1
+	 *      │   │   :   :
+	 *      │   ├── vf1		# parent, d_inode->i_private = VFID(1)
+	 *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
+	 *      │   │   ├── tile1
+	 *      :   :   :   :
+	 */
+	snprintf(name, sizeof(name), "tile%u", tile->id);
+	dent = debugfs_create_dir(name, parent);
+	if (IS_ERR(dent))
+		return;
+	dent->d_inode->i_private = tile;
+
+	xe_tile_assert(tile, extract_tile(dent) == tile);
+	xe_tile_assert(tile, extract_vfid(dent) == vfid);
+	xe_tile_assert(tile, extract_xe(dent) == xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
new file mode 100644
index 000000000000..55d179c44634
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_TILE_SRIOV_PF_DEBUGFS_H_
+#define _XE_TILE_SRIOV_PF_DEBUGFS_H_
+
+struct dentry;
+struct xe_tile;
+
+void xe_tile_sriov_pf_debugfs_populate(struct xe_tile *tile, struct dentry *parent,
+				       unsigned int vfid);
+
+#endif
-- 
2.47.1

