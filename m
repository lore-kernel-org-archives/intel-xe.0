Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F6CCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 06:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA33D10EDBA;
	Mon,  8 Jun 2026 06:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBciAHzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2D410EDB6;
 Mon,  8 Jun 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780901613; x=1812437613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4EsfKOTJe5d7JDFe8kO88W/PuOH3LEH7LI6/ve9dhFE=;
 b=RBciAHzboAEdR9tcFgtt7VP8toPHPGtJ0L7J13+9NrKCHj8AuIxDZZEW
 FU0FyJnKR4hX25gSrWs78a6BWdmmZMlzvklPPTwaFZxqo6+4XoTPGo8gv
 h1+xaEBVAMRu4Y0HvxSGzgm6FThU2uzA50hGzsdbVl1a4zuxpeMg0CwB2
 A8gs839mmE3uxpsOj3Un48Qib5Xx3y0YXyAMhMpSW/vsC18BH9gxWr721
 2MWYk4/C6REu+/6H9zTgQfC0OBv31lWeELF4PK9Bear5aienn6SUBOGjo
 4EmCAMqpS22tRkZm/WzeXFjrqloPz7+nvadtw6xaHZ9iLd6ouPttvYFGw A==;
X-CSE-ConnectionGUID: mRejKt7dSS+KB723e8TdBw==
X-CSE-MsgGUID: bD3hg9KpTjalLR8UM2Y35A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="92196156"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92196156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 23:53:32 -0700
X-CSE-ConnectionGUID: 3a9Vh5/USPGInGzqdFlURQ==
X-CSE-MsgGUID: knW8vuZVReyd4vo89uObmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="249386288"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 23:53:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] drm/i915/psr: Do not check display or eDP revision for DP
Date: Mon,  8 Jun 2026 09:53:17 +0300
Message-ID: <20260608065317.20845-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

DP Panel Replay is supported only by display version >= 14. So no need to
check display version in case of DP when checking support for SDP on prior
scanline. Also checking eDP version doesn't make sense in case of DP.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index d9fcf52328eab..d93340a9d9f9e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1431,8 +1431,9 @@ static bool _compute_psr2_sdp_prior_scanline_indication(struct intel_crtc_state
 	if ((hblank_ns - req_ns) > 100)
 		return true;
 
-	/* Not supported <13 / Wa_22012279113:adl-p */
-	if (DISPLAY_VER(display) < 14 || intel_dp->edp_dpcd[0] < DP_EDP_14b)
+	/* Not supported <14 / Wa_22012279113:adl-p */
+	if (intel_dp_is_edp(intel_dp) && (DISPLAY_VER(display) < 14 ||
+					  intel_dp->edp_dpcd[0] < DP_EDP_14b))
 		return false;
 
 	crtc_state->req_psr2_sdp_prior_scanline = true;
-- 
2.43.0

