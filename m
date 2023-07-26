Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8061C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AE610E49D;
	Wed, 26 Jul 2023 16:10:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D64410E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KDlzmXVc7qluE+1CVyNGIm9fahrwnDv5dOUKM/AaBiM=;
 b=irbwIglqNijuRcrGESrn1FQKFYBG/46Rd3vuKSPtEjCQwd7uMoV6taM3
 CUhPRoJVdzKMh7o0XQtTUdOfIIV/pC3FSvdvaN1cOLg10duOg69RjbMtb
 bcX7/Du/EqSQHLRQF311wBkXsPvSQh6jlFSFAnsIusoONPbqJc65GzRXY
 kTD7lZOwETkhjIGeJfEAgnnXhwB2j8PXlQ1FiHCkY3VxFYwuq4vZSbCYK
 39kIyo5cPBa75H9A6GVql8vfzr2s//XFKdopdFQp0b4CvyxIHwtkGSWP5
 fsNAonJpyRNlLDM8HfpYKDsPXBu20IjKXAFLpNqawNGG+w+BKu98nz8jA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994907"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994907"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279378"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279378"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:07 -0700
Message-Id: <20230726160708.3967790-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/10] drm/xe: Carve out top of DSM as reserved
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Top of DSM contains the WOPCM where kernel driver shouldn't access as
it contains data from other HW agents. Carve it out from the stolen
memory. On a MTL system, the output now matches the expected values:

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h      | 3 +++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index dbf572d11af0..315f6f8dadf3 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -84,4 +84,7 @@
 #define DSMBASE					XE_REG(0x1080C0)
 #define   BDSM_MASK				REG_GENMASK64(63, 20)
 
+#define STOLEN_RESERVED				XE_REG(0x1082c0)
+#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 271b3fba4129..7bba8fff5a5d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,7 +89,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	u32 stolen_size;
+	u32 stolen_size, wopcm_size;
 	u32 ggc, gms;
 
 	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
@@ -124,6 +124,12 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 		return 0;
 	}
 
+	/* Carve out the top of DSM as it contains the reserved WOPCM region */
+	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
+				     xe_mmio_read64(xe_root_mmio_gt(xe),
+						    STOLEN_RESERVED));
+	stolen_size -= (1U << wopcm_size) * SZ_1M;
+
 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
 		return 0;
 
-- 
2.40.1

