Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8932FC7EE2D
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9310E594;
	Thu, 11 May 2023 03:47:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A73910E595
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lhs7q/+NtnERADjvYLGFPJgBwLkoEb/XhNO+rj/TAzE=;
 b=GchhIUn3h7jSvwBw5spF5wBGHLKfn6aaZHO3bAK2mkDRYJa5Li4d4my1
 Zi/WQemirl50h0y6nwrhVIJYbO+4EKcJDbMF85ZjBM6XNSBkvYg6tEvCk
 assca2QpkCPFlzscxOJJCw6Am0reFdpildSJtXW3tn5rm11fc8iCR0DZh
 aNlPlr/EccFBtd6tNZDGYp15iZOl9SoPxNDnW9Rie/RcaYKxv8CtBdMLg
 IV6KyRA/lVW7QOPXh3OVy7CruPKA9kFf8x8/bN/SSUqNQv9TPJ7BX8ZDh
 ZP7pG9vfV4JisWsFpHgKQpesVfXPDvztxASH4FpBSeedP5HTOgTB9ace2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850639"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850639"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203207"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203207"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:06 -0700
Message-Id: <20230511034722.1929038-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/26] drm/xe: Drop vram_id
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The VRAM ID is always the tile ID; there's no need to track it
separately within a GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 6 +++---
 drivers/gpu/drm/xe/xe_pci.c      | 2 --
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index bee5a2031153..e4d1d17b1d3c 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -115,9 +115,9 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
 	int ret;
 
 	/* TODO: Sanity check */
-	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id;
+	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
 	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
-		   gt->info.vram_id);
+		   gt_to_tile(gt)->id);
 
 	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
 				 vram_bit);
@@ -179,7 +179,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	int err, i;
 
 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
-		   dev_name(xe->drm.dev), gt->info.id, gt->info.vram_id);
+		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
 
 	for (i = 0; i < 2; ++i) {
 		xe_vm_lock(vm, &ww, 0, false);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index be7c41024838..0f3508c72c79 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -34,7 +34,6 @@ struct xe_subplatform_desc {
 
 struct xe_gt_desc {
 	enum xe_gt_type type;
-	u8 vram_id;
 	u32 mmio_adj_limit;
 	u32 mmio_adj_offset;
 };
@@ -258,7 +257,6 @@ static const struct xe_device_desc dg2_desc = {
 static const struct xe_gt_desc pvc_gts[] = {
 	{
 		.type = XE_GT_TYPE_REMOTE,
-		.vram_id = 1,
 		.mmio_adj_limit = 0,
 		.mmio_adj_offset = 0,
 	},
-- 
2.40.0

