Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC1606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TAonObw6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B91B10E115;
	Fri, 20 Nov 2026 06:57:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB83C89861
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795157822; x=1826693822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EF/e8iM4EcsHRrZohIH97DSz0YaCNDa9w8UibNvZyLg=;
 b=TAonObw6CGgmi24mo5aHbc5BuVdK7qPMI8G3nbxczO3gbaJoceLDSKqW
 V+lqNSGIOL/EDdv4trXVTnQGvh4pCZ8e/4A38w3CdrqSLdsA0cLqNCQAu
 CU76FyvJvBEM9SCgz15MXoDH0F7T3b6GvfLnyB2YQpnnkyv0Q5NjOrivM
 r7GQUyRAnbQZTFTvxoSLDFf+kpn050mX3+nhmnvGV/sz6ExTr+rElY3x8
 b4np2thMDP0+tnRQWq6rnA5NQ6k6qJ+0/zLTWAuFgcjntLKKyJlHPkcee
 939gAMvghc0zbsbp3N2cBDUHoOe57odCrYeCUsJSX0M6OFhBHRM2i5toU w==;
X-CSE-ConnectionGUID: iEjugQISRqeYfrDIZ1cTMg==
X-CSE-MsgGUID: 7/5JYiSXRFiEulvyhv3rFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3918162"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3918162"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:57:01 -0800
X-CSE-ConnectionGUID: e1dgTK3wRmOKbmucg7SLbQ==
X-CSE-MsgGUID: D9BlI7QITB2M5F+8JGCVYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10860494"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2026 22:57:00 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe: Centralize migration fence updates
Date: Fri, 20 Nov 2026 12:38:22 +0530
Message-ID: <20261120070822.3834209-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120070822.3834209-1-krishnaiah.bommu@intel.com>
References: <20261120070822.3834209-1-krishnaiah.bommu@intel.com>
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

Add a helper for replacing the migration fence. Assert that job_mutex
is held when updating the stored fence and document how readers must
acquire a reference before using it outside the lock.

Use the helper at each migration fence update site, and use
scoped_guard when taking the reference in xe_migrate_wait().
This keeps the fence ownership and locking rules explicit
across the migrate layer.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 36 ++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 57a81eda2088..99d4ce53f0b2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -227,7 +227,9 @@ struct xe_migrate {
 	u64 large_page_copy_pdes;
 	/**
 	 * @fence: dma-fence representing the last migration job batch.
-	 * Protected by @job_mutex.
+	 * Updated under @job_mutex. Readers must take a reference while holding
+	 * the mutex before using the fence outside the critical section. The
+	 * stored reference is released during final teardown.
 	 */
 	struct dma_fence *fence;
 	/** @min_chunk_size: For dgfx, Minimum chunk size */
@@ -273,6 +275,13 @@ static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool enabled)
 	m->ulls.enabled = enabled;
 }
 
+static void xe_migrate_fence_set(struct xe_migrate *m, struct dma_fence *fence)
+{
+	lockdep_assert_held(&m->job_mutex);
+	dma_fence_put(m->fence);
+	m->fence = dma_fence_get(fence);
+}
+
 static void xe_migrate_ulls_fini(struct xe_migrate *m)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
@@ -1433,8 +1442,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		dma_fence_put(fence);
 		fence = xe_migrate_job_push(m, job);
 
-		dma_fence_put(m->fence);
-		m->fence = dma_fence_get(fence);
+		xe_migrate_fence_set(m, fence);
 
 		mutex_unlock(&m->job_mutex);
 
@@ -1862,8 +1870,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 			dma_fence_put(fence);
 			fence = xe_migrate_job_push(m, job);
 
-			dma_fence_put(m->fence);
-			m->fence = dma_fence_get(fence);
+			xe_migrate_fence_set(m, fence);
 		}
 
 		xe_bb_free(bb, fence);
@@ -2097,8 +2104,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		dma_fence_put(fence);
 		fence = xe_migrate_job_push(m, job);
 
-		dma_fence_put(m->fence);
-		m->fence = dma_fence_get(fence);
+		xe_migrate_fence_set(m, fence);
 
 		mutex_unlock(&m->job_mutex);
 
@@ -2152,9 +2158,9 @@ void xe_migrate_wait(struct xe_migrate *m)
 {
 	struct dma_fence *fence;
 
-	mutex_lock(&m->job_mutex);
-	fence = dma_fence_get(m->fence);
-	mutex_unlock(&m->job_mutex);
+	scoped_guard(mutex, &m->job_mutex) {
+		fence = dma_fence_get(m->fence);
+	}
 
 	if (fence) {
 		dma_fence_wait(fence, false);
@@ -2463,12 +2469,10 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		err = 0;
 	}
 
-	mutex_lock(&m->job_mutex);
-	fence = xe_migrate_job_push(m, job);
-
-	dma_fence_put(m->fence);
-	m->fence = dma_fence_get(fence);
-	mutex_unlock(&m->job_mutex);
+	scoped_guard(mutex, &m->job_mutex) {
+		fence = xe_migrate_job_push(m, job);
+		xe_migrate_fence_set(m, fence);
+	}
 
 	xe_bb_free(bb, fence);
 
-- 
2.43.0

