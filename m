Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29115606A330
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VMh+9RSQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D6D10EA50;
	Sun, 22 Nov 2026 13:05:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E18010E9E4
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795352695; x=1826888695;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Rg4XILRTmyLPr8b1JIX5ohEjvOL+B9pG3VyPfth+mis=;
 b=VMh+9RSQcDBmjeCUxik/wlXh8zs64lYDxRIVoiGQsHKoSwObijc0HpR4
 +GaCWvErSkdvo2PqXQDBHe/xx/cQnpJpzzpw1wsCym5yFsFa01ypfgDQY
 mdia+E1DMPvHn1CSfaGopIM6qjBK7CCH0K3AJQtSuxdY/BUeiTAi1pk13
 NQTO9kItDxmoMEKS3oVljrNE1vdhyhbWSxOc40fjs64DIdKM5TTHuf+Nz
 eBJZlhLgri6+8wzgjtEBdNjAx61ssOQhsQNXnZbut8pye1yVfKRN5BMi9
 HJTtaDqsUZ71/AUh+nWvpRFFc+FfwsHddyVJFGRRUksr6JKnLRP76CuPH g==;
X-CSE-ConnectionGUID: yeKmDMn0TUSjzLEK23V7+A==
X-CSE-MsgGUID: E87nnxN+TIaxSpv+vwejPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4066998"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4066998"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 05:04:54 -0800
X-CSE-ConnectionGUID: RoYaDJaOSPWsj1UejlIM1Q==
X-CSE-MsgGUID: jcYoiHrYTeGSNFqnsE5L7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208";a="11022608"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 05:04:53 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2][CI-ONLY] drm/xe/bo: Fix self-flush deadlock in async BO
 free
Date: Sun, 22 Nov 2026 18:26:07 +0530
Message-ID: <20261122125605.3508411-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261122125605.3508411-4-sanjay.kumar.yadav@intel.com>
References: <20261122125605.3508411-4-sanjay.kumar.yadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The async BO free worker can drop the last reference to a page-table
BO, which puts the VM and, via drm_gpuvm_free(), possibly the last
drm_device reference. Device teardown then runs from the worker and
xe_bo_dev_fini() calls flush_work() on the running work, deadlocking.

Hold a device reference across xe_bo_put_commit() so that the final
put happens only after the list is processed, and when
xe_bo_dev_fini() is called from the worker itself, cancel any requeued
instance and free the pending BOs inline instead of flushing.

Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..dc78f5f49e35 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -4157,8 +4157,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
 static void xe_bo_dev_work_func(struct work_struct *work)
 {
 	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
+	struct xe_device *xe = container_of(bo_dev, struct xe_device, bo_device);
+	/*
+	 * Freeing a BO may drop the last VM reference, and with it the last
+	 * device reference. Hold a device reference while freeing so that
+	 * the final put, if any, happens only after the whole list has been
+	 * processed. The refcount is already zero if xe_bo_dev_fini() is
+	 * flushing this work from another context.
+	 */
+	bool dev_ref = kref_get_unless_zero(&xe->drm.ref);
 
 	xe_bo_put_commit(&bo_dev->async_list);
+
+	if (dev_ref)
+		drm_dev_put(&xe->drm);
 }
 
 /**
@@ -4176,7 +4188,17 @@ void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
  */
 void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
 {
-	flush_work(&bo_dev->async_free);
+	/*
+	 * The final device put may come from xe_bo_dev_work_func() itself,
+	 * where flushing would wait on ourselves. The work may have been
+	 * requeued meanwhile, so cancel it and free the pending BOs here.
+	 */
+	if (current_work() == &bo_dev->async_free) {
+		cancel_work(&bo_dev->async_free);
+		xe_bo_put_commit(&bo_dev->async_list);
+	} else {
+		flush_work(&bo_dev->async_free);
+	}
 }
 
 void xe_bo_put(struct xe_bo *bo)
-- 
2.52.0

