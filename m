Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723E1C25B48
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3628710EA5E;
	Fri, 27 Oct 2023 22:30:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2D10EA5D
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445783; x=1729981783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fb9Kn/Fm2ucabzBYt8pAJixxZj+wJGfgoq3RkYIt3x4=;
 b=EfsfBOh0ChcbxU35SuM7ZC6/pJk5XGFrtHxFpjp835WO1ut1qI/izh7K
 iOeERPObojtxRVt+BZBA04tydNJfwABVbDgjbGrqvz9u8ihIedU2/BHY2
 2qWJB9MiVh0d3ok9hNT+VouGFrFI79RSCddpE7ChtlWQbxGjGaVWHGveW
 T6fdu4E74tEXT+rhgiX2xt/OxZyatB94WtYVg1VK6qAL25ArJUr4toad3
 HRRUZveZ8zOpa+5oOH+pSP+qgqNcxaifqJekgMYWqHW1YQ+5DfoPtqLK1
 uSjA1GfDJsmv66sdhzrP8g+IycsiKvxfaMsdibGJYsQMze04vhChuxk61 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397776"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397776"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360368"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360368"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:20 -0700
Message-ID: <20231027222928.1981633-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/12] drm/xe/gsc: GSC FW load
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

The GSC FW must be copied in a 4MB stolen memory allocation, whose GGTT
address is then passed as a parameter to a dedicated load instruction
submitted via the GSC engine.

Since the GSC load is relatively slow (up to 250ms), we perform it
asynchronously via a worker. This requires us to make sure that the
worker has stopped before suspending/unloading.

Note that we can't yet use xe_migrate_copy for the copy because it
doesn't work with stolen memory right now, so we do a memcpy from the
CPU side instead.

Bspec: 65306, 65346
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/xe/instructions/xe_gsc_commands.h |  34 +++
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  29 +++
 drivers/gpu/drm/xe/xe_gsc.c                   | 240 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h                   |   3 +
 drivers/gpu/drm/xe/xe_gsc_types.h             |  17 ++
 drivers/gpu/drm/xe/xe_uc.c                    |  12 +-
 7 files changed, 335 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
new file mode 100644
index 000000000000..c7a833d7f965
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GSC_COMMANDS_H_
+#define _XE_GSC_COMMANDS_H_
+
+#include "instructions/xe_instr_defs.h"
+
+/*
+ * All GSCCS-specific commands have fixed length, so we can include it in the
+ * defines. Note that the generic GSC command header structure includes an
+ * optional data field in bits 9-21, but there are no commands that actually use
+ * it; some of the commands are instead defined as having an extended length
+ * field spanning bits 0-15, even if the extra bits are not required because the
+ * longest GSCCS command is only 8 dwords. To handle this, the defines below use
+ * a single field for both data and len. If we ever get a commands that does
+ * actually have data and this approach doesn't work for it we can re-work it
+ * at that point.
+ */
+
+#define GSC_OPCODE		REG_GENMASK(28, 22)
+#define GSC_CMD_DATA_AND_LEN	REG_GENMASK(21, 0)
+
+#define __GSC_INSTR(op, dl) \
+	(XE_INSTR_GSC | \
+	REG_FIELD_PREP(GSC_OPCODE, op) | \
+	REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))
+
+#define GSC_FW_LOAD __GSC_INSTR(1, 2)
+#define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
index e403b4fcc20a..04179b2a48e1 100644
--- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
+++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
@@ -15,6 +15,7 @@
  */
 #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
 #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
+#define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
 #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
 
 /*
diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
new file mode 100644
index 000000000000..22d2ad9cb64d
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GSC_REGS_H_
+#define _XE_GSC_REGS_H_
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+#include "regs/xe_reg_defs.h"
+
+/* Definitions of GSC H/W registers, bits, etc */
+
+#define MTL_GSC_HECI1_BASE	0x00116000
+#define MTL_GSC_HECI2_BASE	0x00117000
+
+/*
+ * The FWSTS register values are FW defined and can be different between
+ * HECI1 and HECI2
+ */
+#define HECI_FWSTS1(base)				XE_REG((base) + 0xc40)
+#define   HECI1_FWSTS1_CURRENT_STATE			REG_GENMASK(3, 0)
+#define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
+#define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
+#define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 3f709577d73b..7e5ba9039163 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -5,10 +5,20 @@
 
 #include "xe_gsc.h"
 
