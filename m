Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CD1C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21B510E42F;
	Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="It9rPN8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024EF10E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556580; x=1820092580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7jqq4BenHa5HnOItfb3TUeTm82VAxpVRiO36JXr47do=;
 b=It9rPN8YHjdMnn/W5rEpnn03cZzcUrvvtJqU9OfeKOEUKhV5e09gxt99
 WyKMa3iKuMPrs1TNFQvrgKNaW/KXfWH/YZbFQknlGzRWGJBbmrROojyr9
 Y0gvfAl23k9vjY+FJPp8PiOtZ0/sExObfKMuecSU1j+zla0O6wBX+YQMJ
 Iy1pUjQB2L7P/IU73d7Uqkwyhb+0jdk+EUQsGsE7e5GKlMb3+qC1Wz56L
 msE5qUHV3fL5EaoHQV+omTILmfy4AU9C40JMGzd4+5WW0P0hpN0Z2JnL7
 f86GrspeGra6zzR8YqF0yaYcYwCoxYErqxhpsNXUdVk5jPw1DgQC78akP w==;
X-CSE-ConnectionGUID: NA7C2JUNQB+Q2823N7Wb2w==
X-CSE-MsgGUID: qwi94ZxaS7+wmaxJWWi21w==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096798"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: 9ICoyNWxTBSgfleivlYJPw==
X-CSE-MsgGUID: psjuU3I/R36jE4IXJqU2tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563407"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 01/24] drm/xe: Drop struct xe_migrate_pt_update argument
 from populate/clear vfuns
Date: Fri,  4 Sep 2026 14:15:50 -0700
Message-Id: <20260904211613.3934307-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-2-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c |  9 +++++----
 drivers/gpu/drm/xe/xe_migrate.h | 12 +++++-------
 drivers/gpu/drm/xe/xe_pt.c      | 12 +++++-------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ff45c24d8889..149c5fa654e6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1760,6 +1760,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 			  struct xe_migrate_pt_update *pt_update)
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
+	struct xe_vm *vm = pt_update->vops->vm;
 	u32 chunk;
 	u32 ofs = update->ofs, size = update->qwords;
 
@@ -1791,10 +1792,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
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
@@ -1851,12 +1852,12 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
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
index a9acc62f78f0..2ec9de896dfe 100644
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
index 5d990c1c3740..854c0a59af71 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1092,9 +1092,8 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
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
@@ -2008,12 +2007,11 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
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

