Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572D7EE01FB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96D010E94C;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpwZDAq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF3E10E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+Zcv2PrFK6GzEGq8tqKLvbnJrhtAlJCMOqEYnvFODc=;
 b=jpwZDAq1FnCfyTVPTwWBZo4qs2Ay8mqpZ+yVvIoDpAcb0QdgEfAqPacO
 cP1xoC1Dx/dUATTw0a5WaUvuX+4kN3u2aLxtTkvcX9K75Jyu3gG2CvGMA
 xJLA/6voKI6DWrvXE42pNZhNEPXY+lHBc7vSiZMR4yo4hvTpf8mPhu5S7
 +gm+DoeyIoLqg1wMUV59kw3u0P3/VOrtyIFvY6uX4Teo+zChMVit9R7Q7
 67UuIrPnQXLUcv/X5Lz6kfhbJmJdYlDySuqtaxaUqhM7pFEEEwmv7cmO8
 YIqKnmZ0itFzxQX330DpDAt461pFbT/zXDUnAVXofEolJ8f7dgkakSpsg Q==;
X-CSE-ConnectionGUID: 6jEx2LQlRmmrA6OLuOHT1A==
X-CSE-MsgGUID: v8PQ5F/bTR2n0secRyfaUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144317"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144317"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: GBIOi0mHT5a7bcuHjypBbA==
X-CSE-MsgGUID: xn05FHcuQ8iAVhj6tzRUqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989623"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 26/43] drm/xe/mocs: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:46 -0700
Message-ID: <20240910234719.3335472-71-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/tests/xe_mocs.c |  4 ++--
 drivers/gpu/drm/xe/xe_mocs.c       | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 79be73b4a02b..ea932c051cc7 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -55,7 +55,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
 			else
-				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
+				reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i >> 1));
 
 			mocs_dbg(gt, "reg_val=0x%x\n", reg_val);
 		} else {
@@ -94,7 +94,7 @@ static void read_mocs_table(struct xe_gt *gt,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 		mocs_expected = get_entry_control(info, i);
 		mocs = reg_val;
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 7ff0ac5b799a..8df41cd12d51 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -278,7 +278,7 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
 
 		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
 			   j++,
@@ -310,7 +310,7 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 			else
-				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+				reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u ] (%#8x)\n",
 				   i,
@@ -383,7 +383,7 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
 
 		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
 			   j++,
@@ -428,7 +428,7 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
 
 		drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
 			   j++,
@@ -510,7 +510,7 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u]  (%#8x)\n",
 			   i,
@@ -553,7 +553,7 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u]  (%#8x)\n",
 			   i,
@@ -690,7 +690,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 		if (regs_are_mcr(gt))
 			xe_gt_mcr_multicast_write(gt, XEHP_GLOBAL_MOCS(i), mocs);
 		else
-			xe_mmio_write32(gt, XELP_GLOBAL_MOCS(i), mocs);
+			xe_mmio_write32(&gt->mmio, XELP_GLOBAL_MOCS(i), mocs);
 	}
 }
 
@@ -730,7 +730,7 @@ static void init_l3cc_table(struct xe_gt *gt,
 		if (regs_are_mcr(gt))
 			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
 		else
-			xe_mmio_write32(gt, XELP_LNCFCMOCS(i), l3cc);
+			xe_mmio_write32(&gt->mmio, XELP_LNCFCMOCS(i), l3cc);
 	}
 }
 
-- 
2.45.2

