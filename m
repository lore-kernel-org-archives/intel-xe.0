Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C1C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 11:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ADA10E636;
	Wed, 17 Jan 2024 11:14:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E21810E636
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705490042; x=1737026042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YH8jXbtWvubTE9dqijRHRxgHQ39wuJzBmamqGfr0gHs=;
 b=HTexrYOL8z7XNY8R9k6UzTnEuWan/bgOihEIZJj2nitehs6kpvQz9AMC
 JlSD22C6fjIeBBlFuoa3OiQLQTfjF1C04IWcDYSesVgmKCdWzHt7OPWje
 4qVMmx8OnbxQ0/wnltlFAVK8SrCEphrZavnCgSr7c/LkwtXDDltgo01pV
 2K3wqjbYUsqr6JqfC7cn6YaGQg9/vfxLRuzTw7NrxyxPN6s3jN9bK3m1G
 03gv2px70JF65QTFqZ+eACY3JKSIV/p7yD7JtZPswWJUY6RuEWppzRaAk
 wlwLbGEp+kqK9Eo+Dr8Os7qxNhlmxrZxu4gwgky4kRFjPMBSpJI4lUcyL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="431300278"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="431300278"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 03:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874791518"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="874791518"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 03:14:00 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove obsolete async_ops from struct xe_vm
Date: Wed, 17 Jan 2024 13:09:08 +0200
Message-Id: <20240117110908.2362615-1-mika.kuoppala@linux.intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When sync binds were reworked and worker removed, async_ops became
obsolete. Remove it.

Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
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

