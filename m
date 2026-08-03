Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CABC55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 22:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331DF10E041;
	Mon,  3 Aug 2026 22:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9DJk9Ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766A10E041
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 22:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785796006; x=1817332006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ws+hmS/NOlaDS0cyQlvalFMoqw5dntHqKzbAJLizBOs=;
 b=Q9DJk9Iec0qw+4cZji3cgTeMRvm2CaZvQuu7+wl72/x9y3BVNH3F/O+f
 9hSmVY+xJ2z1FbwvvUVnOgzEpHDsp+Vzh63NNtoOoM9C8ZU/EWn5HoHCG
 FWMgYFS+Dd6OQj9xnVU/u71/gulUE4lLJozstgodiJrqFwMPnCIZJ2lXC
 gr1Ze1noAnL/g4MsLOrUTklIUv2iib7ScTNszdAApwvc0+87yBZU4Qdd7
 cW5WevcHnE2lBshwawv0bWMtgiL5TEimM5uxW4gCiEYYGaM+V7LWswuLY
 s0YW43GGGxjJS3bBpl7y9DWZwOQNRfjV4POdeu4U44HiQ+ruh+txEFKq9 g==;
X-CSE-ConnectionGUID: KYzYC+EZTE263Q3GdhcklA==
X-CSE-MsgGUID: OLQqadCFSeOTdO0siLATkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86352540"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86352540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:26:45 -0700
X-CSE-ConnectionGUID: cpniKKVsSpq2CrXbdrXC2Q==
X-CSE-MsgGUID: dnYXHaD6S4a2+YEurj+9ew==
X-ExtLoop1: 1
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 15:26:44 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Date: Mon,  3 Aug 2026 15:21:07 -0700
Message-Id: <20260803222107.1508812-1-vinay.belgaumkar@intel.com>
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
min frequency. Use the xe_guc_pc_get_min_freq_locked() variant to
obtain the frequency as a good practice, and cache the changed value
to fix this issue.

Fixes: bdde16c9ac5c ("drm/xe/bmg: Update Wa_14022085890")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 59f2fa79ad42..8bc2ae15a835 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -911,10 +911,15 @@ static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
+	u32 min_freq, max_freq;
 
 	lockdep_assert_held(&pc->freq_lock);
 
-	ret = pc_action_query_task_state(pc);
+	ret = xe_guc_pc_get_min_freq_locked(pc, &min_freq);
+	if (ret)
+		goto out;
+
+	ret = xe_guc_pc_get_min_freq_locked(pc, &max_freq);
 	if (ret)
 		goto out;
 
@@ -923,7 +928,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	 * overclocking. Let's adjust it to the Hardware RP0, which is the
 	 * regular maximum
 	 */
-	if (pc_get_max_freq(pc) > pc->rp0_freq) {
+	if (max_freq > pc->rp0_freq) {
 		ret = pc_set_max_freq(pc, pc->rp0_freq);
 		if (ret)
 			goto out;
@@ -933,8 +938,12 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	 * Same thing happens for Server platforms where min is listed as
 	 * RPMax
 	 */
-	if (pc_get_min_freq(pc) > pc->rp0_freq)
+	if (min_freq > pc->rp0_freq) {
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
+		if (ret)
+			goto out;
+		min_freq = pc->rp0_freq;
+	}
 
 	/*
 	 * Setting GT RP min frequency to 1.2GHz by default for
@@ -947,8 +956,8 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
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

