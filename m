Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538EAC74A4B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D9910E639;
	Mon, 13 Mar 2023 20:46:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028B610E633
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740364; x=1710276364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTplA6fd2mo0FDDdd1bwZK3PwXY+V0p+9xp3ZMXdN+s=;
 b=AoT/MoXmaBCfsk3cRZWJKGI1kHklLD/1HQ0MmW6xLyjjMHSxmyhAug33
 SqclC1xt2R5KXL1Bx2HL9b0aAtKYc0ayHhPDNq4ak7Cq9q2FCeD8osFat
 PTUXjdn7hkPGhzsYXGkk1ZPqV3q/0bRovhT/vg8bh4Z7Rvx1Qx5mMFhDF
 Uix6eX3GdFzIMIoeLGXOMfbnpoAmDW+6X03lVQ+lsAEN5jkM9bIWNH4GL
 r6MIe8yV35dNktemYKnbhWpPFOVfh9IMUXl4eSNePZNl56mWPLNGqGY6F
 y82eNUejQ483s+e8qCt3+s7sA+lg0OoHB+CY4qsrrjKT8n4PB7BzQ2Adb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334733930"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="334733930"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924650130"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924650130"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 21:45:19 +0100
Message-Id: <20230313204519.158888-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe/tests: Test both CPU- and GPU
 page-table updates with the migrate test
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

Add a test parameter to force GPU page-table updates with the migrate
test and test both CPU- and GPU updates. Also provide some timing
results.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/tests/xe_test.h    |  1 +
 drivers/gpu/drm/xe/xe_migrate.c       | 17 +++++++++++++++++
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index a3bace16282e..73a32f911515 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -64,6 +64,8 @@ sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
 		   u32 qword_ofs, u32 num_qwords,
 		   const struct xe_vm_pgtable_update *update)
 {
+	struct migrate_test_params *p =
+		to_migrate_test_params(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));
 	int i;
 	u64 *ptr = dst;
 	u64 value;
@@ -76,6 +78,10 @@ sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
 		else
 			ptr[i] = value;
 	}
+
+	kunit_info(xe_cur_kunit(), "Used %s.\n", map ? "CPU" : "GPU");
+	if (p->force_gpu && map)
+		KUNIT_FAIL(xe_cur_kunit(), "GPU pagetable update used CPU.\n");
 }
 
 static const struct xe_migrate_pt_update_ops sanity_ops = {
@@ -177,11 +183,12 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 }
 
 static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
-			   struct kunit *test)
+			   struct kunit *test, bool force_gpu)
 {
 	struct xe_device *xe = gt_to_xe(m->gt);
 	struct dma_fence *fence;
 	u64 retval, expected;
+	ktime_t then, now;
 	int i;
 
 	struct xe_vm_pgtable_update update = {
@@ -192,16 +199,26 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
 	struct xe_migrate_pt_update pt_update = {
 		.ops = &sanity_ops,
 	};
+	struct migrate_test_params p = {
+		.base.id = XE_TEST_LIVE_MIGRATE,
+		.force_gpu = force_gpu,
+	};
 
+	test->priv = &p;
 	/* Test xe_migrate_update_pgtables() updates the pagetable as expected */
 	expected = 0xf0f0f0f0f0f0f0f0ULL;
 	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
 
+	then = ktime_get();
 	fence = xe_migrate_update_pgtables(m, NULL, NULL, m->eng, &update, 1,
 					   NULL, 0, &pt_update);
+	now = ktime_get();
 	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
 		return;
 
+	kunit_info(test, "Updating without syncing took %llu us,\n",
+		   (unsigned long long) ktime_to_us(ktime_sub(now, then)));
+
 	dma_fence_put(fence);
 	retval = xe_map_rd(xe, &pt->vmap, 0, u64);
 	check(retval, expected, "PTE[0] must stay untouched", test);
@@ -344,7 +361,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		test_copy(m, big, test);
 	}
 
-	test_pt_update(m, pt, test);
+	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
+	test_pt_update(m, pt, test, false);
+	kunit_info(test, "Testing page table update using GPU\n");
+	test_pt_update(m, pt, test, true);
 
 out:
 	xe_bb_free(bb, NULL);
diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index 00c8a3f9af81..7a1ae213e750 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -18,6 +18,7 @@
  */
 enum xe_test_priv_id {
 	XE_TEST_LIVE_DMA_BUF,
+	XE_TEST_LIVE_MIGRATE,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index dfdc88aa8910..bbfdc28dc513 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -13,6 +13,7 @@
 #include <drm/xe_drm.h>
 
 #include "regs/xe_gpu_commands.h"
+#include "tests/xe_test.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_engine.h"
@@ -967,6 +968,16 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
 	return xe_vm_get(m->eng->vm);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+struct migrate_test_params {
+	struct xe_test_priv base;
+	bool force_gpu;
+};
+
+#define to_migrate_test_params(_priv) \
+	container_of(_priv, struct migrate_test_params, base)
+#endif
+
 static struct dma_fence *
 xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			       struct xe_vm *vm, struct xe_bo *bo,
@@ -974,11 +985,17 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			       u32 num_updates, bool wait_vm,
 			       struct xe_migrate_pt_update *pt_update)
 {
+	XE_TEST_DECLARE(struct migrate_test_params *test =
+			to_migrate_test_params
+			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
 	struct dma_fence *fence;
 	int err;
 	u32 i;
 
+	if (XE_TEST_ONLY(test && test->force_gpu))
+		return ERR_PTR(-ETIME);
+
 	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
 					  DMA_RESV_USAGE_KERNEL))
 		return ERR_PTR(-ETIME);
-- 
2.39.2

