Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C9DCD98D0
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9E910E336;
	Tue,  9 Jun 2026 12:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YblHtYGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E84A10E339;
 Tue,  9 Jun 2026 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006665; x=1812542665;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B7gLLfjZ7RBfJmkdyadwwOpACqitau5a0zRbAp4nmVA=;
 b=YblHtYGFGhUrCu8gNzZoukFZDNlCbTsyifr1jT3eLBal2E5H+r1tqqZ9
 ujOX+hLslbipA2QguC0gYU3H9evRc1F3cusjt93LXq9QNCB0+j1rO0gPW
 PJL4lJrFcmze9ybXIJ77fnQbUD2KLgW8wqIk0sy25/sJ3nHrhaD8srwhM
 UCSHQ8CQMnkZwfIRv178iOGoGvyHX+EZBfBEM+4dXLp0Fo44dqyPUFtU9
 tLlJ7MHmQJdfKOL6NoWGXOoYW01yHlFfp9RNVJE3MalmgYlU9rAcTNx0e
 ga20SREXBFGRg9ZSt+uxNy6XBxvJwZXqOUMBNbQ8Zps2ANnV/OqiAnQtw w==;
X-CSE-ConnectionGUID: 2p2SrqbESN6KygasU6eehQ==
X-CSE-MsgGUID: Zpf5dJ+4SmCjylIakd42mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340449"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:25 -0700
X-CSE-ConnectionGUID: RWTXW0GSTpSV5cxTugSMeA==
X-CSE-MsgGUID: nZoR/twAS+61IVkdPGFGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988479"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:24 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 34/36] drm/i915/display: Mask RO bits in gen9_write_dc_state()
Date: Tue,  9 Jun 2026 17:32:48 +0530
Message-ID: <20260609120250.867750-35-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

The DC_STATE_EN register has read-only status bits that are set by
hardware on some platforms. These bits may cause the read-back
verification loop in gen9_write_dc_state() to spuriously retry.

Mask the RO bits from the read-back comparison to prevent
unnecessary retries.

Changes in v2:
- Rename patch from
  "drm/i915/display: Use rmw in gen9_write_dc_state() to preserve non-DC
bits"
  to
  "drm/i915/display: Mask RO bits in gen9_write_dc_state()"
- Mask only RO bits rather than masking all non DC state bits
  in DC_STATE_EN.  As the register has also some clear-on-write flags,
  like 'Display DC*CO State Status DSI'(Imre Deak)

Changes in v3:
- Limit ro mask to read-back comparison.

BSpec: 49437,69115
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 .../i915/display/intel_display_power_well.c   | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 4f7144d72dc6..86ae0010fe01 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -726,12 +726,28 @@ static void assert_can_disable_dc9(struct intel_display *display)
 	  */
 }
 
+static u32 dc_state_ro_mask(struct intel_display *display)
+{
+	if (DISPLAY_VER(display) >= 20)
+		return BIT(10) | BIT(11);
+	else if (DISPLAY_VER(display) >= 13 && !display->platform.dg2)
+		return BIT(10);
+
+	return 0;
+}
+
 static void gen9_write_dc_state(struct intel_display *display,
 				u32 state)
 {
 	int rewrites = 0;
 	int rereads = 0;
 	u32 v;
+	/*
+	 * Mask out RO status bits from read-back comparison.
+	 * HW may set these bits independently, so exclude them
+	 * to prevent the verify loop from retrying due to RO bits mismatch.
+	 */
+	u32 ro_mask = dc_state_ro_mask(display);
 
 	intel_de_write(display, DC_STATE_EN, state);
 
@@ -743,7 +759,7 @@ static void gen9_write_dc_state(struct intel_display *display,
 	do  {
 		v = intel_de_read(display, DC_STATE_EN);
 
-		if (v != state) {
+		if ((v & ~ro_mask) != (state & ~ro_mask)) {
 			intel_de_write(display, DC_STATE_EN, state);
 			rewrites++;
 			rereads = 0;
@@ -753,10 +769,10 @@ static void gen9_write_dc_state(struct intel_display *display,
 
 	} while (rewrites < 100);
 
-	if (v != state)
+	if ((v & ~ro_mask) != (state & ~ro_mask))
 		drm_err(display->drm,
-			"Writing dc state to 0x%x failed, now 0x%x\n",
-			state, v);
+			"Writing dc state to 0x%x failed, now 0x%x (ro_mask=0x%x)\n",
+			state, v, ro_mask);
 
 	/* Most of the times we need one retry, avoid spam */
 	if (rewrites > 1)
-- 
2.43.0

