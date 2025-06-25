Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4D8C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D324710E7E5;
	Wed, 25 Jun 2025 19:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQTOSsIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E9310E7DF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750880027; x=1782416027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vUgKoOjpt3lct2GcWxgRAHlHWyGJftxhdZUt5Ou5V0w=;
 b=DQTOSsIbmFjAxxNwjgqXKnRmCbZBMaK3xmbeKwIX0DbNCJepHUr24V7+
 zruGT7jfKbjCa89EeA18aesKp+hgwQSvH/ApL0piDYOzZsUDTm51vSYie
 6mMeIPHXPkaXEeMFrGPaVKLULXFOsE17edpSwpeEkeTuppUtjxnJ4Escg
 iohX7miWY3/JGlmSUQPJ8L+faSDbVBNwbbaH2Q9799zee67Y9VZCK2Ftx
 XCh77x4YyogE/i9GrS4ZkLQ2aAj5SOMCjPOm8UHj4EBQ2DCcF0CDP/luO
 BZND/+jZ8Yx+oASdNWuJ+TSDIS6bzzblvhCImZlx5hubWL7ncHhcinSwi g==;
X-CSE-ConnectionGUID: VZgUScLGSqyTGoPHedRjAw==
X-CSE-MsgGUID: xVresE4eSQOhJCVVCC7xRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53305190"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53305190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:47 -0700
X-CSE-ConnectionGUID: FmJzZDazSRmCQAw6ZzRVLg==
X-CSE-MsgGUID: v6an7rbzR7a54y0el4/deQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156697203"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:47 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v3 3/5] drm/xe: Move Wa_15015404425 to use the new
 EX_DEVICE_WA macro
Date: Wed, 25 Jun 2025 12:33:38 -0700
Message-ID: <20250625193340.38971-4-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625193340.38971-1-matthew.s.atwood@intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
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

Move Wa_15015404425 to use the new implemented OOB macro XE_DEVICE_WA()

v2: rename from SoC to Device

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_mmio.c              | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index e69de29bb2d1..b7d12ea4d65c 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -0,0 +1 @@
+15015404425     PLATFORM(LUNARLAKE)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..4990b3a47afd 100644
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
+	if (XE_DEVICE_WA(mmio->tile->xe, 15015404425))
+		mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
 	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
-- 
2.49.0

