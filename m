Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB3C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1E810E8B7;
	Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="ZEMSEi8U";
	dkim-atps=neutral
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4010E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:56 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e589c258663so5409101276.1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240454; x=1739845254; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgpVnaFKwa/BnvlQd9M2QUFCpeBsmaUxhBSqnE5wNrM=;
 b=ZEMSEi8U0yQPx/S4Ul9cSgpZh9e3f+5BE1xAKMCODv7xqIYjAjAvJKYlx7kzLDSCFO
 wmxFq2UI537gXjNWLKUao/sjG/Xm8f9AdJ0mHCzdTC5EhDcjztCV+hV71uAwvLLCULyC
 EOTAZbcUfDMoEzsXwnbnHhwa2/z+6/tdVJjxJvNH8u+NY1aBs6uakoZifN+zmJBEQLIs
 RkBRg8h8kuhBDc9v+IbZjx84pImMTy8OXGcrDqfkoQtEe3IuaXVERvcrJebEAOmmS4Zj
 stw2XpfSErkjLBe508sHX0BHgeKjEQc2ZSRApU3qkCiLWcLDb/MpCQDkBMj1uhOgs8iy
 Sy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240454; x=1739845254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgpVnaFKwa/BnvlQd9M2QUFCpeBsmaUxhBSqnE5wNrM=;
 b=vB7+BDiiUhqorbPg1r0JsTgHDk3zj2qPngCwIAhJDF1gZhFF8juoih31ifUwTlO6+q
 +bNZbo+XhUJl+uEmuYqng3b1UgnGmMUvazRo5GBHpynn3STBiZv60s/oBN/24uyJ6zA2
 ujEbaDrRfNozFfs1I4v2C+05Dmo53swCLvXdL5j6QIIf06wjkkxhgGNT6xfbFqLaYPE0
 Y9iDBKKNEtw3wFxGahZtMD0t99bCXInZjlXPPhk/IMfJ1Kky0A8itvqO0cjF4iX2uT8s
 n9RQuhW0irxAAYrkOya4j6HK05hUrvzAkhQQ7DXMKr8FuU+USlI8zwfRplqcpX4LG7a3
 /otQ==
X-Gm-Message-State: AOJu0YwnJpKkYIHm2h3CTX+TyKvJqJ4nzM3tLQMN3hxB29Aor9EBUJis
 r2I+A+RT4ozNXTkxKgnxm3DjdOHCVREnCbD6rlczGrVgmUhQ18HWVRd7jPo3EbGaH/YTUIFhkTX
 AyYU=
X-Gm-Gg: ASbGncu3DdNt4HoKv3Fkt53YDEVg6pikJO0sno7idqEdZlqqj6DfYiwVETb7QhsDP/0
 KhDuioOPqGS3VGJGstlHagl9RZ70nCRnFwc/iRs1zybr68fPUudp9a7Zku6KNAFkWWrbVSzVBpP
 JnOEs3OcQ1csLnM/zLedhd2AdGVChUXEp1gmTPHrEYwznKeec/lnqdkEoGSWlIcmLdZaL4F2v8V
 VvERMBs/fFnnfydg1+DkvUW8Ui+7Hq1rP/OdPSkAXanMM1VUvcWh2U8CgYdBfnj6I6ENjqyRHUr
 Hfoqee/9hZLs69gPMwPoXCEfLkANf9V0BTNx+VSsAHfVvjLL
X-Google-Smtp-Source: AGHT+IGze/qws2R8vhqmz2MDx7XTHBIZXcuad6raOZgf3ekujGRMlFWP45OV9pLAqmFPjhlB78x54Q==
X-Received: by 2002:a05:690c:6c93:b0:6ef:aae1:ac5d with SMTP id
 00721157ae682-6f9b29e5c82mr160937307b3.27.1739240454295; 
 Mon, 10 Feb 2025 18:20:54 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:52 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 6/6] drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Mon, 10 Feb 2025 18:20:06 -0800
Message-ID: <20250211022006.23234-7-carlos.santa@intel-corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
References: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:09:49 +0000
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

