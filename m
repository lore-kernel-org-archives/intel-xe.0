Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F5CEACC3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 13:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5910E622;
	Tue,  1 Oct 2024 13:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROd8YJMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E4910E622
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727790213; x=1759326213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnV59Sm64DUtx3n8UN1Zigeko9s1qqJbuHICky2ewEM=;
 b=ROd8YJMawZheX2RYpAA6o3t8SxBkV1x/61eVQGb/qfo1T0nMjJN7fMxU
 viurPR5uXxI6K+P/EnvNY4UfjMDtA8R3hiDL2lJIzDCmXoYwTiZM7roIP
 VQmujDtCkUgQDXHi7rGOp7v0S/WrLtZqhlPW7gZdrrQd6Q3dUUtJmBVyo
 8WnGjU01rqgYS9q+ZimRWKGmsPnwVrVSpyYl3E9ZB0LafI7TjsU2867ys
 dHaXonmtOib8Eq6I/tN82mym1gMHL8Vawx/yDI+KBK2vUtKPFFZC1DkFy
 ncp0Q6MD7IAtR4i6fS5M2Q1YRMCj+lyWj1+D3RcQ/aQMeEtPcAGD2U+gW g==;
X-CSE-ConnectionGUID: FT+/V8RZSnCZ0g6lqvJw6g==
X-CSE-MsgGUID: 3ATD4QSMTISJgbcus3HGRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49446851"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="49446851"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:43:33 -0700
X-CSE-ConnectionGUID: IKlCgi20RCiN75Fka1PqNg==
X-CSE-MsgGUID: NXOyYhLrS8eMjNzlLez0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73791115"
Received: from suttanur-desk.iind.intel.com (HELO
 singhapo-Super-Server.iind.intel.com) ([10.145.169.90])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2024 06:43:31 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: oak.zeng@intel.com, Brian Welty <brian.welty@intel.com>,
 Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Date: Tue,  1 Oct 2024 19:24:32 +0530
Message-Id: <20241001135432.447074-3-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001135432.447074-1-apoorva.singh@intel.com>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
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

From: Brian Welty <brian.welty@intel.com>

In order to enable access counters, this must be enabled in LRC for
the exec_queue. Add basic uAPI to set configuration of access counter
trigger threshold and granularity.

When access counters are enabled and threshold is hit, the access
counter handler in xe_gt_pagefault.c will migrate the buffer to that
to that GT's local VRAM.

Signed-off-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 46 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ++++++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 16 ++++++---
 drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
 include/uapi/drm/xe_drm.h                | 11 ++++++
 6 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d098d2dd1b2d..4114a5ca04cc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -117,7 +117,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, q, SZ_16K);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -392,6 +392,42 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
+static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
+				      u64 value)
+{
+	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
+		return -EINVAL;
+
+	q->usm.acc_trigger = value;
+
+	return 0;
+}
+
+static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
+				     u64 value)
+{
+	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
+		return -EINVAL;
+
+	q->usm.acc_notify = value;
+
+	return 0;
+}
+
+static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
+					  u64 value)
+{
+	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
+		return -EINVAL;
+
+	if (value > DRM_XE_ACC_GRANULARITY_64M)
+		return -EINVAL;
+
+	q->usm.acc_granularity = value;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -399,6 +435,9 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -418,7 +457,10 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 7deb480e26af..cf4ec4bfdbfd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -128,6 +128,16 @@ struct xe_exec_queue {
 		struct list_head link;
 	} lr;
 
+	/** @usm: unified shared memory state */
+	struct {
+		/** @usm.acc_trigger: access counter trigger */
+		u32 acc_trigger;
+		/** @usm.acc_notify: access counter notify */
+		u32 acc_notify;
+		/** @usm.acc_granularity: access counter granularity */
+		u32 acc_granularity;
+	} usm;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f3b71fe7a96d..33f5b31ea0cb 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -265,7 +265,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f0976230012a..3be668caf700 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -891,9 +891,11 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
+#define ACC_GRANULARITY_S	20
+#define ACC_NOTIFY_S		16
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -984,7 +986,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
 
 	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
+		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
+				     (q->usm.acc_granularity <<
+				      ACC_GRANULARITY_S) | vm->usm.asid);
+	if (xe->info.has_usm && vm)
+		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
+				     (q->usm.acc_notify <<
+				      ACC_NOTIFY_S) | q->usm.acc_trigger);
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
@@ -1029,7 +1037,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     struct xe_exec_queue *q, u32 ring_size)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1038,7 +1046,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, q, vm, ring_size);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c24542e89318..3806f977cad0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -23,7 +23,7 @@ struct xe_vm;
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     struct xe_exec_queue *q, u32 ring_size);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e..e2326bbedc81 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1108,6 +1108,17 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	4
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_128K			0
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_2M				1
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_16M				2
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

