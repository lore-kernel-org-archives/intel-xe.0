Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F76CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 03:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEEB10E465;
	Mon, 11 May 2026 03:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9Kuk9+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5111410E47B;
 Mon, 11 May 2026 03:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778469694; x=1810005694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JfH4eUXBbXm1Ti6a1y4NOnZ5GqQfJf6fuJRioJfza4E=;
 b=M9Kuk9+u0UNVAhOkeCt4JJMfI78sdhB62HQHpnyqP0PaXqBJveDChrHd
 /voSbVI+2zsc59PJJChR55WJ3BiDdQvk3s3o8YF2ltD1+jhuo7wfS2jZq
 qE34SnSWcdvP1D/Kx33HgtAaeU6FeGZ25wXAMzhzmZBd242WhS3EV2Pot
 lPRCbnPVF+3jYIDJMePjEGOcwn1hVmAJ4TenoYaMMitqlSa2APns2bxZ1
 RUwPadmRS+PwqOjs1/O/KR0oAhLSA33Kr3iVCiwAi3GqPJcBq2+xXzXkA
 o0yB9i25qZjKAqlmoLRii15s5kAmsE36V8J4uXLD92LXsq6Dqk92ZXG5I A==;
X-CSE-ConnectionGUID: 9LIDqsWaQGatfkk1au7JgA==
X-CSE-MsgGUID: 1zV9iHlaS5OzOApH+jDgtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="96917110"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="96917110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:21:34 -0700
X-CSE-ConnectionGUID: 8XOG73MpQAO736Hp+omqDQ==
X-CSE-MsgGUID: qK2fhH7STliWBbtfL9IM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="260796676"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 10 May 2026 20:21:32 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, imre.deak@intel.com, ville.syrjala@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/dp: On DPCD read failure skip LT
Date: Mon, 11 May 2026 08:50:07 +0530
Message-Id: <20260511032007.104081-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

The commit e42e7e585984 ("drm/i915: Fix modesetting in case of
unexpected AUX timeouts") continue the LT even if DPCD read failed.

But doing so will blot the dmesg with multiple AUX Tx errors, so skip
the LT but continue the modeset seq for the reason said in the above
mentioned patch.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index a26094223f78..2598e4ba9712 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1776,9 +1776,12 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 
 	lttpr_count = intel_dp_init_lttpr_and_dprx_caps(intel_dp);
 
-	if (lttpr_count < 0)
-		/* Still continue with enabling the port and link training. */
-		lttpr_count = 0;
+	if (lttpr_count < 0) {
+		/* skip LT but complete the modeset seq */
+		lt_dbg(intel_dp, DP_PHY_DPRX,
+		       "Reading LTTPR/DPRX caps failed, skip LT\n");
+		goto retry;
+	}
 
 	intel_dp_prepare_link_train(intel_dp, crtc_state);
 
@@ -1795,6 +1798,7 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 		return;
 	}
 
+retry:
 	intel_dp->link.seq_train_failures++;
 
 	/*
-- 
2.25.1

