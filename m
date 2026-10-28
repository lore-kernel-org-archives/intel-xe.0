Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D92C606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ieks3zqB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A010E0A6;
	Wed, 28 Oct 2026 16:14:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E159710E636
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793204045; x=1824740045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0hrHPzMa0z2ZnWlJi+VxGsKeIql9Mk2aHguY3D2X3lI=;
 b=Ieks3zqBz8PzlLC5W6ynIa8bhUPKrJR7E5QvougTWoRyEotE9UllICoo
 4wDFqB0gjJSjlNzC5wapKDZ1mWexu5jot0v71fqxrpfpeW1Kj407Ny/LC
 YtlIEdNQDdrYjXcccqJC7WavGB/zyYUqLi8SMFpMEhgmZf/S0M/L/lFcq
 5k9B0vCvt3unWAN2osLxT+eSohjBuDs/Sf+cBbOnYLFyM9AFd/9GdmJJI
 TnT4rwX4aEufjAGq6x28yFIedK1GmKakm9HB2k6BKh+mAlJCtnJBCOayN
 yoLcddUI7MFRO+yRotU2Rv6kifMiE7YYG5q/qc+nwFD6v4XkSRJk14g26 g==;
X-CSE-ConnectionGUID: HgABAJRzQBeOjUb6RNQ11w==
X-CSE-MsgGUID: QHBBkq3qTDGnKsMH91W50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1809931"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1809931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:14:04 -0700
X-CSE-ConnectionGUID: mNz+/+rvSLmXMu9UzqkUzw==
X-CSE-MsgGUID: dEe/yy8HSkCZ5y/3IiMVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4814365"
Received: from unknown (HELO shwdecgfx001.sh.intel.com) ([10.239.83.104])
 by orviesa003.jf.intel.com with ESMTP; 28 Oct 2026 09:14:03 -0700
From: "Chen, Junjia" <junjia.chen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, "Chen, Junjia" <junjia.chen@intel.com>
Subject: [PATCH v2] drm/xe: Unwrap sync fences before adding them as job
 dependencies
Date: Thu, 29 Oct 2026 00:13:58 +0800
Message-ID: <20261028161358.1917359-1-junjia.chen@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
v2:
- Do not return from inside dma_fence_unwrap_for_each(). The iterator
  holds a reference on the current chain node that is only dropped when
  the walk reaches the end, so returning early when
  drm_sched_job_add_dependency() failed leaked it. Keep iterating and
  skip the remaining fences once an error has been seen, as
  pvr_sync_add_dep_to_job() does, since there is no
  dma_fence_unwrap_stop() helper. Reported by the Sashiko AI review.
- No other changes.

v1: https://lore.kernel.org/intel-xe/20261026020721.973291-1-junjia.chen@intel.com/

 drivers/gpu/drm/xe/xe_sync.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 06b1c913588a..766ec96c9df1 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,6 +6,7 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -233,11 +234,35 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
 
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
-	if (sync->fence)
-		return  drm_sched_job_add_dependency(&job->drm,
-						     dma_fence_get(sync->fence));
+	struct dma_fence_unwrap iter;
+	struct dma_fence *fence;
+	int err = 0;
 
-	return 0;
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
+		/*
+		 * There is no dma_fence_unwrap_stop() helper to drop the
+		 * reference the iterator holds, so keep iterating without
+		 * doing anything once an error has occurred.
+		 */
+		if (err || dma_fence_is_signaled(fence))
+			continue;
+
+		err = drm_sched_job_add_dependency(&job->drm,
+						   dma_fence_get(fence));
+	}
+
+	return err;
 }
 
 /**
-- 
2.51.0

