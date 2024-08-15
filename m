Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F37C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 16:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE4E10E0E8;
	Thu, 15 Aug 2024 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUJ2wzjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E18F10E0E8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723739288; x=1755275288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LKkpHs81ud0cOlRdgJIQCFQ/uzwqMj5IZP03HLo+MMQ=;
 b=MUJ2wzjJJjwnMHSO9YJmPQltn0kqJ0uTZpMFklJQXrqi1FsBgy21KYhi
 tFoexi6dKSqrYvtGN5nHHtLRmkc8gqjMHkzJnkK+D7tUzfeZbptaWtG0F
 2+F/6kBbTHLPL51lMf39vwpNBEbtENbEXKDa0/ndeF0KRBLkYAnCm39A2
 +Gmzc7S0m4JsXCEffO0ZYiupFitHQQu3BCX0AiL+fjnGpEkNTq28ejvZG
 pZo7BbX86IWrLs006qB+r0PNfMjaNRMMqcg4NKa4/pErKFvHxhAiMDZCF
 ko3JkIUe/gpFDb7r1HiiXy7saaBDnTIttjAttzsy4nhfzxlqE3hFhM/+u A==;
X-CSE-ConnectionGUID: 1siBIEf8QgiOoHpUP5CATw==
X-CSE-MsgGUID: piRwyZTASqOQONySOqCGDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25767657"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="25767657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:28:07 -0700
X-CSE-ConnectionGUID: ojeWWSdVRLSD7UX7lc7DYg==
X-CSE-MsgGUID: 3GwH9aPYTx+DszCb5QalPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="63815536"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:28:06 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/3] drm/xe/oa: Replace per GT oa mutex per a global one
Date: Thu, 15 Aug 2024 09:27:56 -0700
Message-ID: <20240815162758.36495-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
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

This mutex is not frequently used so there is no reason to have one
per GT, also this reduce complexity.

Also it was missed the code to destroy the mutex.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 13 +++++++------
 drivers/gpu/drm/xe/xe_oa_types.h |  5 ++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3ef92eb8fbb1e..d6eec8caf4c51 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1205,9 +1205,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
-	mutex_lock(&gt->oa.gt_lock);
+	mutex_lock(&gt->tile->xe->oa.streams_lock);
 	xe_oa_destroy_locked(stream);
-	mutex_unlock(&gt->oa.gt_lock);
+	mutex_unlock(&gt->tile->xe->oa.streams_lock);
 
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
@@ -1875,9 +1875,9 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
 	}
 
-	mutex_lock(&param.hwe->gt->oa.gt_lock);
+	mutex_lock(&xe->oa.streams_lock);
 	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
-	mutex_unlock(&param.hwe->gt->oa.gt_lock);
+	mutex_unlock(&xe->oa.streams_lock);
 err_exec_q:
 	if (ret < 0 && param.exec_q)
 		xe_exec_queue_put(param.exec_q);
@@ -2388,8 +2388,6 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 
 	__xe_oa_init_oa_units(gt);
 
-	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->oa.gt_lock);
-
 	return 0;
 }
 
@@ -2472,6 +2470,8 @@ int xe_oa_init(struct xe_device *xe)
 	oa->xe = xe;
 	oa->oa_formats = oa_formats;
 
+	mutex_init(&oa->streams_lock);
+
 	drmm_mutex_init(&oa->xe->drm, &oa->metrics_lock);
 	idr_init_base(&oa->metrics_idr, 1);
 
@@ -2508,5 +2508,6 @@ void xe_oa_fini(struct xe_device *xe)
 	idr_for_each(&oa->metrics_idr, destroy_config, oa);
 	idr_destroy(&oa->metrics_idr);
 
+	mutex_destroy(&oa->streams_lock);
 	oa->xe = NULL;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 540c3ec53a6d7..17e17b5b93640 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -112,9 +112,6 @@ struct xe_oa_unit {
  * struct xe_oa_gt - OA per-gt information
  */
 struct xe_oa_gt {
-	/** @gt_lock: lock protecting create/destroy OA streams */
-	struct mutex gt_lock;
-
 	/** @num_oa_units: number of oa units for each gt */
 	u32 num_oa_units;
 
@@ -149,6 +146,8 @@ struct xe_oa {
 
 	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
 	u16 oa_unit_ids;
+
+	struct mutex streams_lock;
 };
 
 /** @xe_oa_buffer: State of the stream OA buffer */
-- 
2.46.0

