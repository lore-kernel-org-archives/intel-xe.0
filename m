Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BAA1048930
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E190210EC58;
	Sat, 28 Feb 2026 01:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4IvFQqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F17410E1DA
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242508; x=1803778508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/D6E9y5gy12uaMV8+24KMJG+aVaWBTx9/1/7IomYtmU=;
 b=N4IvFQqh2ZjlrYrqeWDAok2cO9OYBTJeptZVWp3+aZDb11aDRGfMk6aS
 vJ8UEUottrh83fMUF1l2tG4sWcWI/C1rz9la5kSfYRMK6qFzeRLJugLpG
 tydy3JOOYe80ZBOBVGodboSrWd/e1ESXQSXuSVDpNK2KC8grTPatmFTn/
 85kAhQYbeSJWzzAIgI29QFa/8d0BoMAGpiVzN4Xty+pRjLX1u4+ORfBBR
 CTEvZTXQ+W3J/TqlXmiz9UycJeetqZ89sRQ5gMq8CDsojVC8WXQPSbiL+
 uv8yzp1X2WKRKgK8lprVQ8YYph6naNW7jNHwP7PFi8Dg5WVRO/r44Ottx A==;
X-CSE-ConnectionGUID: i0B20/erTrmYvxurRLDBAw==
X-CSE-MsgGUID: +fW2p620T6GlzR6WFO077g==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966340"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966340"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:06 -0800
X-CSE-ConnectionGUID: hmqfBTGsR4KWNDbnnjvkVA==
X-CSE-MsgGUID: OC9DLGNWQIeUiWNw+WUBlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854834"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 01/25] drm/xe: Drop struct xe_migrate_pt_update argument
 from populate/clear vfuns
Date: Fri, 27 Feb 2026 17:34:37 -0800
Message-Id: <20260228013501.106680-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Remove the xe_migrate_pt_update argument from the populate and clear
vfuns. This structure will not be available in run_job, where CPU binds
will be implemented. The populate path no longer needs it, and the clear
path already uses the VM field instead.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c |  9 +++++----
 drivers/gpu/drm/xe/xe_migrate.h | 12 +++++-------
 drivers/gpu/drm/xe/xe_pt.c      | 12 +++++-------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8af6c347bea8..f7e3a044bd78 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1656,6 +1656,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 			  struct xe_migrate_pt_update *pt_update)
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
+	struct xe_vm *vm = pt_update->vops->vm;
 	u32 chunk;
 	u32 ofs = update->ofs, size = update->qwords;
 
@@ -1687,10 +1688,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
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
@@ -1747,12 +1748,12 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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
index 1522afb37dcf..c3c0740f908d 100644
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
index 13b355fadd58..99b15d37267f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -980,9 +980,8 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
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
@@ -1811,12 +1810,11 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
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

