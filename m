Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1510EC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 11:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1FB10E250;
	Mon, 24 Mar 2025 11:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCr2SgBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAF910E250
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742814489; x=1774350489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBIF/KU8bn+lQPFfQMdLNEJ1Ed5KW0MlFwd8ynP4OHA=;
 b=NCr2SgBi57ljy5d/IP0Wzr593qIahGDbEGE6oni5Ho5nAOPmsrNdNLvg
 sLGgG4bmwzWUUOPBSrqU4JvsOedHiFNgvpSfyU556rdIluRfywriIJA0n
 kGRKg77W5MRf1DOz1Q5CO0funkneUgbsXFOm2phov/CbUzMS3DgSW4Uoy
 2VjIm+Uz6BCd6rpo9/Sw42eoYjlJtBhohPAu0ywaXPqR7s11Jv592RBmV
 yIbWSxqheIBBZq7TLXdoJ/hqdkB+Ykuus0XiIni6G7M1wweejEhVCuh83
 b3MNgbTgSKcJHaOgBTS7TnifsQIWLRN80WfHyYzOHT1YW7yXZRGJ2Z53j Q==;
X-CSE-ConnectionGUID: pKX15L1WRW2QYa5dY8ei7w==
X-CSE-MsgGUID: q26R+E81SX6cp+26ZeQOGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43899064"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="43899064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:08:05 -0700
X-CSE-ConnectionGUID: ygFt7SPRRJ+ZN3nNwLPYMA==
X-CSE-MsgGUID: 08F+2I5lTn+0O87bx0L/2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124542538"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:08:04 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 52OB7sbi2521835
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 13:07:54 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 52OB7rcH2521834; Mon, 24 Mar 2025 13:07:53 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Koby Elbaz <kelbaz@habana.ai>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ofir Bitton <obitton@habana.ai>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 2/2] drm/xe: add mmio debugfs file & restore xe_mmio_ioctl
 as its ioctl handler
Date: Mon, 24 Mar 2025 13:07:30 +0200
Message-Id: <20250324110730.2521805-2-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
References: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
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

From: Koby Elbaz <kelbaz@habana.ai>

The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
and therefore, recently removed.
Nevertheless, it is now restored for debugging purposes as an
ioctl handler for a newly added 'mmio' debugfs file.

Notes:
1. The non-admin user's limited mmio access (aka, whitelist),
was removed being irrelevant anymore, now that a user using debugfs
must anyway have root permissions to use it.
2. To support multi-tile access, the tile index is now dynamic and
will be retrieved from the given mmio address itself.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 157 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_debugfs_mmio.h |  40 +++++++
 drivers/gpu/drm/xe/xe_gt_mcr.c       |  16 +++
 drivers/gpu/drm/xe/xe_gt_mcr.h       |   2 +
 4 files changed, 214 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e60eaefdd4a5..fb32679e88f0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,12 +5,15 @@
 
 #include "xe_debugfs.h"
 
+#include "regs/xe_reg_defs.h"
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
-
+#include <linux/security.h>
 #include <drm/drm_debugfs.h>
 
