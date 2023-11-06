Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53127C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17B210E2E1;
	Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412EB10E2D8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269760; x=1730805760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/O3XvAdd2zcayQ/AjNb55aUIJUUMeS/bt137Rjj/5k=;
 b=nJacpeGFDwxiCeMTC8qCasT4Q42USlVXFyehX59QV91/ie9M4apKeLNj
 eMzXKatCBEOmKGroMCWFswEAdbhITQGVK6fcMfUS66SyzmzmnhsSa7Cgs
 /9twARGd0/xq9MZAzvPV1Vk65lNdAvrLZrhvh4VrO8yGGh84UJaYP7U84
 GgECIBQ1cZP2ZYUHTA23b46JGZKVSSI05r8HzRDTG3BDYEBou0oNgFVDk
 eQyuUcjBWV8t5e/G3UtSTRXleO9lUpY5hPGBHxe0A9eFNSk9w9mcZ0RL1
 TTBMhpvOcAuyVRBrodi1nBDJLZMr67R1fRnviGA4ZVgpPIwZBxo8Cyifq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646850"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646850"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411680"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411680"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:34 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:37 +0200
Message-Id: <20231106111845.2333093-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 17/25] drm/xe/eudebug: Add per process coredumps
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

We gather state of execution errors for particular pid for
retrospection. State includes vmas, contents of vmas
that were marked for capture and vm and vma based metadata.

TODO: Quotas

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |   3 +
 drivers/gpu/drm/xe/xe_device_types.h       |   3 +
 drivers/gpu/drm/xe/xe_usercoredump.c       | 182 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_usercoredump.h       |   7 +
 drivers/gpu/drm/xe/xe_usercoredump_types.h |  23 +++
 5 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9644387cd11f..bc8032266ef0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -41,6 +41,7 @@
 #include "xe_wait_user_fence.h"
 #include "xe_hwmon.h"
 #include "xe_eudebug.h"
+#include "xe_usercoredump.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
@@ -456,6 +457,7 @@ int xe_device_probe(struct xe_device *xe)
 	xe_display_register(xe);
 
 	xe_debugfs_register(xe);
+	xe_usercoredumps_init(xe);
 
 	xe_pmu_register(&xe->pmu);
 
