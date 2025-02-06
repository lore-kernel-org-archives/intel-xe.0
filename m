Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3767AC0219D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91FB10E9BA;
	Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6DftKSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F26810E9B1
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884236; x=1770420236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7V/W+zzCy9Zxn57o+OICxLXwVaRz6ued0S8jx9Yrv4s=;
 b=l6DftKSQgWNKv09wB7qLLKtiLqT3d78cVFg5TS80Dq1xLU5jsw5ezdaV
 G+AvKvACFKxkr8ntMsBTo5Nhh6Hif+CSwVRnOh7ud9XlJr00P4LRUqx5t
 mADUhX2llMceWLyY9qo6y5FF2LIB/yuICkYsvD+b5lm3Z9YpI6ptGzd10
 wKZ5fFu+f/0QHu7PnlhRTaV39BhZ3dJJ3gCrttA5u7/CdJXLXsQJ3xXJx
 H2RoSeNKnfj0ltdbRYQQyn8mv47Q7OwZzIgWKc/3H81amqJfzjxp8RFjr
 YTiWQZtJK4OScevZ3qKYLx2eY7eKV46xe39dC9fuRMm3lGHLmDlxC1fcF w==;
X-CSE-ConnectionGUID: wMF3BylPTG+AitGU7hJOlQ==
X-CSE-MsgGUID: 3kloNxZMRLeSEVAux0QdjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993723"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:56 -0800
X-CSE-ConnectionGUID: OZ8MxXJCScmhPtImsiGcjw==
X-CSE-MsgGUID: 2zhL6xLaQw6cr5uhBAWkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594799"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 06/14] drm/xe: Add callback support for driver remove
Date: Thu,  6 Feb 2025 15:23:24 -0800
Message-ID: <20250206232333.2660325-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

xe device probe uses devm cleanup in most places. However there are a
few that are not possible: when the driver interacts with other
subsystems that require the cleanup to happen before the device being
removed from the bus. One example is the component_* APIs used by
xe_gsc_proxy and display.

Add a callback-based remove so the exception don't make the probe
use multiple error handling styles.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c               | 59 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h               |  4 ++
 drivers/gpu/drm/xe/xe_device_remove_action.h | 24 ++++++++
 drivers/gpu/drm/xe/xe_device_types.h         | 15 +++++
 drivers/gpu/drm/xe/xe_pci.c                  |  4 +-
 5 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_remove_action.h

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 90275531653fe..5fc4e696262f9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -747,6 +747,9 @@ int xe_device_probe(struct xe_device *xe)
 	u8 last_gt;
 	u8 id;
 
+	xe->probing = true;
+	INIT_LIST_HEAD(&xe->remove_action_list);
+
 	xe_pat_init_early(xe);
 
 	err = xe_sriov_init(xe);
@@ -892,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	xe->probing = false;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
@@ -911,6 +916,58 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_device_call_remove_actions - Call the remove actions
+ * @xe: xe device instance
+ *
+ * This is only to be used by xe_pci and xe_device to call the remove actions
+ * while removing the driver or handling probe failures.
+ */
+void xe_device_call_remove_actions(struct xe_device *xe)
+{
+	struct xe_device_remove_action *ra;
+
+	list_for_each_entry(ra, &xe->remove_action_list, node)
+		ra->remove(ra);
+
+	xe->probing = false;
+}
+
+/**
+ * xe_device_add_remove_action - Add an action to run on driver removal
+ * @xe: xe device instance
+ * @ra: pointer to the object embedded into the object to cleanup
+ * @remove: function to execute. The @ra is passed as argument
+ *
+ * Example:
+ *
+ * .. code-block:: c
+ *
+ *	static void foo_remove(struct xe_device_remove_action *ra)
+ *	{
+ *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
+ *		...
+ *	}
+ *
+ *	int xe_foo_init(struct xe_foo *foo)
+ *	{
+ *		...
+ *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
+ *		...
+ *		return 0;
+ *	};
+ */
+void xe_device_add_remove_action(struct xe_device *xe,
+				 struct xe_device_remove_action *ra,
+				 void (*remove)(struct xe_device_remove_action *ra))
+{
+	drm_WARN_ON(&xe->drm, !xe->probing);
+
+	INIT_LIST_HEAD(&ra->node);
+	ra->remove = remove;
+	list_add(&ra->node, &xe->remove_action_list);
+}
+
 static void xe_device_remove_display(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -934,6 +991,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
+
+	xe_device_call_remove_actions(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index fc3c2af3fb7fd..3fecf865957b0 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -45,6 +45,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
+void xe_device_add_remove_action(struct xe_device *xe,
+				 struct xe_device_remove_action *ra,
+				 void (*remove)(struct xe_device_remove_action *ra));
+void xe_device_call_remove_actions(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_remove_action.h b/drivers/gpu/drm/xe/xe_device_remove_action.h
new file mode 100644
index 0000000000000..e0322c4660dda
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_device_remove_action.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DEVICE_REMOVE_ACTION_H_
+#define _XE_DEVICE_REMOVE_ACTION_H_
+
+#include <linux/list.h>
+
+/**
+ * struct xe_device_remove_action - Action item to run on driver removal
+ *
+ * This should be used like a list_head, embeding it into structures of the
+ * individual parts being initialized. Once the remove action is ready to be
+ * added, call xe_device_add_remove_action() to initialize and use this struct.
+ */
+struct xe_device_remove_action {
+	/* private: */
+	struct list_head node;
+	void (*remove)(struct xe_device_remove_action *ra);
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c0e886bac1831..4c902e0cb4ba9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
+#include "xe_device_remove_action.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
@@ -428,6 +429,20 @@ struct xe_device {
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
+	/**
+	 * @remove_action_list: list of actions to execute on device remove.
+	 * Use xe_device_add_remove_action() for that. Actions can only be added
+	 * during probe and are executed during the call from PCI subsystem to
+	 * remove the driver from the device.
+	 */
+	struct list_head remove_action_list;
+
+	/**
+	 * @probing: cover the section in which @remove_action_list can be used
+	 * to post cleaning actions
+	 */
+	bool probing;
+
 	/**
 	 * @mem_access: keep track of memory access in the device, possibly
 	 * triggering additional actions when they occur.
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e8ef7d6b4db84..50fa27a32ddac 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -904,8 +904,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe(xe);
-	if (err)
+	if (err) {
+		xe_device_call_remove_actions(xe);
 		return err;
+	}
 
 	err = xe_pm_init(xe);
 	if (err)
-- 
2.48.1

