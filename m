Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C593C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209510EB43;
	Fri, 12 Jan 2024 15:27:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFB710EB42
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073227; x=1736609227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mivy/LTZJ59A2IulqWY6Y9K8ZZw1DZkHTTlHeNxX3Jk=;
 b=MVAr4yGxtN5yT6vLMRSGz6fG676H9fG6o1bkfNmTpQKXSCo/1CvPuZYj
 CAbjIwrLg2rB3sdo5iCNKhx9Qo0Wa6EfGcClixcu/7k9awGxYzy/UvY0A
 oRdx4c2O3/Y+CqEvmk7+opyG1fzLE607HzSz7QkPAIOM2ceh+3VrdDc+w
 TAg2Gcz6JuVcHw7LvARdc+358waVuJsIUS5mIRn1tQf9lY1vbaAiNXKkk
 5fgQBFIysupuOmisRVNzTkNx201nPgXi2UkLRcBdHggrHPWDDYjx1c90T
 AbZEV6uYfB37jgoaTBBX+LATj3PpL7+TBjLP6Iiz+QiawaoUvb4fv690y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566372"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003188"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003188"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:04 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/8] drm/xe/vf: Don't check if LMEM is initialized if VF
Date: Fri, 12 Jan 2024 16:26:46 +0100
Message-Id: <20240112152649.849-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It is PF driver responsibility to verify that LMEM was correctly
initialized, also VF drivers don't have access to GU_CNTL register.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c8c5d74b6e90..d8ddd64c6e8f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -20,6 +20,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_sriov.h"
 #include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
@@ -363,13 +364,19 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
+	if (!IS_DGFX(xe))
+		return 0;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	/*
 	 * The boot firmware initializes local memory and assesses its health.
 	 * If memory training fails, the punit will have been instructed to
 	 * keep the GT powered down; we won't be able to communicate with it
 	 * and we should not continue with driver initialization.
 	 */
-	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
+	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
 		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
 		return -ENODEV;
 	}
-- 
2.25.1

