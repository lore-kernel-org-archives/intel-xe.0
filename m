Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEEBCD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 13:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D0110E6D4;
	Mon, 22 Jun 2026 13:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MalqQt+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2CE10E6D4
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782134639; x=1813670639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CbmEowgZDzXyBXEeSQNZfWrK9T+uJoDRHUGeMi5akUM=;
 b=MalqQt+GTZ38vBkK9fzdQRsllw8SjxhR/kq6z/nG7kGKM41SRbLNgTyt
 /RcE53OXojUpntX7uwHqHrOstJD3LYIjARMrZBR4Jojufl9bxEzgb+soo
 TqoA6YLz9DlBkDoBmoDIGEMKH8FQOxnR5jFS0tTgDl23nfLXLSR7yXlLg
 CyqQqeYVoQcw+50aM38USMlrpDTa3L7nO7qOigvWteT/wBFdJQKZ/c2lY
 Rvyw9LvdPUCRZ8w/DKDCo1Ju6oTxFFy0GkHUHW9v4eWDvkyUZ4xCcdIBJ
 ftoxKl0Kol5qD2YPFv5A0c4BYrZUSQav/yt+7ZI0yj9aLAUju7LaoxV+w A==;
X-CSE-ConnectionGUID: B00Pu2ApQImRERlG9DaVsA==
X-CSE-MsgGUID: PlAVwkbBTuuo8tRqB4DjrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93228675"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93228675"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:23:59 -0700
X-CSE-ConnectionGUID: hy0NPFSuToGiJ/g/Ha8ODQ==
X-CSE-MsgGUID: mn7rINTUS+ClyApcKLDuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279407153"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:23:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 1/6] drm/xe/mmio: Verify MMIO is available
Date: Mon, 22 Jun 2026 15:23:37 +0200
Message-ID: <20260622132342.19600-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622132342.19600-1-michal.wajdeczko@intel.com>
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
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

We shouldn't access device registers after the device was unplugged
or the MMIO bar (GTTMMADR) was unmapped. Instead of relying on the
NPD splat due to zeroed tile->mmio.regs, which might be unreliable
anyway as not all xe_mmio structs are using that directly, add an
explicit check during all xe_mmio read/write operations to test if
xe->mmio.regs are still mapped and safely abort with WARN if not.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
v1: https://patchwork.freedesktop.org/patch/728625/?series=167403&rev=1
v2: https://patchwork.freedesktop.org/patch/731360/?series=168108&rev=1
v3: use WARN and early abort to avoid Oops (sashiko)
---
 drivers/gpu/drm/xe/xe_mmio.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..7e0cefcd16bd 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -17,6 +17,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_sriov.h"
+#include "xe_tile_printk.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
 
@@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
 	mmio->tile = tile;
 }
 
+static bool mmio_available(struct xe_mmio *mmio)
+{
+	return !xe_tile_WARN_ON_ONCE(mmio->tile, !mmio->tile->xe->mmio.regs);
+}
+
 static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 {
 #define DUMMY_REG_OFFSET	0x130030
@@ -146,6 +152,9 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
+	if (!mmio_available(mmio))
+		return 0;
+
 	mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
@@ -158,6 +167,9 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	if (!mmio_available(mmio))
+		return;
+
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	writeb(val, mmio->regs + addr);
@@ -168,6 +180,9 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
+	if (!mmio_available(mmio))
+		return 0;
+
 	mmio_flush_pending_writes(mmio);
 
 	val = readw(mmio->regs + addr);
@@ -180,6 +195,9 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	if (!mmio_available(mmio))
+		return;
+
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
@@ -194,6 +212,9 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
+	if (!mmio_available(mmio))
+		return 0;
+
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
-- 
2.47.1

