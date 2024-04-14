Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEAEC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 08:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3825E10E3DC;
	Sun, 14 Apr 2024 08:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ZXjnkoNI";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F6E10E3DC
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 08:11:48 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1713082299; bh=9DkxBx/YZMGIWfhKNNOkAlTkAhMwsNd142bJzPTbPxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZXjnkoNIG1XPKONSGUv2532BUKCmNWj3XfvbGLgCKVSb7OjiCOI3FuziyA6iW0uaK
 2Py5M//U0UuTqbU/9yLL8K4fnYaE5N/LSTSf8ef9xrm1tt5BZXIgn01An5WHFxoCJs
 KeUftaiRvjQN//8kMTPHfjCqK6rjsFj1+zP52k2BwU+xT+WsPMOXhGdVHaY2GZAulN
 3Tv27lysItnxKB7TMoWKM6jJjeB/3K6IEYk/9tYYBjQYTPX0P/N3ujKJ/vDeBY9k+t
 WOlF4hsxrdMbjXDIJDtRsYaK2gsKzinCXFaN5eEk3d1ww4dbAlUXmN4erfYA50n2PF
 RcnX13ROovkng==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 43E8B5HU1199572; Sun, 14 Apr 2024 11:11:32 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ofir Bitton <obitton@habana.ai>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
