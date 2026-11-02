Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B85606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTSZnxa/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E846A10E5FC;
	Mon,  2 Nov 2026 10:01:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCE910E5E9;
 Mon,  2 Nov 2026 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613675; x=1825149675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ceAY1VV30ShnVeuRaMeV2/Ycz5KJfv1lgnbnTg4kO4=;
 b=HTSZnxa/3KwJuu9u7KDMWgGyxOfAtr283cDkeisCWGka2Ku+m3nXfbi6
 7r8s3N/E9JVUKM9Ey+BKJJk4olj/0Ss3KUYnsXhVe0//s1Tibh53UXMnD
 cSfMkLSNVutZ1VJ0yNHVy9xgl03jtn7mRXnqHsqmdO7xLKooor6xNkn+u
 y+eo0YhE4DAJ3gmmc/Stoy+Qv7uddRRX9AUCEHsgq1pyK1U21j0zfn4tn
 qoZ/sIXs8hIYgMFJt0SelWc7JcNc9cCfk2KdG0rvbjdvD1qlVBf5ERjIA
 UzA+Y7OA7HMtCYeytHGN4YDdIZQWtosiSJOlH6fi5/psTiebdLuUBfbpg Q==;
X-CSE-ConnectionGUID: HC7uehoJScm8oO5kZThARA==
X-CSE-MsgGUID: phbbPNF9TCmC9oxD0KSw+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2204605"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2204605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:15 -0800
X-CSE-ConnectionGUID: uu94D5AERiKGUUldERdgYQ==
X-CSE-MsgGUID: fKHlAxCfStms2W3lx7S53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6068346"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:13 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 3/4] drm/i915/psr: Clear CFF state on flip flush
Date: Mon,  2 Nov 2026 12:00:50 +0200
Message-ID: <20261102100051.272137-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102100051.272137-1-jouni.hogander@intel.com>
References: <20261102100051.272137-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An ORIGIN_FLIP flush can clear the last busy frontbuffer bits without
running _psr_flush_handle(), leaving the CFF state flag set.

Clear CFF state when no frontbuffer bits remain busy, and queue PSR
work only when inactive and not paused.

Fixes: 805f04d42a6b ("drm/i915/display/psr: Use continuos full frame to handle frontbuffer invalidations")
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 29 ++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index be1edd9099fb3..bd16563603249 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3798,12 +3798,6 @@ static void _psr_flush_handle(struct intel_dp *intel_dp)
 		intel_psr_exit(intel_dp);
 	} else if (intel_dp->psr.psr2_sel_fetch_enabled) {
 		/* Selective fetch prior LNL */
-		if (intel_dp->psr.psr2_sel_fetch_cff_enabled) {
-			/* can we turn CFF off? */
-			if (intel_dp->psr.busy_frontbuffer_bits == 0)
-				intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
-		}
-
 		/*
 		 * Still keep cff bit enabled as we don't have proper SU
 		 * configuration in case update is sent for any reason after
@@ -3859,13 +3853,8 @@ void intel_psr_flush(struct intel_display *display,
 
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
-		/*
-		 * If the PSR is paused by an explicit intel_psr_paused() call,
-		 * we have to ensure that the PSR is not activated until
-		 * intel_psr_resume() is called.
-		 */
 		if (intel_dp->psr.pause_counter)
-			goto unlock;
+			goto rearm;
 
 		if (origin == ORIGIN_FLIP || origin == ORIGIN_CURSOR_UPDATE)
 			psr2_dc3co_flush_locked(intel_dp, frontbuffer_bits);
@@ -3877,8 +3866,20 @@ void intel_psr_flush(struct intel_display *display,
 		_psr_flush_handle(intel_dp);
 
 rearm:
-		if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
-			queue_work(display->wq.unordered, &intel_dp->psr.work);
+		if (!intel_dp->psr.busy_frontbuffer_bits) {
+			if (intel_dp->psr.psr2_sel_fetch_cff_enabled)
+				intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
+
+			/*
+			 * If the PSR is paused by an explicit
+			 * intel_psr_paused() call, we have to ensure that the
+			 * PSR is not activated until intel_psr_resume() is
+			 * called.
+			 */
+			if (!intel_dp->psr.active && !intel_dp->psr.pause_counter)
+				queue_work(display->wq.unordered, &intel_dp->psr.work);
+		}
+
 unlock:
 		mutex_unlock(&intel_dp->psr.lock);
 	}
-- 
2.53.0

