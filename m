Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C061E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F7BsiE5P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AB7112606;
	Thu, 26 Nov 2026 16:58:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD98112608
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 16:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795712313; x=1827248313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blsWiR3PQOmLNun3Aw0Iv+BIb9RHflDJz+GvFerUE+I=;
 b=F7BsiE5P+lTWbKGdAK1EGAOW4eCXq0pUKkVNuQ1aUjR+I+foaSJX26gx
 Irq1A5hPElu3KNbnRXrfhQdHQaURy350/91YqFkT0rSPDT0tz9vwNmvfH
 ya8P7P0LYCTVAhbnUT6gN7kYIHg0m+2eYPHszCAuqhNW1j6xJyajBlEvs
 crGeFSe4xE1xxp8nwwNdt1CvetHKGV/t2W7NLz150wda+zj0qLUUq6MTQ
 lzFAWLCQkOtWmC0Dsly375KDDZlMXCmyEI4JtyzcsaKBoTfb4r/p2oU0Z
 hWLLEfkR5G2MSCL1kmYpIV/RlXQT8tIetSlVF56cEKg+U9WXJRTxGTC8X A==;
X-CSE-ConnectionGUID: BKvFcaNpQ0Cuig2ffRH8UA==
X-CSE-MsgGUID: Q9tJ9cFcSOKaCQwAGVRHsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4532784"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4532784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:58:32 -0800
X-CSE-ConnectionGUID: tQUwqVZXRemZLhH57pQK/g==
X-CSE-MsgGUID: ctBluEgKTy+qjA7Qh+DU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12549173"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:58:30 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 2/2] drm/xe/bo: Queue async BO free on the module-lifetime
 destroy wq
Date: Thu, 26 Nov 2026 22:19:26 +0530
Message-ID: <20261126164923.3892097-6-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126164923.3892097-4-sanjay.kumar.yadav@intel.com>
References: <20261126164923.3892097-4-sanjay.kumar.yadav@intel.com>
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

The async BO free work may run device teardown and still execute xe
code after xe_device_count drops to zero. Since it runs on system_wq,
which module unload does not drain, rmmod can free the module text
under the running worker.

Queue it on xe_destroy_wq instead, which is drained after
xe_device_exit() at module unload.

Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h     | 3 ++-
 drivers/gpu/drm/xe/xe_module.c | 5 +++--
 drivers/gpu/drm/xe/xe_pt.c     | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 13197e4e0358..651eeeb2eef6 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -14,6 +14,7 @@
 #include "xe_bo_types.h"
 #include "xe_ggtt.h"
 #include "xe_macros.h"
+#include "xe_module.h"
 #include "xe_validation.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
@@ -556,7 +557,7 @@ xe_bo_put_async(struct xe_bo *bo)
 	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
 
 	if (xe_bo_put_deferred(bo, &bo_device->async_list, NULL))
-		schedule_work(&bo_device->async_free);
+		xe_destroy_wq_queue(&bo_device->async_free);
 }
 
 void xe_bo_dev_init(struct xe_bo_dev *bo_device);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 897724cb5cfb..c7323d59b747 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -116,8 +116,9 @@ static void xe_destroy_wq_module_exit(void)
  *
  * The destroy workqueue has module lifetime, and is guaranteed to outlive
  * any xe_device, and to be drained before the module is unloaded. It is used
- * for GuC exec queue and xe_vm/xe_vma teardown that can be deferred past the
- * lifetime of the xe_device that triggered it. SVM pagemap destroy uses the
+ * for GuC exec queue, xe_vm/xe_vma teardown and async BO freeing that can be
+ * deferred past the lifetime of the xe_device that triggered it, or that can
+ * drop the last xe_device reference. SVM pagemap destroy uses the
  * per-device xe->destroy_wq instead.
  *
  * Return: %true if @work was queued, %false if it was already pending.
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0e0bf428df0f..c9db2f116f79 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3073,7 +3073,7 @@ static void xe_pt_job_ops_destroy(struct kref *ref)
 			 * put.
 			 */
 			if (llist_add(&bo->freed, &bo_device->async_list))
-				schedule_work(&bo_device->async_free);
+				xe_destroy_wq_queue(&bo_device->async_free);
 		}
 	}
 
-- 
2.52.0

