Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B70EEE249
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E80910EC1F;
	Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtEK6a+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9682510EC1F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167498; x=1757703498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6UoXQL0Cg5aAOGcVjiIXUlIt17g6TgvcOsQVmvIKu04=;
 b=PtEK6a+xw46rFfM9TNIauqhI1ju+Eg6NpACcmgOFSa1s2kwVTBu8aV9t
 SY9MbEfMHFEbbDcZy8ulV807rSb4MWLoGfq4sP8P5CQP2+mhvSnj82Z0Q
 4fKYyv0ZMzcYdoeT9FreBBMYIo4oQU2vKTVXcqH5ChyJzRG2mGtBET6PQ
 aNXsNuU7OuEsoGt4BL/4sEh/jybfcizfkePYfWnFXcfoY1YaniRrPbD9Z
 17UUprRUud17bkIPB7j7iosQzUy5oLOWiW62uYOdq3P2K9MaEMDMD3gd0
 wXiRgodqyyiDqa9Qiy5zji19OMeVJNJRcqvuar0tPgwh4Sio2E9qszpae w==;
X-CSE-ConnectionGUID: WJI9rgb8Tx+rGFk9Ms3w9w==
X-CSE-MsgGUID: wOpCeTL2ST2SbWvEeg54+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202951"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:18 -0700
X-CSE-ConnectionGUID: 4fjUpa6xQ0io3L/uMXMoPQ==
X-CSE-MsgGUID: L4RJSdHmTpe5I7cksy8Efg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910144"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 09/23] drm/xe/tests/mocs: Update xe_force_wake_get() return
 handling
Date: Fri, 13 Sep 2024 00:45:49 +0530
Message-Id: <20240912191603.194964-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains.
Change assert condition to incorporate this change in return and
pass the return value to xe_force_wake_put()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index ea932c051cc7..2a4c97d67760 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -45,10 +45,10 @@ static void read_l3cc_table(struct xe_gt *gt,
 	u32 l3cc, l3cc_expected;
 	unsigned int i;
 	u32 reg_val;
-	u32 ret;
+	int fw_ref;
 
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
@@ -72,7 +72,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
 				    "l3cc idx=%u has incorrect val.\n", i);
 	}
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -82,13 +82,13 @@ static void read_mocs_table(struct xe_gt *gt,
 	u32 mocs, mocs_expected;
 	unsigned int i;
 	u32 reg_val;
-	u32 ret;
+	int fw_ref;
 
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
@@ -106,7 +106,7 @@ static void read_mocs_table(struct xe_gt *gt,
 				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
-- 
2.34.1

