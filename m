Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8B0C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5FC10E48D;
	Mon,  7 Sep 2026 06:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ny3ZUioV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E02110E48A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788763640; x=1820299640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7uWYgJe5RCQsP+wwNCSxOlz5eElcPmoiaxpHO1iD1fY=;
 b=Ny3ZUioVH0DsIWLut4uiV5eh/ox6YfhPQfBTvMoh8ATtTym5fF4wpBBN
 CeisyrJJSrGulq6YAB9CtMdsJXuOeGbD8wzzIQVIl7iEQd/IWOf2OGu9k
 8ZgC0F8fXDyFl3JaQth4UAgM6YB22NtT1TtS0/w5QOmzxoaB8tO8+njWe
 PHoZL1OxOoFh6fwAnX/u4gzbSChuO7PKH1BSPPPCmvFdB2CQBx1y0nqwd
 rciuoy0bpW/fFinIKtmR6PwPMfrd7WDd8pgi6kzgz5/ZWrjZ5RNi7ZJd6
 0hq3yHXKvXK7geSRMp2LDbSpOk/gw9utP6fgCc4s6BRByTAdp17JdWDfl Q==;
X-CSE-ConnectionGUID: mmxuXugsRP2Zcr5bGrRbwQ==
X-CSE-MsgGUID: pFwfSmmyTy61hHmrZaPP6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76717866"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="76717866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:47:20 -0700
X-CSE-ConnectionGUID: cooGlzvqQ/SHUzO/n9Mf+w==
X-CSE-MsgGUID: 3+C/LOvBRhG3qOXVd4ieJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264434166"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2026 23:47:18 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ryan Neph <ryanneph@google.com>,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 3/4] RFC: ANDROID: drm/xe: provide safe mem_monitor enable
 toggle via debugfs
Date: Mon,  7 Sep 2026 11:37:36 +0530
Message-Id: <20260907060737.3636824-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907060737.3636824-1-s.sebinraj@intel.com>
References: <20260907060737.3636824-1-s.sebinraj@intel.com>
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

From: Ryan Neph <ryanneph@google.com>

Provide a way to safely enable/disable mem_monitor at runtime and modify
its parameters with the sequence:

```
su
echo 0 > /sys/kernel/debug/dri/0/mem_monitor/enabled
; # modify params: /sys/module/xe/parameters/mem_monitor_*
echo 1 > /sys/kernel/debug/dri/0/mem_monitor/enabled
```

Also adds to /sys/kernel/debug/dri/0/mem_monitor/:
  - ./info: to show state of the mem_monitor
  - ./mode: to show/set the current mode

Set the mode by writing "latency" or "throughput" to the file.
If mem_monitor is:
  - disabled, this mode is persistent.
  - enabled, this mode may be changed by the mem_monitor

Test: echo 0 > /sys/kernel/dri/0/mem_monitor/enabled  # disables worker
Test: echo 1 > /sys/kernel/dri/0/mem_monitor/enabled  # re-enables worker

Signed-off-by: Ryan Neph <ryanneph@google.com>
Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   1 +
 drivers/gpu/drm/xe/xe_mem_monitor.c  | 153 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_mem_monitor.h  |  11 ++
 drivers/gpu/drm/xe/xe_module.c       |   1 +
 5 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d21068c1effc..c8cec778cc97 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -941,6 +941,7 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_mem_monitor_init(xe);
 	if (err)
 		return err;
