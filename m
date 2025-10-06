Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA052CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53F10E419;
	Mon,  6 Oct 2025 14:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYSBOPP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DD510E40D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762602; x=1791298602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dl25RzaZe0hfbHY7h4hHdNx0qFpUZeCpfugKimWszhE=;
 b=gYSBOPP0/uMKfHvLWAsen5ei0bpz9l5Nr2aM+y5daPtrXD7irQ+kl++G
 C/Jan6i6G72kcweJsUbbmMkYL131ALMEIPpezjlQfdWuvNRVSh20pdULF
 1n3O8yb/BViryBNkleStrrRDmrd56AjAha6r7LHZm/UQYmydza413vgem
 3liMx/6+HTyESA5e/qc1PpT/6+U29DsKUE37ptp7gWeb/+F56SeDKI2pp
 SjGD8uIhRVqku3VgvzagRBuQdQ77urwA4DiM7U3/WyNGWr5r490qp93W5
 EHVHMp1iLKuicbvK0Bm76uIpzWkfVPuAJ9CkHcf8Gy53zfdro8TXmHKbD A==;
X-CSE-ConnectionGUID: +hCrSl9YQVWm4vT4fl2vrw==
X-CSE-MsgGUID: ScwZNjVvRZC0PCl9sLsHWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143146"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143146"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:41 -0700
X-CSE-ConnectionGUID: 6QMd9nSkSQu6YPOIJr50DQ==
X-CSE-MsgGUID: 7CmSrTWkSyqFnSxl24uxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507619"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:56:38 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 1/8] drm/xe: Add a new xe_user structure
Date: Mon,  6 Oct 2025 14:20:22 +0000
Message-ID: <20251006142034.674435-2-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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

For Android GPU work period event we need to track the runtime
on the GPU for each user id. This means we can have multiple
xe files opened by different processes/threads belonging to
the same user id. All these xe files need to be grouped together
so that one can easily identify these while calculating the
run time for the given user id.

Currently, the xe driver doesn't record the user id of the
calling process. Also, all the xe files created using open
call are clubbed together inside the xe device structure
with no way to distinguish between them based on the user id
of the calling process.

To remedy these limitations we are adding another layer of
indirection between xe device and xe file. xe device will
now have a list of xe users each with a given user id; and each
xe user will have a list of xe files each of which is created
by a process that is associated with this user id.

The lifetime of the xe user structure should be between when
a process with a new user id has opened the xe device; and when
the last xe file belonging to this user id is closed.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile  |  2 +
 drivers/gpu/drm/xe/xe_user.c | 89 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h | 78 +++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c5d2388997d..b078834ec762 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -336,6 +336,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
+	xe-y += xe_user.o
+
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
 		i915-display/intel_display_debugfs_params.o \
diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
new file mode 100644
index 000000000000..f35e18776300
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_user.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_user.h"
+
+
+/**
+ * DOC: Xe User
+ *
+ * Xe User adds support for handling UID (i.e. persistent, unique ID of the
+ * Android app) based requirements for Android platforms.
+ *
+ * For Android GPU work period event we need to track the runtime on the GPU
+ * for each UID. This means we can have multiple xe files opened by different
+ * processes/threads that belongs to the same UID. All these xe files need to
+ * be grouped together so that one can easily identify them while calculating
+ * the run time for the given UID.
+ *
+ * Currently, the xe driver doesn't record the user id of the calling process.
+ * Also, all the xe files created using open call are clubbed together inside
+ * the xe device structure with no way to distinguish between them based on
+ * the UID of the calling process.
+ *
+ * To remedy these limitations we are adding another layer of indirection
+ * between the xe device and the xe file. xe device will now also have a list
+ * of xe users each with a given UID, and each xe user will have a list of xe
+ * files that are created by a process that belongs to this UID.
+ *
+ * The lifetime of a xe user structure should be between when a process with
+ * a new UID has first opened the xe device, and when the last xe file
+ * belonging to this UID is closed.
+ *
+ * In order to implement this we maintain an xarray of xe user structures
+ * inside our xe device instance. Whenever a new xe file is created via an
+ * open call, we check if the calling process' UID is already present in our
+ * xarray. If so, we increment the refcount for the associated xe user and add
+ * our newly created xe file to the list of xe files belonging to this xe user.
+ * Otherwise, we allocate a new xe user structure for this UID and initialize
+ * its file list with our newly create xe file.
+ *
+ * Whenever an xe file is being destroyed, we decrement the refcount of the
+ * associated xe user. When the last xe file in the xe user's file list is
+ * destroyed, the xe user refcount should drop to zero and the xe user should
+ * be cleaned up. During the cleanup path we remove the xarray entry in our xe
+ * device for this xe user and free up its memory.
+ */
+
+
+
+
+/**
+ * xe_user_alloc() - Allocate xe user
+ * @void: No arg
+ *
+ * Allocate xe user struct to track activity on the gpu
+ * by the application. Call this API whenever a new app
+ * has opened xe device.
+ *
+ * Return: pointer to user struct or NULL if can't allocate
+ */
+struct xe_user *xe_user_alloc(void)
+{
+	struct xe_user *user;
+
+	user = kzalloc(sizeof(*user), GFP_KERNEL);
+	if (!user)
+		return NULL;
+
+	kref_init(&user->refcount);
+	mutex_init(&user->filelist_lock);
+	INIT_LIST_HEAD(&user->filelist);
+	return user;
+}
+
+/**
+ * __xe_user_free() - Free user struct
+ * @kref: The reference
+ *
+ * Return: void
+ */
+void __xe_user_free(struct kref *kref)
+{
+	struct xe_user *user =
+		container_of(kref, struct xe_user, refcount);
+
+	kfree(user);
+}
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
new file mode 100644
index 000000000000..9628cc628a37
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_USER_H_
+#define _XE_USER_H_
+
+/**
+ * struct xe_user - xe user structure
+ *
+ * This is a per UID structure for tracking an xe device client. It is
+ * allocated when a new process/app opens the xe device and destroyed
+ * when the last xe file belonging to this UID is destroyed.
+ */
+struct xe_user {
+	/**
+	 * @refcount: reference count
+	 */
+	struct kref refcount;
+
+	/**
+	 * @xe: pointer to the xe_device
+	 */
+	struct xe_device *xe;
+
+	/**
+	 * @filelist_lock: lock protecting the filelist
+	 */
+	struct mutex filelist_lock;
+
+	/**
+	 * @filelist: list of xe files belonging to this xe user
+	 */
+	struct list_head filelist;
+
+	/**
+	 * @work: work to emit the gpu work period event for this
+	 * xe user
+	 */
+	struct work_struct work;
+
+	/**
+	 * @uid: UID of this xe_user
+	 */
+	u32 uid;
+
+	/**
+	 * @active_duration_ns: sum total of xe_file.active_duration_ns
+	 * for all xe files belonging to this xe user
+	 */
+	u64 active_duration_ns;
+
+	/**
+	 * @last_timestamp_ns: timestamp in ns when we last emitted event
+	 * for this xe user
+	 */
+	u64 last_timestamp_ns;
+};
+
+struct xe_user *xe_user_alloc(void);
+
+static inline struct xe_user *
+xe_user_get(struct xe_user *user)
+{
+	kref_get(&user->refcount);
+	return user;
+}
+
+void __xe_user_free(struct kref *kref);
+
+static inline void xe_user_put(struct xe_user *user)
+{
+	kref_put(&user->refcount, __xe_user_free);
+}
+
+#endif // _XE_USER_H_
+
-- 
2.49.0

