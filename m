Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE53D73EB3
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 02:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2840610E04F;
	Fri, 30 Jan 2026 02:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JegHd7GN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6D810E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 02:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769739713; x=1801275713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=copMfMA9va9pHVcSewzWYTYl5m2ezV7sNeqEVsfjh0M=;
 b=JegHd7GNS3sYiFuYx1wHvnH6cAzXfY/YiBdqqCZTdVQzofWsfOCzJYAQ
 VZmVrqV5ar1jFMrJQ77qk7e4Vx0PYBBukDK0fK+GAQ3rRp7V8H9sK7UPW
 ljK04kw2fcoKMD6pk3qL0oaYH3fjhUnZpL4mCjvwCLKzwT7C4aGx+s9K0
 beSiM8Mdawh57vXPgdUCXJ/reaqzVghhRMOmC2+EG8euza4c0CQlurR+J
 zGHOByBy9qcGjScxrPuSrNIPX4L/Vnl1Hl+mg4SdhnVPj0lJrJkSLv8yc
 ohfUks72uo32WLZnoylPuG+l9DAmYj3d0CzCTwOa35KkuWLDIDCDyUajU Q==;
X-CSE-ConnectionGUID: k/R54mH2RVauOeIcZts/zg==
X-CSE-MsgGUID: qwThtZApTN+3lhhmdl4Qwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81724106"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81724106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 18:21:53 -0800
X-CSE-ConnectionGUID: iWxenZg2RKKYbMisT2RecA==
X-CSE-MsgGUID: ur5uAGKqTRWYhK5gKSBpUw==
X-ExtLoop1: 1
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2026 18:21:45 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Date: Fri, 30 Jan 2026 02:18:17 +0000
Message-ID: <20260130021816.442958-2-shuicheng.lin@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
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

