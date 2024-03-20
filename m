Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A40C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 10:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFA810F518;
	Wed, 20 Mar 2024 10:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZWTu7l7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A310F518
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710929131; x=1742465131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OC4IEFc7gcQNstnFLtkZ0zg10T+FrsrN3worgIZovMI=;
 b=YZWTu7l7WFULznsDVfGDtsVHYwk1ckQl0SKXK95S5Bo0zmFH+L6SwlY3
 mhEU/4G2nlTK0XEFpVj/RmuVJRTpJd3WIpLz1mpDYBmpg0CmI91FbpSPG
 MS9hfA2rCCFdX4Ui7GbalXg4oiw7yZLfv530MqzhHwnx37ulNRlHWt5H8
 EKasBhmVxnVmrU/fOBD+sOeuCa+7qN1v6FODvm4igNJrPOQXIK2JIoKWC
 myAYVCb0r5nKdZ8s26PEbrAqWglln4OZUavHEk1eDMOkgDwdztJhQXr7G
 +HK7yB96ji84ITHfUgd4fCFrs4z53vrtL3KQ5cRTIXsmGtPbLzCgCNW/h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6051370"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="6051370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="18845747"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 20 Mar 2024 03:05:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/xe_migrate: Fix potential overflows expression
Date: Wed, 20 Mar 2024 15:48:35 +0530
Message-Id: <20240320101835.3266429-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Cast to proper datatypes to avoid overflows.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
These errors were highlighted by Coverity. I'm uncertain whether they
require attention or if it would be more appropriate to label them as
false positives within the tool.

I've submitted this patch in case addressing the issues is necessary.
However, if reviewers determine that these issues should be marked as
false positives or ignored within the tool, that option is also
available

 drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..2ba4fb9511f6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (vm->flags & XE_VM_FLAG_64K && level == 1)
 			flags = XE_PDE_64K;
 
-		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
+		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
 						  XE_PAGE_SIZE, pat_index);
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
 			  entry | flags);
@@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Write PDE's that point to our BO. */
 	for (i = 0; i < num_entries - num_level; i++) {
-		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
+		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
 						  pat_index);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
@@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 #define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
 #define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
 	drm_suballoc_manager_init(&m->vm_update_sa,
-				  (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
+				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
 				  NUM_VMUSA_UNIT_PER_PAGE, 0);
 
 	m->pt_bo = bo;
@@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
 	struct xe_vm *vm = m->q->vm;
 	u16 pat_index;
 	u32 ptes;
-	u64 ofs = at_pt * XE_PAGE_SIZE;
+	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
 	/* Indirect access needs compression enabled uncached PAT index */
-- 
2.25.1

