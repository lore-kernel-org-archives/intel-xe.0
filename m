Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E25C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 08:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B1E10E315;
	Wed,  1 Jul 2026 08:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUMWG+VK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEFA10E315
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782894966; x=1814430966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qo1G5A/vr1AwgreoEfb+Xpfft1U7zDhknGEPglQvyvE=;
 b=NUMWG+VKgNvYmz6NGkjBOz0tc8ndp48PLhibdqjeD26HfeuBAuJFgVtV
 LUF4IenxZj53uK6yAuziXY/zEBwNqJgSYuzJfN9+fY61dyDRXvol8+hSa
 AsiJYae9x1FPRqpNsUB5MouwEtSXnU6j9UVy1RyTJFqLFjj5JySTu72Wu
 CuqitK/yrUIyrNkX3Vlf8iktkWmbM0jpzdBbBlC9dJczfk7liRsbWKcNn
 OGoiEkIvzlSzwqMQOn6p5702VJSj9/UcHEvbMsN0UDZl0MJrkwLF5W/1a
 Tp9yiQt0b0l156ipEOcEL2g3oeXgu9953U8epbXTKFGAWDMHtz9MIwk5y A==;
X-CSE-ConnectionGUID: vyF0gGUpRfOhIK9jYiuFBg==
X-CSE-MsgGUID: xp8DARGtR5iYZpILpb+nWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83493068"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83493068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:36:05 -0700
X-CSE-ConnectionGUID: XfxlwAcBSjug9b7w44Yqrg==
X-CSE-MsgGUID: hT3a/BieReStuSMM0DhPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="276806220"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 01:36:00 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 05/10] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
Date: Wed,  1 Jul 2026 13:59:29 +0530
Message-ID: <20260701083051.450259-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701083051.450259-1-raag.jadav@intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
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

In preparation of usecases which require re-initializing exec queue
after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
queue LCRs already exist but the context is lost on PCIe FLR and needs
re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
v6: Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
v9: Add negative asserts for GSC and PXP (Daniele)
    Provide xe_lrc_ctx_init() as regular function (Daniele)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 47 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 15 ++++++++--
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 4 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..c864e7f2e227 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -27,6 +27,7 @@
 #include "xe_migrate.h"
 #include "xe_pm.h"
 #include "xe_trace.h"
+#include "xe_uc_fw.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
 
@@ -335,9 +336,8 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 		xe_lrc_put(q->lrc[i]);
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
+static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
-	int i, err;
 	u32 flags = 0;
 
 	/*
@@ -360,6 +360,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
 		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
 
+	return flags;
+}
+
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
+{
+	int i, err;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -383,8 +390,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-					    xe_lrc_ring_size(), q->msix_vec, flags);
+			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
+					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
 				goto err_lrc;
@@ -406,6 +413,38 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	return err;
 }
 
+/**
+ * xe_exec_queue_reinit() - Re-initialize exec queue
+ * @q: exec queue to re-initialize
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_exec_queue_reinit(struct xe_exec_queue *q)
+{
+	struct xe_gt *gt = q->gt;
+	int i, err;
+
+	/* TODO: Re-initialize GSC and PXP queues */
+	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
+	xe_gt_assert(gt, !xe_uc_fw_is_loadable(&gt->uc.gsc.fw));
+	xe_gt_assert(gt, !xe_pxp_is_enabled(gt_to_xe(gt)->pxp));
+
+	/* Re-initialization only allowed for kernel queues */
+	xe_gt_assert(gt, q->flags & EXEC_QUEUE_FLAG_KERNEL);
+
+	/* Re-initialize submission backend */
+	q->ops->reinit_kernel(q);
+
+	for (i = 0; i < q->width; i++) {
+		err = xe_lrc_ctx_init(q->lrc[i], q->hwe, q->vm, q->replay_state,
+				      q->msix_vec, xe_lrc_init_flags(q, q->flags));
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /**
  * xe_exec_queue_create() - Create an exec queue
  * @xe: Xe device
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0225426c57b0..236fa44c2a72 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -34,6 +34,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
+int xe_exec_queue_reinit(struct xe_exec_queue *q);
 
 static inline struct xe_exec_queue *
 xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..3f0a84501bba 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1486,8 +1486,19 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
 	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
 }
 
-static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
-			   void *replay_state, u16 msix_vec, u32 init_flags)
+/**
+ * xe_lrc_ctx_init() - Initialize LRC with context details
+ * @lrc: Pointer to the LRC
+ * @hwe: Hardware Engine
+ * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
+ * @msix_vec: MSI-X interrupt vector (for platforms that support it)
+ * @init_flags: LRC initialization flags
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		    void *replay_state, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 0a3a611391ee..f77c9341e77b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -56,6 +56,8 @@ struct xe_lrc_snapshot {
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		    void *replay_state, u16 msix_vec, u32 init_flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.0

