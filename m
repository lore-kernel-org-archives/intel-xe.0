Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CBBE6BF2F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 16:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD3A10E0AD;
	Fri, 30 Jan 2026 16:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgajfAO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E8210E0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769792371; x=1801328371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bdYnI8RfwNVrE9QCMOvNXXdS5P5PsYv4x8k61YDblz8=;
 b=fgajfAO9YCS2HhxDHEkr1lyOtJOCvC5mlW6yjUQQbz656ZMbHw3nZCt2
 gGCy5B0cwI/OQMkk2ABy3VsBgIsu5vBqzA6YHi5yDgpVyYzaSBw8ED08P
 2ZWBiug6eXDZp41937avo9woBiGqpNHurgwb2GPelzYecG8jWog5A6XG/
 KDoAmHcmuBa4d/p0/xJ+8adl/19OZWeSG0IuOoljMHMtRULpfJfn11erJ
 O7mR058E/psrBnOsMGxNHBdSZc9WSuX22nTn2YpqsiMhYeahLDlq6eE+p
 kkQPJPqYbs5hdWBTj45p3IV2TeIuJSEj+2hjVf05IsK3mz8F75stOzgCB w==;
X-CSE-ConnectionGUID: 0utg+T7ZQp+KAxdATsOiog==
X-CSE-MsgGUID: hP9GxJHzQ5m4C5U91sIpOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="93701944"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="93701944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 08:59:30 -0800
X-CSE-ConnectionGUID: BBTUaf2QQ7CX9AC23PnokQ==
X-CSE-MsgGUID: 8PjbRmFgSSCAj228PJ4ujA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208704649"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 30 Jan 2026 08:59:29 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Date: Fri, 30 Jan 2026 16:56:22 +0000
Message-ID: <20260130165621.471408-2-shuicheng.lin@intel.com>
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

To fix it, replace the adjusted-address comparison with a direct
sanity check that ensures the MMIO address adjustment cutoff never
falls within the 8-byte range of a 64-bit register. And let
xe_mmio_read32() handle address translation.

v2: rewrite the sanity check in a more natural way. (Matt)
v3: Add Fixes tag. (Jani)

Fixes: 07431945d8ae ("drm/xe: Avoid 64-bit register reads")
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bcb6674b7dac..a1a05c68dc7d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -256,11 +256,11 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
 	u32 ldw, udw, oldudw, retries;
 
-	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
-	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
-
-	/* we shouldn't adjust just one register address */
-	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
+	/*
+	 * The two dwords of a 64-bit register can never straddle the offset
+	 * adjustment cutoff.
+	 */
+	xe_tile_assert(mmio->tile, !in_range(mmio->adj_limit, reg.addr + 1, 7));
 
 	oldudw = xe_mmio_read32(mmio, reg_udw);
 	for (retries = 5; retries; --retries) {
-- 
2.50.1

