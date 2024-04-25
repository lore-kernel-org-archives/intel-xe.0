Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB43C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AE011A0E6;
	Thu, 25 Apr 2024 04:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZF0roXYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4A11A0E7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020884; x=1745556884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Up/k439KD0hsjUozQ1U74kt3cYx2IpJvsN6YIIcxBM=;
 b=ZF0roXYtqh9LOkRxbbr7MRpfya//539/XrEu9ltQGCkCP2g+UjxagP1o
 VGEwPCgd0Ce2y2hgq8dyrqajyeBj7hi5Y81Dib4LgjguHDWbUsm8GKCu2
 TSJoHSpiYdLgiK7W9akglzc4sSkg68txjfEkS5GKqX7U22+rbH5vQakoD
 hyV9sOOFE479EuvWzOlGCnbFkOzbfkiLmkqYBNFx5ufvrgyy/SaOnm2jS
 8p/rFidmPV450t2WFaVSVYxTQaRldWFCV7/ilBaRWjN+NJhMohn8wC8fO
 KIWuFhcv89SpzJ8WBQtrU8Rz/HzPEwYVQETzusq0xnSqcBD1NZOntNqX4 Q==;
X-CSE-ConnectionGUID: I52QTSU9Tl+U4WJUGIYN4Q==
X-CSE-MsgGUID: rYgbShIuTGSJUxzHnvArAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374884"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374884"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:44 -0700
X-CSE-ConnectionGUID: ibid+jNXScKeP20KNp3R4A==
X-CSE-MsgGUID: zCEt5FwYQ520UDuTvtpusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996514"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 13/13] drm/xe: Delete PT update selftest
Date: Wed, 24 Apr 2024 21:55:13 -0700
Message-Id: <20240425045513.1913039-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425045513.1913039-1-matthew.brost@intel.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
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

IGTs (e.g. xe_vm) can provide the exact same coverage as the PT update
selftest. The PT update selftest is dependent on internal functions
which can change thus maintaining this test is costly and provide no
extra coverage. Delete this test.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 86 ---------------------------
 1 file changed, 86 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 977d5f4e4490..b6e7f80c3774 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -62,36 +62,6 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 	return 0;
 }
 
-static void
-sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
-		   struct xe_tile *tile, struct iosys_map *map, void *dst,
-		   u32 qword_ofs, u32 num_qwords,
-		   const struct xe_vm_pgtable_update *update)
-{
-	struct migrate_test_params *p =
-		to_migrate_test_params(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));
-	int i;
-	u64 *ptr = dst;
-	u64 value;
-
-	for (i = 0; i < num_qwords; i++) {
-		value = (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
-		if (map)
-			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
-				  sizeof(u64), u64, value);
-		else
-			ptr[i] = value;
-	}
-
-	kunit_info(xe_cur_kunit(), "Used %s.\n", map ? "CPU" : "GPU");
-	if (p->force_gpu && map)
-		KUNIT_FAIL(xe_cur_kunit(), "GPU pagetable update used CPU.\n");
-}
-
-static const struct xe_migrate_pt_update_ops sanity_ops = {
-	.populate = sanity_populate_cb,
-};
-
 #define check(_retval, _expected, str, _test)				\
 	do { if ((_retval) != (_expected)) {				\
 			KUNIT_FAIL(_test, "Sanity check failed: " str	\
@@ -209,57 +179,6 @@ static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
 	test_copy(m, bo, test, region);
 }
 
-static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
-			   struct kunit *test, bool force_gpu)
-{
-	struct xe_device *xe = tile_to_xe(m->tile);
-	struct dma_fence *fence;
-	u64 retval, expected;
-	ktime_t then, now;
-	int i;
-
-	struct xe_vm_pgtable_update update = {
-		.ofs = 1,
-		.qwords = 0x10,
-		.pt_bo = pt,
-	};
-	struct xe_migrate_pt_update pt_update = {
-		.ops = &sanity_ops,
-	};
-	struct migrate_test_params p = {
-		.base.id = XE_TEST_LIVE_MIGRATE,
-		.force_gpu = force_gpu,
-	};
-
-	test->priv = &p;
-	/* Test xe_migrate_update_pgtables() updates the pagetable as expected */
-	expected = 0xf0f0f0f0f0f0f0f0ULL;
-	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
-
-	then = ktime_get();
-	fence = xe_migrate_update_pgtables(m, m->q->vm, NULL, m->q, &update, 1,
-					   NULL, 0, &pt_update);
-	now = ktime_get();
-	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
-		return;
-
-	kunit_info(test, "Updating without syncing took %llu us,\n",
-		   (unsigned long long)ktime_to_us(ktime_sub(now, then)));
-
-	dma_fence_put(fence);
-	retval = xe_map_rd(xe, &pt->vmap, 0, u64);
-	check(retval, expected, "PTE[0] must stay untouched", test);
-
-	for (i = 0; i < update.qwords; i++) {
-		retval = xe_map_rd(xe, &pt->vmap, (update.ofs + i) * 8, u64);
-		check(retval, i * 0x1111111111111111ULL, "PTE update", test);
-	}
-
-	retval = xe_map_rd(xe, &pt->vmap, 8 * (update.ofs + update.qwords),
-			   u64);
-	check(retval, expected, "PTE[0x11] must stay untouched", test);
-}
-
 static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 {
 	struct xe_tile *tile = m->tile;
@@ -398,11 +317,6 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		test_copy_vram(m, big, test);
 	}
 
-	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
-	test_pt_update(m, pt, test, false);
-	kunit_info(test, "Testing page table update using GPU\n");
-	test_pt_update(m, pt, test, true);
-
 out:
 	xe_bb_free(bb, NULL);
 free_tiny:
-- 
2.34.1

