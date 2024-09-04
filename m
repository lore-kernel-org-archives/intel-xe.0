Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F50CCD4853
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4A10E804;
	Wed,  4 Sep 2024 16:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h26suzdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BF610E804
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725466978; x=1757002978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3oDAGF5HgSEVjhyWjyfgHzboBA3zOZb+X3AFr+l7TJM=;
 b=h26suzdnuwv3xb+qLdme7BKw4UzuHJXha9UIZ+RTGI9mTWjn/htr9x8q
 JFzkL3cCcZFX7b3dDgo694sOT6evRLP5VlBxspbAu/s07+bVlxXOibMK6
 QlXT8WpaOT0dvHQt5PVXLkMfUJ/f7vfvpl26tJsTKDixAV1IdjBt4Sc6r
 BJpI7mkq/P9rXwWLmMRB+0qjd6XTYx0tCqt3azCd2mbqcGoGJQwL16XDc
 n6KlXFpWv3e3yWDADZx7HB8x1QGSTk/1T6uEULaIFHZ6p9Q3waaNqDzxw
 f/LXRKn5tsheLEzfW24SwGrMVHoL1iAgrKM7KCkhhzVDuUv3D0MT/KdVM Q==;
X-CSE-ConnectionGUID: dSVCwUwfQuqFarVImQYbYA==
X-CSE-MsgGUID: aM6YiIAyRi+SP1s0XRoZuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24253906"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24253906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:22:57 -0700
X-CSE-ConnectionGUID: +5NySQ6tT86ZQS79xruOhQ==
X-CSE-MsgGUID: 0MNRZJ+JRuuAPpbhNgqBkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69951095"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:22:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Cleanup has_flat_ccs handling
Date: Wed,  4 Sep 2024 09:22:37 -0700
Message-ID: <20240904162238.2831202-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

The flag is set in XE_HP_FEATURES, but then overridden in all but one
xe_graphics_desc. Make it set only where needed.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7eb00a87b786..8642c079bc65 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -103,7 +103,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
 
 #define XE_HP_FEATURES \
 	.has_range_tlb_invalidation = true, \
-	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
 	.va_bits = 48, \
 	.vm_max_level = 3
@@ -120,6 +119,8 @@ static const struct xe_graphics_desc graphics_xehpg = {
 
 	XE_HP_FEATURES,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
+
+	.has_flat_ccs = 1,
 };
 
 static const struct xe_graphics_desc graphics_xehpc = {
@@ -145,7 +146,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 	.has_asid = 1,
 	.has_atomic_enable_pte_bit = 1,
-	.has_flat_ccs = 0,
 	.has_usm = 1,
 };
 
@@ -156,7 +156,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		BIT(XE_HW_ENGINE_CCS0),
 
 	XE_HP_FEATURES,
-	.has_flat_ccs = 0,
 };
 
 #define XE2_GFX_FEATURES \
-- 
2.43.0