From: Matthew Brost <matthew.brost@intel.com>

Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
queue default state to user data passed in. The intent is for a Mesa
tool to use this replay GPU hangs.

v2:
 - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
 - Fix the page size math calculation to avoid a crash

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 32 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 42 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
 5 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6051db78d706..63042bfd5bba 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -47,6 +47,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (q->xef)
 		xe_file_put(q->xef);
 
+	kvfree(q->replay_state);
 	kfree(q);
 }
 
@@ -139,7 +140,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+					  SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -459,6 +461,30 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
 	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
 }
 
+static int exec_queue_set_hang_replay_state(struct xe_device *xe,
+					    struct xe_exec_queue *q,
+					    u64 value)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(q->gt, q->class);
+	u64 __user *address = u64_to_user_ptr(value);
+	void *ptr;
+	int err;
+
+	ptr = kvmalloc(size, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	err = __copy_from_user(ptr, address, size);
+	if (XE_IOCTL_DBG(xe, err)) {
+		kvfree(ptr);
+		return -EFAULT;
+	}
+
+	q->replay_state = ptr;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -467,6 +493,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
+	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -487,7 +514,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..60360256588a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -138,6 +138,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} pxp;
 
+	/** @replay_state: GPU hang replay state */
+	void *replay_state;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 779a52daf3d7..d3c59e6f4553 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a77fbce523e6..cc685fcc9058 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -38,6 +38,7 @@
 #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
 
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
+#define LRC_PPHWSP_SIZE SZ_4K
 
 static struct xe_device *
 lrc_to_xe(struct xe_lrc *lrc)
@@ -45,7 +46,16 @@ lrc_to_xe(struct xe_lrc *lrc)
 	return gt_to_xe(lrc->fence_ctx.gt);
 }
 
-size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
+/**
+ * xe_gt_lrc_hang_replay_size() - Hang replay size
+ * @gt: The GT
+ * @class: Hardware engine class
+ *
+ * Determine size of GPU hang replay state for a GT and hardware engine class.
+ *
+ * Return: Size of GPU hang replay size
+ */
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t size;
@@ -74,11 +84,18 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size = 2 * SZ_4K;
 	}
 
+	return size - LRC_PPHWSP_SIZE;
+}
+
+size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(gt, class);
+
 	/* Add indirect ring state page */
 	if (xe_gt_has_indirect_ring_state(gt))
 		size += LRC_INDIRECT_RING_STATE_SIZE;
 
-	return size;
+	return size + LRC_PPHWSP_SIZE;
 }
 
 /*
@@ -650,7 +667,6 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
-#define LRC_PPHWSP_SIZE SZ_4K
 
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 {
@@ -883,7 +899,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
+		       struct xe_vm *vm, void *replay_state, u32 ring_size,
+		       u16 msix_vec,
 		       u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -897,9 +914,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
-	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
-	if (xe_gt_has_indirect_ring_state(gt))
-		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
+	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
@@ -925,7 +940,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	if (!gt->default_lrc[hwe->class]) {
+	if (!gt->default_lrc[hwe->class] && !replay_state) {
 		init_data = empty_lrc_data(hwe);
 		if (!init_data) {
 			err = -ENOMEM;
@@ -938,7 +953,11 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * values
 	 */
 	map = __xe_lrc_pphwsp_map(lrc);
-	if (!init_data) {
+	if (replay_state) {
+		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
+		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE, replay_state,
+				 xe_gt_lrc_hang_replay_size(gt, hwe->class));
+	} else if (!init_data) {
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
@@ -1033,6 +1052,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * xe_lrc_create - Create a LRC
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
  * @ring_size: LRC ring size
  * @msix_vec: MSI-X interrupt vector (for platforms that support it)
  * @flags: LRC initialization flags
@@ -1043,7 +1063,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec, u32 flags)
+			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1052,7 +1072,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 2d6838645858..1ee1bff40569 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -46,7 +46,7 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_RUNALONE 0x1
 #define XE_LRC_CREATE_PXP 0x2
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec, u32 flags);
+			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
@@ -73,6 +73,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 	kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.43.0

