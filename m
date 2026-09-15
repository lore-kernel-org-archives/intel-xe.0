Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C74C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C092110F583;
	Tue, 15 Sep 2026 09:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h893BSqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA3B10F39F;
 Tue, 15 Sep 2026 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789464367; x=1821000367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A5hAu3FQN6qzM84ekr1GxMqmTYdUvwr/u62OwwenhK0=;
 b=h893BSqAdgyhovxhVAE7m6LFdsZZDghR+cgWd2n65aWHli5PEc9C/Pqh
 Qntcq6X8fyotpwG7rlsMV7ZI/idAlLhzFeJht0+XeCQ8CiOtI/MORSf6q
 YYC6ZDP7QhtkqfOB/b4hokg5k48FcoCLUUsDz3N9Me6LYHjzHXwAWA10J
 h0BNg2OVvWXegya19XzpqJp2GYdUgdeOWej+Zn9cQ9pmbC4PQtP3Fd/h4
 Fe1HvRFnn0urr/KWZRNdNNjwE1PLZMdEnIVYPmU5KH1bGGbRC19xIzx9X
 0GQJX2dP5oxOPadRQNgZp9bRlVfVvIRF6t7bPkwdQOv/29CGa1gO5lahF w==;
X-CSE-ConnectionGUID: Dtj1YL/4Re+ZGMNvR+D/Dg==
X-CSE-MsgGUID: 9uHlRmlhREyzfBj+CVzawg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89581872"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89581872"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:25:50 -0700
X-CSE-ConnectionGUID: tr3hsLIjRQOoA9fGf7lvCQ==
X-CSE-MsgGUID: jCEWildDR821+pMMhChX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1118210"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:25:48 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	vinod.govindapillai@intel.com
Subject: [PATCH v8 4/5] drm/i915/irq: conditional HPD IRQ resets based on PME
 capability
Date: Tue, 15 Sep 2026 12:25:16 +0300
Message-ID: <20260915092518.639448-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915092518.639448-1-vinod.govindapillai@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
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

v4: remove the unused include file from the previous revision

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c   | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a59b75830bd1..8ce30112de97 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -2217,8 +2217,10 @@ static void gen11_display_irq_reset(struct intel_display *display)
 	enum pipe pipe;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
+	bool reset_hpd = !intel_display_rpm_pme_enabled(display);
 
-	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
+	if (reset_hpd)
+		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
 
 	if (DISPLAY_VER(display) >= 12) {
 		enum transcoder trans;
@@ -2250,13 +2252,15 @@ static void gen11_display_irq_reset(struct intel_display *display)
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

