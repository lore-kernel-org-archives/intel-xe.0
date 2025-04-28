Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D79EC369D1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 02:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE3F10E0F3;
	Mon, 28 Apr 2025 02:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAroZvAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B207310E0F3
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 02:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745807009; x=1777343009;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kk36bvg6VEL15c6jMuLpmvUd2c55wkGS2VHa4pmzYXY=;
 b=QAroZvAnCs2uBIPKhWJJHXl4VPBuTvovgCAHpHlYeIIBZ411jwsWNIyE
 b0QUht86IyV/OVAIW/aZdpgkanjCRzbKpGWSfuPnzQfJx9HZTBaZuH0yl
 abtvKU7okxwDlKIwklsinLQjV0tzbc4kCqexOQPlH548xGepcmzqZeFJP
 nnHdciZYrjEOmHx5hSU8Wbwx2hYQAk4Z9k/ev5MTGkwnc5ht+NO3M7L9m
 htAaICby7dhUWpvVzTq+ueRKRbyQWMeVfwSiJM1057HKH1PZ1QPK1pEu6
 m5TWLK1i7tFYgdLTd+3jvwNUZJyi66w8Ek3eWsxp6IvKQKQlS6zMfm79d w==;
X-CSE-ConnectionGUID: hGQsXPnaR1OsbhoFKVJEnA==
X-CSE-MsgGUID: Z+yjXCsGQkiemSwUoH8CSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50038412"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50038412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:23:28 -0700
X-CSE-ConnectionGUID: R2e9SaS0S+uJZHbrutw3Dg==
X-CSE-MsgGUID: IdKVuQ3PTpufpaNiUXhAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="138198389"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:21:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Drop force_alloc from xe_bo_evict in selftests
Date: Sun, 27 Apr 2025 19:23:18 -0700
Message-Id: <20250428022318.877860-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The force_alloc flag was removed from TTM / Xe but updating the
selftests to new function interfaces was missed. Remove argument from
xe_bo_evict in selftests.

v2:
 - Fix dma-buf, migrate selftests (CI)

Fixes: 55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      | 2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 230eb824550f..378dcd0fb414 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	}
 
 	/* Evict to system. CCS data should be copied. */
-	ret = xe_bo_evict(bo, true);
+	ret = xe_bo_evict(bo);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return ret;
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index cedd3e88a6fb..c53f67ce4b0a 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -65,7 +65,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	 * the exporter and the importer should be the same bo.
 	 */
 	swap(exported->ttm.base.dma_buf, dmabuf);
-	ret = xe_bo_evict(exported, true);
+	ret = xe_bo_evict(exported);
 	swap(exported->ttm.base.dma_buf, dmabuf);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 52f89476bf62..4a65e3103f77 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -509,7 +509,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
 	dma_fence_put(fence);
 
 	kunit_info(test, "Evict vram buffer object\n");
-	ret = xe_bo_evict(vram_bo, true);
+	ret = xe_bo_evict(vram_bo);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return;
-- 
2.34.1

