Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794D0CDD543
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1EF10E5EA;
	Wed, 18 Sep 2024 16:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayrQLHOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CE910E5EA
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677150; x=1758213150;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9frwgwY72CbaalTARUbv8320f/SmF2XMt3bdKszXhKM=;
 b=ayrQLHOyQcZF/mucaSBRSXvYI5ZvSlPYO6gWEvMfibCPzBEyfIl+YLgE
 MCYE50DnUjNm7f3bHsav6Xrx15PwcD6u21HSGsgva+DTNsfwd9qpA4APH
 Ra+VdlASxXrXmCQaUIjiqIiQd2CqHUboR5c8/DIm3ryKB4AT0BzhoXnFl
 Jr74/vQpwiLev/I55SdSKyZZqerJVOiOY5AVdNi1UiwwUuFvL5+QJh79Q
 c2fIpQ4lD70mpLaydlMaIpjtk8kgx2v1W5KiLOYirKYhMO1ee0677dj6R
 34W9R1l3wCk4EOOXmoi3pLf77nc6EAgffeSfF+hqdeuHEm+UbAZ00/OPQ A==;
X-CSE-ConnectionGUID: mWI5NglcT8q2LKu0EBTRlA==
X-CSE-MsgGUID: ydGmH3+eSGyV24MrZYrzXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29495718"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29495718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:32:29 -0700
X-CSE-ConnectionGUID: /1/vXK0rQ/2TbE6qq6FViw==
X-CSE-MsgGUID: cFKhAmNuQI6Z9Rau8ZuAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="92933615"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:32:29 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Date: Wed, 18 Sep 2024 12:45:45 -0400
Message-Id: <20240918164545.3955824-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
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

Add debugfs entry to display all the gpuva that is bound to the
device. This is done by walking all the VMs created for each device
process, and display va information of each VM. This is useful for
gpuvm debugging. With this change, user can display gpuva info
as below:

root@DUT7279PVC:/home/gta# cat /sys/kernel/debug/dri/0/gpuvas
Process "your process name" GPU VA space
DRM GPU VA space (Xe VM) [0x0000000000000000;0x0200000000000000]
Kernel reserved node [0x0000000000000000;0x0000000000000000]

 VAs | start              | range              | end                | object             | object offset
-------------------------------------------------------------------------------------------------------------
     | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
     | 0x00007ffff5db7000 | 0x0000000000001000 | 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
     | 0x00007ffff5db8000 | 0x00ff80000a248000 | 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 44 +++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1011e5d281fa..0c7bee1c2a8d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -9,6 +9,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file *m)
+{
+	int ret;
+
+	mutex_lock(&vm->snap_mutex);
+	ret = drm_debugfs_gpuva_info(m, &vm->gpuvm);
+	mutex_unlock(&vm->snap_mutex);
+
+	return ret;
+}
+
+static int show_each_vm(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct xe_device *xe = node_to_xe(node);
+	struct drm_device *dev = &xe->drm;
+	struct drm_file *file;
+	struct xe_file *xef;
+	int (*show)(struct xe_vm *, struct seq_file *) = node->info_ent->data;
+	struct xe_vm *vm;
+	unsigned long idx;
+	int ret = 0;
+
+	mutex_lock(&dev->filelist_mutex);
+	list_for_each_entry(file, &dev->filelist, lhead) {
+		xef = (struct xe_file *)file->driver_priv;
+		seq_printf(m, "Process %s GPU VA space\n", xef->process_name);
+		mutex_lock(&xef->vm.lock);
+		xa_for_each(&xef->vm.xa, idx, vm) {
+			ret = show(vm, m);
+			if (ret < 0)
+				break;
+
+			seq_puts(m, "\n");
+		}
+		mutex_unlock(&xef->vm.lock);
+	}
+	mutex_unlock(&dev->filelist_mutex);
+
+	return ret;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
+	DRM_DEBUGFS_GPUVA_INFO(show_each_vm, show_vm_gpuvas),
 };
 
 static int forcewake_open(struct inode *inode, struct file *file)
-- 
2.26.3

