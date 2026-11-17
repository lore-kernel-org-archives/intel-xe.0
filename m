Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C0606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D4o3pab7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E210EACD;
	Tue, 17 Nov 2026 00:56:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D7210EACB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794876961; x=1826412961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+YTsaKoCI9zxJ+rlWC2IYtEb+60k9KrSpMNWZzmSWWg=;
 b=D4o3pab7dyGvfcGGcYRCKK27J5nC9MdU+n0Dxot4U0TpubcE+OH59XtN
 L3PasqrkX4eNg/+cHQPxYiKvNoNLlSexIK7jdizJBHfDX0j+GTv5HPQxB
 +BKj7QD1wzoTrc3sNqziWAoUh8JVRFoJAykBLhyYOK7vqxfELaj0WY0/e
 aJ7pgDYDmS7bhm2L6vdL9DHYh164zKrrUVF2TS/+H2u0z5vka2hdbRr4Y
 KQu+t5sFgkk2HJMnV8cfgaGCAeJpYOgU36dEkAHMIX9q15l9mnbDSRz2f
 ai+S5c+gmF3ZQWgqVCmRG4rr8t3gom8hbegSbKRxe7cgQavyocs9Rma3h w==;
X-CSE-ConnectionGUID: IxeURjxPQF2TLSQoZTAJsQ==
X-CSE-MsgGUID: km4z1ZrPR7+Rj2sMvGMBaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3526340"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3526340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:56:01 -0800
X-CSE-ConnectionGUID: yJ07y0itQnyXd1tskXZ0ZQ==
X-CSE-MsgGUID: CcxMy0EoQfiWe1V7iLkT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9761872"
Received: from jesusnar-vm-u24.iil.labsad.intel.com ([10.111.58.210])
 by orviesa001.jf.intel.com with ESMTP; 16 Nov 2026 16:55:59 -0800
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jesus Narvaez <jesus.narvaez@intel.com>
Subject: [PATCH v4 1/2] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
Date: Tue, 17 Nov 2026 02:55:36 +0200
Message-ID: <20261117005534.2322094-5-jesus.narvaez@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117005534.2322094-4-jesus.narvaez@intel.com>
References: <20261117005534.2322094-4-jesus.narvaez@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Add a has_sem64 capability bit to the graphics/media IP descriptors,
set on every Xe3p platform that supports it. Graphics version 35.10 and
Media version 35.00 only gain support at stepping B0, so that exception
is applied when resolving the final gt->info.has_sem64 value.

The bit indicates whether the GT's command streamer supports the
MI_SEMAPHORE_WAIT_64 instruction. A platform's CS must not mix
MI_SEMAPHORE_WAIT and MI_SEMAPHORE_WAIT_64 within a context or across
context submissions, so both the primary and media GT must agree before
either one enables sem64; resolve has_sem64 once in xe_info_init() and
hand the single value to both GT allocators.

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_pci.c       | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci_types.h |  2 ++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index c00a7c171f80..cc7d6adb6aec 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -167,6 +167,8 @@ struct xe_gt {
 		 * error reporting support
 		 */
 		u8 has_uncorrectable_error_reporting:1;
+		/** @info.has_sem64: GT supports the MI_SEMAPHORE_WAIT_64 instruction */
+		u8 has_sem64:1;
 		/**
 		 * @info.has_xe2_blt_instructions: GT supports Xe2-style MEM_SET
 		 * and MEM_COPY blitter functionality.  Note that despite the
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 619653c68f2c..b33dc06cf8d2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -128,6 +128,7 @@ static const struct xe_graphics_desc graphics_xe3p_lpg = {
 	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
 	.num_geometry_xecore_fuse_regs = 3,
 	.num_compute_xecore_fuse_regs = 3,
+	.has_sem64 = 1,
 };
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
@@ -154,11 +155,20 @@ static const struct xe_media_desc media_xelpmp = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
-		BIT(XE_HW_ENGINE_GSCCS0)
+		BIT(XE_HW_ENGINE_GSCCS0),
+};
+
+static const struct xe_media_desc media_xe3p_lpm = {
+	.hw_engine_mask =
+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
+		BIT(XE_HW_ENGINE_GSCCS0),
+	.has_sem64 = 1,
 };
 
 static const struct xe_media_desc media_xe3p_hpm = {
 	.has_uncorrectable_error_reporting = 1,
+	.has_sem64 = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -199,7 +209,7 @@ static const struct xe_ip media_ips[] = {
 	{ 2000, "Xe2_LPM", &media_xelpmp },
 	{ 3000, "Xe3_LPM", &media_xelpmp },
 	{ 3002, "Xe3_LPM", &media_xelpmp },
-	{ 3500, "Xe3p_LPM", &media_xelpmp },
+	{ 3500, "Xe3p_LPM", &media_xe3p_lpm },
 	{ 3503, "Xe3p_HPM", &media_xe3p_hpm },
 };
 
@@ -904,6 +914,9 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 	gt->info.has_uncorrectable_error_reporting =
 		graphics_desc->has_uncorrectable_error_reporting;
+	/* excludes configs that don't support sem64 */
+	gt->info.has_sem64 = graphics_desc->has_sem64 &&
+		!(GRAPHICS_VERx100(xe) == 3510 && xe->info.step.graphics < STEP_B0);
 	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
 	if (!xe_configfs_get_enable_multi_queue(to_pci_dev(xe->drm.dev))) {
 		xe_gt_info(gt, "Multi-queue disabled via configfs\n");
@@ -954,6 +967,9 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
 	gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 	gt->info.has_uncorrectable_error_reporting = media_desc->has_uncorrectable_error_reporting;
+	/* excludes configs that don't support sem64 */
+	gt->info.has_sem64 = media_desc->has_sem64 &&
+		!(MEDIA_VERx100(xe) == 3500 && xe->info.step.media < STEP_B0);
 	gt->info.engine_mask = media_desc->hw_engine_mask;
 
 	return gt;
@@ -1108,6 +1124,13 @@ static int xe_info_init(struct xe_device *xe,
 		tile->media_gt = alloc_media_gt(tile, media_desc);
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
+
+		/* can't mix MI_SEMAPHORE_WAIT/_64 across GTs on the same device */
+		if (tile->media_gt && !(tile->primary_gt->info.has_sem64 &&
+					tile->media_gt->info.has_sem64)) {
+			tile->primary_gt->info.has_sem64 = false;
+			tile->media_gt->info.has_sem64 = false;
+		}
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 74a6cd461b21..90936f805d8f 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -84,6 +84,7 @@ struct xe_graphics_desc {
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 	u8 has_uncorrectable_error_reporting:1;
+	u8 has_sem64:1;
 };
 
 struct xe_media_desc {
@@ -91,6 +92,7 @@ struct xe_media_desc {
 
 	u8 has_indirect_ring_state:1;
 	u8 has_uncorrectable_error_reporting:1;
+	u8 has_sem64:1;
 };
 
 struct xe_ip {
-- 
2.43.0

