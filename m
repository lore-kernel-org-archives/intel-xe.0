Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2000C77B60
	for <intel-xe@archiver.kernel.org>; Sat, 29 Apr 2023 06:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A7710E095;
	Sat, 29 Apr 2023 06:24:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A794610E07E
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682749458; x=1714285458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xKekkyxp/mlSWwtTDY5RS+qczo66lLijoXUg+mbb/xM=;
 b=gGSYkxuYkkkjh1vsOt9AweRIjhVd/FM5BZsWWmVRuf7r3koOu3eVzYZX
 Re+0/jVAGxeoOlZmm0Ewe7POIwfqGAnQOBALSpYevOaYSRLn2/sfMjhl0
 Ho7FqbUpdGDhkW/qpDxwJJqoLmOy6A3/PTGj3k9b1grfNN7CB8LQK+1ay
 P/LKHRSBkP9aEl8Dmbf8LoAY3salml3QnJ4xTeOTghL8ZOJ20WlrxLEgg
 Mkqz9H1qZRPpwSLTOnLv8gFRPJWEB3rfiqSvfswmJZ+I8d/LpmAl8zz+j
 qUxBXsBmHAESkeI7u0jX39YxScwNS0OqmUzfx8rTpOwq3xRu3M5INm0QJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375928426"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="375928426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="697829084"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="697829084"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 23:23:28 -0700
Message-Id: <20230429062332.354139-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429062332.354139-1-lucas.demarchi@intel.com>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe: Use media base for GMD_ID access
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

Instead of adding a hardcoded base, define GMD_ID() with a base
argument and use it in all places.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 +++-
 drivers/gpu/drm/xe/xe_pci.c          | 9 +++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4d87f1fe010d..da7b6d2c7e01 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -8,6 +8,8 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define MTL_MEDIA_GT_BASE			0x380000
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0					XE_REG(0xd00)
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
@@ -21,7 +23,7 @@
 #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
 #define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
 
-#define GMD_ID					XE_REG(0xd8c)
+#define GMD_ID(base)				XE_REG((base) + 0xd8c)
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
 #define   GMD_ID_STEP				REG_GENMASK(5, 0)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 35dcb8781f2a..8687e51cb0a4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -276,7 +276,7 @@ static const struct xe_gt_desc xelpmp_gts[] = {
 		.type = XE_GT_TYPE_MEDIA,
 		.vram_id = 0,
 		.mmio_adj_limit = 0x40000,
-		.mmio_adj_offset = 0x380000,
+		.mmio_adj_offset = MTL_MEDIA_GT_BASE,
 	},
 };
 
@@ -391,8 +391,9 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
+static u32 peek_gmdid(struct xe_device *xe, struct xe_reg gmdid_reg)
 {
+	u32 gmdid_offset = gmdid_reg.reg;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
 	u32 ver;
@@ -441,7 +442,7 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	ver = peek_gmdid(xe, GMD_ID.reg);
+	ver = peek_gmdid(xe, GMD_ID(0));
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -456,7 +457,7 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
+	ver = peek_gmdid(xe, GMD_ID(MTL_MEDIA_GT_BASE));
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
-- 
2.40.1

