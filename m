Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67207CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 17:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0835310E248;
	Wed, 27 May 2026 17:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPbIXkHH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41B910E248
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779904506; x=1811440506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VsV2BjCUBkcMGIop2fdx+mZIOTTKLDrTCOZHr5BJpmQ=;
 b=PPbIXkHH9YGPshm8DOfI0ztDwRWuo2FeLHCaUw+Gf60SDUQs1wM9p8nF
 dSp73oEVoBazspQnAcflMNbQtor9X55O8+qISVPVjrRMUHCtVjeQoSF2I
 58OgXAL32CWFCvqqYm5nZSUWAQ70gv3PB5b5sSkAK93PmlRQCHD2vu5Q4
 3pn/KAMKRfh5PGI+A9fLaLjJtsOQdu7d/j9Odz3aHYJAe/Ejo7A2ZAaQh
 w8iviM/3ODxxDZBfzOFIZZ2Sag763cKIi19Bn6UtSp7qfHEFTE0+iQUmo
 N9fW2kbhoK6AOjgB+Bg+OX9WOOUx2aytQ7AQziRZcVujdPBvY2FZjprOC g==;
X-CSE-ConnectionGUID: vn0+BVAfRPWtRRd8wEvCFw==
X-CSE-MsgGUID: pK/5DRWrRTC32OfUecpHfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91433449"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91433449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:55:06 -0700
X-CSE-ConnectionGUID: MlVaBbR5RJaHhDbxBuWKpA==
X-CSE-MsgGUID: RrO7vDP/SBuJjFMwQ1zEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="241476659"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:55:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/mmio: Assert MMIO is available
Date: Wed, 27 May 2026 19:54:37 +0200
Message-ID: <20260527175437.22585-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We shouldn't access device registers after the device was unplugged.
Instead of relying on the NPD splat due to zeroed xe.mmio.regs, which
might be unreliable anyway as not all xe_mmio are using that directly,
add an explicit assert during xe_mmio read/write operations to catch
invalid accesses to MMIO after device was unplugged.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..b77a717f0556 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/pci.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
 	mmio->tile = tile;
 }
 
+static void mmio_assert_available(struct xe_mmio *mmio)
+{
+	xe_tile_assert(mmio->tile, !drm_dev_is_unplugged(&mmio->tile->xe->drm));
+}
+
 static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 {
 #define DUMMY_REG_OFFSET	0x130030
@@ -146,6 +152,7 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
+	mmio_assert_available(mmio);
 	mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
@@ -158,6 +165,7 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	mmio_assert_available(mmio);
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	writeb(val, mmio->regs + addr);
@@ -168,6 +176,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
+	mmio_assert_available(mmio);
 	mmio_flush_pending_writes(mmio);
 
 	val = readw(mmio->regs + addr);
@@ -180,6 +189,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	mmio_assert_available(mmio);
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
@@ -194,6 +204,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
+	mmio_assert_available(mmio);
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
-- 
2.47.1

