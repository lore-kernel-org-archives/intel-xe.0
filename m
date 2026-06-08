Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B9CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D68510F6BF;
	Mon,  8 Jun 2026 16:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUbXZVGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3C610F6BF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935521; x=1812471521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sk0C99hJ1fHfnOIfQ9eiJtTQ6OLnfcl+hLtZjFRkzxc=;
 b=TUbXZVGknlBxoyclybQradfY5eB6yUfIC8ONkQHlqn2ZEKZt9iztQhqc
 rA6xk3l4sXOVdFMcv+EOadkaf78PIZgRngRO/EYwtOjlJ79oiqz4tqXsI
 EEpkuwhdFRpHpstWaLWuTSQzq8iaIt9QKwkAX2jMbzVMsBajEch3RDMNX
 wpyHKNhdAErbi/s/yUo3QAEn+Ec70KJrwRQr23V8el8wO8HwbygQtBFCJ
 zK8DTxxd5gzK6Mxa839PJO+9z+9U9jig0x2YpHcYZK7r8JamljtCc3NGl
 kvdogRtzhh1RPVsHS/Uh5xCuyx2PJvmFj7Y683l+0Df0PuwHVqzW4yhqx g==;
X-CSE-ConnectionGUID: bi2DltqESZKVU0gvsDv55w==
X-CSE-MsgGUID: 1XwA2hXxRuKl1QkdBUnBtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85532045"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85532045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:41 -0700
X-CSE-ConnectionGUID: 9jnbfw7jSTO2oMMX+C90Dg==
X-CSE-MsgGUID: wiRUZSUUTly1At6hCN5mHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247459292"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:34 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 18/18] drm/xe: Add xe_client_debugfs and introduce debug_data
 file
Date: Mon,  8 Jun 2026 19:16:36 +0300
Message-ID: <20260608161639.1652127-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Create a debug_data file for each xe file/client which is supposed to
list all mapped debug data and attempts to mimic '/proc/pid/maps'.
Each line represents a single mapping and has the following format:

  <vm id> <begin>-<end> <flags> <offset> <pathname>

v2: trim len in debug_data_read() (Sashiko)

Cc: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile            |   3 +-
 drivers/gpu/drm/xe/xe_client_debugfs.c | 132 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_client_debugfs.h |  19 ++++
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 4 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1531ea9b3a93..e43d89a45d39 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -354,7 +354,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
 endif
 
 ifeq ($(CONFIG_DEBUG_FS),y)
-	xe-y += xe_debugfs.o \
+	xe-y += xe_client_debugfs.o \
+		xe_debugfs.o \
 		xe_gt_debugfs.o \
 		xe_gt_sriov_vf_debugfs.o \
 		xe_gt_stats.o \
diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.c b/drivers/gpu/drm/xe/xe_client_debugfs.c
new file mode 100644
index 000000000000..3ce9527188c4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_client_debugfs.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_device.h"
+#include "xe_client_debugfs.h"
+
+#include <linux/debugfs.h>
+
+#include "xe_debug_data.h"
+#include "xe_debug_data_types.h"
+#include "xe_device_types.h"
+#include "xe_vm_types.h"
+
+#define MAX_LINE_LEN (64 + PATH_MAX)
+
+static ssize_t debug_data_read(struct file *file, char __user *buf, size_t count,
+			       loff_t *ppos)
+{
+	struct xe_debug_data *dd;
+	unsigned long vm_index;
+	const char *path;
+	char *kbuf;
+	struct xe_vm *vm;
+
+	struct xe_file *xef = file->private_data;
+	ssize_t total = 0;
+	loff_t pos = 0;
+
+	if (!xef || !buf)
+		return -EINVAL;
+
+	kbuf = kmalloc(MAX_LINE_LEN, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	mutex_lock(&xef->vm.lock);
+
+	xa_for_each(&xef->vm.xa, vm_index, vm) {
+		mutex_lock(&vm->debug_data.lock);
+		list_for_each_entry(dd, &vm->debug_data.list, link) {
+			int len;
+
+			path = dd->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO ?
+				xe_debug_data_pseudo_path_to_string(dd->pseudopath) :
+				dd->pathname;
+
+			/* Format: <vm id> <begin>-<end> <flags> <offset> <pathname> */
+			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
+				vm_index,
+				dd->addr,
+				dd->addr + dd->range,
+				dd->flags,
+				dd->offset,
+				path);
+
+			/* snprintf may return more but string is truncated to size */
+			if (len > MAX_LINE_LEN)
+				len = MAX_LINE_LEN;
+
+			if (pos + len <= *ppos) {
+				pos += len;
+				continue;
+			}
+
+			if (pos < *ppos) {
+				const int skip = *ppos - pos;
+
+				len -= skip;
+				memmove(kbuf, kbuf + skip, len);
+				pos = *ppos;
+			}
+
+			if (total + len > count)
+				len = count - total;
+
+			if (copy_to_user(buf + total, kbuf, len)) {
+				mutex_unlock(&vm->debug_data.lock);
+				mutex_unlock(&xef->vm.lock);
+				kfree(kbuf);
+				return -EFAULT;
+			}
+
+			total += len;
+			pos += len;
+
+			if (total >= count) {
+				mutex_unlock(&vm->debug_data.lock);
+				mutex_unlock(&xef->vm.lock);
+				kfree(kbuf);
+				*ppos = pos;
+				return total;
+			}
+		}
+		mutex_unlock(&vm->debug_data.lock);
+	}
+
+	mutex_unlock(&xef->vm.lock);
+	kfree(kbuf);
+	*ppos = pos;
+	return total;
+}
+
+static int debug_data_open(struct inode *inode, struct file *file)
+{
+	struct xe_file *xef = inode->i_private;
+
+	file->private_data = xe_file_get(xef);
+	return 0;
+}
+
+static int debug_data_release(struct inode *inode, struct file *file)
+{
+	struct xe_file *xef = inode->i_private;
+
+	xe_file_put(xef);
+	return 0;
+}
+
+static const struct file_operations maps_fops = {
+	.owner = THIS_MODULE,
+	.open = debug_data_open,
+	.release = debug_data_release,
+	.read = debug_data_read,
+	.llseek = default_llseek,
+};
+
+void xe_client_debugfs_register(struct xe_file *xef)
+{
+	debugfs_create_file("debug_data", 0444, xef->drm->debugfs_client, xef, &maps_fops);
+}
diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.h b/drivers/gpu/drm/xe/xe_client_debugfs.h
new file mode 100644
index 000000000000..9eace15c0a49
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_client_debugfs.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_CLIENT_DEBUGFS_H_
+#define _XE_CLIENT_DEBUGFS_H_
+
+#include <linux/debugfs.h>
+
+struct xe_file;
+
+#ifdef CONFIG_DEBUG_FS
+void xe_client_debugfs_register(struct xe_file *xef);
+#else
+static inline void xe_client_debugfs_register(struct xe_file *xef) { }
+#endif
+
+#endif // _XE_CLIENT_DEBUGFS_H_
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 02ab8b307c9f..539ce3be8d42 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,6 +25,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
+#include "xe_client_debugfs.h"
 #include "xe_configfs.h"
 #include "xe_debugfs.h"
 #include "xe_defaults.h"
@@ -125,6 +126,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 		put_task_struct(task);
 	}
 
+	xe_client_debugfs_register(xef);
+
 	return 0;
 }
 
-- 
2.43.0

