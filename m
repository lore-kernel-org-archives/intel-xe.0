Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CC2C55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 23:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF3110F030;
	Wed,  5 Aug 2026 23:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ij5wLYhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F6110F030
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 23:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785973932; x=1817509932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0E8y0srJlM1sx59jiZAoZLqHt3jZkh5mariKc0/B7cg=;
 b=Ij5wLYhIMp7F7f/4X7AKnMT67vpUE0o7GdWQnnBbMun7ALe9gQM2OGss
 3h69i30GL8Cf5Ny0c9CPVAUXm4XY5marN94612Kh3u/Ysp7YX/r5gH3vw
 DWvtzn41wcLoV+SFepIgFdtd9vtcsZeS/KzIUgzreLjh9txRVVFNrx2Vs
 zaU+ytNIRTCBplHLnnjP+Mb8hgcwVuuLi7044wKP1eX9hfupIrdk1spNp
 eaKgb8iUmYINijl5qAMH5vy+BkPGnJ6e3Tv0+AoznDYr45cTcvAPBm71t
 KCOStYgH+3athFwSETzHVwYMsQmWzcqwYLMMS9c/J7RPoe1u1UqM/UAbM A==;
X-CSE-ConnectionGUID: lkpMf6oaRke0+z3ahftrvg==
X-CSE-MsgGUID: vbnWiEA4QjWSYG3hhI3N8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="109353124"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="109353124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:52:12 -0700
X-CSE-ConnectionGUID: 9U8jIp9zQtGJQtr5meZ1rQ==
X-CSE-MsgGUID: 0ZOFBJp4RRGoiCeRkMwzUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="285315853"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa002.fm.intel.com with ESMTP; 05 Aug 2026 16:52:11 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Date: Wed,  5 Aug 2026 16:46:49 -0700
Message-Id: <20260805234649.2076384-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

In cases where min frequency was actually greater than BMG_MIN_FREQ,
we were not using the updated min frequency as there was a missing
call to pc_action_query_task_state() between the two settings of
min frequency. Since we know what min_freq was last set, use that
cached value while comparing to BMG_MIN_FREQ to fix this issue.

v2: pc->freq_ready is not set until after pc_adjust_freq_bounds(). Stay
with pc_action_query_task_state() instead.

v3: Update commit message (Stuart)

Fixes: bdde16c9ac5c ("drm/xe/bmg: Update Wa_14022085890")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 59f2fa79ad42..7cf8f4858598 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -911,6 +911,7 @@ static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
+	u32 min_freq;
 
 	lockdep_assert_held(&pc->freq_lock);
 
@@ -933,8 +934,14 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	 * Same thing happens for Server platforms where min is listed as
 	 * RPMax
 	 */
-	if (pc_get_min_freq(pc) > pc->rp0_freq)
+	min_freq = pc_get_min_freq(pc);
+	if (min_freq > pc->rp0_freq) {
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
+		if (ret)
+			goto out;
+
+		min_freq = pc->rp0_freq;
+	}
 
 	/*
 	 * Setting GT RP min frequency to 1.2GHz by default for
@@ -947,8 +954,8 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	 * we aren't expecting high power output across board
 	 *
 	 */
-	if (pc_needs_min_freq_change(pc))
-		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
+	if (pc_needs_min_freq_change(pc) && min_freq < BMG_MIN_FREQ)
+		ret = pc_set_min_freq(pc, BMG_MIN_FREQ);
 
 out:
 	return ret;
-- 
2.38.1

