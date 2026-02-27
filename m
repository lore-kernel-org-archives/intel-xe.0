Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE5FEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02110EBD2;
	Fri, 27 Feb 2026 17:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXdjwDCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C7010EBD7
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211820; x=1803747820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CnH1A/tWga1OGkS5qF1E+ANIlUvFgtFhVcjCb5xVDQM=;
 b=PXdjwDCZMr8UoNqwsWq0fBDdJ2vZllQxp44muOpJLr3oa8oRZcHhbswf
 rdsQxM+pwyU4FJ8jKwCZ6m3NIcudSMaeA5h467HY6h4BDk+Fdj3NmgNwD
 VVsqMXp8RZDcYi3LzmmyWAyPZ7RneRquVfL1V18RzXzZXQx7kmSgXQw0B
 mEGnHVSmfYPdMx8P7z2NALHovbK6KUEn+4UQqeGinrpFNmlRPUCkVLqHN
 e9ob4cNEaRNp7RceXprzKYCvqEIcxB/voHZXuLN1Bf77RchICI1+rrpBJ
 Im7Cs0m0vv1PH1L52XqPzg0i9cJLABmvJPzNr4xf0ByBxLZ8GgvwG70R2 Q==;
X-CSE-ConnectionGUID: quSkImjqQ2yrVu88Hracyg==
X-CSE-MsgGUID: 1q0vYtSWTpOSj80OJmcXEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73169928"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73169928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:03:39 -0800
X-CSE-ConnectionGUID: G43VoigtRZGBUrrcguxFCg==
X-CSE-MsgGUID: oCHUj3Q3ROiTgIXnbUdqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216964821"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 09:03:35 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 7/9] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
Date: Fri, 27 Feb 2026 22:30:47 +0530
Message-ID: <20260227170049.3418863-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227170049.3418863-1-raag.jadav@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
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
queue LCRs already exist but the context is lost on PCIe FLR which needs
re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 34 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4..4bbc1e3e29a4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -270,9 +270,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
+static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
-	int i, err;
 	u32 flags = 0;
 
 	/*
@@ -292,6 +291,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
@@ -310,8 +316,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 		struct xe_lrc *lrc;
 
 		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
-		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-				    xe_lrc_ring_size(), q->msix_vec, flags);
+		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
+				    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
 		if (IS_ERR(lrc)) {
 			err = PTR_ERR(lrc);
 			goto err_lrc;
@@ -329,6 +335,26 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index c9e3a7c2d249..9200803547d3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -34,6 +34,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
+int xe_exec_queue_reinit(struct xe_exec_queue *q);
 
 static inline struct xe_exec_queue *
 xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
-- 
2.43.0

