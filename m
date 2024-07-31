Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C67C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E10E10E62A;
	Wed, 31 Jul 2024 14:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW3b+3+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68DA10E62A
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435845; x=1753971845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IuvQ1iICZZ89m/L54UavM5yPhcUEKqNrDhgQcfJZ200=;
 b=iW3b+3+bDiQFFkPLXVamfjycuWJOPnT2mcwVLL4bwuClQ9llfJ1eHq/I
 /kNIhw1BlHx95qtrBYl7JS1vciEmIiwGIm4kQjhGdNbnkp5ZVMTdzQl7g
 8fDJ81WA1kCeipjooM9d272gGQhAZMV9I0WFmDPpUp5DP1uCJMfHp8+Od
 UFaiG0zLUOdljoaTkE9PDbMo0ZiF1UCX8tAPSX8l+7G3xl9zFaR54wuob
 9om5mePXpuQpdSqplDqEuA4pJWq2Avl7Awurhqq7kkqGryffLmQK5PbxX
 di6W6Aat8bnv5uWdMtZNWRu2gocKOTUvej3HPxtAvmCfGGh27iOGUwCkI Q==;
X-CSE-ConnectionGUID: BwVO20X+Q1+QZhCvne5Q5A==
X-CSE-MsgGUID: HNTXO17dT72G61kqt+tAJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469177"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:05 -0700
X-CSE-ConnectionGUID: 9uy39XrzQluzmOUOoENDAA==
X-CSE-MsgGUID: Ow/6ca2tQM+afDxzp9Djfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59500964"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 01/13] drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Date: Wed, 31 Jul 2024 16:21:35 +0200
Message-ID: <20240731142349.4101307-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
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

Typically, hw engines of the same group share some resources such as EUs.
This depends on the hardware configuration of the platforms.

v2: Move to own files, improve error handling (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  4 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 99 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       | 16 +++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h | 48 +++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +
 6 files changed, 170 insertions(+)
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
index 00ace5fcc284..f62992d0497a 100644
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
@@ -764,6 +765,9 @@ int xe_hw_engines_init(struct xe_gt *gt)
 	}
 
 	hw_engine_setup_logical_mapping(gt);
+	err = xe_hw_engine_setup_groups(gt);
+	if (err)
+		return err;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
new file mode 100644
index 000000000000..7fd10f0780ea
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -0,0 +1,99 @@
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

