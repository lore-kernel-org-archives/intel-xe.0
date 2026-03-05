Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6678CF3D336
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 17:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9410E2CC;
	Thu,  5 Mar 2026 17:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfVBg4Yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD02A10E2C7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772730209; x=1804266209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6d5aBuspDlrEcEfYNSM25Vymlb4th/JnuwmK3LZfeLs=;
 b=LfVBg4YoyIEGsz/EZSVhZAsBs3f02YnvQw76pVTSTdB+rI/hV78SYXx2
 cy2HGM0cDWdl99dxsSal8Z0oSdmQB8HpeRVcVp45Cdu0VrcEkGWoCBGqP
 q6c9n1kTf/awcrHAYdlYDtgOiyVYZsbLyY0zLlR0hRCuuIlfTFttFzCTE
 GhEiLnPvAhQbBUzJicFVaH1kJxnBaMbVHKeipcI2xTCShDc+yDV8cqfyh
 Ts4YxX4qQsdDywT5pJ0hArDrT96LYD/v9BQevLaSQsE6l8037iCUH+ZdU
 A7IxheO0HpG+nfkDqq6Kn3JTNgWunWZ7O48PM12XigZexUllVN4iYkfj5 w==;
X-CSE-ConnectionGUID: svCarcDGRkCw0X8qi0oWYA==
X-CSE-MsgGUID: vwaaJ9bOSuiBrAggRhoiXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77697137"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="77697137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 09:03:06 -0800
X-CSE-ConnectionGUID: A3E9wLwqT7qbDft5GnNE8Q==
X-CSE-MsgGUID: 1apLKUmxSFCRB0DRF67HMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218871244"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa007.jf.intel.com with ESMTP; 05 Mar 2026 09:03:04 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, stuart.summers@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Thu,  5 Mar 2026 22:25:21 +0530
Message-ID: <20260305165519.4170892-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305165519.4170892-3-naresh.kumar.g@intel.com>
References: <20260305165519.4170892-3-naresh.kumar.g@intel.com>
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

 While previously applied only to the BMG G21(Battle image) platform
 via workaround Wa_14022085890, this 1.2 GHz minimum is now the default
 for BMG and CRI platforms.

 Setting this frequency floor(1.2GHz) default is critical in multi GPU
 environment for supporting effective Peer-to-Peer(P2P) transactions.

v2:
- Fix Indentation(Thomas)
- Add comment about power impact(Stuart)

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 21fe73ab4583..5b3d6604c4c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -886,6 +886,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
 	int ret;
+	struct xe_device *xe = pc_to_xe(pc);
 
 	lockdep_assert_held(&pc->freq_lock);
 
@@ -911,7 +912,17 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
-	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
+	/*
+	 * Setting GT RP min frequency to 1.2GHz by default for
+	 * all BMG and CRI(For BMG G21 WA do the same).
+	 *
+	 * This is an active frequency, so if the device is idle
+	 * we aren't expecting high power output across board
+	 *
+	 */
+	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
+	    (xe->info.platform == XE_BATTLEMAGE ||
+	     xe->info.platform == XE_CRESCENTISLAND))
 		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
 
 out:
-- 
2.43.0

