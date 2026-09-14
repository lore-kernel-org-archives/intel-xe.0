Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4D4C88E7B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A82F10F241;
	Mon, 14 Sep 2026 20:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fh27z3bA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E897510F235;
 Mon, 14 Sep 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789418467; x=1820954467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5UemxPIF+Ia4M6IDKZQLzbg5O+M1Y/u4VFo5kRUe9M=;
 b=fh27z3bA8Fz/IoMjN0dTIN/g1x+ELRCKilOnzwo4YrIzPp15C4XYax4b
 Lr3rNPt8+FLJ+wbw7pGqSEC3FZgyK+CQYsZytsvDTNQ3zsrEllbWdfHme
 exw3c5ipjGi5IDuvpdJ/iVg+ZzBmRBlDDgJQ3BYSf93bF53VGRwrnWy4c
 5YTaSYgGxRGEQ8QnE+2pPXXauKqFornKgZejtrKHsLTF32+1pmMtMSA/g
 /27ah48FkNUiZHymGrWwzikbIpzAHdGLtxHC5IZj950NcDZ1Rn3id8S7b
 7FMwVluVb7+FXO2EWYK7rDujrzDmlkBND0sFynrL3j+8DOH3UgCSGzNI2 A==;
X-CSE-ConnectionGUID: o6PE2HGURVmyjxaaGiL++A==
X-CSE-MsgGUID: ak8fky4HRI+YZ1mmR8SPWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107288141"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107288141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:41:07 -0700
X-CSE-ConnectionGUID: 2U6WZMAzQZKPk6BYodJ4dg==
X-CSE-MsgGUID: Us5nTS0UTB+JEmqWP0jrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270113311"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:41:05 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v7 6/7] drm/i915/irq: conditional HPD IRQ resets based on PME
 capability
Date: Mon, 14 Sep 2026 23:40:33 +0300
Message-ID: <20260914204034.309566-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914204034.309566-1-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

If a device supports generating PME from HPDs, resetting HPD IRQs
will be counter productive as HPDs itself will be lost. During
suspend routines, all the IRQs are reset. So if the device is
capable of generating PME rom HPDs, keep the HPD related IRQs from
reset based on the PME capability of the device on a target power
state. PME capability will be assessed and updated separately.

v2: change keep_hpd to reset_hpd

v3: use intel_display_rpm_pme_enabled() directly (JaniN)

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a59b75830bd1..7e71c96c663f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -22,6 +22,7 @@
 #include "intel_fdi_regs.h"
 #include "intel_fifo_underrun.h"
 #include "intel_gmbus.h"
+#include "intel_hotplug.h"
 #include "intel_hotplug_irq.h"
 #include "intel_lpe_audio.h"
 #include "intel_parent.h"
@@ -2217,8 +2218,10 @@ static void gen11_display_irq_reset(struct intel_display *display)
 	enum pipe pipe;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
+	bool reset_hpd = !intel_display_rpm_pme_enabled(display);
 
-	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
+	if (reset_hpd)
+		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
 
 	if (DISPLAY_VER(display) >= 12) {
 		enum transcoder trans;
@@ -2250,13 +2253,15 @@ static void gen11_display_irq_reset(struct intel_display *display)
 	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
 	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
 
-	if (DISPLAY_VER(display) >= 14)
-		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
-	else
-		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
+	if (reset_hpd) {
+		if (DISPLAY_VER(display) >= 14)
+			irq_reset(display, PICAINTERRUPT_IRQ_REGS);
+		else
+			irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
 
-	if (INTEL_PCH_TYPE(display) >= PCH_ICP)
-		irq_reset(display, SDE_IRQ_REGS);
+		if (INTEL_PCH_TYPE(display) >= PCH_ICP)
+			irq_reset(display, SDE_IRQ_REGS);
+	}
 }
 
 void gen8_irq_power_well_post_enable(struct intel_display *display,
-- 
2.43.0

