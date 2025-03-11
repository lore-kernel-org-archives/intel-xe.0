Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43682C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 18:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108FA10E63B;
	Tue, 11 Mar 2025 18:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7Uil+m6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3635810E633
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741717688; x=1773253688;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A1emSa3K5S5mAxd4IFSWbQWpOR7JHaOxoleRJOjDmGE=;
 b=G7Uil+m6OitrDryBGkK7ao2f6Wk2LpXpWvuEsM3Zj6Ih8vZ1FXD2s8nC
 3hqrx/fpopM/yHZp36DXKPu537lgHzN7062+BVXfbgl0ai7BPcsglktVD
 STkQc97BXOtkkn2LlyqY2JkjMnVIGCnnrXcWZ6PWUhT1xF+PoIMsJWeZr
 GgLJpyM2WFf/QUppmlyUgb7NWr1Jdypp8XfatpGeZfFXNNxZ3zBiiHyD3
 s+RZ/bXi2Li0EFviNwdvrij/ICJG6GUAK1TRtMVP42dvPUDHhTqFq0CRh
 44b70ZepU6gcYqlplAgRQM83kQR1ppNKVuZPvsESZp2J8Pj4R/dQyw9kS A==;
X-CSE-ConnectionGUID: CUHp6G8JRyaPb56sIiJ1AA==
X-CSE-MsgGUID: Zu+vJ5XxSIu1jtd1aXg/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46420957"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46420957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:28:08 -0700
X-CSE-ConnectionGUID: N0jsakQBQ06Ke5u+KsPOxA==
X-CSE-MsgGUID: Lp0dlF+nS6mDd644sSvH5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="125601653"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:28:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use local fence in error path of xe_migrate_clear
Date: Tue, 11 Mar 2025 11:29:15 -0700
Message-Id: <20250311182915.3606291-1-matthew.brost@intel.com>
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

The intent of the error path in xe_migrate_clear is to wait on locally
generated fence and then return. The code is waiting on m->fence which
could be the local fence but this is only stable under the job mutex
leading to a possible UAF. Fix code to wait on local fence.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index df4282c71bf0..a83bebef3780 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1177,7 +1177,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 err_sync:
 		/* Sync partial copies if any. FIXME: job_mutex? */
 		if (fence) {
-			dma_fence_wait(m->fence, false);
+			dma_fence_wait(fence, false);
 			dma_fence_put(fence);
 		}
 
-- 
2.34.1

