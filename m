Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA39CA0EC4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 05:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C39810E3DD;
	Wed, 13 Aug 2025 05:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoW5cxI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3810E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755063830; x=1786599830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JAsBgHfoHb0Ecyo4MAUWe71zmWKsiZIS3ui1HmcbX0E=;
 b=VoW5cxI7ao8loLBVxSgT1lT7xKu67wl46cfuGalpaztRA5XNZOSwMoae
 c+QiZEGWJ+NiGtEVOvnNuXuQRRqU6wAQ4zyyYPfPLVO5b9eteeeyiS5Mu
 h/r4A8m58BD6yRJNMJSx9ii9w+wrVHdohMJo47RO5hobGFwueIK2wh2fH
 /ihqnLCbxILHwvygHZ+V6i+2uzJyT0evvhlvUt7ccXhL1m7/fWE51DomU
 8anK/ClZL6E0cwiuLD+KBjcYumnp5jAJR4UdAWgrgljYxoLRfvoCNp0I3
 WjRn+IXbeOrvK0BuHEg88CzotzljChdTNKSQGZ5+7WPBgTDN0LiX5G9gp g==;
X-CSE-ConnectionGUID: X09GpkoHTBuDbM5iJt3snw==
X-CSE-MsgGUID: b/1+CIcuSXuzsIn6y5QlYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57307120"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57307120"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 22:43:49 -0700
X-CSE-ConnectionGUID: VXavbgOoT2SMEtUpymw6zQ==
X-CSE-MsgGUID: Jszz0lMkRZyQdmIjHeZ7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="190082953"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 22:43:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 alexander.usyskin@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, stuart.summers@intel.com
Subject: [PATCH] drm/xe/nvm: Use root tile mmio
Date: Wed, 13 Aug 2025 11:39:26 +0530
Message-ID: <20250813060926.2625463-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Use root tile mmio regs instead of gt mmio regs to allow
initialization of nvm in early probe for additional
usecases in future.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 61b0a1531a53..9ca4a5ae1693 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -39,17 +39,17 @@ static void xe_nvm_release_dev(struct device *dev)
 
 static bool xe_nvm_non_posted_erase(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
 	if (xe->info.platform != XE_BATTLEMAGE)
 		return false;
-	return !(xe_mmio_read32(&gt->mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
+	return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
 		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
 }
 
 static bool xe_nvm_writable_override(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	bool writable_override;
 	resource_size_t base;
 
@@ -72,7 +72,7 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 	}
 
 	writable_override =
-		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
+		!(xe_mmio_read32(mmio, HECI_FWSTS2(base)) &
 		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
 	if (writable_override)
 		drm_info(&xe->drm, "NVM access overridden by jumper\n");
-- 
2.47.1

