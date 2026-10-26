Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F7606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 02:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UkI8yaQ+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CC410E136;
	Mon, 26 Oct 2026 02:08:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D1E10E136
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 02:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792980487; x=1824516487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B7e2t56P5JF6a7W2i1QLrBYfpDdE368Nnidj7lrVx7E=;
 b=UkI8yaQ+fdrA0r+of6LAhrr34gXOZaxBk9moRfDTKZUZ3QYs9ciSMHmm
 5rndqIQoAFO1fL4/McKMmV7sAtLQpw1fwsmfXS8hucnXQV/9S8SnXwU5G
 W830FUa5iokchVkevYRbcdUln+3cdin+p6xHaTFjF1TiTWsJsGMfrddmH
 gHTOA+wm41qOc+ub4ZmHM1xaMs+agfhkLc8NkjQ0+JRMvtxAIMqX4WMU3
 TZF/CQDVuwnYjVVtsdW7tJlQJweaUz/R6iWH3qHkNJyLldAEJZdrH+qPi
 Z2NIIBIKOwuhs/VNftP/qe7fnFv9diRxAQtPaGh75SBDfzBf2AoJaFz1z w==;
X-CSE-ConnectionGUID: 63nJdhSwQx6Ij1LCeYqWWQ==
X-CSE-MsgGUID: K+jOtR8JS2i2p17Xu7A4MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1512522"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1512522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 19:07:31 -0700
X-CSE-ConnectionGUID: g6tviq6DRiGvoKwQYin8ug==
X-CSE-MsgGUID: bgSayXtAQ7Ceysyy939spg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4171579"
Received: from unknown (HELO shwdecgfx001.sh.intel.com) ([10.239.83.104])
 by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2026 19:07:29 -0700
From: "Chen, Junjia" <junjia.chen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, "Chen, Junjia" <junjia.chen@intel.com>
Subject: [PATCH] drm/xe: Unwrap sync fences before adding them as job
 dependencies
Date: Mon, 26 Oct 2026 10:07:21 +0800
Message-ID: <20261026020721.973291-1-junjia.chen@intel.com>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A timeline syncobj point is a dma_fence_chain node that carries its own
fence context, separate from the contexts of the fences it wraps.
xe_sync_entry_add_deps() passed that container straight to
drm_sched_job_add_dependency().

drm_sched_entity_add_dependency_cb() only drops a dependency when the
fence context is one of the entity's own (fence_context or
fence_context + 1). A chain node never matches, so a wait on a point
whose inner fence is the finished fence of an earlier job on the same
exec queue is treated like a cross-queue dependency: the job is held
until the previous job has completed on the GPU. Every job queued
behind it waits too, and the ring drains before the next batch of jobs
is released.

Unwrap the fence with dma_fence_unwrap_for_each() and add each
unsignaled underlying fence as a dependency, so drm_sched sees the real
fence contexts and ignores same-entity fences. Dependencies on other
exec queues still wait for completion. drm_sched_job_add_dependency()
keeps only the latest fence per context, so the dependency array does
not grow with the length of the chain.

Signed-off-by: Chen, Junjia <junjia.chen@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 06b1c913588a..73fe7f05ba16 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,6 +6,7 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -233,9 +234,30 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
 
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
-	if (sync->fence)
-		return  drm_sched_job_add_dependency(&job->drm,
-						     dma_fence_get(sync->fence));
+	struct dma_fence_unwrap iter;
+	struct dma_fence *fence;
+	int err;
+
+	if (!sync->fence)
+		return 0;
+
+	/*
+	 * Unwrap fence containers (e.g. dma_fence_chain from a timeline
+	 * syncobj) so the scheduler sees the underlying fences. That lets it
+	 * drop dependencies on jobs from the same entity and only wait for
+	 * jobs on the same scheduler to be scheduled, rather than waiting for
+	 * the container, which forces a full GPU completion wait and drains
+	 * the queue.
+	 */
+	dma_fence_unwrap_for_each(fence, &iter, sync->fence) {
+		if (dma_fence_is_signaled(fence))
+			continue;
+
+		err = drm_sched_job_add_dependency(&job->drm,
+						   dma_fence_get(fence));
+		if (err)
+			return err;
+	}
 
 	return 0;
 }
-- 
2.51.0

