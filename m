Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ACBC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B09610E6C0;
	Wed, 25 Oct 2023 17:39:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801EA10E6CE
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698255592; x=1729791592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DM+uYVh7JsAtllEyeFBiHDo470DlgCUQZloQtkS2TV0=;
 b=LCm4D58/UPbBiM6w1+hqIn13Va3QfVK3mwr7S4cdOjOqMwmVHdwxRyTV
 74JocEQ9mZGM5O1rz8Oj5thakmNLGCy4aPJ3NUECDkt6ML0C/EV+a+6Tt
 jEtnJaNoFd0dMzkZABfD7NAtmB7kJ3iGx9EYWrz3/Kta38O/YdevAVC8h
 9a//jo2lu/BXklJTKdQjjCL8c05hh8aTZt2E2+rvFJNyBI3+3M9zeI005
 55ApkY3xdc+mXzFnbWDxeXHCXUhpgW/T8+Du6Ml8nLPfuHCp6AaOF8WyA
 nbOr8B1bVEymRq79d4DUMoowu2QAG2PWKV7cnue+LESQx43ExQeboabbj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391233699"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="391233699"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735464919"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735464919"
Received: from kozlovdm-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:39:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 18:39:40 +0100
Message-ID: <20231025173937.197744-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025173937.197744-5-matthew.auld@intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/bo: consider dma-resv fences for
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 009d728af762..896a6d8398ea 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -980,8 +980,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 
-		/* TODO: Add dependencies here */
-
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
 			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
@@ -1010,6 +1008,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		}
 
 		xe_sched_job_add_migrate_flush(job, flush_flags);
+		if (!fence) {
+			err = job_add_deps(job, bo->ttm.base.resv,
+					   DMA_RESV_USAGE_BOOKKEEP);
+			if (err)
+				goto err_job;
+		}
 
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
@@ -1024,6 +1028,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		xe_bb_free(bb, fence);
 		continue;
 
+err_job:
+		xe_sched_job_put(job);
 err:
 		mutex_unlock(&m->job_mutex);
 		xe_bb_free(bb, NULL);
-- 
2.41.0

