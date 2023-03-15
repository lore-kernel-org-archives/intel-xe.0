Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C209DC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 08:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9967810E951;
	Wed, 15 Mar 2023 08:15:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABFC10E951
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 08:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678868117; x=1710404117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=49Z7kJrE64Ap9FUECyvCQVjcU1d7wT3UVuEwm0z9iiI=;
 b=laFv8/0UAt7tASwH45QKEtbU2hYpe+JY4MyvarvNqOHqJmPoxuhOGtUT
 eKsyOuyvwN5jaUAcmY1O4w1KAmZZtlIuXxG17som+Gzo3u54kjArAjZi1
 QJvDNwrHpYTPjBr2diRtzUfsqlWyZfFXeovfCPEjuJC6JBIaDBr1uK8y8
 RE8Ju3GHA2LA/z4BwxdSnYWh/Oi3xqWD6LGSH4RL7g1Dj7dw+T3j1ydfo
 w2anyMU22juRP/4xwjmIph2MxF4XHSnxxom51IGHDuSMV2cvylUDJJlbN
 1Px42rGhWBAeClIHpL+OCfCqBUaezWPHRCiLLq5ow7QBQbzLMBhQopRJJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317295849"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317295849"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 01:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681739217"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="681739217"
Received: from atheja-mobl2.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.127.182])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 01:15:15 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 13:45:00 +0530
Message-Id: <20230315081500.608346-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
References: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/2] drm/xe/tests: Adapt migrate_sanity_test
 for link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Link copy engines does not support XY_FAST_COLOR instruction and hence
use the MEM_SET instruction in its place. MEM_SET only support setting
8-bit value. To keep it simple, driver uses MEM_SET only to clear
address range.
migrate_sanity tests adapted such that it doesn't try to set any values
in platforms with link copy engines but validates that memory region is
cleared

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ac659b94e7f5..9bf73a2ce982 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -86,7 +86,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 		      struct kunit *test)
 {
 	struct xe_device *xe = gt_to_xe(m->gt);
-	u64 retval, expected = 0xc0c0c0c0c0c0c0c0ULL;
+	u64 retval, expected;
 	bool big = bo->size >= SZ_2M;
 	struct dma_fence *fence;
 	const char *str = big ? "Copying big bo" : "Copying small bo";
@@ -117,7 +117,12 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	}
 
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
-	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource, 0xc0c0c0c0);
+
+	expected = (xe->info.has_link_copy_engine) ? 0 : 0xc0c0c0c0c0c0c0c0ULL;
+	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource,
+				 (xe->info.has_link_copy_engine) ? 0 :
+				 0xc0c0c0c0);
+
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing sysmem big bo" :
 				 "Clearing sysmem small bo", test)) {
 		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
@@ -287,7 +292,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	bb->len = 0;
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
-	expected = 0x12345678U;
+	/*
+	 * Platforms with link copy engines currently doesn't support setting a
+	 * value, but only allow clearing
+	 */
+	expected = (xe->info.has_link_copy_engine) ? 0 : 0x12345678U;
 
 	emit_clear(m->gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
 		   expected, IS_DGFX(xe));
@@ -302,7 +311,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* Clear a small bo */
 	kunit_info(test, "Clearing small buffer object\n");
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
-	expected = 0x224488ff;
+	expected = (xe->info.has_link_copy_engine) ? 0 : 0x224488ff;
 	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, expected);
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
@@ -321,7 +330,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* Clear a big bo with a fixed value */
 	kunit_info(test, "Clearing big buffer object\n");
 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
-	expected = 0x11223344U;
+	expected = (xe->info.has_link_copy_engine) ? 0 : 0x11223344U;
 	fence = xe_migrate_clear(m, big, big->ttm.resource, expected);
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
-- 
2.25.1

