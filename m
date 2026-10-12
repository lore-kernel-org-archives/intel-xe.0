Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87360CA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD09710F08B;
	Mon, 12 Oct 2026 12:42:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7A410EF66;
 Mon, 12 Oct 2026 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808915; x=1823344915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbtS6AAJCYcjvP2f590ko9pTpWQusuGlOcYnv/kgtXw=;
 b=focO9nLf7mLAfJoSFS8X4VaRkGtaAMmKVPMI4Kw+wWNwz0a8/QjOpSeD
 TgCn8sRHKoO/FeIzfo1IfmhlsqvLNgFT6r16P/xsUACSHzR0hVppcU0lV
 66v7nTwLGbYN3CFwL0AiE/AcSBpHTxxNKoHjBhC5AZbPNG7trhLxiRMoD
 EPRAJORVpta0fxV6xGg0rXgOPKt/BY4gd8kE0SAL4RCfud/8pcPs9Ugh1
 hudXlXv+DPOOQfmYsktvbBZcTjRU5uHTjPctzuxGAa69Qumukiy4jJI99
 KAmRpVgeBFk/WSvGWvUJI/FvipKwE13OFbihFH7AJ2pN2R8oq275B9Czn A==;
X-CSE-ConnectionGUID: REDzK0JxTwupKl0yP40l+Q==
X-CSE-MsgGUID: Sc5WdfcpQSSf51hP3ZA1iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506209"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:53 -0700
X-CSE-ConnectionGUID: 3rEQkE4aSuidRgVzvmqknw==
X-CSE-MsgGUID: uVUDryBuSqewoq/+8I6dLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808166"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:52 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 3/6] drm/i915/psr: Take the selective fetch area from
 pipe_mode
Date: Mon, 12 Oct 2026 12:41:42 +0000
Message-ID: <20261012124145.1960050-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012124145.1960050-1-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
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

The adjusted mode spans all the joined pipes, so it is the wrong
reference for a per-pipe area. pipe_mode is the per-pipe timing.

No functional change, the two are the same without a joiner.

v2: Use pipe_mode instead of pipe_src (Jouni)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 76260ceb49cb..6ec13737e248 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2912,8 +2912,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	struct drm_rect display_area = {
 		.x1 = 0,
 		.y1 = 0,
-		.x2 = crtc_state->hw.adjusted_mode.crtc_hdisplay,
-		.y2 = crtc_state->hw.adjusted_mode.crtc_vdisplay,
+		.x2 = crtc_state->hw.pipe_mode.crtc_hdisplay,
+		.y2 = crtc_state->hw.pipe_mode.crtc_vdisplay,
 	};
 	bool full_update = false, su_area_changed;
 	int i, ret;
-- 
2.43.0

