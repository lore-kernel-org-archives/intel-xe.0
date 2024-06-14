Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC10BC27C75
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 09:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F0110ECBE;
	Fri, 14 Jun 2024 09:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnyuIC3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED87410ECC4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718358290; x=1749894290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eu6jpBgm9oj3/ZGEMCTSn2MUIzpwy6V1iqyQQrJrZKU=;
 b=GnyuIC3wS9Kh2LzzU1ijtwJY2E0UUwoBqA81UnBvnfbB6S4XHooUzbiv
 S0O8SbwLgEntzCKt0yGv0W7kO1mKEHNGviN6RGu0t6IVgjLlsZPHxS//S
 6N2VcUeg4ywnndr86pxntVeM57tK/FVAAzCSSoiDAzZF3IpvXp0INUZak
 mozYtk+quuvna3IZNze1ezWApzL4e0O5LYxQ5vw6YNnBrUGgPQJuPW3Hr
 koXfAhx6pGXjuCcPFzEI86vewIt9t3VV/3agT7/ifhRps8PgNzxZkzw7Z
 1a7ibk8Qy2CoJRP+cCtDG1MuooforUKxrKPduBcBz24F9aVHxfzdLJGLb Q==;
X-CSE-ConnectionGUID: Sdn1283GSxW3Nz2I9w6row==
X-CSE-MsgGUID: 5kUS8g/NTPOX+Z2bh2MGuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15464650"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15464650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:44:49 -0700
X-CSE-ConnectionGUID: 9uGREA/fRu2Nrv0XBRTemA==
X-CSE-MsgGUID: hpqw3/+KTiCOg7bgThyF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="71224471"
Received: from kamber-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.249.37.242])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:44:48 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/sched_job: Promote xe_sched_job_add_deps()
Date: Fri, 14 Jun 2024 11:44:33 +0200
Message-ID: <20240614094433.775866-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Move it out of the xe_migrate compilation unit so it can be re-used in
other places.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c      |  6 +++---
 drivers/gpu/drm/xe/xe_migrate.c   | 26 ++++++++++----------------
 drivers/gpu/drm/xe/xe_sched_job.c |  6 ++++++
 drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
 4 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4cf6c6ab4866..2d72cdec3a0b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -259,9 +259,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	/* Wait behind rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
-		err = drm_sched_job_add_resv_dependencies(&job->drm,
-							  xe_vm_resv(vm),
-							  DMA_RESV_USAGE_KERNEL);
+		err = xe_sched_job_add_deps(job,
+					    xe_vm_resv(vm),
+					    DMA_RESV_USAGE_KERNEL);
 		if (err)
 			goto err_put_job;
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7e3fb33110d9..efdf148ae59e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -647,12 +647,6 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 	bb->cs[bb->len++] = upper_32_bits(src_ofs);
 }
 
-static int job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
-			enum dma_resv_usage usage)
-{
-	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
-}
-
 static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
 {
 	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
@@ -849,11 +843,11 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		xe_sched_job_add_migrate_flush(job, flush_flags);
 		if (!fence) {
-			err = job_add_deps(job, src_bo->ttm.base.resv,
-					   DMA_RESV_USAGE_BOOKKEEP);
+			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
+						    DMA_RESV_USAGE_BOOKKEEP);
 			if (!err && src_bo != dst_bo)
-				err = job_add_deps(job, dst_bo->ttm.base.resv,
-						   DMA_RESV_USAGE_BOOKKEEP);
+				err = xe_sched_job_add_deps(job, dst_bo->ttm.base.resv,
+							    DMA_RESV_USAGE_BOOKKEEP);
 			if (err)
 				goto err_job;
 		}
@@ -1091,8 +1085,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 			 * fences, which are always tracked as
 			 * DMA_RESV_USAGE_KERNEL.
 			 */
-			err = job_add_deps(job, bo->ttm.base.resv,
-					   DMA_RESV_USAGE_KERNEL);
+			err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
+						    DMA_RESV_USAGE_KERNEL);
 			if (err)
 				goto err_job;
 		}
@@ -1417,8 +1411,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	/* Wait on BO move */
 	if (bo) {
-		err = job_add_deps(job, bo->ttm.base.resv,
-				   DMA_RESV_USAGE_KERNEL);
+		err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
+					    DMA_RESV_USAGE_KERNEL);
 		if (err)
 			goto err_job;
 	}
@@ -1428,8 +1422,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * trigger preempts before moving forward
 	 */
 	if (first_munmap_rebind) {
-		err = job_add_deps(job, xe_vm_resv(vm),
-				   DMA_RESV_USAGE_BOOKKEEP);
+		err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
+					    DMA_RESV_USAGE_BOOKKEEP);
 		if (err)
 			goto err_job;
 	}
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 5c013904877a..44d534e362cd 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -363,3 +363,9 @@ xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot,
 	for (i = 0; i < snapshot->batch_addr_len; i++)
 		drm_printf(p, "batch_addr[%u]: 0x%016llx\n", i, snapshot->batch_addr[i]);
 }
+
+int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
+			  enum dma_resv_usage usage)
+{
+	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
+}
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index f362e28455db..3dc72c5c1f13 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -90,4 +90,7 @@ struct xe_sched_job_snapshot *xe_sched_job_snapshot_capture(struct xe_sched_job
 void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot);
 void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct drm_printer *p);
 
+int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
+			  enum dma_resv_usage usage);
+
 #endif
-- 
2.43.0

