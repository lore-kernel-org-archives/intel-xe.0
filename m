Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC7606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IL6HLZpG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75E910E0F0;
	Fri, 20 Nov 2026 04:54:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C9C10E0F0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 04:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795150448; x=1826686448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1UpYDCTiGOcXKLNQccWLUHWNMKN02i5byxPMmI1BnNU=;
 b=IL6HLZpGlQvKtL8cOygSCwOH2+aZqSF6xJNJAOqfFYR4OBZnibfh2Ax9
 LLQ5TNUu4+ad0oE1fdAdEbDr8psgkfYWDr8+ZQPoBIV88029cvlOzvCyk
 eTq+kthAcuuAB1wIx36LkZRQaTfUUSHEvorlMJYatspBxgs1FsBIRBgv7
 Yrf2f8XZW4bQlY/+4xHvoxFKK91iI+VIw2UXLJGYUxI4aof425TaUSBwk
 cJ7uDjL6JHoSgHJPsQGez6+EL/wx9SBJ7lnN2KLYfKuIEYpvkNme6/zM/
 85+rGcRo0nzZOBCVcAeeeULBZbk0kZcf/jlkWhNAL6pdsL5lTtG8o9Z8b Q==;
X-CSE-ConnectionGUID: hSPIEiAkQ2GZVJgOycO7ZQ==
X-CSE-MsgGUID: huGnAgW9QniTk2MbIyCaQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3912038"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3912038"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 20:54:07 -0800
X-CSE-ConnectionGUID: HDYKeZQQTomaUwyObAYlWg==
X-CSE-MsgGUID: Xq+ktxHIQna6fc6yFBsy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11174103"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2026 20:54:06 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Hold a fence reference while waiting for migration
Date: Fri, 20 Nov 2026 10:35:30 +0530
Message-ID: <20261120050530.3808036-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_migrate_wait() reads m->fence without job_mutex, while migration
submissions replace the pointer and drop the previous reference under
that mutex. A concurrent replacement could leave the waiter accessing
a fence whose reference has been released.

Take a fence reference under job_mutex, then wait and release
the reference outside the lock. This protects the snapshot without holding
the submission mutex throughout the wait. Callers must still quiesce
submissions when they require the migration context to be idle.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d7a8d8ecffe6..57a81eda2088 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2150,8 +2150,16 @@ struct migrate_test_params {
  */
 void xe_migrate_wait(struct xe_migrate *m)
 {
-	if (m->fence)
-		dma_fence_wait(m->fence, false);
+	struct dma_fence *fence;
+
+	mutex_lock(&m->job_mutex);
+	fence = dma_fence_get(m->fence);
+	mutex_unlock(&m->job_mutex);
+
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
 }
 
 static u32 pte_update_cmd_size(u64 size)
-- 
2.43.0

