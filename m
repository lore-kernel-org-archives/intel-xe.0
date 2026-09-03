Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F60C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672F410F682;
	Thu,  3 Sep 2026 15:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDWsUq8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC1410F682
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447698; x=1819983698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zz0iJ9UUsEnHdifwT8uq6oLLfvaUW5vEzbqW+wjwF9w=;
 b=QDWsUq8YYz/ETVpliQaTnmtBZq85PWONXUQhGQJGryCnlLWE36RZPCOV
 lh0VSPI6wk2F4sroBHu9kV3uIsAABpyjkX2EsEIh8cwuUsHPF4yEmMTkD
 S4HayY1HgW98gfE5RX0AZCHxDGBFr055L9N3xSskYEEzOkpbHxhLzWIPU
 yrxLEGCqBZx3YxTEnLoZasyRoYHU/peLXxudUQUYwnOUSyX4IINYTiwta
 hVqoilCp1UAgyJZ+siKxnu0rkk64iVgd/Rj5DEYwTQd42QFIhI1ap1eXX
 m2+zyXroKH4vYthfIpzWuIlaSYiM4Kp/x6CatIKe51aWtn9UL46a3wCFH A==;
X-CSE-ConnectionGUID: /qJeIrVyTxiJhzq/bagLVg==
X-CSE-MsgGUID: Ds/tPqwjTxGvZiyc3Ye20Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486864"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:34 -0700
X-CSE-ConnectionGUID: T50B/5lMT9eZ9f99VRYVnA==
X-CSE-MsgGUID: V/SfuX93S9yUVI2YWdVuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441257"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:29 -0700
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
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 19/27] drm/xe: Add xe_client_debugfs and introduce
 debug_data file
Date: Thu,  3 Sep 2026 17:59:43 +0300
Message-ID: <20260903145952.848051-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Create a debug_data file for each xe file/client. It lists all mapped
debug data and mimics '/proc/pid/maps'.
Each line represents a single mapping and has the following format:

  <vm id> <begin>-<end> <flags> <offset>	<pathname>

v2: trim len in debug_data_read() (Sashiko)
v3: - fix return len, avoid rewind (Sashiko)
    - use guard, kdoc, cleanups (Michal)
    - drop client ref after seq_file is done (Claude)

Assisted-by: Claude:claude-opus-4-8
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile            |   3 +-
 drivers/gpu/drm/xe/xe_client_debugfs.c | 108 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_client_debugfs.h |  17 ++++
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5cdf47f79aa4..4a882e34bbe8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -358,7 +358,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
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
index 000000000000..919738c4893b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_client_debugfs.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+
+#include "xe_client_debugfs.h"
+#include "xe_debug_data.h"
+#include "xe_debug_data_types.h"
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_vm_types.h"
+
+static void debug_data_show_vm(struct seq_file *m, unsigned long vm_id,
+			       struct xe_vm *vm)
+{
+	struct xe_debug_data *dd;
+
+	guard(mutex)(&vm->debug_data.lock);
+
+	list_for_each_entry(dd, &vm->debug_data.list, link) {
+		/* Format: <vm id> <begin>-<end> <flags> <offset>\t<pathname> */
+		seq_printf(m, "%lu 0x%llx-0x%llx 0x%llx 0x%llx\t",
+			   vm_id,
+			   dd->addr,
+			   dd->addr + dd->range,
+			   dd->flags,
+			   dd->offset);
+
+		if (dd->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO)
+			seq_puts(m, xe_debug_data_pseudo_path_to_string(dd->pseudopath));
+		else
+			/*
+			 * The pathname originates from userspace; escape it the
+			 * same way seq_path() does for /proc/pid/maps so that a
+			 * newline cannot break the line oriented format.
+			 */
+			seq_escape(m, dd->pathname, "\n");
+
+		seq_putc(m, '\n');
+	}
+}
+
+static int debug_data_show(struct seq_file *m, void *data)
+{
+	struct xe_file *xef = m->private;
+	unsigned long vm_id;
+	struct xe_vm *vm;
+
+	guard(mutex)(&xef->vm.lock);
+
+	xa_for_each(&xef->vm.xa, vm_id, vm)
+		debug_data_show_vm(m, vm_id, vm);
+
+	return 0;
+}
+
+static int debug_data_open(struct inode *inode, struct file *file)
+{
+	struct xe_file *xef = inode->i_private;
+	int ret;
+
+	ret = single_open(file, debug_data_show, xef);
+	if (ret)
+		return ret;
+
+	xe_file_get(xef);
+
+	return 0;
+}
+
+static int debug_data_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct xe_file *xef = m->private;
+	int ret;
+
+	ret = single_release(inode, file);
+	xe_file_put(xef);
+
+	return ret;
+}
+
+static const struct file_operations debug_data_fops = {
+	.owner = THIS_MODULE,
+	.open = debug_data_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = debug_data_release,
+};
+
+/**
+ * xe_client_debugfs_register() - Register the per-client debugfs files
+ * @xef: The xe file to register the files for
+ *
+ * Create the debugfs entries exposed under the DRM client directory of @xef.
+ * Called from xe_file_open(), after DRM has created the client directory.
+ *
+ * The files are removed by drm_file_free() before ->postclose runs, so they
+ * do not need to be torn down by the driver.
+ */
+void xe_client_debugfs_register(struct xe_file *xef)
+{
+	debugfs_create_file("debug_data", 0444, xef->drm->debugfs_client, xef,
+			    &debug_data_fops);
+}
diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.h b/drivers/gpu/drm/xe/xe_client_debugfs.h
new file mode 100644
index 000000000000..1211433a4efe
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_client_debugfs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CLIENT_DEBUGFS_H_
+#define _XE_CLIENT_DEBUGFS_H_
+
+struct xe_file;
+
+#ifdef CONFIG_DEBUG_FS
+void xe_client_debugfs_register(struct xe_file *xef);
+#else
+static inline void xe_client_debugfs_register(struct xe_file *xef) { }
+#endif
+
+#endif /* _XE_CLIENT_DEBUGFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01254c73b2c6..f901cf7b7301 100644
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
@@ -127,6 +128,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 		put_task_struct(task);
 	}
 
+	xe_client_debugfs_register(xef);
+
 	return 0;
 }
 
-- 
2.53.0

