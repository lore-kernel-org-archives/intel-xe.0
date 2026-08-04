Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A21C55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 23:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A755C10E11D;
	Tue,  4 Aug 2026 23:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQe5X1Wt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D810E11D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 23:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785886042; x=1817422042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vZoSpN49uvv2BB8eWEiBBdfnAGbfkZ/KThxnZNlpMOg=;
 b=YQe5X1WtycnseRV4vqC4eNP4CCXB1NwvXnTHUCXcOp4rZ+WCMkOgcSv4
 LdOTFjwsEZGNW3C+btXOcMbqt2lSWszrU28rMCmpHXX+2y7pKVQfZYBqE
 8F31PWD0TEsArSOFAwc+9m+uMqxFpvF9JkFtO4ZN6sA7omtLEdJ9PCRCW
 WXNLTzR+d7rZl64Up9oJTT12XF1Wgd15MnM4+LBYTAK+Bh7nf0KaPT5VS
 Ffg9QqkrZVJ6dp1Ug+uHTo/JpRDi7ltK9DtNCB3UDR1/03F/kxO4rnySH
 y6Jbv1CD6ZWWGcyd3Ll3bDkyvft6eiBcjvvzJFc/+apQZncehksn6kND+ Q==;
X-CSE-ConnectionGUID: p37939SQQ8iFmrq5W4lIUA==
X-CSE-MsgGUID: MVNhRgdpRluTbKksVFKKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86649822"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86649822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 16:27:21 -0700
X-CSE-ConnectionGUID: gAj29puzQGS9LU2bn5pUEA==
X-CSE-MsgGUID: 6lBX3OoPRIWACrj1zv+vUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="291580955"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa002.jf.intel.com with ESMTP; 04 Aug 2026 16:27:21 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Date: Tue,  4 Aug 2026 16:22:18 -0700
Message-Id: <20260804232218.1736159-1-vinay.belgaumkar@intel.com>
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

v2: pc->freq_ready is not set until after pc_adjust_freq_bounds(). Stay
with pc_action_query_task_state() instead.

Fixes: bdde16c9ac5c ("drm/xe/bmg: Update Wa_14022085890")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 59f2fa79ad42..3106ac50827c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -911,6 +911,7 @@ static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
+	u32 min_freq;
 
 	lockdep_assert_held(&pc->freq_lock);
 
@@ -933,8 +934,13 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	 * Same thing happens for Server platforms where min is listed as
 	 * RPMax
 	 */
-	if (pc_get_min_freq(pc) > pc->rp0_freq)
+	min_freq = pc_get_min_freq(pc);
+	if (min_freq > pc->rp0_freq) {
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
+		if (ret)
+			goto out;
+		min_freq = pc->rp0_freq;
+	}
 
 	/*
 	 * Setting GT RP min frequency to 1.2GHz by default for
@@ -947,8 +953,8 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
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

