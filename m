Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A558C3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 16:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCC210E30A;
	Mon, 15 Jan 2024 16:06:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E26510E32C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jan 2024 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705334767; x=1736870767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SUfV07gIFaDNiA1Sjs5VWWVXpz1/+jlqtgP+xe6fCCE=;
 b=LQe5xnztIqaJ6AgxgXPpQzhNxGfLcFj/fXLHSOKt0rf7j12aHkelDJ7g
 UGIVy0HHlBbbF4hbMlxjxFdzr0KNeUrKyx4PNKw7lZoqAMD9/tnaxp82U
 X5c50o4vx+Dm2Usm3up7dVu1oLJ2oxy76ENthzVD6Vd/POu9Z8KF/u1lx
 lewrH+d5bE0GBd78nsxfkkZNf3dfXS0RS/FY+DFOrL/3cmhbJl1yXQn6d
 GRItMgHWF7Hj7unAXPWHlL4iJaWfN89vqUcLz0KZUG8hTZXjDSz9crGvh
 465qWKSbod60IGlmXXhHobmAgy/dHvJO0vtStNQh4CvZt9hl5XulPa8fl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6398954"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6398954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 08:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="817867465"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="817867465"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 08:06:03 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove obsolete async_ops from struct xe_vm
Date: Mon, 15 Jan 2024 18:01:13 +0200
Message-Id: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
made async_ops in struct xe_vm obsolete but forgot to remove it.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 63e8a50b88e9..b0357fa282b8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -180,30 +180,6 @@ struct xe_vm {
 	 */
 	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
 
-	/** @async_ops: async VM operations (bind / unbinds) */
-	struct {
-		/** @list: list of pending async VM ops */
-		struct list_head pending;
-		/** @work: worker to execute async VM ops */
-		struct work_struct work;
-		/** @lock: protects list of pending async VM ops and fences */
-		spinlock_t lock;
-		/** @fence: fence state */
-		struct {
-			/** @context: context of async fence */
-			u64 context;
-			/** @seqno: seqno of async fence */
-			u32 seqno;
-		} fence;
-		/** @error: error state for async VM ops */
-		int error;
-		/**
-		 * @munmap_rebind_inflight: an munmap style VM bind is in the
-		 * middle of a set of ops which requires a rebind at the end.
-		 */
-		bool munmap_rebind_inflight;
-	} async_ops;
-
 	const struct xe_pt_ops *pt_ops;
 
 	/** @userptr: user pointer state */
-- 
2.34.1

