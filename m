Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB4C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 07:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B462910E3DA;
	Fri, 24 May 2024 07:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQ7Wmv8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE4310E480
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716535200; x=1748071200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7k7eORB+TkUHtNr3yTT1SXq4Bff77PfJYLACkdiWLZE=;
 b=bQ7Wmv8b0iy4GBmc+W342r9JQ/nTD3sKaP+RcR+7/NSSgPOKjwrReHDf
 n2FqHQziWOPRRt021Dga6Y4Qrn/rHjgBkjeq4SM1ZwJx8TjUZgYsjDVI9
 FPXU125fXDw9dWxxG4o5BQqji5mixOoz+WHOBLyVaCJzYvShsmM/Bl3YM
 ouz4e8szWUIcONLUe4IO1o96wcZNxxoONz7vSJNlOlDlri6En06ocFH2/
 wMiP4Q/C1zHbfMApmnVhylF+gaKgVpH6aScc2UbhMMgNcY0fyRiNlHYda
 +B0O7Swl55Mo5s+H3ekpeiacRTjG4wT03mciRlRZChHTeVI5nabweE4an g==;
X-CSE-ConnectionGUID: 715LEiokQty1XiIzMMysTw==
X-CSE-MsgGUID: HqaSk94ETmWubO84mLMeHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13130628"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13130628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:20:00 -0700
X-CSE-ConnectionGUID: hD4tUfOqQlmvVVuLPavhYg==
X-CSE-MsgGUID: fooZuaM/RHSgHLi51EsP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="64751320"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 5/5] drm/xe: Move job creation out of the struct
 xe_migrate::job_mutex
Date: Fri, 24 May 2024 09:19:40 +0200
Message-ID: <20240524071940.83042-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In order to be able to run gpu jobs from reclaim context,
move job creation (where allocation takes place) out of the
struct xe_migrate::job_mutex, and prime that mutex as reclaim
tainted.

Jobs that may need to run from reclaim context include
CCS metadata extraction at shrinking time.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bacb23de411b..cccffaf3db06 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -383,6 +383,9 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	}
 
 	mutex_init(&m->job_mutex);
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&m->job_mutex);
+	fs_reclaim_release(GFP_KERNEL);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_migrate_fini, m);
 	if (err)
@@ -807,7 +810,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
 						  src_L0, ccs_ofs, copy_ccs);
 
-		mutex_lock(&m->job_mutex);
 		job = xe_bb_create_migration_job(m->q, bb,
 						 xe_migrate_batch_base(m, usm),
 						 update_idx);
@@ -827,6 +829,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				goto err_job;
 		}
 
+		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -844,7 +847,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 err_job:
 		xe_sched_job_put(job);
 err:
-		mutex_unlock(&m->job_mutex);
 		xe_bb_free(bb, NULL);
 
 err_sync:
@@ -1044,7 +1046,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 			flush_flags = MI_FLUSH_DW_CCS;
 		}
 
-		mutex_lock(&m->job_mutex);
 		job = xe_bb_create_migration_job(m->q, bb,
 						 xe_migrate_batch_base(m, usm),
 						 update_idx);
@@ -1067,6 +1068,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				goto err_job;
 		}
 
+		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -1083,7 +1085,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 err_job:
 		xe_sched_job_put(job);
 err:
-		mutex_unlock(&m->job_mutex);
 		xe_bb_free(bb, NULL);
 err_sync:
 		/* Sync partial copies if any. FIXME: job_mutex? */
@@ -1377,9 +1378,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 			write_pgtable(tile, bb, 0, &updates[i], pt_update);
 	}
 
-	if (!q)
-		mutex_lock(&m->job_mutex);
-
 	job = xe_bb_create_migration_job(q ?: m->q, bb,
 					 xe_migrate_batch_base(m, usm),
 					 update_idx);
@@ -1420,6 +1418,9 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		if (err)
 			goto err_job;
 	}
+	if (!q)
+		mutex_lock(&m->job_mutex);
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -1435,8 +1436,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 err_job:
 	xe_sched_job_put(job);
 err_bb:
-	if (!q)
-		mutex_unlock(&m->job_mutex);
 	xe_bb_free(bb, NULL);
 err:
 	drm_suballoc_free(sa_bo, NULL);
-- 
2.44.0