+#include "regs/xe_gt_regs.h"
+#include "xe_gt_mcr.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -21,6 +24,8 @@
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_debugfs_mmio.h"
+#include "xe_mmio.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -150,6 +155,150 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+static struct xe_tile *get_xe_tile_from_args(struct xe_device *xe,
+					     struct xe_debugfs_mmio_ioctl_data *args)
+{
+	u32 tile_mmio_base = 0;
+	struct xe_tile *tile;
+	unsigned int bytes;
+	u8 id;
+
+	if ((args->flags & XE_DEBUGFS_MMIO_BITS_MASK) == XE_DEBUGFS_MMIO_32BIT)
+		bytes = 4;
+	else if ((args->flags & XE_DEBUGFS_MMIO_BITS_MASK) == XE_DEBUGFS_MMIO_64BIT)
+		bytes = 8;
+	else
+		return NULL;
+
+	if (!IS_ALIGNED(args->addr, bytes))
+		return NULL;
+
+	for_each_tile(tile, xe, id) {
+		tile_mmio_base = id * SZ_16M;
+		/* Each tile has a 16M MMIO space, but the contained CFG space is only 4M */
+		if (args->addr >= tile_mmio_base && args->addr <= (tile_mmio_base + SZ_4M - bytes))
+			return tile;
+	}
+
+	return NULL;
+}
+
+static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
+{
+	struct xe_reg reg;
+	struct xe_reg_mcr reg_mcr;
+	struct xe_tile *tile;
+	u32 mmio_offset_in_tile;
+	bool is_mcr = false;
+	int ret;
+
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, args->flags & ~XE_DEBUGFS_MMIO_VALID_FLAGS))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, (args->flags & XE_DEBUGFS_MMIO_OPS_MASK) == XE_DEBUGFS_MMIO_OPS_MASK))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !(args->flags & XE_DEBUGFS_MMIO_WRITE) && args->value))
+		return -EINVAL;
+
+	tile = get_xe_tile_from_args(xe, args);
+	if (!tile) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	mmio_offset_in_tile = args->addr - tile->id * SZ_16M;
+
+	if (xe_gt_mcr_is_mcr_reg(tile->primary_gt, mmio_offset_in_tile)) {
+		reg_mcr = XE_REG_MCR(mmio_offset_in_tile);
+		is_mcr = true;
+	} else {
+		reg = XE_REG(mmio_offset_in_tile);
+	}
+
+	ret = forcewake_get(xe);
+	if (ret)
+		return ret;
+
+	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
+		case XE_DEBUGFS_MMIO_32BIT:
+			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
+				ret = -EINVAL;
+				goto exit;
+			}
+			if (is_mcr)
+				xe_gt_mcr_multicast_write(tile->primary_gt, reg_mcr, args->value);
+			else
+				xe_mmio_write32(&tile->mmio, reg, args->value);
+			break;
+		default:
+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
+			ret = -EOPNOTSUPP;
+			goto exit;
+		}
+	}
+
+	if (args->flags & XE_DEBUGFS_MMIO_READ) {
+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
+		case XE_DEBUGFS_MMIO_32BIT:
+			if (is_mcr)
+				args->value = xe_gt_mcr_unicast_read_any(tile->primary_gt, reg_mcr);
+			else
+				args->value = xe_mmio_read32(&tile->mmio, reg);
+			break;
+		case XE_DEBUGFS_MMIO_64BIT:
+			if (is_mcr)
+				ret = -EOPNOTSUPP;
+			else
+				args->value = xe_mmio_read64_2x32(&tile->mmio, reg);
+			break;
+		default:
+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
+			ret = -EOPNOTSUPP;
+		}
+	}
+
+exit:
+	forcewake_put(xe);
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
+	return 0;
+}
+
 static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 				size_t size, loff_t *pos)
 {
@@ -203,6 +352,11 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static const struct file_operations mmio_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = xe_debugfs_mmio_ioctl,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -245,6 +399,7 @@ void xe_debugfs_register(struct xe_device *xe)
 		xe_gt_debugfs_register(gt);
 
 	xe_pxp_debugfs_register(xe->pxp);
+	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
 
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
 }
diff --git a/drivers/gpu/drm/xe/xe_debugfs_mmio.h b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
new file mode 100644
index 000000000000..20074a691e44
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEBUGFS_MMIO_H_
+#define _XE_DEBUGFS_MMIO_H_
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+#define XE_DEBUGFS_MMIO_32BIT		0x1
+#define XE_DEBUGFS_MMIO_64BIT		0x2
+#define XE_DEBUGFS_MMIO_BITS_MASK	(XE_DEBUGFS_MMIO_32BIT | XE_DEBUGFS_MMIO_64BIT)
+#define XE_DEBUGFS_MMIO_READ		0x4
+#define XE_DEBUGFS_MMIO_WRITE		0x8
+#define XE_DEBUGFS_MMIO_OPS_MASK	(XE_DEBUGFS_MMIO_READ | XE_DEBUGFS_MMIO_WRITE)
+
+#define XE_DEBUGFS_MMIO_VALID_FLAGS (XE_DEBUGFS_MMIO_BITS_MASK | XE_DEBUGFS_MMIO_OPS_MASK)
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
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 605aad3554e7..c0d46704cda6 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -540,6 +540,22 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
 	}
 }
 
+bool xe_gt_mcr_is_mcr_reg(struct xe_gt *gt, u32 addr)
+{
+	const struct xe_reg reg = XE_REG(addr);
+
+	for (int type = 0; type < NUM_STEERING_TYPES; type++) {
+		if (!gt->steering[type].ranges)
+			continue;
+
+		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
+			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg))
+				return true;
+		}
+	}
+	return false;
+}
+
 /*
  * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
  *    will steer a register to a non-terminated instance
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index bc06520befab..93328b536b7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -26,6 +26,8 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
+bool xe_gt_mcr_is_mcr_reg(struct xe_gt *gt, u32 addr);
+
 bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 					  struct xe_reg_mcr reg_mcr,
 					  u8 *group, u8 *instance);
-- 
2.34.1

