Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFBEC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DD210E95C;
	Thu,  1 Aug 2024 12:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3IyALrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC81710E95C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517090; x=1754053090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P4d00ctAaoOkzOqFqvZDwAqUDSrxzR0WNXn5t6tEWA4=;
 b=A3IyALrBYFzN0i/TLoAZFQuHnYk8AwxQeU3DqPDeoCKN7DEbAR3qCf/G
 TS4bnVDj8LOaaX0g50kuWNLzT/+S3f6fiXTRRmkYEDQgjLdUTkuQvhZQT
 4/oTcjC5kk3+Gv5HeFUy6ie12GOFsbga+Dih7if+rrLNecsgF/qeBoIGp
 XMpIKJzeTWMe19Istd6rarGWuHhZBgJb1ezpFBVE3dswPCPG4Q2CHSVUx
 I5QmTxo2HcKC6REymS+KY/SwusxwA9D0rQxvEmMf9VZS4gw81r9NrzJQM
 u0s2RiFGxa8IZV0X6ItLLDerM5bi8Qh/hIXbmywIQGecqPiI+jLFrXTpl g==;
X-CSE-ConnectionGUID: PGecOGtRTlisvaQE4a4knQ==
X-CSE-MsgGUID: D7jy85uhSCud5ESIS0oF9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357117"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:10 -0700
X-CSE-ConnectionGUID: PIxBGS8wQSyBTTHhUEqG0w==
X-CSE-MsgGUID: UJm2X12PQwufTQnk+YhJJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110043"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 01/13] drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Date: Thu,  1 Aug 2024 14:56:42 +0200
Message-ID: <20240801125748.355078-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
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

A xe_hw_engine_group is a group of hw engines. Two hw engines belong to
the same xe_hw_engine_group if one hw engine cannot make progress while
the other is stuck on a page fault.

Typically, hw engines of the same group share some resources such as EUs,
but this really depends on the hardware configuration of the platforms.
The simple engines partitioning proposed here might be too conservative
but is intended to work for existing platforms. It can be optimized later
if more sets of independent engines are identified.

The hw engine groups are intended to be used in the context of faulting
long-running jobs submissions.

v2: Move to own files, improve error handling (Matt Brost)

v3: Fix build issue reported by CI, improve commit message (Matt Roper)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 100 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |  16 +++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  48 +++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 6 files changed, 171 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..b67ace7ed204 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -69,6 +69,7 @@ xe-y += xe_bb.o \
 	xe_heci_gsc.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
+	xe_hw_engine_group.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 403eb1d2d20a..66a8b2dca6fb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -23,6 +23,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
+#include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -770,6 +771,9 @@ int xe_hw_engines_init(struct xe_gt *gt)
 	}
 
 	hw_engine_setup_logical_mapping(gt);
+	err = xe_hw_engine_setup_groups(gt);
+	if (err)
+		return err;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
new file mode 100644
index 000000000000..5ab08e86b085
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_hw_engine_group.h"
+
+static void
+hw_engine_group_free(struct drm_device *drm, void *arg)
+{
+	struct xe_hw_engine_group *group = arg;
+
+	kfree(group);
+}
+
+static struct xe_hw_engine_group *
+hw_engine_group_alloc(struct xe_device *xe)
+{
+	struct xe_hw_engine_group *group;
+	int err;
+
+	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return ERR_PTR(-ENOMEM);
+
+	init_rwsem(&group->mode_sem);
+	INIT_LIST_HEAD(&group->exec_queue_list);
+
+	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
+	if (err)
+		return ERR_PTR(err);
+
+	return group;
+}
+
+/**
+ * xe_hw_engine_setup_groups() - Setup the hw engine groups for the gt
+ * @gt: The gt for which groups are setup
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_hw_engine_setup_groups(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	group_rcs_ccs = hw_engine_group_alloc(xe);
+	if (IS_ERR(group_rcs_ccs)) {
+		err = PTR_ERR(group_rcs_ccs);
+		goto err_group_rcs_ccs;
+	}
+
+	group_bcs = hw_engine_group_alloc(xe);
+	if (IS_ERR(group_bcs)) {
+		err = PTR_ERR(group_bcs);
+		goto err_group_bcs;
+	}
+
+	group_vcs_vecs = hw_engine_group_alloc(xe);
+	if (IS_ERR(group_vcs_vecs)) {
+		err = PTR_ERR(group_vcs_vecs);
+		goto err_group_vcs_vecs;
+	}
+
+	for_each_hw_engine(hwe, gt, id) {
+		switch (hwe->class) {
+		case XE_ENGINE_CLASS_COPY:
+			hwe->hw_engine_group = group_bcs;
+			break;
+		case XE_ENGINE_CLASS_RENDER:
+		case XE_ENGINE_CLASS_COMPUTE:
+			hwe->hw_engine_group = group_rcs_ccs;
+			break;
+		case XE_ENGINE_CLASS_VIDEO_DECODE:
+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			hwe->hw_engine_group = group_vcs_vecs;
+			break;
+		default:
+			drm_warn(&xe->drm, "NOT POSSIBLE");
+		}
+	}
+
+	return 0;
+
+err_group_vcs_vecs:
+	kfree(group_vcs_vecs);
+err_group_bcs:
+	kfree(group_bcs);
+err_group_rcs_ccs:
+	kfree(group_rcs_ccs);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
new file mode 100644
index 000000000000..c2648f87f7ef
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_HW_ENGINE_GROUP_H_
+#define _XE_HW_ENGINE_GROUP_H_
+
+#include "xe_hw_engine_group_types.h"
+
+struct drm_device;
+struct xe_gt;
+
+int xe_hw_engine_setup_groups(struct xe_gt *gt);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
new file mode 100644
index 000000000000..b828d85d24cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_HW_ENGINE_GROUP_TYPES_H_
+#define _XE_HW_ENGINE_GROUP_TYPES_H_
+
+#include "xe_force_wake_types.h"
+#include "xe_lrc_types.h"
+#include "xe_reg_sr_types.h"
+
+/**
+ * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
+ * engine group
+ */
+enum xe_hw_engine_group_execution_mode {
+	EXEC_MODE_LR,
+	EXEC_MODE_DMA_FENCE,
+};
+
+/**
+ * struct xe_hw_engine_group - Hardware engine group
+ *
+ * hw engines belong to the same group if they share hardware resources in a way
+ * that prevents them from making progress when one is stuck on a page fault.
+ */
+struct xe_hw_engine_group {
+	/**
+	 * @exec_queue_list: list of exec queues attached to this
+	 * xe_hw_engine_group
+	 */
+	struct list_head exec_queue_list;
+	/** @resume_work: worker to resume faulting LR exec queues */
+	struct work_struct resume_work;
+	/** @resume_wq: workqueue to resume faulting LR exec queues */
+	struct workqueue_struct *resume_wq;
+	/**
+	 * @mode_sem: used to protect this group's hardware resources and ensure
+	 * mutual exclusion between execution only in faulting LR mode and
+	 * execution only in DMA_FENCE mode
+	 */
+	struct rw_semaphore mode_sem;
+	/** @cur_mode: current execution mode of this hw engine group */
+	enum xe_hw_engine_group_execution_mode cur_mode;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 70e6434f150d..39f24012d0f4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -150,6 +150,8 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 	/** @oa_unit: oa unit for this hw engine */
 	struct xe_oa_unit *oa_unit;
+	/** @hw_engine_group: the group of hw engines this one belongs to */
+	struct xe_hw_engine_group *hw_engine_group;
 };
 
 /**
-- 
2.43.0

