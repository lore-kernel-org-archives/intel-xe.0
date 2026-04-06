Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5CFF46C44
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A57910E168;
	Mon,  6 Apr 2026 14:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cignKjKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDF010E1E3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775484730; x=1807020730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7fDs/U4Tp7u3PcEgfav0ATKAfwKhG7KjBRH4uyqBtk=;
 b=cignKjKfMri6mREuc47sjjYIs96OWj7vbX6ck0ZiRnwwlVHhwT/FJydW
 QCYp9MdRGYuWxH8qpZrzyEjD5UJZxVjAhJ+yg5VH4A9AnsV6NZfdWDutQ
 FTGp4tT8hBcurKNeFUB+kp5z37T5F9xkP6/sHnkbOR6C9uixkxELbmLDt
 FJzK2h3FgbBgjWVQawaE6i4k2QnL5wtCuWmZMsNht6XpG8esXNNS1lJ4R
 lZkwcJVM3ntURpOHbXeVM//MCHbKGJggtUGZdh8J8qAYwTtkeqKSv4Kjg
 peMyflYzFkkKR+k55+UWotKLtzKT8N1og0Jf/Q5BzLg2wCvNpdztFCoTL A==;
X-CSE-ConnectionGUID: xsVAM260TLmjGb3UAtdlkg==
X-CSE-MsgGUID: 8IdzhWtjSW2YTuJeafAwiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76443898"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76443898"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:12:10 -0700
X-CSE-ConnectionGUID: eDTuPWwzSJCVthOTrSEkwQ==
X-CSE-MsgGUID: KE4AYzBrThywDXP4mTkooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227788281"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 07:12:05 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 7/9] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
Date: Mon,  6 Apr 2026 19:37:20 +0530
Message-ID: <20260406140722.154445-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406140722.154445-1-raag.jadav@intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b287d0e0e60a..dd99bf766926 100644
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
@@ -402,6 +408,29 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
index 9d12a0d2f0b5..a6421ac3765b 100644
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

