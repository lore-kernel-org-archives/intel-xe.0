Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9539DCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5978610EBF1;
	Fri, 12 Sep 2025 09:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCuAyzuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB9610EBF1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669801; x=1789205801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPH+9EAkGUHN/4MYLUTsDHrhWLa/D1hcXknpvE7BZCU=;
 b=dCuAyzuBKZrCYCGs6aWzPVdz8LwXUNXscsBvGZFKGGkEWS/bhGqMzQTA
 hUI4cbM4EFccxYupzmuVfICRM7OkvP0YI0s6qrQoCRIFpvh1v5rbAfo2P
 aVX2e5WGWl+kA8lJNMDQ/lCCu8otgR9Q1KbVFwtWyLHrSM2SBqIsjzl7z
 uNZkBa5jrlOKV1KhrR29lvdcu85g3tWSGVS3KkIYebetf7ieZxZvPY4Qh
 gxfd0Wzl06oH5c1njc06dGNDWOi0aF5k7v3cUpYF3ag385SgTyBvhAJD6
 5K7RX6dlcPSxASHdNL9Ejg71zcxDgcUvSx6UfVv26r/fVqz2nJepDPkP+ w==;
X-CSE-ConnectionGUID: u4ChUd/SSNOLc3stoLe6QA==
X-CSE-MsgGUID: vq6owJlUQfGCJKQGkPLN6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159841"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:41 -0700
X-CSE-ConnectionGUID: x3nvsuUCQuW39+bBa9lV7A==
X-CSE-MsgGUID: H2Qzgr/kTU++9Ht/CWb0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311710"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:38 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 5/9] Handle xe_user creation and removal
Date: Fri, 12 Sep 2025 09:03:48 +0000
Message-ID: <20250912090354.2619418-6-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
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

We want our xe user structure to be created when a new
user id opens the xe device node and to be destroyed
when the final xe file with this uid is closed. In other
words the xe_user structure for a uid should remain in
scope as long as any process with this uid has an open
xe file descriptor.

To implement this we maintain an xarray of xe user
structures inside our xe device instance. Whenever a new
xe file is created via an open call, we check if the
calling process' uid is already present in our xarray.
If so, we increment the refcount for the associated
xe user and add this xe file to the list of xe files
belonging to this xe user. Otherwise, we allocate a
new xe user structure for this uid and initialize its
file list with this xe file.

Whenever an xe file is destroyed, we decrement the
refcount of the associated xe user. When the last
xe file in the xe user's file list is destroyed,
the xe user refcount should drop to zero and the
xe user should be cleaned up. During the cleanup path
we remove the xarray entry for this xe user in our
xe device and free up its memory.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 57 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++
 drivers/gpu/drm/xe/xe_user.c         | 28 +++++++++++++-
 drivers/gpu/drm/xe/xe_user.h         | 10 +++++
 4 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e0402dff423..bd4a1c5c57ca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
+#include "xe_user.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
@@ -76,9 +77,13 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_drm_client *client;
+	struct xe_user *user;
 	struct xe_file *xef;
 	int ret = -ENOMEM;
+	int uid = -EINVAL;
+	u32 idx;
 	struct task_struct *task = NULL;
+	const struct cred *cred = NULL;
 
 	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
 	if (!xef)
@@ -105,11 +110,53 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 
 	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
 	if (task) {
+		cred = get_task_cred(task);
+		if (cred) {
+			uid = (unsigned int) cred->euid.val;
+			put_cred(cred);
+		}
 		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
 		xef->pid = task->pid;
 		put_task_struct(task);
 	}
 
+	if (uid < 0)
+		return -ENOENT;
+
+	INIT_LIST_HEAD(&xef->user_link);
+	/*
+	 * Check if the calling process/uid has already been registered
+	 * with the xe device during a previous open call. If so then
+	 * take a reference to this xe user and add this xe file to the
+	 * filelist belonging to this xe user
+	 */
+	user = xe_user_lookup(xe, uid);
+	if (!user) {
+		/*
+		 * We couldn't find an existing xe user for the calling process.
+		 * Allocate a new struct xe_user and register it with this xe
+		 * device
+		 */
+		user = xe_user_alloc();
+		if (!user)
+			return -ENOMEM;
+
+		user->uid = uid;
+		user->last_timestamp_ns = ktime_get_raw_ns();
+		user->xe = xe;
+
+		ret = xa_alloc(&xe->work_period.users, &idx, user, xa_limit_32b, GFP_KERNEL);
+		if (ret < 0)
+			return ret;
+
+		user->id = idx;
+		drm_dev_get(&xe->drm);
+	}
+	mutex_lock(&user->filelist_lock);
+	list_add(&xef->user_link, &user->filelist);
+	mutex_unlock(&user->filelist_lock);
+	xef->user = user;
+
 	return 0;
 }
 
