Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A33C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FDA10EAEF;
	Wed, 17 Jul 2024 13:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQDVJbZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF83B10EAF0
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221725; x=1752757725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iFay5JO7dsXGevXU7xJRbcyK5dMHGjKx33wNck0oJjU=;
 b=hQDVJbZ2bmtpI65KWTHdtP1JUrvfq9Q5+QEctierJKNFsIyDSyGZ++sL
 mXVAROG+Q50m8Epk4cjNy3f+OFOP1JuNuHBvv5b1ti9prse2Yu42aPMBZ
 BQDyk8WXjTqcI38+IJVAW947sSHkaH6X2uzmP6EW9oRit4so/gBQ0yrhL
 K/esFRzDfrA7K5oIGMMGg6slpUZnie1wvTdi1UsOTjGb5SOTDce4lMulY
 4nAO7l7/SUpWf4hp1CqJt5iUT/0Ej954z5wtdBC+vRSUFz2g6QaBYUKcl
 d73H5mD/IliVc0v0dbKD/D+qJ5HyqcC6098og2VYeE58F0JoLsJNzf1po g==;
X-CSE-ConnectionGUID: 6kN2n7xZQQC48fZb9r1tbw==
X-CSE-MsgGUID: qICcoQqzTuOWazn0cwDWXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832057"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:45 -0700
X-CSE-ConnectionGUID: cQOXb92sQjOh/xboPNK+Xw==
X-CSE-MsgGUID: ijqRTY4RQE6nqtK2uw9wsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532012"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:44 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's exec
 queues
Date: Wed, 17 Jul 2024 15:07:24 +0200
Message-ID: <20240717130821.1073379-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717130821.1073379-1-francois.dugast@intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
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

Add helpers to safely add and delete the exec queues attached to a hw
engine group, and make use them at the time of creation and destruction
of the exec queues. Keeping track of them is required to control the
execution mode of the hw engine group.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
 drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..645423a63434 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 			xe_exec_queue_put(eq);
 	}
 
+	if (q->vm)
+		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
+
 	q->ops->fini(q);
 }
 
@@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, err))
 				goto put_exec_queue;
 		}
+
+		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
+		if (err)
+			goto put_exec_queue;
 	}
 
 	mutex_lock(&xef->exec_queue.lock);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index f8df85d25617..4dcc885a55c8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
 	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
 }
+
+/**
+ * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
+ * @group: The hw engine group
+ * @q: The exec_queue
+ *
+ * Return: 0 on success,
+ *	    -EINTR if the lock could not be acquired
+ */
+int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
+{
+	int err;
+
+	err = down_write_killable(&group->mode_sem);
+	if (err)
+		return err;
+
+	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
+	up_write(&group->mode_sem);
+
+	return 0;
+}
+
+/**
+ * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
+ * @group: The hw engine group
+ * @q: The exec_queue
+ *
+ * Return: 0 on success,
+ *	    -EINTR if the lock could not be acquired
+ */
+int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
+{
+	int err;
+
+	err = down_write_killable(&group->mode_sem);
+	if (err)
+		return err;
+
+	if (!list_empty(&group->exec_queue_list))
+		list_del(&q->hw_engine_group_link);
+	up_write(&group->mode_sem);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 7f2d27c0ba1a..ce59d83a75ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -9,6 +9,7 @@
 #include "xe_hw_engine_types.h"
 
 struct drm_printer;
+struct xe_exec_queue;
 
 #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
 #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
@@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 
+int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
+int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
+
 #endif
-- 
2.43.0

