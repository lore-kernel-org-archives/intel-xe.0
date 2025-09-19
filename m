Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF3BCAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 19:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D68010EA7E;
	Fri, 19 Sep 2025 19:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ej3pIm2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441D810EA78
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758309119; x=1789845119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9n3Bs3uwYVOU5Q6ZqAhiQ8tTd9DrnL5TjYl2ANj+z9s=;
 b=Ej3pIm2+NhXCySNPQzFTl3MR1mGrk2T4zSOvDdQiL0BLHA0bk2cyOPRN
 HU0M5Sgmdi9xHH4ip1Uek5BP+HMs4NaYizsgE0rxLnX3BD2WkPzQK3g2c
 SDkRtVbIuvAEJft055urxZNxSk0P6zCAEEGb2idG41QeghSKXkqaiC/ez
 mz7Q3koD8EJeKKBze9jTCfHArF4Pr7a8EkHnMTFWZV2QTos1AIusvvM2J
 LOCePTfIWhs5K8wflMo8tjByJ01eB5Jiqj8xB8g8hZHF2JXE99pBDy3gg
 NAq4tKBA0B/7rMzU+KDnk/qgNf9McC0c1UdCv4IvbGW+vbrKiMAmL2wPH g==;
X-CSE-ConnectionGUID: wb1OQLQFTNSOcllXqr0R3g==
X-CSE-MsgGUID: 923bo2LVQOGcRxDmyNxwxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60579532"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60579532"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 12:11:59 -0700
X-CSE-ConnectionGUID: RtkhzcnDRF2D7hZn5pkyvQ==
X-CSE-MsgGUID: xBY1FJ56SfeAV5EqrZLAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175530193"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2025 12:11:56 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v3 1/8] Add a new xe_user structure
Date: Fri, 19 Sep 2025 18:38:01 +0000
Message-ID: <20250919183817.52325-2-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250919183817.52325-1-aakash.deep.sarkar@intel.com>
References: <20250919183817.52325-1-aakash.deep.sarkar@intel.com>
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
index d9c6cf0f189e..ff6b584f3293 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -333,6 +333,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
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

