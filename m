Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC65C7115B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C36F10EBEB;
	Fri, 20 Jun 2025 21:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ap9I6VX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407510EBCD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750456166; x=1781992166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MeD5afbFl1ia6uZdbDDU0BO9yASG7HcbqLfZjXm7oeI=;
 b=Ap9I6VX0tK8otKLs+WvIMq0thXByN2K5crW59HwiliYFnqSomFQApSUF
 zj6CI0x06UTsRtseixGhUNM0mhAMrxoj/+AQf6HQl6MvHSudmNCy2867W
 Wq1VJUB5I2dauBRKqlkDxkY+uJD8TEJaXAbz47jYDLpEDy1nrtEEd7Fbv
 zVOtxINmGuATP7JR8YIOj8w6NqaI1Zt/+Z9yYerBIeVgG1QBpRffHMnGN
 N1ExKfs69oIVGvidkREJReUdfmXxYm+7reiHG9geE2IU8GaXglJkOJkYw
 OYKVRIBzESb7CpBRit+xkFppVemOq6/lGzElbyBzQ9iybOJtnAdaGYUJu Q==;
X-CSE-ConnectionGUID: hAsfRIaOSRy7G6HT2jTwlg==
X-CSE-MsgGUID: xR2aFUP3TWijaVVbsdxnjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40336502"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="40336502"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:26 -0700
X-CSE-ConnectionGUID: r0E25yz0SjihKIoRkKfWeA==
X-CSE-MsgGUID: PeXrsFfxQeugKPdlM/m6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="151158399"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:26 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 3/5] drm/xe: Move Wa_15015404425 to use the new EX_SOC_WA macro
Date: Fri, 20 Jun 2025 14:49:18 -0700
Message-ID: <20250620214920.718179-4-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620214920.718179-1-matthew.s.atwood@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
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

Move Wa_15015404425 to use the new implemented OOB macro XE_SOC_WA()

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c           | 10 +++++-----
 drivers/gpu/drm/xe/xe_soc_wa_oob.rules |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..377fa82d1d13 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,9 @@
 #include "xe_macros.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
+#include "xe_wa.h"
+
+#include "generated/xe_soc_wa_oob.h"
 
 static void tiles_fini(void *arg)
 {
@@ -163,9 +166,6 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 #define DUMMY_REG_OFFSET	0x130030
 	int i;
 
-	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
-		return;
-
 	/* 4 dummy writes */
 	for (i = 0; i < 4; i++)
 		writel(0, mmio->regs + DUMMY_REG_OFFSET);
@@ -176,8 +176,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
-	/* Wa_15015404425 */
-	mmio_flush_pending_writes(mmio);
+	if (XE_SOC_WA(mmio->tile->xe, 15015404425))
+		mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
 	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
diff --git a/drivers/gpu/drm/xe/xe_soc_wa_oob.rules b/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
index e69de29bb2d1..b7d12ea4d65c 100644
--- a/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
@@ -0,0 +1 @@
+15015404425     PLATFORM(LUNARLAKE)
-- 
2.49.0

