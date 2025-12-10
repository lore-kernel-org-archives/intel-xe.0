Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F24D3B9B6
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E4010E56E;
	Wed, 10 Dec 2025 00:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixWRDQek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C182610E56E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327161; x=1796863161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzZfjzk924of6Tg5geae3w4SwQ8VQW8h0sIjgAOXItM=;
 b=ixWRDQekIAaiZD9XosPAOUKbX+LFKnevcJi+hbw439pJFfzKNsFChvQj
 TcXiDdSu1ZHqqRhVMJL4a8Xax61o3jcb8eYbTIlz7ZNYY6IgZzp1RlRBl
 dxjOfZGJ4CqR5V5LqriaPK2DK4xmVkl23ifpMa2Kiq7Bpc6vPBO/pRgf3
 Pa3JvwdgvHlreLy3M+5Q7EGS/4y49+QnA7kiH1fFZb4mYdpuJ0a08MOiW
 WCCVhT9Ri1ChQ0RD9TjDTzeTguUdkoL5xhM84W6qkNSd1SmURldjsJeXR
 EYtHt+KE34Ojx20WtvJNdd8TwhXobOrhV2xy76JlYb/kIcwKVtB1+GjNA Q==;
X-CSE-ConnectionGUID: 8okDp10eQ6qrdJxm/Pk2oQ==
X-CSE-MsgGUID: qEYpeQ4QS5S53uSMDnKqKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180365"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180365"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:21 -0800
X-CSE-ConnectionGUID: yTbWrwXhSJCiuUGqs2gLQA==
X-CSE-MsgGUID: 6hwNMlNeS9eXt+iHHjS6ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421501"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v5 01/17] drm/xe/multi_queue: Add multi_queue_enable_mask to
 gt information
Date: Tue,  9 Dec 2025 16:39:12 -0800
Message-ID: <20251210003913.1612141-20-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
References: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c   | 2 ++
 drivers/gpu/drm/xe/xe_gt_types.h  | 5 +++++
 drivers/gpu/drm/xe/xe_pci.c       | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h | 1 +
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0f8a96a05a8e..4fa423a82bea 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -93,6 +93,8 @@ static int info(struct seq_file *m, void *data)
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
 		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
 			   gt->info.engine_mask);
+		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
+			   gt->info.multi_queue_engine_class_mask);
 	}
 
 	return 0;
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
index c8188a5b0f76..16b3eb247439 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -764,6 +764,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.type = XE_GT_TYPE_MAIN;
 	gt->info.id = tile->id * xe->info.max_gt_per_tile;
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
+	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f19f35359696..b06c108e25e6 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -60,6 +60,7 @@ struct xe_device_desc {
 
 struct xe_graphics_desc {
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
+	u16 multi_queue_engine_class_mask; /* bitmask of engine classes which support multi queue */
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
-- 
2.43.0

