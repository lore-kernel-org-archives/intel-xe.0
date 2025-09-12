Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8ECCAC594
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D995410EBEB;
	Fri, 12 Sep 2025 09:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlRupevP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFEB10EBEB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669792; x=1789205792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jM/R6d0dP3iNMNjYXXpZm1VF65T5KlkHWKBg+KMWhFQ=;
 b=NlRupevPUw9xjA2AZpNfk4Mz8vsSyTGS3pWpL7Oca0h5puYeOtlyU+ID
 sOEV62WyLyD605tTB8VY4PQF9Al/BwzBdmDwhx+utOEVCd/0QIeFGwKwq
 sXp0U71k9uMFUY/iFrV9/IkgEkn2pteWNYs7NbfcWU/eZfvH1efNg2DWi
 tuFYwXFnT6mL9q8n52I7XCbcBCotYOOnFq3iUArl8DkHtPRp68afVtEzz
 ZF6+3rMit0EOTNOc7pDavXrTR8s0emgyUB6WpRylIT8k8GEHFZ9fsz/tM
 hqTMavTYJ8uXGBLEWqciYT32MvbY+oOfAYGoYr/MwDujtK+8OVGnQpOll A==;
X-CSE-ConnectionGUID: B7bFYdf/SSqEsrsJ3smxOQ==
X-CSE-MsgGUID: IqiJKQixSmijZSYujnj36A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159834"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159834"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:32 -0700
X-CSE-ConnectionGUID: f9aB/sMRRka+xFpTxQjxpw==
X-CSE-MsgGUID: LxlyGERiSoWR5NIhxfV7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311674"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:29 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 1/9] Add a new xe_user structure
Date: Fri, 12 Sep 2025 09:03:44 +0000
Message-ID: <20250912090354.2619418-2-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
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
 drivers/gpu/drm/xe/xe_user.c | 59 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h | 81 ++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..89212fc7ef44 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -325,6 +325,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
+	xe-y += xe_user.o
+
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
 		i915-display/intel_display_debugfs_params.o \
diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
new file mode 100644
index 000000000000..8c285a68115a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_user.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/slab.h>
+
+#include "xe_user.h"
+
+/**
+ * worker thread to emit gpu work period event for this xe user
+ * @work: work instance for this xe user
+ *
+ * Return: void
+ */
+static inline void work_period_worker(struct work_struct *work)
+{
+	//TODO: Implement this worker
+}
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
+	//TODO: Add a hook into xe device
+	INIT_WORK(&user->work, work_period_worker);
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
index 000000000000..e52f66d3f3b0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_USER_H_
+#define _XE_USER_H_
+
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/workqueue.h>
+
+/**
+ * This is a per process/user id structure for a xe device
+ * client. It is allocated when a new process/app opens the
+ * xe device and destroyed when the last xe file belonging
+ * to this user id is destroyed.
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
+	 * @uid: user id for this xe_user
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