+	xe_mem_monitor_debugfs_register(xe);
 
 	err = xe_late_bind_init(&xe->late_bind);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 48aa9d8f6f56..b920a412026b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -586,6 +586,7 @@ struct xe_device {
 
 	/** @mem_monitor: GPU memory growth monitor data */
 	struct xe_mem_monitor_data *mem_monitor;
+	struct dentry *mem_monitor_debugfs_root;
 
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.c b/drivers/gpu/drm/xe/xe_mem_monitor.c
index 9205417bfb0b..a34cafe56976 100644
--- a/drivers/gpu/drm/xe/xe_mem_monitor.c
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.c
@@ -59,9 +59,12 @@
 #include "xe_mem_monitor.h"
 
 #include <linux/atomic.h>
+#include <linux/debugfs.h>
 #include <linux/jiffies.h>
 #include <linux/minmax.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/workqueue.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -154,6 +157,11 @@ struct xe_mem_monitor_data {
 	bool is_high_throughput;
 	atomic_t suspended;
 	bool was_pending_before_suspend;
+
+	struct {
+		atomic64_t current_bytes;
+		atomic64_t delta_signed;
+	} info;
 };
 
 static void xe_mem_monitor_set_high_throughput_mode(struct xe_mem_monitor_data *mon)
@@ -247,6 +255,9 @@ static void xe_mem_monitor_work(struct work_struct *work)
 				 ALPHA_RETAINED * mon->ema_growth_bytes)
 				>> ALPHA_SHIFT;
 
+	atomic64_set(&mon->info.current_bytes, current_bytes);
+	atomic64_set(&mon->info.delta_signed, delta_signed);
+
 	atomic64_set(&mon->prev_mem_bytes, current_bytes);
 	mon->last_poll_jiffies = now;
 
