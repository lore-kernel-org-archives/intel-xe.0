Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F769C41513
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D7310E3F8;
	Tue, 25 Jul 2023 20:28:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D1110E3F8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690316905; x=1721852905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fxjW+Ps/nbgd7MyM/a7U5fgKPwJq0ggJnb4t6b1hbMQ=;
 b=g+wMwbfVURYDCW3UtvxlTWKI5UWWdbTr0+PID7i9p0VDLepQLDO4BZgU
 ZLne6RNBdcIFJEZWF9vrgVaZX/Q9fSeoCldBQJ/vfHrvCu8ONgZn7iHdJ
 ZlA87fovIGKJodeq7K//qRU/IbLcXwN39kaNMabpeUYl85B6kKUmorbEs
 5c4m2zNz1QWIHhyrpqqd0NWUEjpYJR95rIF/8Jg5m+z+CmAMRI2cN6Nbn
 6ZvhOqYyGP1r+dxKbnNneLGusJUY7ElZpnt0jaLKEfCWc+xMQWm2eGmXe
 6d29GsCa6pFSfuT/xy8i7AM+oDooGER3cls1vC5YyuuJRAC5BLN4QuM1G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366717420"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="366717420"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726220310"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726220310"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 13:28:34 -0700
Message-Id: <20230725202836.3854908-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725202836.3854908-1-lucas.demarchi@intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Carve out top of DSM as reserved
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Top of DSM contains the WOPCM where kernel driver shouldn't access as
it contains data from other HW agents. Carve it out from the stolen
memory.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h      | 3 +++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 8be616a1bd51..dd7568badb4e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -101,4 +101,7 @@
 #define DSMBASE					XE_REG(0x1080C0)
 #define   BDSM_MASK				REG_GENMASK64(63, 20)
 
+#define STOLEN_RESERVED				XE_REG(0x1082C0)
+#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 271b3fba4129..3a7d7b42b43d 100644
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
+	stolen_size -= 1U << wopcm_size;
+
 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
 		return 0;
 
-- 
2.40.1

