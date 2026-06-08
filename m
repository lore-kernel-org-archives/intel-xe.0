Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663ACCD8CAB
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D2810F450;
	Mon,  8 Jun 2026 14:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jcm7I1in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DE410F44F;
 Mon,  8 Jun 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780927938; x=1812463938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fFbaASA6lj0SpsVjvDv/Dlzy86pSDsKsPVdrm1ZI234=;
 b=Jcm7I1intXFRoPL5waZCqvYLUrTHaBERbhn2K2+AEGUPuuXertaafkN5
 AQqy7k8bFvDqCOT4fJhnS+V5mXKXEAKFUTD6c5u+HKCOH1itco/Wu+Fo8
 N/Sj5QuG46P7b1MG5nZAyGIj/4yHG3sWFhl6tV6iUUXxxVF7OUlTvRJFM
 aT6OGSOyTTs4FsyjFGTTzFG4iHMIMCL8sJcQzbb+BLwMqxAiLJwxuHmE6
 LxVJA6bgwnOEbDiwVnf3deAetzTWi/+m5nBi4rBpwR3pmkjC27jnEa4kw
 z2RP6dfDS/rQqs1NTwd/IdSHrgsK4EpypZHCN7NP6Toupae3UeZ+a1vG3 g==;
X-CSE-ConnectionGUID: S4UMCsDBTH2ki4KQETXZTw==
X-CSE-MsgGUID: yV0hHPxfQcqzqaOmPiZ9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81781295"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81781295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:18 -0700
X-CSE-ConnectionGUID: SEhf5yRFQxOcdHz60Sj7+Q==
X-CSE-MsgGUID: tzFh1AzvSD2ReDKwRCN1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241113694"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:16 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 1/7] drm/i915/psr: Check FEC support for DP Panel Replay
Date: Mon,  8 Jun 2026 17:11:18 +0300
Message-ID: <20260608141124.144878-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608141124.144878-1-jouni.hogander@intel.com>
References: <20260608141124.144878-1-jouni.hogander@intel.com>
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

DP Panel Replay spec mentions FEC needs to be enabled when using Panel
Replay. Check support for FEC and disable Panel Replay if not supported.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e138982dc91f6..ad2f6c79f5808 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1851,8 +1851,15 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
 	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_dp_is_edp(intel_dp)) {
+		if (!intel_dp_supports_fec(intel_dp, connector, crtc_state)) {
+			drm_dbg_kms(display->drm,
+				    "Panel Replay not enabled because FEC not supported\n");
+			return false;
+		}
+
 		return true;
+	}
 
 	/* Remaining checks are for eDP only */
 
-- 
2.43.0

