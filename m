Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DD606A33A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKSxe1Ig
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242EE112E98;
	Fri,  6 Nov 2026 15:55:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F901112E89
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793980546; x=1825516546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8tCNRGMP4bPp1aptvZK/Vl9MOthLQTP6ZeC8xas/8t4=;
 b=nKSxe1IgXUwHQQlX+XdEzIWryWqvdFPYRiuyGxQNfRWXDrmbLvtUUrAg
 AjyYTgytkaSJAE3gqr/grr6yzv9rylPO/TS9pLjURUbidl71ZBMPeBOVS
 O8o4HhSrrGvig2lls9ce8sJmGXTIxU6Q0U07dIWPETvIdIAdCKFRj/Edu
 gIegkf3xAYqPi1vF/oorni9OUj/pbXFNGYTn4v1j8emU8+NPHUBsF5j4n
 rbp9wyC8gqRRx1Lby8wPd+HqRv/thvsPiisbN/289T57rxCuKcr7QfLRq
 k+rPu0nJUjtD/+QJqFMIxsWWU2XqpJ2opTGaT6aCJQnlukLSjnvB/8/iw w==;
X-CSE-ConnectionGUID: 3/ywT9MpSYKoVP2Ms/98pA==
X-CSE-MsgGUID: orb0+G0pR5Ot6/kwaZ+azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2896007"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2896007"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:55:46 -0800
X-CSE-ConnectionGUID: QFxZGHB2QxmabsQ3uZgFxQ==
X-CSE-MsgGUID: cLyeBBSvRui7netfmA3whg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7650430"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2026 07:55:45 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v2 2/2] drm/xe: After VF migration,
 repeat BO mapping in progress
Date: Fri,  6 Nov 2026 16:56:15 +0100
Message-ID: <20261106155615.977330-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106155615.977330-1-tomasz.lis@intel.com>
References: <20261106155615.977330-1-tomasz.lis@intel.com>
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

If VF migration happens during BO mapping, it is possible
that some PTE values were not written at the correct place.
This can happen because GGTT range, and therefore range of
assigned PTEs, have changed during the migration.
Restoring VF state on PF side will ensure that any PTEs
already set within the previous VM are moved to correct
positions, but if VM was paused and migrated while setting
PTEs, it will continue the loop at the old position. The
GGTT base address is used to select which PTEs to write,
so setting them again needs to wait until the post-migration
recovery procedure updates the GGTT base.

Previously, LRC creation was repeated. This means only BOs
that were part of exec queues were properly protected from
VF migration. With this change, as the redo is moved to BO
creation, all BOs are protected.

v2: Removed memirq safety check - looking at current memirq init,
  no extra check should be necessary.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com> (v1)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 27 ++++++++-------------------
 drivers/gpu/drm/xe/xe_ggtt.c       | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 23fd0f6cba7f..ed24b11fdb90 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -431,28 +431,17 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	 * from the moment vCPU resumes execution.
 	 */
 	for (i = 0; i < q->width; ++i) {
-		struct xe_lrc *__lrc = NULL;
-		int marker;
 
-		do {
-			struct xe_lrc *lrc;
-
-			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
-
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-					    xe_lrc_ring_size(), q->msix_vec, flags);
-			if (IS_ERR(lrc)) {
-				err = PTR_ERR(lrc);
-				goto err_lrc;
-			}
-
-			xe_exec_queue_set_lrc(q, lrc, i);
+		struct xe_lrc *lrc;
 
-			if (__lrc)
-				xe_lrc_put(__lrc);
-			__lrc = lrc;
+		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+				    xe_lrc_ring_size(), q->msix_vec, flags);
+		if (IS_ERR(lrc)) {
+			err = PTR_ERR(lrc);
+			goto err_lrc;
+		}
 
-		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
+		xe_exec_queue_set_lrc(q, lrc, i);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 9ef2ce743770..6508d301a082 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -22,6 +22,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_gt_types.h"
 #include "xe_log.h"
 #include "xe_map.h"
@@ -834,6 +835,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 {
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
 	u8 tile_id = ggtt->tile->id;
+	int marker;
 	int err;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -858,6 +860,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		goto out;
 	}
 
+retry:
+	marker = xe_gt_sriov_vf_wait_valid_ggtt(ggtt->tile->primary_gt);
+
 	mutex_lock(&ggtt->lock);
 	/*
 	 * When inheriting the initial framebuffer, the framebuffer is
@@ -890,6 +895,18 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 
 		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
+
+		/*
+		 * If VF migration happens during BO mapping, some PTE value writes may
+		 * be ignored by HW. This can happen in case GGTT range changes; already
+		 * set PTEs are moved by the VF restore, but xe_ggtt_map_bo() within VM
+		 * may still loop at old position. To be sure, redo all PTE writes.
+		 */
+		if (marker != xe_vf_migration_fixups_complete_count(ggtt->tile->primary_gt)) {
+			drm_mm_remove_node(&bo->ggtt_node[tile_id]->base);
+			mutex_unlock(&ggtt->lock);
+			goto retry;
+		}
 	}
 	mutex_unlock(&ggtt->lock);
 
-- 
2.43.0