@@ -124,6 +171,12 @@ static void xe_file_destroy(struct kref *ref)
 
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
+
+	mutex_lock(&xef->user->filelist_lock);
+	list_del(&xef->user_link);
+	mutex_unlock(&xef->user->filelist_lock);
+
+	xe_user_put(xef->user);
 	kfree(xef);
 }
 
@@ -458,6 +511,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
+	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
+
+	mutex_init(&xe->work_period.lock);
+
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		/* Trigger a large asid and an early asid wrap. */
 		u32 asid;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c4f076a26291..b375c4928a09 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -576,6 +576,16 @@ struct xe_device {
 	atomic64_t global_total_pages;
 #endif
 
+	/**
+	 * @xe_work_period: Support for GPU work period tracepoint
+	 */
+	struct xe_work_period {
+		/** @users: list of users that have opened this xe device */
+		struct xarray users;
+		/** @lock: lock protecting this structure */
+		struct mutex lock;
+	} work_period;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
@@ -659,6 +669,12 @@ struct xe_file {
 	/** @active_duration_ns: total run time in ns for this xe file */
 	u64 active_duration_ns;
 
+	/** @user: pointer to struct xe_user associated with this xe file */
+	struct xe_user *user;
+
+	/** @user_link: link into xe_user::filelist */
+	struct list_head user_link;
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 
diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
index 8c285a68115a..5c7d21dfcc45 100644
--- a/drivers/gpu/drm/xe/xe_user.c
+++ b/drivers/gpu/drm/xe/xe_user.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/slab.h>
+#include <drm/drm_drv.h>
 
 #include "xe_user.h"
 
@@ -39,7 +40,6 @@ struct xe_user *xe_user_alloc(void)
 	kref_init(&user->refcount);
 	mutex_init(&user->filelist_lock);
 	INIT_LIST_HEAD(&user->filelist);
-	//TODO: Add a hook into xe device
 	INIT_WORK(&user->work, work_period_worker);
 	return user;
 }
@@ -54,6 +54,32 @@ void __xe_user_free(struct kref *kref)
 {
 	struct xe_user *user =
 		container_of(kref, struct xe_user, refcount);
+	struct xe_device *xe = user->xe;
+	void *lookup;
 
+	mutex_lock(&xe->work_period.lock);
+	lookup = xa_erase(&xe->work_period.users, user->id);
+	xe_assert(xe, lookup == user);
+	mutex_unlock(&xe->work_period.lock);
+
+	drm_dev_put(&user->xe->drm);
 	kfree(user);
 }
+
+struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
+{
+	struct xe_user *user = NULL;
+	unsigned long i;
+
+	mutex_lock(&xe->work_period.lock);
+	xa_for_each(&xe->work_period.users, i, user) {
+		if (user->uid == uid) {
+			xe_user_get(user);
+			mutex_unlock(&xe->work_period.lock);
+			return user;
+		}
+	}
+	mutex_unlock(&xe->work_period.lock);
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index e52f66d3f3b0..55035a9c2c4c 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -8,8 +8,12 @@
 
 #include <linux/kref.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/workqueue.h>
 
+#include "xe_device.h"
+
+
 /**
  * This is a per process/user id structure for a xe device
  * client. It is allocated when a new process/app opens the
@@ -43,6 +47,11 @@ struct xe_user {
 	 */
 	struct work_struct work;
 
+	/**
+	 * @id: index of this user into the xe device users array
+	 */
+	u32 id;
+
 	/**
 	 * @uid: user id for this xe_user
 	 */
@@ -62,6 +71,7 @@ struct xe_user {
 };
 
 struct xe_user *xe_user_alloc(void);
+struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid);
 
 static inline struct xe_user *
 xe_user_get(struct xe_user *user)
-- 
2.49.0

