Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA2DC9EC83
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7689510E452;
	Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmYLTuKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0FE10E2FC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272758; x=1799808758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiQ0fsGpXflU5zsf81yjgviPOSGq1M3riwsk+/O56tQ=;
 b=MmYLTuKMXMAOtZL4ds/LEMADyHlNCP4rVVCP+Ne9AiFE7qW7wTyYtRGb
 wk3zk/9rSSWc1a4WZnDXFyCMYSyrt4q+MUsjtUct5N/v0FQ15m/t8QxFX
 dHJPz0DkZu3/ygpGkDlZypkducXlP99WiENK5TjsDtvlClVliPTbWovkD
 vNjfAc4Kjg95C/Wp8oTRTDjlkK7/+CbzpLayvWz+mgeE5zdCeolioZVW1
 NZ4oIa/KKM2hTJDD1jg+D5HEqUqiUkAqCTsGmsdXxGJnlNBnaalTKq5qx
 40cwyWgNYexBcwpKqbbNClrOUgfeCvJP28gTXrjP5AZIJ+UGCrgMiBbtn g==;
X-CSE-ConnectionGUID: t4QyJoT4SWisXi6xSn1xcw==
X-CSE-MsgGUID: Sjos4gBZQfeM/9B1cji3rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714526"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714526"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: oEhaImdaSpa/Cr1bRfBMvQ==
X-CSE-MsgGUID: kaZlEA13S1CwPDvSyN9VtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070314"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 03/12] drm/xe: Add has_ctx_tlb_inval to device info
Date: Mon, 12 Jan 2026 18:52:23 -0800
Message-Id: <20260113025232.3504648-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Add has_ctx_tlb_inval to device info indicating a device has context
basd TLB invalidation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4dab3057f58d..57cb5533679d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -351,6 +351,8 @@ struct xe_device {
 		u8 has_pre_prod_wa:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
+		/** @info.has_ctx_tlb_inval: Has context based TLB invalidations */
+		u8 has_ctx_tlb_inval:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
 		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91e0553a8163..6ea1199f703e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -889,6 +889,7 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5f20f56571d1..000b54cbcd0e 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -71,6 +71,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
+	u8 has_ctx_tlb_inval:1;
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 };
-- 
2.34.1

