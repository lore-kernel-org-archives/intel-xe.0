Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89B4EE0216
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87F610E9B9;
	Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGjD60iM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF7610E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012049; x=1757548049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=36s7AEYfb+EBCd5NijTyt4l8BlSpkW9qgqfWenqmJ7A=;
 b=cGjD60iMA+toVuzuKoseyWcUmoU7rITgIpUhoPyTpyKtqf9PrbHKL2E1
 Tal+IykkBgbe+6Cu9hyJ04uXQ+vm1dDrh1XxQdjDULhhXs2Y9kShirEd+
 +mKv8qkTHM4F2u2Q9Um7e+UHS28Fojc7rm76L+01wEWDNlaMlT/vA+zuW
 ueZyMS4zM/OoCm2k2MNu/6+x1eUH0TMlCqtOrVtHs+wCXvEP94RDYQ0/U
 OA/Vk8W5jjcRwmFYYivN4HLollo+PNV2E8ulzRQWQL0smnuq2Eelxjk0F
 NnLobPGAuUPCFfx6vqhVeUTaO+IjI2dYqU+QsnNYfk3Rx6UW8ifJQ/B4+ A==;
X-CSE-ConnectionGUID: Aq6N6Vc0TVyXh/YIh2j73A==
X-CSE-MsgGUID: PY6XzQIkSuyJQga1Czx10A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144321"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: w3/wVtdbTN+89FhYASUjBQ==
X-CSE-MsgGUID: g1j4PLe8R/G2RX+rB4jmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989637"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 30/43] drm/xe/wopcm: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:50 -0700
Message-ID: <20240910234719.3335472-75-matthew.d.roper@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d3a99157e523..93c82825d896 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -123,8 +123,8 @@ static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
 static bool __wopcm_regs_locked(struct xe_gt *gt,
 				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
 {
-	u32 reg_base = xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET);
-	u32 reg_size = xe_mmio_read32(gt, GUC_WOPCM_SIZE);
+	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
+	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
 
 	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
 	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
@@ -150,13 +150,13 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
 
 	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
-	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE, size, mask,
+	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
 					 size | GUC_WOPCM_SIZE_LOCKED);
 	if (err)
 		goto err_out;
 
 	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
-	err = xe_mmio_write32_and_verify(gt, DMA_GUC_WOPCM_OFFSET,
+	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
 					 base | huc_agent, mask,
 					 base | huc_agent |
 					 GUC_WOPCM_OFFSET_VALID);
@@ -169,10 +169,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
 	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
 		   DMA_GUC_WOPCM_OFFSET.addr,
-		   xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET));
+		   xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
 	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
 		   GUC_WOPCM_SIZE.addr,
-		   xe_mmio_read32(gt, GUC_WOPCM_SIZE));
+		   xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
 
 	return err;
 }
-- 
2.45.2

