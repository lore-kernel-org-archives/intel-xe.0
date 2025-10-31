Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C9CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAE610E2FE;
	Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qo4F7Fu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1610E2FE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935384; x=1793471384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tbczvUCFgR+zaUwqA37hQH/0ZGMq2FDAR0rUWxp3eCk=;
 b=Qo4F7Fu7UviYDiwj35LPp1NqBWPM7v9VUu8esE1FpTaNL5mhLLjakiQh
 0NAqTf08PcpI5tN/AEOCf+U+8AeU3kMDzWSRPU1qyNAOFyIOvSCS8NJcT
 it5QsnJIWScSYnpA8LOHmsyE1V1Q5U+k6sZKjO/q7m0SHWI2A29vEb6QT
 L8mU7I7uICXnfU25ynBAJ1gli84lQ4yMfr/kpkYvAmu0YUIanw9pidX7Y
 15mSpV29ANNDfpCinYb37I+cDCYdP18S31XmwTky1CW2Qes+ahA0MGZON
 ujOOKTyC93EuzRkde68x8jcoUNshc0r7VEUaRthVpciIvbqpw4egqI/Ct A==;
X-CSE-ConnectionGUID: nABZXHr7S7CY6mCbiD3fqQ==
X-CSE-MsgGUID: 0di4U/EgTdOJNp1z03xRPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123850"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
X-CSE-ConnectionGUID: WUEF6U/ZSay8iiB2pxZTsg==
X-CSE-MsgGUID: bP1DAliZSPicv1q3eOBpzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987628"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/16] drm/xe/multi_queue: Add multi_queue_enable_mask to gt
 information
Date: Fri, 31 Oct 2025 11:29:21 -0700
Message-ID: <20251031182936.1882062-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c   | 2 ++
 drivers/gpu/drm/xe/xe_gt_types.h  | 5 +++++
 drivers/gpu/drm/xe/xe_pci.c       | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h | 1 +
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e91da9589c5f..34460d7ef71c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -93,6 +93,8 @@ static int info(struct seq_file *m, void *data)
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
 		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
 			   gt->info.engine_mask);
+		drm_printf(&p, "gt%d multi_queue_enable_mask 0x%x\n", id,
+			   gt->info.multi_queue_enable_mask);
 	}
 
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 0b525643a048..4a18bf772b22 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -140,6 +140,11 @@ struct xe_gt {
 		u64 engine_mask;
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
+		/**
+		 * @multi_queue_enable_mask: Bitmask of engine classes with
+		 * multi queue support enabled.
+		 */
+		u16 multi_queue_enable_mask;
 		/** @info.id: Unique ID of this GT within the PCI Device */
 		u8 id;
 		/** @info.has_indirect_ring_state: GT has indirect ring state support */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e59642e7820..b5eaf0fc105c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -754,6 +754,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.type = XE_GT_TYPE_MAIN;
 	gt->info.id = tile->id * xe->info.max_gt_per_tile;
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
+	gt->info.multi_queue_enable_mask = graphics_desc->multi_queue_enable_mask;
 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..77e09a53da64 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -58,6 +58,7 @@ struct xe_device_desc {
 
 struct xe_graphics_desc {
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
+	u16 multi_queue_enable_mask; /* bitmask of engine classes which support multi queue */
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
-- 
2.43.0