@@ -479,6 +481,7 @@ int xe_device_probe(struct xe_device *xe)
 
 static void xe_device_remove_display(struct xe_device *xe)
 {
+	xe_usercoredumps_fini(xe);
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c025ecd1c321..57ec132286d7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -203,6 +203,9 @@ struct xe_device {
 	/** @devcoredump: device coredump */
 	struct xe_devcoredump devcoredump;
 
+	/** @usercoredumps: User state coredump repository */
+	struct xe_usercoredumps usercoredumps;
+
 	/** @info: device info */
 	struct intel_device_info {
 		/** @graphics_name: graphics IP name */
diff --git a/drivers/gpu/drm/xe/xe_usercoredump.c b/drivers/gpu/drm/xe/xe_usercoredump.c
index 2ebaf15b563c..2d3fc5a24c48 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump.c
+++ b/drivers/gpu/drm/xe/xe_usercoredump.c
@@ -89,7 +89,7 @@ vma_snapshot_create(struct xe_vma *vma, u64 addr, bool is_vram)
 {
 	struct xe_vma_snapshot *s;
 
-	s = kzalloc(sizeof(*s), GFP_ATOMIC);
+	s = kzalloc(sizeof(*s), GFP_NOWAIT | __GFP_NOWARN);
 	if (!s)
 		return NULL;
 
@@ -254,6 +254,7 @@ void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 	mutex_lock(&s->vmas.lock);
 	list_for_each_entry(v, &s->vmas.list, link)
 		vma_snapshot_print(p, v);
+
 	mutex_unlock(&s->vmas.lock);
 }
 
@@ -290,3 +291,182 @@ xe_user_state_snapshot_capture(struct xe_exec_queue *q)
 	return s;
 }
 
+static int create_pidroot_debugfs(struct xe_usercoredumps *store,
+				  struct xe_pidroot *r)
+{
+	struct dentry *root = store->debugfs_root;
+	struct dentry *d;
+	char pid_str[8];
+
+	if (!root) {
+		drm_warn(&store->xe->drm, "no debugfs root for usercoredumps\n");
+		return -ENOENT;
+	}
+
+	sprintf(pid_str, "%u", r->pid_nr);
+	d = debugfs_create_dir(pid_str, root);
+	if (IS_ERR(d))
+		return PTR_ERR(d);
+
+	r->dentry = d;
+
+	return 0;
+}
+
+static struct xe_pidroot *create_pidroot(struct xe_usercoredumps *store,
+					 struct xe_user_state_snapshot *s)
+{
+	struct xe_pidroot *r, *old;
+	int ret;
+
+	r = kzalloc(sizeof(*r), GFP_KERNEL);
+	if (!r)
+		return ERR_PTR(-ENOMEM);
+
+	r->pid_nr = pid_vnr(s->pid);
+	INIT_LIST_HEAD(&r->snapshots);
+	old = xa_store(&store->pidroots, r->pid_nr, r, GFP_KERNEL);
+	if (xa_is_err(old)) {
+		kfree(r);
+		return ERR_PTR(xa_err(old));
+	}
+
+	ret = create_pidroot_debugfs(store, r);
+	if (ret) {
+		kfree(r);
+		return ERR_PTR(ret);
+	}
+
+	r->store = store;
+
+	return r;
+}
+
+static int snapshot_show(struct seq_file *m, void *data)
+{
+	struct xe_user_state_snapshot *s = m->private;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_user_state_snapshot_print(s, &p);
+
+	return 0;
+}
+
+static ssize_t snapshot_write(struct file *file,
+			      const char __user *ubuf,
+			      size_t len, loff_t *offp)
+{
+	/* struct seq_file *m = file->private_data; */
+	/* struct xe_user_state_snapshot *s = m->private; */
+
+	return len;
+}
+
+static int snapshot_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, snapshot_show, inode->i_private);
+}
+
+static const struct file_operations snapshot_fops = {
+	.owner = THIS_MODULE,
+	.open = snapshot_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = snapshot_write
+};
+
+static int create_snapshot_debugfs(const struct xe_pidroot *r,
+				   struct xe_user_state_snapshot *s)
+{
+	struct dentry *d;
+	char name[32];
+
+	sprintf(name, "%lu", r->seqno);
+
+	d = debugfs_create_file(name, S_IRUSR | S_IWUSR,
+				r->dentry,
+				s, &snapshot_fops);
+	if (IS_ERR(d))
+		return PTR_ERR(d);
+
+	s->dentry = d;
+
+	return 0;
+}
+
+int xe_usercoredumps_add(struct xe_device *xe,
+			 struct xe_user_state_snapshot *s)
+{
+	struct xe_usercoredumps *store = &xe->usercoredumps;
+	struct xe_pidroot *pr;
+	int ret;
+
+	ret = 0;
+	mutex_lock(&store->lock);
+	pr = xa_load(&store->pidroots, pid_vnr(s->pid));
+	if (!pr) {
+		pr = create_pidroot(store, s);
+		if (IS_ERR(pr)) {
+			ret = PTR_ERR(pr);
+			pr = NULL;
+		}
+	}
+
+	if (pr) {
+		s->pidroot = pr;
+		pr->seqno++;
+		list_add_tail(&s->link, &pr->snapshots);
+		create_snapshot_debugfs(pr, s);
+	}
+
+	mutex_unlock(&store->lock);
+
+	return ret;
+}
+
+void xe_usercoredumps_init(struct xe_device *xe)
+{
+	struct drm_minor *minor = xe->drm.primary;
+	struct dentry *root = minor->debugfs_root;
+	struct xe_usercoredumps *ucd = &xe->usercoredumps;
+
+	if (XE_WARN_ON(ucd->debugfs_root))
+		return;
+
+	mutex_init(&ucd->lock);
+	xa_init_flags(&ucd->pidroots, GFP_KERNEL);
+
+	ucd->debugfs_root = debugfs_create_dir("usercoredumps", root);
+	if (IS_ERR(ucd->debugfs_root)) {
+		drm_warn(&xe->drm, "Create usercoredumps directory failed %ld",
+			 PTR_ERR(ucd->debugfs_root));
+		ucd->debugfs_root = NULL;
+	}
+
+	ucd->xe = xe;
+}
+
+void xe_usercoredumps_fini(struct xe_device *xe)
+{
+	struct xe_usercoredumps *ucd = &xe->usercoredumps;
+	struct xe_pidroot *pr;
+	long unsigned int pid;
+
+	if (XE_WARN_ON(!ucd->debugfs_root))
+		return;
+
+	xa_for_each(&ucd->pidroots, pid, pr) {
+		struct xe_user_state_snapshot *s, *tmp;
+
+		list_for_each_entry_safe(s, tmp, &pr->snapshots, link)
+			xe_user_state_snapshot_release(s);
+
+		kfree(pr);
+	}
+
+	debugfs_remove_recursive(ucd->debugfs_root);
+
+	xa_destroy(&ucd->pidroots);
+	mutex_destroy(&ucd->lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_usercoredump.h b/drivers/gpu/drm/xe/xe_usercoredump.h
index cc94e85996e9..f7bc5e0f7607 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump.h
+++ b/drivers/gpu/drm/xe/xe_usercoredump.h
@@ -16,4 +16,11 @@ xe_user_state_snapshot_capture(struct xe_exec_queue *eq);
 void xe_user_state_snapshot_release(struct xe_user_state_snapshot *s);
 void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 				  struct drm_printer *p);
+
+void xe_usercoredumps_init(struct xe_device *xe);
+void xe_usercoredumps_fini(struct xe_device *xe);
+int xe_usercoredumps_add(struct xe_device *xe,
+			 struct xe_user_state_snapshot *s);
+int xe_usercoredumps_remove(struct xe_device *xe,
+			    struct xe_user_state_snapshot *s);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_usercoredump_types.h b/drivers/gpu/drm/xe/xe_usercoredump_types.h
index 7d80f412edaf..635656e830cf 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_usercoredump_types.h
@@ -9,8 +9,10 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 #include <linux/sched.h>
+#include <linux/xarray.h>
 
 struct xe_device;
+struct xe_pidroot;
 
 struct xe_vma_snapshot {
 	struct list_head link;
@@ -34,6 +36,7 @@ struct xe_vma_snapshot {
  * shows the state of the GPU of when the issue has happened.
  */
 struct xe_user_state_snapshot {
+	struct list_head link;
 
 	struct {
 		struct mutex lock;
@@ -43,6 +46,26 @@ struct xe_user_state_snapshot {
 	struct pid *pid;
 	u64 client_id; /* drm client id */
 	char comm[TASK_COMM_LEN];
+	u64 count;
+
+	struct xe_pidroot *pidroot;
+	struct dentry *dentry;
+};
+
+struct xe_pidroot {
+	struct xe_usercoredumps *store;
+	int pid_nr;
+	unsigned long seqno;
+	struct list_head snapshots;
+	struct dentry *dentry;
+};
+
+struct xe_usercoredumps {
+	struct xe_device *xe;
+	struct mutex lock;
+	struct xarray pidroots;
+
+	struct dentry *debugfs_root;
 };
 
 #endif
-- 
2.34.1

