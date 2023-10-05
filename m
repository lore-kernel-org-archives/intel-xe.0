Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448E7E92FCE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 22:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F19F10E49D;
	Thu,  5 Oct 2023 22:00:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199ED10E499
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696543254; x=1728079254;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7PaieEUnG2pGFAR4bshkzj4WKxLqhiQTRbxstDWZYBg=;
 b=kr6WwSbPM6cBFJ4nQ04rmtWUJtCPUdU/qs++yEKhk+TD21O37gu6D4o9
 lcxLyaOtQ94R2RHrRk/dmVvq+gVmhlrj61vWQ/FhlWe4QEU06GBu8ysQP
 +5ZLMUvco2nQU8fpLzee6BdDY5+d3GQ0dq8bmXbCgD+RUgihaf7Ru/0yK
 RMAn1+h60an+1TIE5S6uVyjwQpHlv3dt7Xz3m7g/RWkCN5CKI/inkw8Ta
 B6C4+bNl5Lsibg75wRPO6FtQnj2ayW9g5k4R1fk8Gk7S2deNR+e92eFzN
 sYcBKMUsqmAnCWkqsnN8s3zLmKrOhLVrsUHhuK0Hlg/x/AdTpZYWZ6/G5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386461083"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386461083"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 15:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="999105364"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="999105364"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 15:00:52 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Thu,  5 Oct 2023 18:00:40 -0400
Message-Id: <20231005220040.552765-3-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231005220040.552765-1-david.kershner@intel.com>
References: <20231005220040.552765-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/2] drm/xe/tests/xe_migrate.c: Add vram to
 vram KUNIT test
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

Add missing kunit test to migrate a bo from vram to vram

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 103 +++++++++++++++++---------
 1 file changed, 66 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 6906ff9d9c31..0db4b651ff1a 100644
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
@@ -108,83 +108,104 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	const char *str = big ? "Copying big bo" : "Copying small bo";
 	int err;
 
-	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
+	struct xe_bo *remote = xe_bo_create_locked(xe, m->tile, NULL,
 						   bo->size,
 						   ttm_bo_type_kernel,
-						   XE_BO_CREATE_SYSTEM_BIT |
+						   region |
 						   XE_BO_NEEDS_CPU_ACCESS);
-	if (IS_ERR(sysmem)) {
-		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
-			   str, PTR_ERR(sysmem));
+	if (IS_ERR(remote)) {
+		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %li\n",
+			   str, PTR_ERR(remote));
 		return;
 	}
 
-	err = xe_bo_validate(sysmem, NULL, false);
+	err = xe_bo_validate(remote, NULL, false);
 	if (err) {
 		KUNIT_FAIL(test, "Failed to validate system bo for %s: %li\n",
 			   str, err);
 		goto out_unlock;
 	}
 
-	err = xe_bo_vmap(sysmem);
+	err = xe_bo_vmap(remote);
 	if (err) {
 		KUNIT_FAIL(test, "Failed to vmap system bo for %s: %li\n",
 			   str, err);
 		goto out_unlock;
 	}
 
-	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
-	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource);
-	if (!sanity_fence_failed(xe, fence, big ? "Clearing sysmem big bo" :
-				 "Clearing sysmem small bo", test)) {
-		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
-		check(retval, expected, "sysmem first offset should be cleared",
+	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
+	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
+	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
+				 "Clearing remote small bo", test)) {
+		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
+		check(retval, expected, "remote first offset should be cleared",
 		      test);
-		retval = xe_map_rd(xe, &sysmem->vmap, sysmem->size - 8, u64);
-		check(retval, expected, "sysmem last offset should be cleared",
+		retval = xe_map_rd(xe, &remote->vmap, remote->size - 8, u64);
+		check(retval, expected, "remote last offset should be cleared",
 		      test);
 	}
 	dma_fence_put(fence);
 
-	/* Try to copy 0xc0 from sysmem to vram with 2MB or 64KiB/4KiB pages */
-	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
+	/* Try to copy 0xc0 from remote to vram with 2MB or 64KiB/4KiB pages */
+	xe_map_memset(xe, &remote->vmap, 0, 0xc0, remote->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
 
 	expected = 0xc0c0c0c0c0c0c0c0;
-	fence = xe_migrate_copy(m, sysmem, bo, sysmem->ttm.resource,
+	fence = xe_migrate_copy(m, remote, bo, remote->ttm.resource,
 				bo->ttm.resource);
-	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
-				 "Copying small bo sysmem -> vram", test)) {
+	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo remote -> vram" :
+				 "Copying small bo remote -> vram", test)) {
 		retval = xe_map_rd(xe, &bo->vmap, 0, u64);
 		check(retval, expected,
-		      "sysmem -> vram bo first offset should be copied", test);
+		      "remote -> vram bo first offset should be copied", test);
 		retval = xe_map_rd(xe, &bo->vmap, bo->size - 8, u64);
 		check(retval, expected,
-		      "sysmem -> vram bo offset should be copied", test);
+		      "remote -> vram bo offset should be copied", test);
 	}
 	dma_fence_put(fence);
 
 	/* And other way around.. slightly hacky.. */
-	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
+	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
 
-	fence = xe_migrate_copy(m, bo, sysmem, bo->ttm.resource,
-				sysmem->ttm.resource);
-	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
-				 "Copying small bo vram -> sysmem", test)) {
-		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
+	fence = xe_migrate_copy(m, bo, remote, bo->ttm.resource,
+				remote->ttm.resource);
+	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> remote" :
+				 "Copying small bo vram -> remote", test)) {
+		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
 		check(retval, expected,
-		      "vram -> sysmem bo first offset should be copied", test);
-		retval = xe_map_rd(xe, &sysmem->vmap, bo->size - 8, u64);
+		      "vram -> remote bo first offset should be copied", test);
+		retval = xe_map_rd(xe, &remote->vmap, bo->size - 8, u64);
 		check(retval, expected,
-		      "vram -> sysmem bo last offset should be copied", test);
+		      "vram -> remote bo last offset should be copied", test);
 	}
 	dma_fence_put(fence);
 
-	xe_bo_vunmap(sysmem);
+	xe_bo_vunmap(remote);
 out_unlock:
-	xe_bo_unlock(sysmem);
-	xe_bo_put(sysmem);
+	xe_bo_unlock(remote);
+	xe_bo_put(remote);
+}
+
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
 }
 
 static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
@@ -349,7 +370,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	check(retval, expected, "Command clear small last value", test);
 
 	kunit_info(test, "Copying small buffer object to system\n");
-	test_copy(m, tiny, test);
+	test_copy_sysmem(m, tiny, test);
+	if (xe->info.tile_count > 1) {
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
+		kunit_info(test, "Copying big buffer object to other vram\n");
+		test_copy_vram(m, big, test);
+	}
 
 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
 	test_pt_update(m, pt, test, false);
-- 
2.35.1

