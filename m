Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67137F55139
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E06410E01F;
	Sun,  8 Mar 2026 13:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRATUj3a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5326710E01F
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978313; x=1804514313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bZQjWNBm/5F7slG7cn7Cwkn/+imQsDGEMTTkmbApNt4=;
 b=TRATUj3aq4g3Q1D/rPhwhK7Jd2+cjFGiXfeRi7kkHMCTBxghu3tYiYj9
 k5T9ZGZfMXz7zj5L3KEWNvR59wvz07R+jcouz50buX/n/DhZCS9+LbJJE
 VOIsH4gstnENEmlVeWsNMdB1JhZYr1ZeEwOQomYabnvR7Dk5QOeYWveWD
 eCjpNop2OoD2ei/TWctU4GXmFZqa5PZEUaYvqATkFms0j/ScyLUGrkfsN
 7sDEgmOCEaUOqjnupjF9Wvs2O48erEcwOEoaXNjjcL1RBfL3Pq82mkLCu
 6dBfs9yLwgPzLp/mjIPXaZqmhPaiMfafacTVaeN2YhUgLOyUIP9rDGyH1 Q==;
X-CSE-ConnectionGUID: 9DblkfBSR4iNogbtvbchRg==
X-CSE-MsgGUID: t+V7QL26S4OfI4MHMA+FnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934726"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:33 -0700
X-CSE-ConnectionGUID: oqkQc6RtTWyWPGvxUpXynA==
X-CSE-MsgGUID: iteW/60OTreNaTn6UCQdkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523305"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:30 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 08/10] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
Date: Sun,  8 Mar 2026 19:25:34 +0530
Message-ID: <20260308135536.3852304-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308135536.3852304-1-raag.jadav@intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
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

In preparation of usecases which require re-initializing an exec queue
after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
queue LCRs already exist but the context is lost on PCIe FLR and needs
re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 34 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 17 +++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 4 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6166b1a81433..50fb94bc343b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -331,9 +331,8 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 		xe_lrc_put(q->lrc[i]);
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
+static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
-	int i, err;
 	u32 flags = 0;
 
 	/*
@@ -353,6 +352,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
 		flags |= XE_LRC_CREATE_USER_CTX;
 
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
@@ -376,8 +382,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-					    xe_lrc_ring_size(), q->msix_vec, flags);
+			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
+					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
 				goto err_lrc;
@@ -399,6 +405,26 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
+	int i, err;
+
+	for (i = 0; i < q->width; i++) {
+		err = xe_lrc_reinit(q->lrc[i], q->hwe, q->vm, q->replay_state,
+				    q->msix_vec, xe_lrc_init_flags(q, q->flags));
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
index a82d99bd77bc..445867d4da26 100644
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
index ebab5d78f7cc..9c9746cd8906 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1561,6 +1561,23 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	return err;
 }
 
+/**
+ * xe_lrc_reinit() - Re-initialize LRC
+ * @lrc: Pointer to the LRC
+ * @hwe: Hardware Engine
+ * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
+ * @msix_vec: MSI-X interrupt vector (for platforms that support it)
+ * @init_flags: LRC initialization flags
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		  void *replay_state, u16 msix_vec, u32 init_flags)
+{
+	return xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
+}
+
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
 		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 48f7c26cf129..69ca51aa4807 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -52,6 +52,8 @@ struct xe_lrc_snapshot {
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		  void *replay_state, u16 msix_vec, u32 init_flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.0

