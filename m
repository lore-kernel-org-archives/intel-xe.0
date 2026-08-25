Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7CFC5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F70510E8ED;
	Tue, 25 Aug 2026 06:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNWOIWXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDE910E8D3;
 Tue, 25 Aug 2026 06:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638767; x=1819174767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H9EZ1NjHlPgTle9NL9A563C6GMKFyu06SnIKLHFApM0=;
 b=kNWOIWXAn44T7V4cAQ8pJ1hWQWulO2arm6xXAf7qmikOL2ZC4BBQPuuk
 S1OxYWwFW4Q4+Dtuah1mxgDEWElWv+s9eG/ERrv9dlejIVS03JpsypBwK
 T2GwmCvMdEjn0ELEgC8nHdIz6vQFp450udjGhgwYwW/FuiVatFaLzUbAp
 T/C0Q+quS8tza059pPuBuxnDag3vwt9U66SFfkDxLk5RTcFshggVyloi2
 FKs+dnyZuHR779T7Mfu+c2Ydd/BVQxxRzoLKyPNz7g5iGFa0yH8CSalub
 7V/10IBsI61KtGZlT3XfSLLuV7zMub8dvqID749XIhRJMfjLAI8Zx+OoX g==;
X-CSE-ConnectionGUID: CCFfIpLiT5qUfBk5DxaHNQ==
X-CSE-MsgGUID: WbzTAMJzRTGXKL6rBmtSJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112670"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112670"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:26 -0700
X-CSE-ConnectionGUID: twFwC+BJThe7hNBZo65+Fg==
X-CSE-MsgGUID: ExObCh9wRpmWwKDLjy4cZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912960"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:25 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation
Date: Tue, 25 Aug 2026 11:15:29 +0530
Message-Id: <20260825054536.3455704-9-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for half LFPS cycle calculation for DP2.1 ALPM as dependent
parameters got changed.

v1: Initial version.
v2: Avoid returning early. [Jani]
v3: Use intel_crtc_has_type(). [Suraj]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 078e04bb69d2..98aa418a6ff7 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -80,12 +80,18 @@ static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
 static void get_lfps_cycle_min_max_time(const struct intel_crtc_state *crtc_state,
 					int *min, int *max)
 {
-	if (crtc_state->port_clock < 540000) {
-		*min = 65 * LFPS_CYCLE_COUNT;
-		*max = 75 * LFPS_CYCLE_COUNT;
-	} else {
-		*min = 140;
-		*max = 800;
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	*min = 320;
+	*max = 1600;
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		if (crtc_state->port_clock < 540000 && DISPLAY_VER(display) < 35) {
+			*min = 65 * LFPS_CYCLE_COUNT;
+			*max = 75 * LFPS_CYCLE_COUNT;
+		} else {
+			*min = 140;
+			*max = 800;
+		}
 	}
 }
 
-- 
2.29.0

