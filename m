Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078ACE94107
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 19:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F7910E031;
	Fri,  6 Oct 2023 19:20:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BEC10E564
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696620009; x=1728156009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zoTBBQknKyqm7RiNYgE8BuEhcCyiIPn92qwXNN7+eXY=;
 b=SUl5bLzUIEfGrepSqO+LIOzWvESmMeJlWiIC8VcxZ/Ys2Kds4Iw4DsnW
 YP4QuDOoJvhYgJiepnsatMsKy6W5VHsb8rqjX7vd8xsJ0JW3v/wGRfrwI
 NBI/EZZc+ToFUWe71XPsvMLsBJc04nzMgJfUH5AeiMX9tYNRTjRz7t/ia
 AvFwm5Wm92bbCVjIVbQdqhyMCkGgY6X9r5q6ED4WXpO5Nin+mnGwWVTqY
 gmHQqWI1pxI8AnwsHPi4Aw9Q1kdtusAeVn/AwqEEPZ2G2LqBvHC069mrt
 LO7PcyLOoykXY5c4ijM+HP0RVM2EEofk+G8G9MRviMcuPEIB/hrXwlSH7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="387697097"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="387697097"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="926060981"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="926060981"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:19:45 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 12:19:39 -0700
Message-ID: <20231006191939.78251-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add INSTDONE register to devcoredump
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This register contains important information that can help with debug
of GPU hangs.

While at it also fixing the double line jump at the end of engine
registers for CCS engines.

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 5 ++++-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 35dd4837dd75f..32465e384fc24 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -32,6 +32,7 @@
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index f63c821baeb77..52acfe1d8b6aa 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -728,6 +728,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_dma_fadd =
 		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+	snapshot->reg.ring_instdone = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
 
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
@@ -783,10 +784,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
 		   snapshot->reg.ring_dma_fadd_udw,
 		   snapshot->reg.ring_dma_fadd);
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
+	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.ring_instdone);
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
+	drm_puts(p, "\n");
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 5d4ee29042407..dc164d51579bd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -221,6 +221,8 @@ struct xe_hw_engine_snapshot {
 		u32 ipehr;
 		/** @rcu_mode: RCU_MODE */
 		u32 rcu_mode;
+		/** @ring_instdone: RING_INSTDONE */
+		u32 ring_instdone;
 	} reg;
 };
 
-- 
2.42.0

