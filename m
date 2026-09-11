Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FF1C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B048D10F560;
	Fri, 11 Sep 2026 08:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGJQ8wNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD7710F55F;
 Fri, 11 Sep 2026 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113941; x=1820649941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lF5IGk3aY/aSnAAqk+JfsaL5XnldZQsXLtwQ/UOXqqg=;
 b=BGJQ8wNQ71n5FW1hT0aRcBpHe8qiIo8cSUn2Pun5Ch4eRunK0USaWtsp
 ex6G47Rx/hqbRAeQYBkWLaBm25xilXuXI1vgfxu/yjwiJf0jEc2wLOqtC
 mKYzmsr4Ee/E41apI/BvLs6fAxxfMjgyH9g36W0SaaS88p6GZHRSkjonH
 GKAmXM0eSmaYKv45xJ4t7ZoxDOvrSkAMHRoUrxXX8iCDtQivHYWTrWTgg
 HYgL3S3riZ2nyLOgWzBbPcKY1dfOXe+AKgmErsakonRFqbpMi6VCsSmoh
 QnIN+XCoXpvreY+R/7bQIJbEKK6bl+bXPBecnca7gNW5rcLOdIvifRfYq A==;
X-CSE-ConnectionGUID: WH9YgIddQFKK0Qc282PsWg==
X-CSE-MsgGUID: unIpkGqbTv2EiQrq+JZPsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094760"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:41 -0700
X-CSE-ConnectionGUID: p558bi/BTnSN0F45kuVTDQ==
X-CSE-MsgGUID: 5rW1Hv28RimkhhqMOupqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295334496"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:38 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 09/10] drm/i915/irq: conditional HPD IRQ resets based on
 PME capability
Date: Fri, 11 Sep 2026 11:04:47 +0300
Message-ID: <20260911080448.778316-10-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
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

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a59b75830bd1..1b53c43a7006 100644
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
+	bool reset_hpd = !intel_hpd_can_generate_pme(display);
 
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

