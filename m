Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B31E7D27B
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE0E10E0C8;
	Tue, 26 Sep 2023 10:39:11 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D16B10E39D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 10:39:08 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695724708; bh=ms5qEbr6HMk40SmXByBku5LSZTBil9cNdkspZi/5MQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GdS8ql1z/eu/pWNnpzsQGOzpCWUnJ0DZSTqmZY5yOtdU9a2/uPMM4Yl0xazDhjsZy
 RxN8ycBB9GNedO5fEtTociF4EWpY9P6aWsrTrVYlBv2hy0Uf4oimbUEI3tHWYORIAD
 Q/CN0IU0FOVV+bE1J8mD8Fp9KU6pZ/SDRI9ROqBSDUoLACrxNg7p+RcKfHAv/dJy7F
 XfWOp2C9H+hb2jjLCdF5gpG3jrGARqp5RL9cceofYZ79H1QNx7nHIvdqGbluTjTs7a
 Pmd9Z1ff9EVW+35lo5CMQ6RnH10xVsIhIEuzOW4BKVN7CmNK52qWuRytlCyQFp+mu8
 nyRAHjYr+abIw==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38QAcmdF1200229; Tue, 26 Sep 2023 13:38:59 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:38:44 +0300
Message-Id: <20230926103848.1200206-3-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926103848.1200206-1-kelbaz@habana.ai>
References: <20230926103848.1200206-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/6] drm/xe: add read/write support for MMIO
 extension space
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A distinction has to be made when addressing the MMIO space or
the additional MMIO extension space.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_mmio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 9e0fd4a6fb29..ae09f777d711 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -29,7 +29,7 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readb(tile->mmio.regs + reg.addr);
+	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
@@ -39,7 +39,7 @@ static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readw(tile->mmio.regs + reg.addr);
+	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline void xe_mmio_write32(struct xe_gt *gt,
@@ -50,7 +50,7 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	writel(val, tile->mmio.regs + reg.addr);
+	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
@@ -60,7 +60,7 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readl(tile->mmio.regs + reg.addr);
+	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
-- 
2.34.1

