Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528B2C47072
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 07:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B3810E4F9;
	Wed, 15 Nov 2023 07:38:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF48E10E4F9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700033897; x=1731569897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X0xrEdTzv4rVzJ9/nCKWmaOBM9qAF+xbTXGSSSHbiug=;
 b=VQ7DnQPSXJDzE3vlrT6bgLe3xt3rmKzH0r6nmHIQeyPyZQQIR5guCtku
 bPKVpiGnptPHRRBL2tfbbmYNPCINhlCRSEqcczUreVvfqMwAmkZDkxeGa
 fwrZkfEnCPA5rEhHg7teFen4TkqmABBtNREr+8xNPTAisKnkq5DQfi3DQ
 7voGmN0qQLzwLHQiRYeE3hqwTwPl9VvFFFtRnkw7w1Vg4VcOH9rBWtli2
 6aG+eptbkHWJstnX7JXUZUzyfwY0knEq8VhbS63bx5QVTPTziGd+x3St4
 4ckCrYPkd80Wz1BJgWywAPOcn7WKNOxEBVqAyiVWf/ESgB9mn+CST1AgM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393689394"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="393689394"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 23:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096371377"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="1096371377"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.235])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 23:38:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:38:02 +0100
Message-Id: <20231115073804.1861-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Add device flag to indicate SR-IOV
 support
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

The Single Root I/O Virtualization (SR-IOV) extension to
the PCI Express (PCIe) specification suite is supported
starting from 12th generation of Intel Graphics processors.

Add a device flag that we will use to enable SR-IOV specific
code paths and to indicate our readiness to support SR-IOV.

We will enable this flag for the specific platforms once all
required changes and additions will be ready and merged.

Bspec: 52391
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 5 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 ++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c4232de40ae0..54694f98c91a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -158,6 +158,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 	return xe->info.has_flat_ccs;
 }
 
+static inline bool xe_device_has_sriov(struct xe_device *xe)
+{
+	return xe->info.has_sriov;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be11cadccbd4..f2ba4f746fa2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -253,6 +253,8 @@ struct xe_device {
 		u8 has_llc:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
+		/** @has_sriov: Supports SR-IOV */
+		u8 has_sriov:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
 		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682ba188e456..c1c8048bbc0f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 
 	u8 has_llc:1;
+	u8 has_sriov:1;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
 };
@@ -532,7 +533,6 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
-
 static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
 			const struct xe_subplatform_desc *subplatform_desc)
@@ -578,6 +578,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_sriov = desc->has_sriov;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
-- 
2.25.1

