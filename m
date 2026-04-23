Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D328F99363
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8510F031;
	Thu, 23 Apr 2026 10:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVFLnBUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B1510F031
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776938620; x=1808474620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JR3woo/fpV3oaamvrgevWaQBR+wehosDS63ZbNTTjeM=;
 b=eVFLnBUMsZHGHqPTHv99U+TTmFR/VwaGR5YWmjWogtv8DPYDh4GqEvNF
 A1wa0OZqMpA4kQh2inDf3AsMJIw9CF1g7Zq/FcNAjwaBRrhDq8ljBTjsm
 +Fbj9TLNZNAxYmqaXxbKiRpafcpsvTtD2NX51B+aXaFxQ1uwm7y4+6pdY
 p6ct5i0Wo5VtAyu1fe5vLzsKG0S+o1X4t/ORvVKfBjL07XNHslqNdwkaR
 zJQvFGMrEkU7Ozo4mf/2lwhL4EAZdTHiW7GaW8bvjNJWRptg2iOu556RW
 1aXgCNM4ZGp9YlUxqDyoyFu2PazpEWEIjvyccLkvLCDUSmo35XNE9J2iK A==;
X-CSE-ConnectionGUID: iIfLunhhQNONB8UXS9bNwQ==
X-CSE-MsgGUID: WKePbl7DRSSXZSqOnt30dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88600291"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88600291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:03:39 -0700
X-CSE-ConnectionGUID: cdXa1lhBSsamH7a/iWmllQ==
X-CSE-MsgGUID: yeDesF5kS9CQ9MR5bofMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232522869"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 23 Apr 2026 03:03:35 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 5/8] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
Date: Thu, 23 Apr 2026 15:30:14 +0530
Message-ID: <20260423100017.1051587-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423100017.1051587-1-raag.jadav@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
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
---
v2: Re-initialize migrate context (Matthew Brost)
v6: Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 42 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 4 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 071b8c41df43..bb43522380b4 100644
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
@@ -356,6 +355,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
@@ -379,8 +385,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-					    xe_lrc_ring_size(), q->msix_vec, flags);
+			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
+					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
 				goto err_lrc;
@@ -402,6 +408,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
+	/* TODO: Re-initialize GSC and PXP queues */
+	xe_assert(gt_to_xe(q->gt), IS_DGFX(gt_to_xe(q->gt)));
+	/* Re-initialization only allowed for kernel queues */
+	xe_assert(gt_to_xe(q->gt), q->flags & EXEC_QUEUE_FLAG_KERNEL);
+
+	/* Re-initialize submission backend */
+	q->ops->reinit(q);
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
index c725cde4508d..deb650b99d8a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1593,6 +1593,23 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
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
index e7c975f9e2d9..514355ce3d6a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -53,6 +53,8 @@ struct xe_lrc_snapshot {
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+		  void *replay_state, u16 msix_vec, u32 init_flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.0

