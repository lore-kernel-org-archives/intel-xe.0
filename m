Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52EBD46BFB
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 21:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6721610E0BC;
	Wed, 28 Jan 2026 21:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMcuFLKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B269210E0BC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 21:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769634954; x=1801170954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5ctluVm5c3xYOt7jXqSQDd4N9zT4ZXtLxcNWKV68wQY=;
 b=TMcuFLKBlgX29RL2Zrov8/Aa8taMxB3Trt4cXuVq78AGGDmQnUHzE/xj
 ZSv/w3b6VhO8gjqvHHjfiREERGm8PYJOHn0Ft41f7MWHBDlGkIMO1WId9
 dJ6lYVOq5MR5gcO0Eyh+X9QZYmQoTxcc8NsiUZvlvGTluoSsEJ7ZjPlb/
 3xIuBNMPvjmErWZvuAvIzx8BOWOPmHd/VsC0kZyfuVyC1zM73AR4ymFqA
 L6CttWEkqf9nIRIrlKlZjFUAHNjWpDW8UbnlkAkoGVk/MSbz72DqCY/ZR
 yxvgIxBoJsyr3O6LfkBLdWYYIqOg+2XJkeRPGKRC9t8mJ3X0vV/R+PESK Q==;
X-CSE-ConnectionGUID: oko5ngDpROu/XlmLpjObpg==
X-CSE-MsgGUID: J7RZm1LCTXCjjlaqJpfd/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73453024"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73453024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:15:53 -0800
X-CSE-ConnectionGUID: lfPmr4G+TS6kL1WNVyjplA==
X-CSE-MsgGUID: 7LTN7REeQ8a3nVRXcU5qTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208465537"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 13:15:52 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Date: Wed, 28 Jan 2026 21:12:51 +0000
Message-ID: <20260128211250.3643131-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

xe_mmio_read64_2x32() was adjusting register addresses and then
calling xe_mmio_read32(), which applies the adjustment again.
This may shift accesses twice if adj_offset < adj_limit. There is
no issue currently, as for media gt, adj_offset > adj_limit, so
the 2nd adjust will be a no-op. But it may not work in future.

To fix it, keep the adjustment only for a sanity check and let
xe_mmio_read32() handle address translation.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bcb6674b7dac..76f8458c8ee1 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -255,12 +255,17 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
 	u32 ldw, udw, oldudw, retries;
+	u32 addr, addr_udw;
 
-	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
-	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
+	/*
+	 * use adjusted addresses only for a sanity check;
+	 * xe_mmio_read32() also applies adjustment.
+	 */
+	addr = xe_mmio_adjusted_addr(mmio, reg.addr);
+	addr_udw = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
 
 	/* we shouldn't adjust just one register address */
-	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
+	xe_tile_assert(mmio->tile, addr_udw == addr + 0x4);
 
 	oldudw = xe_mmio_read32(mmio, reg_udw);
 	for (retries = 5; retries; --retries) {
-- 
2.50.1