@@ -320,8 +331,21 @@ static void xe_mem_monitor_work(struct work_struct *work)
 static void xe_mem_monitor_cleanup(struct drm_device *drm, void *arg)
 {
 	struct xe_mem_monitor_data *mon = arg;
+	struct xe_device *xe = mon->xe;
 
+	WARN_ON_ONCE(!xe->mem_monitor);
 	cancel_delayed_work_sync(&mon->work);
+	kfree(mon);
+	xe->mem_monitor = NULL;
+}
+
+void xe_mem_monitor_fini(struct xe_device *xe)
+{
+	if (!xe->mem_monitor)
+		return;
+
+	drmm_release_action(&xe->drm, xe_mem_monitor_cleanup, (void *)xe->mem_monitor);
+	drm_info(&xe->drm, "xe_mem_monitor: stopped");
 }
 
 /**
@@ -437,7 +461,7 @@ int xe_mem_monitor_init(struct xe_device *xe)
 		return 0;
 	}
 
-	mon = drmm_kzalloc(&xe->drm, sizeof(*mon), GFP_KERNEL);
+	mon = kzalloc(sizeof(*mon), GFP_KERNEL);
 	if (!mon)
 		return -ENOMEM;
 
@@ -467,3 +491,130 @@ int xe_mem_monitor_init(struct xe_device *xe)
 
 	return 0;
 }
+
+static ssize_t enabled_write(struct file *file,
+			     const char __user *userbuf,
+			     size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_device *xe = s->private;
+	bool enable;
+	int ret;
+
+	ret = kstrtobool_from_user(userbuf, count, &enable);
+	if (ret)
+		return ret;
+
+	if (!enable && xe->mem_monitor)
+		xe_mem_monitor_fini(xe);
+	else if (enable && !xe->mem_monitor)
+		xe_mem_monitor_init(xe);
+
+	return count;
+}
+static int enabled_show(struct seq_file *s, void *data)
+{
+	struct xe_device *xe = s->private;
+
+	seq_printf(s, "%c\n", xe->mem_monitor ? 'Y' : 'N');
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(enabled);
+
+static int info_show(struct seq_file *s, void *data)
+{
+	struct xe_device *xe = s->private;
+	struct xe_mem_monitor_data *mon = xe->mem_monitor;
+
+	if (!mon)
+		return 1;
+
+	seq_printf(s, "current=%llu MB, delta=%lld MB, EMA=%llu MB mode=%d\n",
+		   atomic64_read(&mon->info.current_bytes) >> 20,
+		   atomic64_read(&mon->info.delta_signed) >> 20,
+		   mon->ema_growth_bytes >> 20,
+		   atomic_read(&xe->gpu_mem_mode));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(info);
+
+static ssize_t mode_write(struct file *file, const char __user *userbuf,
+			  size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_device *xe = s->private;
+	char buf[32];
+	size_t len;
+
+	len = min(count, sizeof(buf) - 1);
+	if (copy_from_user(buf, userbuf, len))
+		return -EFAULT;
+	buf[len] = '\0';
+
+	if (sysfs_streq(buf, "latency"))
+		atomic_set(&xe->gpu_mem_mode, XE_GPU_MEM_MODE_LATENCY);
+	else if (sysfs_streq(buf, "throughput"))
+		atomic_set(&xe->gpu_mem_mode, XE_GPU_MEM_MODE_HIGH_THROUGHPUT);
+
+	return count;
+}
+
+static int mode_show(struct seq_file *s, void *data)
+{
+	struct xe_device *xe = s->private;
+	enum xe_gpu_mem_mode mode = atomic_read(&xe->gpu_mem_mode);
+
+	/*
+	 * Print the options, placing brackets around the currently active mode.
+	 */
+	switch (mode) {
+	case XE_GPU_MEM_MODE_LATENCY:
+		seq_puts(s, "[latency] throughput\n");
+		break;
+	case XE_GPU_MEM_MODE_HIGH_THROUGHPUT:
+		seq_puts(s, "latency [throughput]\n");
+		break;
+	default:
+		seq_puts(s, "latency throughput\n");
+		break;
+	}
+
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(mode);
+
+static void xe_mem_monitor_debugfs_unregister(struct drm_device *dev,
+					      void *data)
+{
+	struct xe_device *xe = data;
+
+	debugfs_remove(xe->mem_monitor_debugfs_root);
+}
+
+/* Exposes controls through debugfs under the drm root for this device:
+ *   /sys/kernel/dri/0/mem_monitor/
+ */
+int xe_mem_monitor_debugfs_register(struct xe_device *xe)
+{
+	struct dentry *root;
+	int ret;
+
+	root = debugfs_create_dir("mem_monitor", xe->drm.debugfs_root);
+	if (IS_ERR(root)) {
+		drm_warn(&xe->drm, "failed to create mem_monitor debug directory");
+		return 1;
+	}
+	root->d_inode->i_private = xe;
+	xe->mem_monitor_debugfs_root = root;
+
+	if (xe_modparam.mem_monitor_enabled) {
+		WARN_ON(!xe->mem_monitor);
+		debugfs_create_file("enabled", 0600, root, xe, &enabled_fops);
+		debugfs_create_file("info", 0400, root, xe, &info_fops);
+	}
+	debugfs_create_file("mode", 0600, root, xe, &mode_fops);
+
+	ret = drmm_add_action_or_reset(&xe->drm,
+				       xe_mem_monitor_debugfs_unregister, xe);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.h b/drivers/gpu/drm/xe/xe_mem_monitor.h
index 846c0628ed93..c617c10c1a12 100644
--- a/drivers/gpu/drm/xe/xe_mem_monitor.h
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.h
@@ -39,6 +39,8 @@ enum xe_gpu_mem_mode {
 #ifdef CONFIG_DRM_XE_MEM_MONITOR
 
 int xe_mem_monitor_init(struct xe_device *xe);
+void xe_mem_monitor_fini(struct xe_device *xe);
+int xe_mem_monitor_debugfs_register(struct xe_device *xe);
 
 /*
  * Notify the monitor that GPU allocation activity occurred (called from the
@@ -77,6 +79,15 @@ static inline void xe_mem_monitor_resume(struct xe_device *xe)
 {
 }
 
+static inline void xe_mem_monitor_fini(struct xe_device *xe)
+{
+}
+
+static inline int xe_mem_monitor_debugfs_register(struct xe_device *xe)
+{
+	return 0;
+}
+
 #endif /* CONFIG_DRM_XE_MEM_MONITOR */
 
 #endif /* _XE_MEM_MONITOR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index a49b0c0f958b..a38776734544 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -5,6 +5,7 @@
 
 #include "xe_module.h"
 
+#include "linux/log2.h"
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/stringify.h>
-- 
2.34.1

