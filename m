Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A8606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSm+GbaT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D2910E363;
	Mon, 23 Nov 2026 05:05:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120910E2E6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 05:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795410348; x=1826946348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1dxSlDLufTCAz1YqBM9X/LSUxXA8PnAkm19HldEfocc=;
 b=bSm+GbaTl9iLz/7nwvDnAwgu309ohK5iC9qTcBuY5eqK7GJxyfQPq/Qw
 ENZ0F4hTanCM7n38PDzlVMF/FuVcWoqldsrNDvevD7H/KHLygEPd/wuM2
 ePDjC1IH2Ay4C7V6YZtcK11ov7xRGsAkSQAhq0/uvKWG7qcpWNTnDeG1t
 Qa9JMByRJxMgzN07+ELdgJB+/28yXpqLhvFKBL66EVBi6sKW0UmJaZxpl
 TlqynG6BCjSMgLl2XwtuG0pCfOPWpVwhTxMT1UzKAGkiBUjAlxh2rXBGQ
 iAyIWGktxYly+86smNmddCMAHkdmGQ19yAV4+3OHFjbFQ2JflyGGwpoqV A==;
X-CSE-ConnectionGUID: BS9ttlakTiKvAMt7rJQorQ==
X-CSE-MsgGUID: l8dzv7ZXRE2MLJPPu9YNMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4102843"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4102843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:05:48 -0800
X-CSE-ConnectionGUID: G+Bo0/VIRRSj4OG/f0S3CQ==
X-CSE-MsgGUID: +EijaiAWTtCH6kzFTsY5Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11772162"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:05:46 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/2] drm/xe/bo: Fix self-flush deadlock in async BO free
Date: Mon, 23 Nov 2026 10:26:54 +0530
Message-ID: <20261123045652.3575516-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123045652.3575516-4-sanjay.kumar.yadav@intel.com>
References: <20261123045652.3575516-4-sanjay.kumar.yadav@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..dc78f5f49e35 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -4157,8 +4157,17 @@ void xe_bo_put_commit(struct llist_head *deferred)
 static void xe_bo_dev_work_func(struct work_struct *work)
 {
 	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
+	struct xe_device *xe = container_of(bo_dev, struct xe_device, bo_device);
+	/*
+	 * Freeing a BO may drop the last device ref, so hold one until the
+	 * list is processed. Zero if xe_bo_dev_fini() is already flushing us.
+	 */
+	bool dev_ref = kref_get_unless_zero(&xe->drm.ref);
 
 	xe_bo_put_commit(&bo_dev->async_list);
+
+	if (dev_ref)
+		drm_dev_put(&xe->drm);
 }
 
 /**
@@ -4176,7 +4185,16 @@ void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
  */
 void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
 {
-	flush_work(&bo_dev->async_free);
+	/*
+	 * Final device put from the worker itself: flushing would deadlock,
+	 * so cancel any requeue and free the pending BOs inline.
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