+#include <drm/drm_managed.h>
+
+#include "xe_bb.h"
+#include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_map.h"
+#include "xe_mmio.h"
+#include "xe_sched_job.h"
 #include "xe_uc_fw.h"
+#include "instructions/xe_gsc_commands.h"
+#include "regs/xe_gsc_regs.h"
 
 static struct xe_gt *
 gsc_to_gt(struct xe_gsc *gsc)
@@ -16,6 +26,134 @@ gsc_to_gt(struct xe_gsc *gsc)
 	return container_of(gsc, struct xe_gt, uc.gsc);
 }
 
+static int memcpy_fw(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 fw_size = gsc->fw.size;
+	void *storage;
+
+	/*
+	 * FIXME: xe_migrate_copy does not work with stolen mem yet, so we use
+	 * a memcpy for now.
+	 */
+	storage = kmalloc(fw_size, GFP_KERNEL);
+	if (!storage)
+		return -ENOMEM;
+
+	xe_map_memcpy_from(xe, storage, &gsc->fw.bo->vmap, 0, fw_size);
+	xe_map_memcpy_to(xe, &gsc->private->vmap, 0, storage, fw_size);
+	xe_map_memset(xe, &gsc->private->vmap, fw_size, 0, gsc->private->size - fw_size);
+
+	kfree(storage);
+
+	return 0;
+}
+
+static int emit_gsc_upload(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	u32 offset = xe_bo_ggtt_addr(gsc->private);
+	struct xe_bb *bb;
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	long timeout;
+
+	bb = xe_bb_new(gt, 4, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
+	bb->cs[bb->len++] = GSC_FW_LOAD;
+	bb->cs[bb->len++] = lower_32_bits(offset);
+	bb->cs[bb->len++] = upper_32_bits(offset);
+	bb->cs[bb->len++] = (gsc->private->size / SZ_4K) | GSC_FW_LOAD_LIMIT_VALID;
+
+	job = xe_bb_create_job(gsc->q, bb);
+	if (IS_ERR(job)) {
+		xe_bb_free(bb, NULL);
+		return PTR_ERR(job);
+	}
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	dma_fence_put(fence);
+	xe_bb_free(bb, NULL);
+	if (timeout < 0)
+		return timeout;
+	else if (!timeout)
+		return -ETIME;
+
+	return 0;
+}
+
+static int gsc_fw_is_loaded(struct xe_gt *gt)
+{
+	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
+			      HECI1_FWSTS1_INIT_COMPLETE;
+}
+
+static int gsc_fw_wait(struct xe_gt *gt)
+{
+	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
+			      HECI1_FWSTS1_INIT_COMPLETE,
+			      HECI1_FWSTS1_INIT_COMPLETE,
+			      500, NULL, false);
+}
+
+static int gsc_upload(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	int err;
+
+	if (XE_WARN_ON(!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q || gsc_fw_is_loaded(gt)))
+		return 0;
+
+	err = memcpy_fw(gsc);
+	if (err) {
+		xe_gt_err(gt, "Failed to memcpy GSC FW\n");
+		return err;
+	}
+
+	err = emit_gsc_upload(gsc);
+	if (err) {
+		xe_gt_err(gt, "Failed to emit GSC FW upload (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	err = gsc_fw_wait(gt);
+	if (err) {
+		xe_gt_err(gt, "Failed to wait for GSC load (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	xe_gt_dbg(gt, "GSC FW async load completed\n");
+
+	return 0;
+}
+
+static void gsc_work(struct work_struct *work)
+{
+	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret;
+
+	xe_device_mem_access_get(xe);
+	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+
+	ret = gsc_upload(gsc);
+	if (ret)
+		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
+	else
+		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_device_mem_access_put(xe);
+}
+
 int xe_gsc_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
@@ -23,6 +161,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
 	int ret;
 
 	gsc->fw.type = XE_UC_FW_TYPE_GSC;
+	INIT_WORK(&gsc->work, gsc_work);
 
 	/* The GSC uC is only available on the media GT */
 	if (tile->media_gt && (gt != tile->media_gt)) {
@@ -48,3 +187,104 @@ int xe_gsc_init(struct xe_gsc *gsc)
 	return ret;
 }
 
+static void free_resources(struct drm_device *drm, void *arg)
+{
+	struct xe_gsc *gsc = arg;
+
+	if (gsc->wq) {
+		destroy_workqueue(gsc->wq);
+		gsc->wq = NULL;
+	}
+
+	if (gsc->q) {
+		xe_exec_queue_put(gsc->q);
+		gsc->q = NULL;
+	}
+
+	if (gsc->private) {
+		xe_bo_unpin_map_no_vm(gsc->private);
+		gsc->private = NULL;
+	}
+}
+
+int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, 0, true);
+	struct xe_exec_queue *q;
+	struct workqueue_struct *wq;
+	struct xe_bo *bo;
+	int err;
+
+	if (!xe_uc_fw_is_available(&gsc->fw))
+		return 0;
+
+	if (!hwe)
+		return -ENODEV;
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
+				  ttm_bo_type_kernel,
+				  XE_BO_CREATE_STOLEN_BIT |
+				  XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	q = xe_exec_queue_create(xe, NULL,
+				 BIT(hwe->logical_instance), 1, hwe,
+				 EXEC_QUEUE_FLAG_KERNEL |
+				 EXEC_QUEUE_FLAG_PERMANENT);
+	if (IS_ERR(q)) {
+		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
+		err = PTR_ERR(q);
+		goto out_bo;
+	}
+
+	wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
+	if (!wq) {
+		err = -ENOMEM;
+		goto out_q;
+	}
+
+	gsc->private = bo;
+	gsc->q = q;
+	gsc->wq = wq;
+
+	err = drmm_add_action_or_reset(&xe->drm, free_resources, gsc);
+	if (err)
+		return err;
+
+	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOADABLE);
+
+	return 0;
+
+out_q:
+	xe_exec_queue_put(q);
+out_bo:
+	xe_bo_unpin_map_no_vm(bo);
+	return err;
+
+}
+
+void xe_gsc_load_start(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+
+	if (!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q)
+		return;
+
+	/* GSC FW survives GT reset and D3Hot */
+	if (gsc_fw_is_loaded(gt)) {
+		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+		return;
+	}
+
+	queue_work(gsc->wq, &gsc->work);
+}
+
+void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
+{
+	if (xe_uc_fw_is_loadable(&gsc->fw) && gsc->wq)
+		flush_work(&gsc->work);
+}
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index baa7f21f4204..f870eddc77d4 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -9,5 +9,8 @@
 #include "xe_gsc_types.h"
 
 int xe_gsc_init(struct xe_gsc *gsc);
+int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
+void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
+void xe_gsc_load_start(struct xe_gsc *gsc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 1bc50583fe58..57fefd66a7ea 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -6,8 +6,13 @@
 #ifndef _XE_GSC_TYPES_H_
 #define _XE_GSC_TYPES_H_
 
+#include <linux/workqueue.h>
+
 #include "xe_uc_fw_types.h"
 
+struct xe_bo;
+struct xe_exec_queue;
+
 /**
  * struct xe_gsc - GSC
  */
@@ -17,6 +22,18 @@ struct xe_gsc {
 
 	/** @security_version: SVN found in the fetched blob */
 	u32 security_version;
+
+	/** @private: Private data for use by the GSC FW */
+	struct xe_bo *private;
+
+	/** @q: Default queue used for submissions to GSC FW */
+	struct xe_exec_queue *q;
+
+	/** @wq: workqueue to handle jobs for delayed load and proxy handling */
+	struct workqueue_struct *wq;
+
+	/** @work: delayed load and proxy handling work */
+	struct work_struct work;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index b67154c78dff..15dcd1f91e9c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -74,11 +74,17 @@ int xe_uc_init(struct xe_uc *uc)
  */
 int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 {
+	int err;
+
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
-	return xe_guc_init_post_hwconfig(&uc->guc);
+	err = xe_guc_init_post_hwconfig(&uc->guc);
+	if (err)
+		return err;
+
+	return xe_gsc_init_post_hwconfig(&uc->gsc);
 }
 
 static int uc_reset(struct xe_uc *uc)
@@ -173,6 +179,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	ret = xe_huc_auth(&uc->huc);
 	xe_gt_assert(uc_to_gt(uc), !ret);
 
+	/* GSC load is async */
+	xe_gsc_load_start(&uc->gsc);
+
 	return 0;
 }
 
@@ -197,6 +206,7 @@ void xe_uc_gucrc_disable(struct xe_uc *uc)
 
 void xe_uc_stop_prepare(struct xe_uc *uc)
 {
+	xe_gsc_wait_for_worker_completion(&uc->gsc);
 	xe_guc_stop_prepare(&uc->guc);
 }
 
-- 
2.41.0

