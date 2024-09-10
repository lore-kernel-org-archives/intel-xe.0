Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA26EE020F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E9210E96E;
	Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaBbektp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BFA10E933
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ErmVbIUScDvsgqWJhHEsNV0/jZgBv7t0YK8fPcJQPpw=;
 b=GaBbektpiPsvYtmlNWikhUVNl2lC3dee9NaICT4/nXiKxgQnvBltVMcZ
 j5f+0PZb2fNIBWWkHlxkFNTJ4xJGzfpzPN3bevvaXATkBr9yGAXl2ET+e
 MelKZbtdRcTA7Ft2dvVHH1IBQpyzGniB3bVBu+sPH8NiQ0Xpnx3Aki8tL
 45G4GBkFr52GmpNcPiz+86ltZ58fHQkLTDEI8edsygD95MlcorEPh1pa2
 XjyBut8AXeah+dUXw53+1TQepuY25ndEmGpTEHZG2hOHG3wp9PKEkdZC2
 fXkinpUJEgnIK5+JnSM5fbSPD7htU76b0hUI/Q/zvAPHaFMis4v9Lg36U A==;
X-CSE-ConnectionGUID: CuRABtNdS3G5wdIg1rIHIQ==
X-CSE-MsgGUID: S5o0DgvKTdG88Ou0eOQoCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144307"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144307"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
X-CSE-ConnectionGUID: M4PxCCVTQy+AD/Djm8K/DA==
X-CSE-MsgGUID: ExYZJt/sS4O3TRPbV+ZXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989588"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 16/43] drm/xe/stolen: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:36 -0700
Message-ID: <20240910234719.3335472-61-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f7113cf6109d..423856cc18d4 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -60,7 +60,7 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u64 stolen_size;
 	u64 tile_offset;
@@ -94,7 +94,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 	u32 wopcm_size;
 	u64 val;
 
-	val = xe_mmio_read64_2x32(xe_root_mmio_gt(xe), STOLEN_RESERVED);
+	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
 	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
 
 	switch (val) {
@@ -119,7 +119,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	u32 stolen_size, wopcm_size;
 	u32 ggc, gms;
 
-	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
+	ggc = xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
 
 	/*
 	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
@@ -159,7 +159,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	stolen_size -= wopcm_size;
 
 	if (media_gt && XE_WA(media_gt, 14019821291)) {
-		u64 gscpsmi_base = xe_mmio_read64_2x32(media_gt, GSCPSMI_BASE)
+		u64 gscpsmi_base = xe_mmio_read64_2x32(&media_gt->mmio, GSCPSMI_BASE)
 			& ~GENMASK_ULL(5, 0);
 
 		/*
-- 
2.45.2

