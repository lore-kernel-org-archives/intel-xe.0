Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F7CC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B823112CEC;
	Tue, 30 Apr 2024 16:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTRv1Hwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE28112CEA
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714495213; x=1746031213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tEABSVxEmmha0tiTILspXbZ3M+tyYNn/rTuI920OKsQ=;
 b=hTRv1HwkYnDcJ6s3sRwWvz4rWZf4JiherIws/BMnuAD5wf2NH3GM+krS
 4SQIG4sfzyGC++tEsn9B1+OKivR/yGaqZXSL12NF/1ED5RXkJLVBqL+7G
 pC4WtRw0f/C6CPx8prXSU6eXuSt39b7zYoTluNtsGzk27u2XRaTHCq6D0
 3EYffEWtMekhimjhQYR4iH990y7nduTrSCIz1//17QEXaEgMRDrhURyVA
 LRjxEdqs8e72smbhAqMb6Le1lQozeXVm2Gc85PnQ8S5S8ZFKKUCRQwTWD
 2nmAzaYcJ/hcAf7MFGB613OUdmXfNanj1nh3UN6mHxHCxDEsN6WQkYEPH w==;
X-CSE-ConnectionGUID: upJd4tnGTCCgpasnxpH9bw==
X-CSE-MsgGUID: GpELhSa7R22zDjxSmfWQ0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10073936"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10073936"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:13 -0700
X-CSE-ConnectionGUID: EC4/iKiYTfamkr/xESVHpA==
X-CSE-MsgGUID: QRy712n+T6SSTLcv+MwoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26519121"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:12 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v6 1/5] drm/xe: Introduce has_atomic_enable_pte_bit device info
Date: Tue, 30 Apr 2024 18:25:25 +0200
Message-ID: <20240430162529.21588-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add has_atomic_enable_pte_bit to specify that a device
has PTE_AE bit in its PTE feild. Currently XE2 and PVC
supports this so set this for those two.

This will help consolidate setting atomic access bit in PTE
logic which is spread between multiple files.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0f68c55ea405..7cddb00f9c35 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -281,6 +281,8 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
+		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
+		u8 has_atomic_enable_pte_bit:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a0cf5dd803c2..5618318e6f3a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -146,6 +146,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
 	.has_asid = 1,
+	.has_atomic_enable_pte_bit = 1,
 	.has_flat_ccs = 0,
 	.has_usm = 1,
 };
@@ -163,6 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
+	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 1, \
@@ -629,6 +631,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
+	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index b1ad12fa22d6..e1f2b4879fc2 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -25,6 +25,7 @@ struct xe_graphics_desc {
 	u8 max_remote_tiles:2;
 
 	u8 has_asid:1;
+	u8 has_atomic_enable_pte_bit:1;
 	u8 has_flat_ccs:1;
 	u8 has_range_tlb_invalidation:1;
 	u8 has_usm:1;
-- 
2.42.0

