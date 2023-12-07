Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C842C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B46610E827;
	Thu,  7 Dec 2023 09:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5218410E822
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940315; x=1733476315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgufEyarBHjnQJId6DJ6Dp2pVb909R5SShSqs9KSq4A=;
 b=mUq+qemkX28t9Ja2jwlWQQvKAjoMCbJExkrRNXpM1db1/DRpa6incUI/
 OIy03avnyPmZXps7KVrBjuZMrd3Xkn0+oEZ0mjsBqh7S/heyAZuD15jLH
 7AbEcZ+S5UKTzCf1pkRz8jXtjn/znAzAy8jD2TTsUI9cGWT+am7QINGcv
 hmooyfL6+R3QSQHd2nQwa8WoGjS2sUgWBBWly4ZBPBPZ2xOv5MOPmfoyf
 /ca60+TICWds+8v87PKP2RVbsYzVCozWXPrdurjcyDCDFgFtKuvWWABQa
 RtclMejcyxn+QCPdA30gFXAi28590kwf1DBB6AMJuGzn4LbEl+EE8gsu9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391374027"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391374027"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067882"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067882"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:51 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:21 +0530
Message-Id: <20231207091922.1224800-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 8/9] drm/xe/xe2: Modify xe_bo_test for system
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

