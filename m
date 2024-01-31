Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83105C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3043110E990;
	Wed, 31 Jan 2024 20:00:15 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A88710E990
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 20:00:11 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1706731198; bh=Uo7neN+oQo+4MwIYaGlZQwJDeTDrVtRqiZMkLdVwf7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=um3ydv4lUu0s4JXxQbU62k8+LlaDJB7gDrf8/gzBpe9FS2xBc4pOkRB255JE3IJt9
 R3w1DJ5UItyIznd+VZPZbc8gUn+2eboOVIMzjix6pvOl2YqJDvFOuE8af6xK6/6xdw
 d8ODdjCRJtMBB6GcZwObJ2mm2757zWAhG7rtDlHKj+hlnNNg4/16FTBomNI2YlBCmx
 6/8nnXr5PyK+zVMzzGm3UBVmJT+GFVUVhddCHoki77FfYuF8J1jwZLZ8Tqyb0dSBdZ
 sScRBCCWjx/QCRKjZmdIvCVcGq7WxBV0lSiwVEpkVvlQFIz3S88R+kkVWnAw5Ioz0f
 pO2VHvQ5XRiXQ==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 40VJxrlw852654; Wed, 31 Jan 2024 21:59:53 +0200
From: Koby Elbaz <kelbaz@habana.ai>
To: michal.winiarski@intel.com
Subject: [PATCH v6 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl handler of
 the mmio debugfs file
Date: Wed, 31 Jan 2024 21:59:53 +0200
Message-Id: <20240131195953.852641-2-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131195953.852641-1-kelbaz@habana.ai>
References: <20240131195953.852641-1-kelbaz@habana.ai>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
and therefore, recently removed.
Nevertheless, it is now restored for debugging purposes to function
as the ioctl handler of the 'mmio' debugfs file.
Note, that the non-admin user's limited mmio access (aka, whitelist),
was removed being irrelevant anymore, now that a user using debugfs
must anyway have root permission to use it.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
Changes in v6:
 - Removed unnecessary header includes.
 - Expanded the scope of security_lock_down check.
 drivers/gpu/drm/xe/xe_debugfs.c      | 111 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_debugfs_mmio.h |  43 +++++++++++
 2 files changed, 152 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 21b2257aa3a8..cc9d108f7fb2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -6,13 +6,15 @@
 #include "xe_debugfs.h"
 
 #include <linux/string_helpers.h>
-
+#include <linux/security.h>
 #include <drm/drm_debugfs.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
 #include "xe_step.h"
+#include "xe_debugfs_mmio.h"
+#include "xe_mmio.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -98,8 +100,113 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
+static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	unsigned int bits_flag, bytes;
+	struct xe_reg reg;
+	int ret = 0;
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
+	bits_flag = args->flags & XE_DEBUGFS_MMIO_BITS_MASK;
+	bytes = 1 << bits_flag;
+	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
+		return -EINVAL;
+
+	/*
+	 * TODO: allow distinction between XE_REG / XE_REG_EXT to
+	 * handle registers from both MMIO & MMIO_EXT spaces.
+	 */
+
+	/*
+	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
+	 * multicast registers. Steering would need uapi extension.
+	 */
+	reg = XE_REG(args->addr);
+
+	xe_device_mem_access_get(xe);
+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
+		switch (bits_flag) {
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
+		switch (bits_flag) {
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
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(xe);
+
+	return ret;
+}
+
+static long xe_debugfs_mmio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
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

