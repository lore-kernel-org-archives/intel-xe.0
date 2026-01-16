Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99BFC9830B
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D594110E277;
	Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlMxGce3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EB110E264
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601866; x=1800137866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wlmqQ9jJv2gIRa++8P7ZMrm+B5J6FovOydEUJB5pKM8=;
 b=PlMxGce3Qu5DCeCWI7dl/qzH32/AQ4WqGQPJEwW9A8TOgc3Qhkdx0kAT
 z8M0wVGW8FpcEWeTJDa3qUO7avrPI/6x/lMpysgkbuMiBSDoTp9M45cLs
 ENCiUUB8svohXwHI77sPLU5MTCEpUJIzKf647DVYZDF+i4rGqbju4EcMh
 tNPmL3mKflpaZUG+Vy/SI7/zl+Cz0jKda9eqc6o46KfvWBgQDi+AmHTw2
 UB98ZBlLmh9jgbdtE0dDAgsrqHzAqx13tjsV4NqDx+pzCa0xxCS3XmXPl
 HiL8nc0wQXaMgXUONK5Olg0rhQI/P+LX+jNuKtlMh10nXTHSSvEeW83CB g==;
X-CSE-ConnectionGUID: tyWtu2qTSMaIHnj06qgvjw==
X-CSE-MsgGUID: 4UcY6k9AQ169SmtaeAChPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123349"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: RAaRr/1GTuCnckJpZGyX9A==
X-CSE-MsgGUID: Qr9ebtqhTK6FqjYrwUi7kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962699"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 03/11] drm/xe: Add has_ctx_tlb_inval to device info
Date: Fri, 16 Jan 2026 14:17:23 -0800
Message-Id: <20260116221731.868657-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f689766adcb1..72453206267b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -353,6 +353,8 @@ struct xe_device {
 		u8 has_pre_prod_wa:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
+		/** @info.has_ctx_tlb_inval: Has context based TLB invalidations */
+		u8 has_ctx_tlb_inval:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
 		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2c3656126751..f6600a661860 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -892,6 +892,7 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 20acc5349ee6..7ccb0ab7a53b 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -72,6 +72,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
+	u8 has_ctx_tlb_inval:1;
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 };
-- 
2.34.1

