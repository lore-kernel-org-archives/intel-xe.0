Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF110CD6E75
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CF211A1E1;
	Thu,  4 Jun 2026 17:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="XLOkyJ9u";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7141811A1D9
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593301;
 bh=nsddJwO0NDgnKQIW2BL37nxLKE2h1UyZ7QTRNHy7sqs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XLOkyJ9uQM/Zz2XZKWhUkr4Hah6VG6PHKCzSoX2M0UYtr+VDEsoMhLEZ1en3jcGu4
 X5S36R0ZqZ03PUURE8KUw0AMHLVVJyAfK9qrKBBWO68ZQl5mC2Kaip2cimaM40fUeq
 Zk9XJjy+Wen5NthHtoeA5aUplUQUlBjKV6xv17PYcKVQnjrgnQRIUsYHDaSCpbMjPd
 qBQjczJiK2nvIWkQjxqu2z7AplfnUd/YNdP2qaigOhyomS0l+21dO54iJNbI0egv6V
 SN7YYnQ+C/udiqJqxcPvUYFBWfrJyRPzax5euJpb684Bj4zqjpfmJp+UXD7feBGNaL
 Y+HqmCHJ0Wz1w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 01/24] drm/xe: Drop struct xe_migrate_pt_update argument from
 populate/clear vfuns
Date: Thu,  4 Jun 2026 19:14:37 +0200
Message-ID: <20260604171502.84047-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Remove the xe_migrate_pt_update argument from the populate and clear
vfuns. This structure will not be available in run_job, where CPU binds
will be implemented. The populate path no longer needs it, and the clear
path already uses the VM field instead.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-2-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c |  9 +++++----
 drivers/gpu/drm/xe/xe_migrate.h | 12 +++++-------
 drivers/gpu/drm/xe/xe_pt.c      | 12 +++++-------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9428dd5e7760c..d63e977b0e528 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1741,6 +1741,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 			  struct xe_migrate_pt_update *pt_update)
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
+	struct xe_vm *vm = pt_update->vops->vm;
 	u32 chunk;
 	u32 ofs = update->ofs, size = update->qwords;
 
@@ -1772,10 +1773,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
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
@@ -1832,12 +1833,12 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 				&pt_op->entries[j];
 
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
index 965c45889c726..1aec7bf944d59 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -40,7 +40,6 @@ enum xe_migrate_copy_dir {
 struct xe_migrate_pt_update_ops {
 	/**
 	 * @populate: Populate a command buffer or page-table with ptes.
-	 * @pt_update: Embeddable callback argument.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
 	 * @pos: If @map is NULL, map into the memory to be populated.
@@ -52,13 +51,12 @@ struct xe_migrate_pt_update_ops {
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
@@ -70,9 +68,9 @@ struct xe_migrate_pt_update_ops {
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
index 15ce77ce7793e..dc7d74c889a1d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1007,9 +1007,8 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
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
@@ -1858,12 +1857,11 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
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
2.53.0