Subject: [PATCH v7 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl handler of
 the mmio debugfs file
Date: Sun, 14 Apr 2024 11:11:05 +0300
Message-Id: <20240414081105.1199559-2-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
References: <20240414081105.1199559-1-kelbaz@habana.ai>
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

The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
and therefore, recently removed.
Nevertheless, it is now restored for debugging purposes to function
as the ioctl handler of the 'mmio' debugfs file.

Notes:
1. The non-admin user's limited mmio access (aka, whitelist),
was removed being irrelevant anymore, now that a user using debugfs
must anyway have root permission to use it.
2. To support multi-tile access, the tile index is now dynamic and
will be retrieved from the given mmio address itself.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
Changes in v7:
 - Get/put forcewake will only be done for enabled/available GTs.
 - Added Multi-tile/GT MMIO access support.
 - Patchset was rebased on top of drm-tip, rather than drm-xe-next.

 drivers/gpu/drm/xe/xe_debugfs.c      | 160 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_debugfs_mmio.h |  43 +++++++
 2 files changed, 201 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index ce27516ffac0..4ad728b937fd 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -6,7 +6,7 @@
 #include "xe_debugfs.h"
 
 #include <linux/string_helpers.h>
-
+#include <linux/security.h>
 #include <drm/drm_debugfs.h>
 
 #include "xe_bo.h"
@@ -15,6 +15,8 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_debugfs_mmio.h"
+#include "xe_mmio.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -111,8 +113,162 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
+static int get_tile_id_of_mmio_addr(struct xe_device *xe, u32 mmio_addr, u8 *tile_id)
+{
+	/* MMIO space size is identical for all tiles so arbitrarily choose root tile */
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	u32 tile_mmio_base_addr = 0;
+	u8 id;
+
+	if (mmio_addr >= (tile->mmio.size * xe->info.tile_count))
+		return -EINVAL;
+
+	for_each_tile(tile, xe, id) {
+		tile_mmio_base_addr = id * tile->mmio.size;
+		/* Each tile has a 16M MMIO space, but the contained CFG space is only 4M */
+		if ((mmio_addr >= tile_mmio_base_addr) &&
+				(mmio_addr < (tile_mmio_base_addr + SZ_4M))) {
+			*tile_id = id;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int assign_mmio_args_to_xe_reg(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args,
+				      struct xe_reg *reg, u8 *tile_id)
 {
+	unsigned int mmio_bits_flag, bytes;
+	u32 mmio_offset_in_tile;
+	struct xe_gt *gt;
+	u8 local_tile_id;
+	int ret;
+
+	mmio_bits_flag = args->flags & XE_DEBUGFS_MMIO_BITS_MASK;
+	bytes = 1 << mmio_bits_flag;
+
+	ret = get_tile_id_of_mmio_addr(xe, args->addr, &local_tile_id);
+	if (ret)
+		return ret;
+
+	gt = xe_device_get_gt(xe, local_tile_id);
+	mmio_offset_in_tile = args->addr - local_tile_id * SZ_16M;
+
+	/*
+	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
+	 * multicast registers. Steering would need uapi extension.
+	 */
+	*reg = XE_REG(mmio_offset_in_tile);
+
+	if (XE_IOCTL_DBG(xe, reg->addr + bytes > gt_to_tile(gt)->mmio.size))
+		return -EINVAL;
+
+	*tile_id = local_tile_id;
+
+	return 0;
+}
+
+static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
+{
+	struct xe_reg reg;
+	struct xe_gt *gt;
+	u8 tile_id, id;
+	int ret;
+
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, args->flags & ~XE_DEBUGFS_MMIO_VALID_FLAGS))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !(args->flags & XE_DEBUGFS_MMIO_WRITE) && args->value))
+		return -EINVAL;
+
+	xe_device_mem_access_get(xe);
+	for_each_gt(gt, xe, id)
+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+
+	ret = assign_mmio_args_to_xe_reg(xe, args, &reg, &tile_id);
+	if (ret)
+		goto exit;
+
+	gt = xe_device_get_gt(xe, tile_id);
+
+	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
+		case XE_DEBUGFS_MMIO_32BIT:
+			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
+				ret = -EINVAL;
+				goto exit;
+			}
+			xe_mmio_write32(gt, reg, args->value);
+			break;
+		default:
+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
+			fallthrough;
+		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
+		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
+			ret = -EOPNOTSUPP;
+			goto exit;
+		}
+	}
+
+	if (args->flags & XE_DEBUGFS_MMIO_READ) {
+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
+		case XE_DEBUGFS_MMIO_32BIT:
+			args->value = xe_mmio_read32(gt, reg);
+			break;
+		case XE_DEBUGFS_MMIO_64BIT:
+			args->value = xe_mmio_read64_2x32(gt, reg);
+			break;
+		default:
+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
+			fallthrough;
+		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
+		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
+			ret = -EOPNOTSUPP;
+		}
+	}
+
+exit:
+	for_each_gt(gt, xe, id)
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+
+	xe_device_mem_access_put(xe);
+
+	return ret;
+}
+
+static long xe_debugfs_mmio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct xe_device *xe = file_inode(filp)->i_private;
+	struct xe_debugfs_mmio_ioctl_data mmio_data;
+	int ret;
+
+	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
+	if (ret)
+		return ret;
+
+	if (cmd == XE_DEBUGFS_MMIO_IOCTL) {
+		ret = copy_from_user(&mmio_data, (struct xe_debugfs_mmio_ioctl_data __user *)arg,
+				     sizeof(mmio_data));
+		if (ret)
+			return -EFAULT;
+
+		ret = _xe_debugfs_mmio_ioctl(xe, &mmio_data);
+		if (ret)
+			return ret;
+
+		ret = copy_to_user((struct xe_debugfs_mmio_ioctl_data __user *)arg,
+				   &mmio_data, sizeof(mmio_data));
+		if (ret)
+			return -EFAULT;
+	} else {
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs_mmio.h b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
new file mode 100644
index 000000000000..1dfb8fa2ce9a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEBUGFS_MMIO_H_
+#define _XE_DEBUGFS_MMIO_H_
+
+#include <drm/drm.h>
+
+#define XE_DEBUGFS_MMIO_8BIT		0x0
+#define XE_DEBUGFS_MMIO_16BIT		0x1
+#define XE_DEBUGFS_MMIO_32BIT		0x2
+#define XE_DEBUGFS_MMIO_64BIT		0x3
+#define XE_DEBUGFS_MMIO_BITS_MASK	0x3
+#define XE_DEBUGFS_MMIO_READ		0x4
+#define XE_DEBUGFS_MMIO_WRITE		0x8
+
+#define XE_DEBUGFS_MMIO_VALID_FLAGS (\
+	XE_DEBUGFS_MMIO_BITS_MASK |\
+	XE_DEBUGFS_MMIO_READ |\
+	XE_DEBUGFS_MMIO_WRITE)
+
+struct xe_debugfs_mmio_ioctl_data {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	__u32 addr;
+
+	__u32 flags;
+
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+#define XE_DEBUGFS_MMIO_IOCTL_NR	0x00
+
+#define XE_DEBUGFS_MMIO_IOCTL \
+	_IOWR(0x20, XE_DEBUGFS_MMIO_IOCTL_NR, struct xe_debugfs_mmio_ioctl_data)
+
+#endif /* _XE_DEBUGFS_MMIO_H_ */
-- 
2.34.1

