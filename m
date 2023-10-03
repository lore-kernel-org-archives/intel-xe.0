Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC10E8FDB5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6310E084;
	Tue,  3 Oct 2023 20:27:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9222F10E071
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696364862; x=1727900862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGfOvnP7Mw7khFPJtrKOviiDevss8RJgfdNPPs5rvKg=;
 b=YM7j20Gx2mXRvOFdHGl3kac16R1xgNq2IdbWJc5EwDBMnOW3KwNSc3MF
 TKVfJbh2W1EkzfjFaSKEEWl+XmTjO9wPD9mHubM4N2vKtF2nukt2ehd5y
 UIUDKFSdBBwOSefJCt1jNHLuWrB29IjKLqtrE5d0r7YP5CoN3GhN5Ob++
 tcCAfwkD7yLJIXhN3V/5CiidxuoYzXg4YYMC3RVlmyTIkqbYOoWjS9T31
 3wk1YQ3zw95EDG0OCFbNycvwU/c19pxtvXmXtVXqVTX32/P5tJWRQnmx1
 h7zJJtHBx+Ki5cvJZO0C4j5qxQhY/UkH10zxxmOLXE5QiZKsQLpvUp39f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362331338"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="362331338"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816834321"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="816834321"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:27:42 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:27:28 -0700
Message-ID: <20231003202728.132545-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003202728.132545-1-jose.souza@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Remove devcoredump readout of IPEIR
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

This register don't exist in gfx12+, so here dropping the readout
and print in devcoredump.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 --
 drivers/gpu/drm/xe/xe_hw_engine.c        | 2 --
 drivers/gpu/drm/xe/xe_hw_engine_types.h  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 792d431161c68..35dd4837dd75f 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -31,12 +31,10 @@
 
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
-#define RING_IPEIR(base)			XE_REG((base) + 0x64)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
-#define IPEIR(base)				XE_REG((base) + 0x88)
 #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c2db391cf2674..f63c821baeb77 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -727,7 +727,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
 	snapshot->reg.ring_dma_fadd =
 		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
@@ -784,7 +783,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
 		   snapshot->reg.ring_dma_fadd_udw,
 		   snapshot->reg.ring_dma_fadd);
-	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
 	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index cd4bc1412a3ff..5d4ee29042407 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -217,8 +217,6 @@ struct xe_hw_engine_snapshot {
 		u32 ring_dma_fadd_udw;
 		/** @ring_dma_fadd: RING_DMA_FADD */
 		u32 ring_dma_fadd;
-		/** @ipeir: IPEIR */
-		u32 ipeir;
 		/** @ipehr: IPEHR */
 		u32 ipehr;
 		/** @rcu_mode: RCU_MODE */
-- 
2.42.0

