Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BCCCA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D377F112061;
	Fri,  9 Oct 2026 10:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjEWwFWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EF311205F;
 Fri,  9 Oct 2026 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542162; x=1823078162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1msTE/sgdedUUA8C5euvZomglt6pL1jSRMQhphKfpXw=;
 b=QjEWwFWHPlikybIYxLQuNZ1CA+bDjvMquLI5YWxn/XznRD6LkV3LvqF/
 lcUA5+1+rMP++o//7NM8L9m7h2Vy+zErJ7Vav7b60TxDP0nfvaD2Pi/td
 dWUDWTfxg2MS9XotCfIsYQFbtskNZrI6A7uNrEmTnDSEmLzdjMFyTjbQr
 vyncBIKFr9eHlLJqX+KB1yRASUDs6XpeN4+Zk5wU0SFImPMpQaA2yzA5J
 5dk5VeQ6Pc9W+AHTBmEhwryRCYZL27ImkwS1eNFax2ZsFT087UoLBV2cv
 ckIqwxsdyQC7hwRy+2mkOeYfMkQr1xRAOKosQ3XqzMrJgICN5EpdS0bcf A==;
X-CSE-ConnectionGUID: SmxQSNQbT6+ejrHRDRtEvw==
X-CSE-MsgGUID: mrhu252ESMSQSwj32AHm9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219339"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219339"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:36:02 -0700
X-CSE-ConnectionGUID: sMYWGp73RqeD5lg/0jRLlA==
X-CSE-MsgGUID: EQvaHHC6SBOEJJ4lhryvhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="399273"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 03:36:01 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port A only
Date: Fri,  9 Oct 2026 10:35:48 +0000
Message-ID: <20261009103552.1864818-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009103552.1864818-1-mika.kahola@intel.com>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
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

W/A 14022081154 applies to port A, but intel_encoder_is_c10phy() also
matches PHY B on WCL, so the W/A ran on port B there. Filter on PHY_A.

On PTL nothing changes, intel_encoder_is_c10phy() already matched port
A only. MTL and LNL are not affected either, the W/A is for PTL+.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index e899b2eb0871..164fe7104545 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -5226,8 +5226,7 @@ static void sanitize_dpll_state(struct intel_display *display,
  * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
  * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
  * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
- * power state to save power. For PTL the workaround is needed only for port A. Port B
- * is not connected.
+ * power state to save power. The workaround is needed only for port A.
  *
  * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
  *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
@@ -5245,6 +5244,9 @@ void intel_dpll_power_save_wa(struct intel_display *display)
 		if (!intel_encoder_is_dig_port(encoder))
 			continue;
 
+		if (intel_encoder_to_phy(encoder) != PHY_A)
+			continue;
+
 		intel_cx0_pll_power_save_wa(encoder);
 	}
 }
-- 
2.43.0

