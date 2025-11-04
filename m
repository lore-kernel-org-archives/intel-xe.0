Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1A6CCFA0C
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A4710E32B;
	Tue,  4 Nov 2025 18:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdPCwPah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927310E2B0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282317; x=1793818317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0SMG78jCS6Qj3uX+h/d/uOotVZiIcYBPYo/8cTj0dsc=;
 b=YdPCwPahfDz3fsrVc6khMk/5TmJOluKct9y0sajAKk9oH0QVkL1dfcpi
 0MgqfSsAYjIIPVGTqPTkhiuIYyKQXpi/bgfpDLWqr4HBWEICFwr+DRz/c
 9/GZjE0+47h9pijDVHzHXOw1mh6uv/TwXfKLhyQKijQzJ5X4q8hzDXp9g
 WPRbPlHOKIzJGaeFXBuU+xG2TbeoQDHvdAxALzghftfVCvcjihKJ9rqSN
 E5I9kdl9Rh8DOP6HvYwlAOjXH8AHMW1t7VfE6/V4RKQlpL2mcXG9Ij2UJ
 zojD8F9+O4VEsOxGhixGRFdXdMnEIjMDghGjXWaW69H9iXvhETjU63jbh Q==;
X-CSE-ConnectionGUID: 6q+DFmLmSYC3Uv34juQ/EA==
X-CSE-MsgGUID: F9oAyCfJQjaYi9Tns//H2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247741"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:56 -0800
X-CSE-ConnectionGUID: ivCFUO1qR9uFZCmQLfN1Cw==
X-CSE-MsgGUID: tDm3hUG3SXqCjzoHqyHi8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183066"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 01/16] drm/xe/multi_queue: Add multi_queue_enable_mask to
 gt information
Date: Tue,  4 Nov 2025 10:51:35 -0800
Message-ID: <20251104185150.246345-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

Add multi_queue_enable_mask field to the gt information structure
which is bitmask of all engine classes with multi queue support
enabled.

v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c   | 2 ++
 drivers/gpu/drm/xe/xe_gt_types.h  | 5 +++++
 drivers/gpu/drm/xe/xe_pci.c       | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h | 1 +
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e91da9589c5f..e1e3f7ddeff7 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -93,6 +93,8 @@ static int info(struct seq_file *m, void *data)
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
 		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
 			   gt->info.engine_mask);
+		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
+			   gt->info.multi_queue_engine_class_mask);
 	}
 
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 0a728180b6fe..5318d92fd473 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -140,6 +140,11 @@ struct xe_gt {
 		u64 engine_mask;
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
+		/**
+		 * @multi_queue_engine_class_mask: Bitmask of engine classes with
+		 * multi queue support enabled.
+		 */
+		u16 multi_queue_engine_class_mask;
 		/** @info.id: Unique ID of this GT within the PCI Device */
 		u8 id;
 		/** @info.has_indirect_ring_state: GT has indirect ring state support */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e59642e7820..927d3a62c02d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -754,6 +754,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.type = XE_GT_TYPE_MAIN;
 	gt->info.id = tile->id * xe->info.max_gt_per_tile;
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
+	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..975e9857f70c 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -58,6 +58,7 @@ struct xe_device_desc {
 
 struct xe_graphics_desc {
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
+	u16 multi_queue_engine_class_mask; /* bitmask of engine classes which support multi queue */
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
-- 
2.43.0

