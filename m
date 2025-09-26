Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F2CCAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5699910EA94;
	Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cq2UwKM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E81890B2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902391; x=1790438391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DaDplf+ZgXpWwogeLZCb2W//4hJnnhMrQtrM1IXfISc=;
 b=Cq2UwKM6qA+ekDMruoUUFf8E35tc3AwZHHKt46dyAuXNgH/Mb+GhKKLL
 SpG6zCZPY+kP0tS/+Vh/gNkcnO4YCNhll4UGJ5H7emmmOjLAZ+bjCJHJl
 p6PUnplKDFOIXyjHinSRVrfReFBEBocIzEmYH90R3kruPIK7HM+g3+6Rh
 DU/xZwC8Vlm+Trwce4/QXUtMBs+mZV+iwF8g+SLzdvMLcaoaeWlW/ZshN
 IZ3uKYSNeda+I8ZZ8Sa9BeOgSat2JChmNrHI9lfJWtxZJbMRNw2DPrKmw
 M1M27+1CxPMghsOqhy4DiN43Muj00fyvDZaBSCMzxNATS0ECVH8hHFpsc w==;
X-CSE-ConnectionGUID: jxaY+f5qQwSReC9FbmLRQA==
X-CSE-MsgGUID: ahGuDopjTC+dFAAdkYgc5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63872191"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="63872191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
X-CSE-ConnectionGUID: bsktWl+PRdqd1SHF8recaQ==
X-CSE-MsgGUID: gDNA1YjuTomWiMw5S7pmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182914427"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 5/5] drm/xe/tests: Use xe_root_mmio_gt instead of
 xe_device_get_gt
Date: Fri, 26 Sep 2025 15:59:54 +0000
Message-ID: <20250926155948.145934-12-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926155948.145934-7-jonathan.cavitt@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
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

xe_root_mmio_gt(xe) is equivalent to xe_device_get_gt(xe, 0) in terms of
return value, but it takes up less line space and is slightly more
efficient during execution.  Replace instances of the latter with the
former in the xe test code.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e..33dbcb262204 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -63,7 +63,7 @@ static int guc_buf_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 
 	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
-	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
+	guc = &xe_root_mmio_gt(test->priv)->uc.guc;
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a..59a7c2d57fe2 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -13,7 +13,7 @@ static int guc_dbm_test_init(struct kunit *test)
 	struct xe_guc_db_mgr *dbm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
+	dbm = &xe_root_mmio_gt(test->priv)->uc.guc.dbm;
 
 	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..d211dfa09538 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -355,7 +355,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
 	struct xe_gt *root_gt, *gt;
 	int i;
 
-	root_gt = xe_device_get_gt(xe, 0);
+	root_gt = xe_root_mmio_gt(xe);
 	root_gt->uc.guc.g2g.bo = bo;
 	root_gt->uc.guc.g2g.owned = true;
 	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..3c84bcacd0ac 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -13,7 +13,7 @@ static int guc_id_mgr_test_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
index 13701451b923..645c8b6de3db 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
@@ -38,7 +38,7 @@ static int relay_test_init(struct kunit *test)
 	xe = test->priv;
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
-	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	relay = &xe_root_mmio_gt(xe)->uc.guc.relay;
 	kunit_activate_static_stub(test, relay_get_totalvfs,
 				   replacement_relay_get_totalvfs);
 
-- 
2.43.0

