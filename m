Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A5DC04A68
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839110E4C0;
	Tue,  7 Nov 2023 05:26:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313A310E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334758; x=1730870758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eGKnWTjHvuCwSoQFeTOG8bB7oOYr/FxBp6KOZpekGeQ=;
 b=EtjdqKNwq/Y/jJ8ARbX6Exbe3YThpDq6hTg7KHOGlNQ8tLTpHF4cUIth
 8xODbDg9IpgpGVA/h3Yhw7bXgr6sPv4TQ/yhyyrYYhrX0K8qBb552BXcu
 8KIRe5EIUScDXtHQH72lLxKyJvMm1xBwXwk/qpZfqG2+S4EYfp0qejdyg
 lUGT5b2y6oeHMyJAaWHLZJBLoImbcZpy1a76m/LS7ktAkdYUZzg9oeBDC
 l5lVRHPMYvf0VXa6DP8N8NwoYsUPAkudeoDzAbir9znciW+pIhFbV8nsX
 aH6ilU2bJD/MsujHKUHdvGpjEt4Ny61o/LSFk1QMU8j/1WlGYpcLkYauJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769534"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689881"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689881"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:58 -0800
Message-Id: <20231107052603.124361-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 22/27] drm/xe: Update clear / populate
 arguments
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

This will help implement CPU binds in run_job() as 'struct
xe_migrate_pt_update' is not available at the time of run_job().

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c |  9 +++++----
 drivers/gpu/drm/xe/xe_migrate.h | 12 +++++-------
 drivers/gpu/drm/xe/xe_pt.c      | 12 +++++-------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3a01c6de1ec6..5d7c3dc080a3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1058,6 +1058,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 			  struct xe_migrate_pt_update *pt_update)
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
+	struct xe_vm *vm = pt_update->vops->vm;
 	u32 chunk;
 	u32 ofs = update->ofs, size = update->qwords;
 
@@ -1089,10 +1090,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 		bb->cs[bb->len++] = lower_32_bits(addr);
 		bb->cs[bb->len++] = upper_32_bits(addr);
 		if (pt_op->bind)
-			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
+			ops->populate(tile, NULL, bb->cs + bb->len,
 				      ofs, chunk, update);
 		else
-			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
+			ops->clear(vm, tile, NULL, bb->cs + bb->len,
 				   ofs, chunk, update);
 
 		bb->len += chunk * 2;
@@ -1149,12 +1150,12 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 				&pt_op->entries[i];
 
 			if (pt_op->bind)
-				ops->populate(pt_update, m->tile,
+				ops->populate(m->tile,
 					      &update->pt_bo->vmap, NULL,
 					      update->ofs, update->qwords,
 					      update);
 			else
-				ops->clear(pt_update, m->tile,
+				ops->clear(vm, m->tile,
 					   &update->pt_bo->vmap, NULL,
 					   update->ofs, update->qwords, update);
 		}
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 7fbc21bd265e..805c780d3ab6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -31,7 +31,6 @@ struct xe_vma;
 struct xe_migrate_pt_update_ops {
 	/**
 	 * @populate: Populate a command buffer or page-table with ptes.
-	 * @pt_update: Embeddable callback argument.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
 	 * @pos: If @map is NULL, map into the memory to be populated.
@@ -43,13 +42,12 @@ struct xe_migrate_pt_update_ops {
 	 * page-table system to populate command buffers or shared
 	 * page-tables with PTEs.
 	 */
-	void (*populate)(struct xe_migrate_pt_update *pt_update,
-			 struct xe_tile *tile, struct iosys_map *map,
+	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
 			 void *pos, u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
 	/**
 	 * @clear: Clear a command buffer or page-table with ptes.
-	 * @pt_update: Embeddable callback argument.
+	 * @vm: VM being updated
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
 	 * @pos: If @map is NULL, map into the memory to be populated.
@@ -61,9 +59,9 @@ struct xe_migrate_pt_update_ops {
 	 * page-table system to populate command buffers or shared
 	 * page-tables with PTEs.
 	 */
-	void (*clear)(struct xe_migrate_pt_update *pt_update,
-		      struct xe_tile *tile, struct iosys_map *map,
-		      void *pos, u32 ofs, u32 num_qwords,
+	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
+		      struct iosys_map *map, void *pos, u32 ofs,
+		      u32 num_qwords,
 		      const struct xe_vm_pgtable_update *update);
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 73199b34820f..7d9bd7d1dabb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -831,9 +831,8 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static void
-xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
-		       struct iosys_map *map, void *data,
-		       u32 qword_ofs, u32 num_qwords,
+xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
+		       void *data, u32 qword_ofs, u32 num_qwords,
 		       const struct xe_vm_pgtable_update *update)
 {
 	struct xe_pt_entry *ptes = update->pt_entries;
@@ -1455,12 +1454,11 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 }
 
 static void
-xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
-				  struct xe_tile *tile, struct iosys_map *map,
-				  void *ptr, u32 qword_ofs, u32 num_qwords,
+xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
+				  struct iosys_map *map, void *ptr,
+				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	struct xe_vm *vm = pt_update->vops->vm;
 	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
 	int i;
 
-- 
2.34.1

