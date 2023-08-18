Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0C0EE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E1E10E56B;
	Fri, 18 Aug 2023 22:08:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B747F10E56B
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1FFDWhsA8wO4uLpWDGU6ektX1/dCkE4UQ6hUO+cI+U=;
 b=Hinz3LNxMwTHTMNX8r4592cVvX6llZNf1uQQX9ct/c2JOXffKn9Jptkm
 NI4t79b4MoyQe3SOIZQbRNLvvQ1ape7uoBAcEYKo56rVmIxPgnICB8Ug+
 fAVG+yXo2SDfwWXiIVgSwqdmaArQvpCna8Kd+Q3jL2WSJTykvw1WVvlje
 nugrTfinGrUGuhWJPTYj8DRUk69ZbDc5Jn8kUPMkkmrLPcwzBxLY58SAP
 OK1gri3yzZGYQXNtlk2LToJNwb0ngVlRH5TIpnpO3BaRZECVC3XEY/GL6
 RZ9YZrRrQ+HQ7D9RSG9xwE0Vz+izVDuADtlk25v4ePcS47vRG+LJob78Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592992"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592992"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758203"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758203"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:19 -0700
Message-Id: <20230818220824.700519-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/15] drm/xe/xe2: Track VA bits independently
 of max page table level
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Starting with Xe2, a 5-level page table is always used, regardless of
the actual virtual address range supported by the platform.  The two
values need to be tracked separately in the device descriptor since Xe2
platforms only have a 48 bit virtual address range.

Bspec: 59505, 65637, 70817
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 6 ++++++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_query.c        | 3 +--
 drivers/gpu/drm/xe/xe_vm.c           | 2 +-
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 303447c093c5..18292aad87e9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -216,6 +216,8 @@ struct xe_device {
 		u8 gt_count;
 		/** @vm_max_level: Max VM level */
 		u8 vm_max_level;
+		/** @va_bits: Maximum bits of a virtual address */
+		u8 va_bits;
 
 		/** @is_dgfx: is discrete device */
 		u8 is_dgfx:1;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fdd2eba1b91f..70d5f25c0d20 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -106,6 +106,7 @@ static const struct xe_graphics_desc graphics_xelp = {
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
 	.dma_mask_size = 39,
+	.va_bits = 48,
 	.vm_max_level = 3,
 };
 
@@ -117,6 +118,7 @@ static const struct xe_graphics_desc graphics_xelpp = {
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
 	.dma_mask_size = 39,
+	.va_bits = 48,
 	.vm_max_level = 3,
 };
 
@@ -124,6 +126,7 @@ static const struct xe_graphics_desc graphics_xelpp = {
 	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
+	.va_bits = 48, \
 	.vm_max_level = 3
 
 static const struct xe_graphics_desc graphics_xehpg = {
@@ -157,6 +160,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 	XE_HP_FEATURES,
 	.dma_mask_size = 52,
 	.max_remote_tiles = 1,
+	.va_bits = 57,
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
@@ -182,6 +186,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
 	.has_range_tlb_invalidation = 1, \
 	.supports_usm = 0 /* FIXME: implementation missing */, \
+	.va_bits = 48, \
 	.vm_max_level = 4, \
 	.hw_engine_mask = \
 		BIT(XE_HW_ENGINE_RCS0) | \
@@ -587,6 +592,7 @@ static int xe_info_init(struct xe_device *xe,
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
+	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.supports_usm = graphics_desc->supports_usm;
 	xe->info.has_asid = graphics_desc->has_asid;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ba31b933eb8e..df6ddbc52d7f 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -14,6 +14,7 @@ struct xe_graphics_desc {
 	u8 rel;
 
 	u8 dma_mask_size;	/* available DMA address bits */
+	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 7ea235c71385..1db77a7c9039 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -197,8 +197,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
 	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
-	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
-		(9 * (xe->info.vm_max_level + 1));
+	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
 	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e99f865d7ec..389ac5ba8ddf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1207,7 +1207,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	kref_init(&vm->refcount);
 	dma_resv_init(&vm->resv);
 
-	vm->size = 1ull << xe_pt_shift(xe->info.vm_max_level + 1);
+	vm->size = 1ull << xe->info.va_bits;
 
 	vm->flags = flags;
 
-- 
2.40.1

