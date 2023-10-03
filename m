Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B41AE8FDAF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0A410E071;
	Tue,  3 Oct 2023 20:22:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DE910E071
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696364574; x=1727900574;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M7BMnXO3xTtmGJQY05p4U2+g4A/myFWO9HuUAoS6dho=;
 b=VrmythAT+imsZTsOW4aKkmzC0+GB7j0rVIFZDkg1a6q3xAMrqjl++YwD
 HBK7gYxjgL/wYIXEPw9z8U3+b6tfRbc5876+xqxuo3VfxEKeJSO+PCNT+
 uE9DkbnYQoVugay9QAS2R7sQ3konf3C16JHg0I1Hh+zcJqL2OyshLrSAh
 TVmwovbqhLotIU8RsaGJBmzCdSCuIzXT9696+5TbXjNqU2DYjWa/f6q4j
 QuEhnAIGjzW1h53o4AOv1XgYm68dBnxD+Z6fz4X/uxHhXkTEtr+eVUGVS
 rmsPfKC7J2o5Nj8pelBFJqkf1ezKKKOR7QP6obTv4uwnAOw09hgcx5lAa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362330686"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="362330686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816833315"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="816833315"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:22:52 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Tue,  3 Oct 2023 16:22:45 -0400
Message-Id: <20231003202245.4082710-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
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

Device Physical Address (DPA) is the starting offset device memory.

Update xe_migrate identity map base PTE entries to start at dpa_base
instead of 0.

The VM offset value should be 0 relative instead of DPA relative.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
Changes since v1:
	- migrate identity map is Xe relative instead of tile
	- added KUNIT test to test between tiles if available

 drivers/gpu/drm/xe/tests/xe_migrate.c | 37 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 6906ff9d9c31..75b06f0bd755 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops sanity_ops = {
 		} } while (0)
 
 static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
-		      struct kunit *test)
+		      struct kunit *test, u32 region)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 	u64 retval, expected = 0;
@@ -111,7 +111,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
 						   bo->size,
 						   ttm_bo_type_kernel,
-						   XE_BO_CREATE_SYSTEM_BIT |
+						   region |
 						   XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(sysmem)) {
 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
@@ -187,6 +187,27 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_bo_put(sysmem);
 }
 
+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
+			     struct kunit *test)
+{
+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT);
+}
+
+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
+			   struct kunit *test)
+{
+	u32 region;
+
+	if (bo->ttm.resource->mem_type == XE_PL_SYSTEM)
+		return;
+
+	if (bo->ttm.resource->mem_type == XE_PL_VRAM0)
+		region = XE_BO_CREATE_VRAM1_BIT;
+	else
+		region = XE_BO_CREATE_VRAM0_BIT;
+	test_copy(m, bo, test, region);
+}
+
 static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
 			   struct kunit *test, bool force_gpu)
 {
@@ -349,7 +370,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	check(retval, expected, "Command clear small last value", test);
 
 	kunit_info(test, "Copying small buffer object to system\n");
-	test_copy(m, tiny, test);
+	test_copy_sysmem(m, tiny, test);
+	if (IS_DGFX(xe) && xe->info.tile_count > 1) {
+		kunit_info(test, "Copying small buffer object to other vram\n");
+		test_copy_vram(m, tiny, test);
+	}
 
 	/* Clear a big bo */
 	kunit_info(test, "Clearing big buffer object\n");
@@ -366,7 +391,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	check(retval, expected, "Command clear big last value", test);
 
 	kunit_info(test, "Copying big buffer object to system\n");
-	test_copy(m, big, test);
+	test_copy_sysmem(m, big, test);
+	if (xe->info.tile_count > 1) {
+		kunit_info(test, "Copying big buffer object to opposite vram\n");
+		test_copy_vram(m, big, test);
+	}
 
 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
 	test_pt_update(m, pt, test, false);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 15f091a7bba3..42942aeef595 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -114,8 +114,12 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
 }
 
-static u64 xe_migrate_vram_ofs(u64 addr)
+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_device *xe)
 {
+	/* Remove the DPA to get a correct offset into identity table for the
+	 * migrate offset
+	 */
+	addr -= xe->mem.vram.dpa_base;
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
@@ -149,7 +153,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, xe);
 
 	return 0;
 }
@@ -225,12 +229,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	} else {
 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 
-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, xe);
 
 		if (xe->info.supports_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr, xe);
 		}
 	}
 
@@ -268,7 +272,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * Use 1GB pages, it shouldn't matter the physical amount of
 		 * vram is less, when we don't access it.
 		 */
-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
+		for (pos = xe->mem.vram.dpa_base;
+		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
+		     pos += SZ_1G, ofs += 8)
 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
 	}
 
@@ -443,8 +449,8 @@ static u32 pte_update_size(struct xe_migrate *m,
 		cmds += cmd_size;
 	} else {
 		/* Offset into identity map. */
-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
-					      vram_region_gpu_offset(res));
+		*L0_ofs = xe_migrate_vram_ofs(cur->start + vram_region_gpu_offset(res),
+					      tile_to_xe(m->tile));
 		cmds += cmd_size;
 	}
 
@@ -1062,7 +1068,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	xe_tile_assert(tile, update->qwords <= 0x1ff);
 	if (!ppgtt_ofs) {
 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
+							   XE_PAGE_SIZE), tile_to_xe(tile));
 	}
 
 	do {
-- 
2.35.1

