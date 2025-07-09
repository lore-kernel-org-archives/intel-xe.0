Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB79C83F14
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4810E375;
	Wed,  9 Jul 2025 22:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6XADe2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1904010E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099371; x=1783635371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fPgOtUN6DoG8pbCrMnSXqBdFg5vnfIFZJhCvWQgu8oU=;
 b=m6XADe2zkAcAEbsFmFzjWdgeP5KPEakKjdhAaICCR39IwWB9V4rpwZuX
 j0qmM1tl1VgcaXLn9tYer6sOiBf72GmAuRBWQyYE320Qg7d6sAKEaGSD7
 2i8Oat1NzPv/janZBGW8E4XXwJySEL8RmLGkbBIsr+vgi3T8Z0SpqHhze
 Wp3jjZaKehuTsv7Jd2r0iHWwn8FqxvGM+tJ79c6gfT/CcfZoxAsLE+LNc
 tB66oMxxDFYjWakqA8s79K1R/fuCk0qH35vubmn1v7bppO4Mr8VpHmfbX
 XVmC2y5MCmncbko38MgqhvMmhyOXsfA204Qg95wZWYfOEKZzrjb7n08Mx Q==;
X-CSE-ConnectionGUID: bVrgX1dVSJirEO1fHUsJLA==
X-CSE-MsgGUID: N0LpuGvMRe26QFxrfvW2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518059"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54518059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:11 -0700
X-CSE-ConnectionGUID: bHb7aj2WSkSpwLdR3Et58Q==
X-CSE-MsgGUID: dLch/pU9Qv+/YPnDEekcHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193096146"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:11 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v6 5/6] drm/xe: Move Wa_15015404425 to use the new
 XE_DEVICE_WA macro
Date: Wed,  9 Jul 2025 15:16:04 -0700
Message-ID: <20250709221605.172516-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709221605.172516-1-matthew.s.atwood@intel.com>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
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
v5: move workaround call back into the flush call
v6: remove redundant commenting

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 drivers/gpu/drm/xe/xe_mmio.c              | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index e69de29bb2d1..b7d12ea4d65c 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -0,0 +1 @@
+15015404425     PLATFORM(LUNARLAKE)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 751586d6806a..e4db8d58ea2d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,9 @@
 #include "xe_macros.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
+#include "xe_wa.h"
+
+#include "generated/xe_device_wa_oob.h"
 
 static void tiles_fini(void *arg)
 {
@@ -167,7 +170,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 #define DUMMY_REG_OFFSET	0x130030
 	int i;
 
-	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
+	if (!XE_DEVICE_WA(mmio->tile->xe, 15015404425))
 		return;
 
 	/* 4 dummy writes */
@@ -180,7 +183,6 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
-	/* Wa_15015404425 */
 	mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
@@ -194,7 +196,6 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
-	/* Wa_15015404425 */
 	mmio_flush_pending_writes(mmio);
 
 	val = readw(mmio->regs + addr);
@@ -221,7 +222,6 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
-	/* Wa_15015404425 */
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
-- 
2.49.0

