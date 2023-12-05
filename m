Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC88C10F05
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34BD10E639;
	Tue,  5 Dec 2023 21:34:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36D10E639
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812045; x=1733348045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgufEyarBHjnQJId6DJ6Dp2pVb909R5SShSqs9KSq4A=;
 b=d5zNxdQ74t3Zk2pSW0AEdTDtFE+xPcEJ+mwogYfX3kkT4AFB/ON6O9wG
 ygpcpvcgjenbq5jnrSocNBfwj6hZHNtrWJPbpi/XfJ0Y8QTHqJNvupizC
 mLtEKWpdKaVhyoDyxK88oG5lk/FM9ayLd8VNnOTHAdvUAhYQV/R0CTI6O
 raJP6OUfYPmJiWXCQ9ZkPkNfvY242PR38bs+otVztZTEQ2SSDyd8L3LKY
 Jdcc4P8Ho8ArloiyvhktTfqh1JEkaegyppUU20wcYZdzdVPFvqrRy3Cwn
 2vr69q9EMCfIcAZmPILJUH2Wgf1wCnDTHYMWL9VHvzYiAFbkZudJrTAz4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378983021"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="378983021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889079471"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="889079471"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:34:03 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 03:11:34 +0530
Message-Id: <20231205214135.958847-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
References: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 8/9] drm/xe/xe2: Modify xe_bo_test for system
 memory
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

Modify test to valid ccs clear and copy during evict/restore on
igfx.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 549ab343de80..5e4e19a246dc 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -112,16 +112,21 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
 			    struct kunit *test)
 {
 	struct xe_bo *bo;
-	u32 vram_bit;
+	u32 mem_bit;
 	int ret;
 
 	/* TODO: Sanity check */
-	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
-	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
-		   gt_to_tile(gt)->id);
 
-	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
-				 vram_bit);
+	mem_bit = IS_DGFX(xe) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id :
+				XE_BO_CREATE_SYSTEM_BIT;
+
+	if (IS_DGFX(xe))
+		kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id, gt_to_tile(gt)->id);
+	else
+		kunit_info(test, "Testing system memory\n");
+
+	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
+			       ttm_bo_type_device, mem_bit);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
@@ -160,8 +165,12 @@ static int ccs_test_run_device(struct xe_device *xe)
 
 	xe_device_mem_access_get(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		/* For igfx run only for primary gt */
+		if (!IS_DGFX(xe) && id > 0)
+			continue;
 		ccs_test_run_gt(xe, gt, test);
+	}
 
 	xe_device_mem_access_put(xe);
 
-- 
2.25.1

