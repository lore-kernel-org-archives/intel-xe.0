Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D84C04FDF
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF82310E6BD;
	Fri, 11 Aug 2023 16:08:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E5710E6AD
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J55FQxq0tSYCJEcWOv39uC1I/hTwC5UlP93Ic4yK8qQ=;
 b=UR38IEck1plccmzi6y/OmUUKM6kpXR8BmmIH/67qm+TXMxUpoorFW1Ut
 YRZr7ibc5rPC+UnY0Gw4MhXv7Xcd+pRx93KmGwZLWMJIre0WPGN3nH6FA
 J/QVsnIgWp1GcPgnrJ1UAi3CNe54p1sfs/yv0+dyf6z6uoJy0lOFtpJv4
 S2EQyleYe1BPu0x8Nn+84+2eXNy+O+yo/MJumHccaN7hQFWV2K7AD/SRJ
 wDkImGbdN8LIiHM0bWSTMujETcbkXSzdQCvntxQL/LVXuzeYdS4wqisIb
 5f0TssSx2grqL9vQ9JM04XQZNCg+d5ZoVJrijIV5crrH4SL45FD5yc+Vz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044333"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300469"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300469"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:13 -0700
Message-Id: <20230811160618.477297-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/15] drm/xe/xe2: Track VA bits independently of
 max page table level
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
Cc: Matt Roper <matthew.d.roper@intel.com>
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
index bfedcc7571b0d..5d278f5d0a4e1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -209,6 +209,8 @@ struct xe_device {
 		u8 gt_count;
 		/** @vm_max_level: Max VM level */
 		u8 vm_max_level;
+		/** @va_bits: Maximum bits of a virtual address */
+		u8 va_bits;
 
 		/** @is_dgfx: is discrete device */
 		u8 is_dgfx:1;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fdd2eba1b91f9..70d5f25c0d208 100644
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
index ba31b933eb8e0..df6ddbc52d7f6 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -14,6 +14,7 @@ struct xe_graphics_desc {
 	u8 rel;
 
 	u8 dma_mask_size;	/* available DMA address bits */
+	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 7ea235c71385f..1db77a7c90398 100644
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
index 2e99f865d7ecf..389ac5ba8ddf4 100644
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

