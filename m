Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70750C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 17:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3874010E377;
	Thu,  1 May 2025 17:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7qupuk9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F88810E271
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746120994; x=1777656994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3n+GGnsw6BPjRb9iyagx5Wwbex/dxHuhO224Y84DUD0=;
 b=b7qupuk9ofvCIcZZ6P4Sls++T4QebS+sY8wyo19qI0C6Tf79jr2KCvZ9
 e6U5eqBC+w1BWNoeLCKb5NhvAk746Dws95mYukd/wE8TCqsz+uuekXN1G
 itFnjmXD7WiXNn36lbafypM81C7dT2j2PIy/dcEy6gLeMmeDEMQzHW7V9
 gCw4NS57BgtROmxi87ULvjFy1rLEyZkmm61x8X6p10To7JzrJhuH9j6t/
 z5xqKNI2zD8k/0OX8tSpiKWp/9fXlYN3J/One0eezxhiS/WOVifP4AU1O
 xlFo3dPkZCkh61uMO9DdLu6P/XzD48q59w3TIXPWKPTTFh/vLPbR8MxtI g==;
X-CSE-ConnectionGUID: CSXhanxHQLCijA/A5c1KxQ==
X-CSE-MsgGUID: pV/B8g/mRX+CCKaS7E3ixw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59169281"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="59169281"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 10:36:33 -0700
X-CSE-ConnectionGUID: l6D420egQK6I/r3/aQnLKQ==
X-CSE-MsgGUID: 4N6aK7OBSBe3GajyeTUe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="134742999"
Received: from unknown (HELO DUT137ARLU.fm.intel.com) ([10.105.23.70])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 10:36:32 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: niranjana.vishwanathapura@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Date: Thu,  1 May 2025 17:36:26 +0000
Message-Id: <20250501173626.64481-1-stuart.summers@intel.com>
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

Make it explicit that the ASID is used to identify a VM
when issuing a ranged-based TLB invalidation.

/s/has_range_tlb_invalidation/has_range_tlb_invalidation_asid/

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h        | 4 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
 drivers/gpu/drm/xe/xe_pci.c                 | 6 +++---
 drivers/gpu/drm/xe/xe_pci_types.h           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 06c65dace026..3e49b88a8a62 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -327,8 +327,8 @@ struct xe_device {
 		u8 has_llc:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
-		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
-		u8 has_range_tlb_invalidation:1;
+		/** @info.has_range_tlb_invalidation_asid: Has range based TLB invalidations */
+		u8 has_range_tlb_invalidation_asid:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 084cbdeba8ea..c68f7cc8e175 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -366,7 +366,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
-	if (!xe->info.has_range_tlb_invalidation ||
+	if (!xe->info.has_range_tlb_invalidation_asid ||
 	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a4caa6222b6f..cfafcfcbbbc6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -91,7 +91,7 @@ static const struct xe_graphics_desc graphics_xelp = {
 };
 
 #define XE_HP_FEATURES \
-	.has_range_tlb_invalidation = true, \
+	.has_range_tlb_invalidation_asid = true, \
 	.va_bits = 48, \
 	.vm_max_level = 3
 
@@ -140,7 +140,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
 	.has_indirect_ring_state = 1, \
-	.has_range_tlb_invalidation = 1, \
+	.has_range_tlb_invalidation_asid = 1, \
 	.has_usm = 1, \
 	.va_bits = 48, \
 	.vm_max_level = 4, \
@@ -680,7 +680,7 @@ static int xe_info_init(struct xe_device *xe,
 	/* Runtime detection may change this later */
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 
-	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
+	xe->info.has_range_tlb_invalidation_asid = graphics_desc->has_range_tlb_invalidation_asid;
 	xe->info.has_usm = graphics_desc->has_usm;
 
 	for_each_remote_tile(tile, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index e9b9bbc138d3..3d1c745de2ac 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -19,7 +19,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_flat_ccs:1;
 	u8 has_indirect_ring_state:1;
-	u8 has_range_tlb_invalidation:1;
+	u8 has_range_tlb_invalidation_asid:1;
 	u8 has_usm:1;
 };
 
-- 
2.34.1

