Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED993E8FDB2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B856810E071;
	Tue,  3 Oct 2023 20:27:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690F210E071
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696364861; x=1727900861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lmk6y5xf6yDfYlS3iNRi0svct6iUMseMNW9fnheTvp8=;
 b=kSJqkrHN1vxaY3E8Xb8tbIfVwQZKlYt1BVHMmpGvp8mRHP7mye/ySgwi
 BdJzgcmEQjdLrserBzk5qh7UDfQWmogYqx55KQWkCDRv81HnoWjgdkFnY
 S/oHaEbTfhtPoanQDXca2bBmxs+Mu9YWD6xAnZzn15qNbPE/th2+iq5se
 atz0SFNpo0XvIsF6sbgpnEggamYe94AKJbgOh44b8BHpxaQ0JRRGpqHl+
 e/xFeiRgW6clKgX/PwWDYc5abMnXABJ9AGI58gSbxcQxBa11+95Dp81zW
 36rJI+OeJheqmD7U+UFoMmjmd4WTp4lNZm7zJF2riYgHPFv+DJByioprg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362331334"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="362331334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816834317"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="816834317"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:27:41 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:27:27 -0700
Message-ID: <20231003202728.132545-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003202728.132545-1-jose.souza@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Fix devcoredump readout of IPEHR
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

It was reading (base) + 0x88 but that is not a valid register
and instead it should read (base) + 0x68.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 -
 drivers/gpu/drm/xe/xe_hw_engine.c        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 692213d09ceaa..792d431161c68 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -37,7 +37,6 @@
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
 #define IPEIR(base)				XE_REG((base) + 0x88)
-#define IPEHR(base)				XE_REG((base) + 0x8c)
 #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index dc9dd83d99c52..c2db391cf2674 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -728,7 +728,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_dma_fadd =
 		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
 	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
-	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0));
+	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
-- 
2.42.0

