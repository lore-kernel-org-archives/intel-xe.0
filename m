Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C106606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cGMRCv83
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1368410E2E6;
	Mon, 23 Nov 2026 05:05:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0A310E363
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 05:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795410350; x=1826946350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=No6djhtuehBPGxUxXjPU39vK00E7ehrpfRQnzLPfJlE=;
 b=cGMRCv834THudDxbMHGllYJd6ESTge2FBvufCwiy3Yu7Gpthaiz4etMi
 rTKjb2NpP9hQ1WOzw/MC6nsvIF3ISe+XgxbaAb+VvOSbg9bYt1FP0OmIT
 averI0gl0Wf6JGevThTGDfp2P7AbCS/KuvLlp1N85K38Ew2BlooOuC8X7
 jSdFqgOYByWg3/RAs2bcSJczJqTg3lMDTbmBszGe3L/dgfarsmvCJz8jM
 sSgqRCpHLOa4HvwVZLY5bSKTF9BtOde942G+9kfJcZtw4+K63ZGLdTsMa
 irHZ5ayDAA1E2del8j0SbGqHNNJnLnfhUJAqrKaDpmbhP+pJGEcwQCQSW w==;
X-CSE-ConnectionGUID: CY3rTzrmRVGdZjhJgZpoag==
X-CSE-MsgGUID: eai+DQhITd+DuLKU6K0OjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4102846"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4102846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:05:50 -0800
X-CSE-ConnectionGUID: fbpHpK5kRhaYYyEXyFAv9Q==
X-CSE-MsgGUID: h9lqv9KeS/iPvhMURAwqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11772167"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:05:48 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/2] drm/xe/bo: Queue async BO free on the module-lifetime
 destroy wq
Date: Mon, 23 Nov 2026 10:26:55 +0530
Message-ID: <20261123045652.3575516-6-sanjay.kumar.yadav@intel.com>
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
---
 drivers/gpu/drm/xe/xe_bo.h     | 3 ++-
 drivers/gpu/drm/xe/xe_module.c | 5 +++--
 drivers/gpu/drm/xe/xe_pt.c     | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8e..a4c4fa6f183b 100644
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
@@ -550,7 +551,7 @@ xe_bo_put_async(struct xe_bo *bo)
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
index 81e3c2e2011b..bceead2938a4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3072,7 +3072,7 @@ static void xe_pt_job_ops_destroy(struct kref *ref)
 			 * put.
 			 */
 			if (llist_add(&bo->freed, &bo_device->async_list))
-				schedule_work(&bo_device->async_free);
+				xe_destroy_wq_queue(&bo_device->async_free);
 		}
 	}
 
-- 
2.52.0

