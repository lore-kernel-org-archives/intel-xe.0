Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA38606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lItuETmb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9745C10E94F;
	Thu, 12 Nov 2026 11:03:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A0C10E94F;
 Thu, 12 Nov 2026 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794481430; x=1826017430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XHWH4D6W4z0rp441da7OtLKxCG1K6huXMv59BeQQqpg=;
 b=lItuETmbFSeJeQZ6CeRb9dSSOpbEQlpVKNO4D/HiURQ6cSIbRSzKQ+ES
 mhcjnudyIW/QHqyHz6tXGUNuswVGpoN6Y7F2uALv0pj2y2Dzt19eGZhup
 TgvtunkJnXk9hyuhr3HNyi+RsgQgv4k4CLvRgA/jL5t5Z8FCbEG14xezJ
 qHVvIRbxjG49MISunbG45HC4gnA6VSh6/Jox7J3koB5Kfow4gbVmCBkCq
 mX3d6saIv4xd+TtAuCRuXJNrHAhmvdW4luDw8qAOPWrsPZ+3JYpYd+Rt9
 4VaTU4mhqmusoYD7ZRIXTfykcStMYkT9tTXICai+0/ErUbQldbznkwNWq Q==;
X-CSE-ConnectionGUID: T2rbnXNqQVuxNMxi0auY2w==
X-CSE-MsgGUID: SSaUdWkMT6ahFIMHWHypxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3140462"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3140462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:03:49 -0800
X-CSE-ConnectionGUID: yr8dIToGRnCzMsHZGHdw8g==
X-CSE-MsgGUID: 6LC0Ro8NQUSPFHgxnvzPyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8800097"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2026 03:03:48 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/psr: Check the transcoder for eDP Panel Replay
Date: Thu, 12 Nov 2026 11:03:45 +0000
Message-ID: <20261112110345.571870-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSR/PR is per transcoder and joined pipes use the primary's. Checking
the joined pipe mask wrongly rejects a pipe B primary joined to pipe C,
so check the transcoder instead. Unjoined pipes are unaffected.

Fixes: 82a273802e29 ("drm/i915/psr: Allow Panel Replay and PSR2 with joiner")
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bd1656360324..438cb1502c26 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1752,8 +1752,8 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 
 	/* Remaining checks are for eDP only */
 
-	/* Every joined pipe needs its own PSR/Panel Replay register block. */
-	if (intel_crtc_joined_pipe_mask(crtc_state) & ~(BIT(PIPE_A) | BIT(PIPE_B)))
+	/* PSR/PR is per transcoder, joined pipes use the primary's. */
+	if (!transcoder_has_psr2(display, crtc_state->cpu_transcoder))
 		return false;
 
 	/* 128b/132b Panel Replay is not supported on eDP */
-- 
2.43.0

