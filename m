Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057BFC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 20:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E3E10E69A;
	Wed, 22 Nov 2023 20:43:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B078C10E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700685824; x=1732221824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pzq6Q3CCtriAkZ6cZEWocuXN4QxuAW/r1SY4af/ZYL0=;
 b=A7FmHD8D8v6Svq3Xj/Gp02xoQQNVjFhKa7YEuvI63XFRRgBXMXHBrx/a
 wxZeg8ig4s0WJ2K3AnLeKt5Zj5PZ79dI3DYzq4hcXxVBjVrdSV3F3UVS1
 3xTS8opwAlzMDVwjSDfY8DDQ4BdJbVMCQor0xApWz/055hiapoOtyMujY
 aqb81YJIMkyK/zQoEHydtSAnGOyyWSSsFtuvQbuK6WaZPlDnOqiYMAuiM
 /oceg/pBInKOI3hiPhrlw67gfvrsXZnHJnPe5rfHMGtZJknfkp5XG0j25
 wXPWWkax8uSMnElxBWc0vcAIYFtYdnBU+7mjPQhnNrOMHxY3kxd2vgpAv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="394972176"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="394972176"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801872565"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="801872565"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:43:43 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:45:01 -0800
Message-Id: <20231122204501.1353325-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122204501.1353325-1-fei.yang@intel.com>
References: <20231122204501.1353325-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: explicitly set GGTT access for GuC
 DMA
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Confirmed with hardware that setting GGTT memory access for GuC
firmware loading is correct for all platforms and required for
new platforms going forward.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 1 +
 drivers/gpu/drm/xe/xe_uc_fw.c         | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index ba375fc51a87..92320bbc9d3d 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -70,6 +70,7 @@
 #define DMA_ADDR_1_HIGH				XE_REG(0xc30c)
 #define   DMA_ADDR_SPACE_MASK			REG_GENMASK(20, 16)
 #define   DMA_ADDRESS_SPACE_WOPCM		REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
+#define   DMA_ADDRESS_SPACE_GGTT		REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 8)
 #define DMA_COPY_SIZE				XE_REG(0xc310)
 #define DMA_CTRL				XE_REG(0xc314)
 #define   HUC_UKERNEL				REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3032c4f148d4..438ce51dd373 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -629,7 +629,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	/* Set the source address for the uCode */
 	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
 	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
-	xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
+	xe_mmio_write32(gt, DMA_ADDR_0_HIGH,
+			upper_32_bits(src_offset) | DMA_ADDRESS_SPACE_GGTT);
 
 	/* Set the DMA destination */
 	xe_mmio_write32(gt, DMA_ADDR_1_LOW, offset);
-- 
2.25.1

