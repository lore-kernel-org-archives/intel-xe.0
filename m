Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4B4E743E6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 04:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15410E066;
	Fri, 29 Sep 2023 04:49:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AB910E066
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 04:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695962991; x=1727498991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y1YQHWvkZuNiNH7Fc+pZP048aJTD8GETte75WyuAGJs=;
 b=O1hUDBXh9DHUuZ7c+dqIlVLyelj/ktGTypaqZqNaJyJrUY+T2fm1h2MM
 k3CH5eSDjAkIwUp0iFcGTENr/EIqpCOSbPhHmLoMyFwdf4l+vGSavQXad
 dowRNS9a1HDfJTe2qOgrt/0woUNphV3KgKm2JEg9n0JVhRJ1Tf2KwMCtj
 vffyZ5rW77er7zxPcOLCmJKv/ApuPNP7cIbiOPz+zfIFimYm9yJAyESqK
 6dHcbwOzAkvbPOzevJ+bSk+FWS1wGq/wPm1LXa6h7dW30Harlz86Us6rf
 Zf94TSE+7Kl6yyMX1lwONmI9iaeK4jnDlq50+2m/TA+I8VjMisG4zYUzw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="838854"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="838854"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753262094"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="753262094"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:49:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 21:49:59 -0700
Message-Id: <20230929044959.3149265-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Extend reserved stolen sizes
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

For xe2, besides the previous sizes, the reserved portion of stolen can
also have 16MB and 32MB.

Bspec: 53148
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h      |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 32 ++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 8a93ab169e04..dbb0ea1a585e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -69,7 +69,7 @@
 #define GSMBASE					XE_REG(0x108100)
 
 #define STOLEN_RESERVED				XE_REG(0x1082c0)
-#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
+#define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
 
 #define MTL_RP_STATE_CAP			XE_REG(0x138000)
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 6ba6b1b7f34b..79fbd74a3944 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -86,6 +86,29 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	return ALIGN_DOWN(stolen_size, SZ_1M);
 }
 
+static u32 get_wopcm_size(struct xe_device *xe)
+{
+	u32 wopcm_size;
+	u64 val;
+
+	val = xe_mmio_read64_2x32(xe_root_mmio_gt(xe), STOLEN_RESERVED);
+	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
+
+	switch (val) {
+	case 0x5 ... 0x6:
+		val--;
+		fallthrough;
+	case 0x0 ... 0x3:
+		wopcm_size = (1U << val) * SZ_1M;
+		break;
+	default:
+		WARN(1, "Missing case wopcm_size=%llx\n", val);
+		wopcm_size = 0;
+	}
+
+	return wopcm_size;
+}
+
 static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -125,10 +148,11 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	}
 
 	/* Carve out the top of DSM as it contains the reserved WOPCM region */
-	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
-				     xe_mmio_read64_2x32(xe_root_mmio_gt(xe),
-							 STOLEN_RESERVED));
-	stolen_size -= (1U << wopcm_size) * SZ_1M;
+	wopcm_size = get_wopcm_size(xe);
+	if (drm_WARN_ON(&xe->drm, !wopcm_size))
+		return 0;
+
+	stolen_size -= wopcm_size;
 
 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
 		return 0;
-- 
2.40.1

