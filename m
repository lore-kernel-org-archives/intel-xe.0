Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD7CC00142
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 16:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0710E33E;
	Mon, 30 Oct 2023 16:11:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E564710E32E
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698682261; x=1730218261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vJ/5IDn/vR/ieYlo6huaJxi5SiU7e5QJZG7g0BrVO3k=;
 b=CSsgr5Sgu5qSYn1NuNG8BsrVcCFSYaNnc2sKfnzBEogV6Ld9WJtQsRR4
 NBImRO2oyMpFdVHe1htRqoGAEAJ7brc8fnJZgdxeMk8692vUz0BfSkdbG
 FYsXQre5dxb8YBY1kTwi/n2dTfYOXDlCQTpFLy5FGfOEsJQ9NCGw0rhnA
 Jm8/7vswSXRkfG1RlhqtBEQeemoOfjeWdi96HgAEcDHIbHJbxRek6t9tM
 SyobLxFR+gOoWWi9gL+7WmD+9mjqM9vGpFn22CHzTsnqr86pozpKVZqfY
 +DSN+1RHZx7nBhOFPnBgtkQuPmkamTwP+ahIHyqq8LvGNLdMtQ2QcQ5RT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474347269"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="474347269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1543614"
Received: from vishvend-mobl2.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.8])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:10:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 16:10:19 +0000
Message-ID: <20231030161016.54300-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030161016.54300-5-matthew.auld@intel.com>
References: <20231030161016.54300-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe/bo: consider dma-resv fences for
 clear job
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

There could be active fences already in the dma-resv for the object
prior to clearing. Make sure to input them as dependencies for the clear
job.

v2 (Matt B):
  - We can use USAGE_KERNEL here, since it's only the move fences we
    care about here. Also add a comment.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 009d728af762..e6a31f90ebdb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -980,8 +980,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 
-		/* TODO: Add dependencies here */
-
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
 			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
@@ -1010,6 +1008,18 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		}
 
 		xe_sched_job_add_migrate_flush(job, flush_flags);
+		if (!fence) {
+			/*
+			 * There can't be anything userspace related at this
+			 * point, so we just need to respect any potential move
+			 * fences, which are always tracked as
+			 * DMA_RESV_USAGE_KERNEL.
+			 */
+			err = job_add_deps(job, bo->ttm.base.resv,
+					   DMA_RESV_USAGE_KERNEL);
+			if (err)
+				goto err_job;
+		}
 
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
@@ -1024,6 +1034,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		xe_bb_free(bb, fence);
 		continue;
 
+err_job:
+		xe_sched_job_put(job);
 err:
 		mutex_unlock(&m->job_mutex);
 		xe_bb_free(bb, NULL);
-- 
2.41.0

