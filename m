Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08041FEC0F4
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DC810E108;
	Tue, 24 Mar 2026 18:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAe29XtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA12110E6B0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774376933; x=1805912933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+X0NFmi0wuCD4P774bDAQmpOHVaHaXb8rexMJs2B2g=;
 b=ZAe29XtTb1x5dhHsxYEE3xOeYB+LUKvrIkInXTlKuLmumI9YJajPM3A2
 kg26ekU0ufjwxEiHWDXooQ8ZReOYBpkyLMSRT7ugKIn5z48vYU8kpuE4k
 bunHLappbQax/h7UEhPTlBo2f7mlVGnGRhN/LgHAHvDdIyQpojg8Y6Ysj
 GepqHzQkX5yABuEnjdtrT37JlAZe801edg5t7U56cFRsxs59a3Cj7LZaY
 dqV2vkl9ghfG9kOaXh6tSOT4qacKMh3FB7o4MDcRIStQzsYJL3OeTFU1F
 QeZSWgPEyrjlkmkZk+buBd+q/7wHP1fhAd/Q0FFUip2v6LiFDbTZCAKPW w==;
X-CSE-ConnectionGUID: lbrZBvnRTLmvPxY/qMzFCw==
X-CSE-MsgGUID: KUrhvy/CR4WoFhPMpiI2NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75291451"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75291451"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 11:28:53 -0700
X-CSE-ConnectionGUID: +a2CUrMoSBaoWz42IOZ1OA==
X-CSE-MsgGUID: tJTFyC9rTR23eLrxuK3Xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229373575"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 11:28:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, stuart.summers@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Tue, 24 Mar 2026 23:51:38 +0530
Message-ID: <20260324182136.709386-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324182136.709386-3-naresh.kumar.g@intel.com>
References: <20260324182136.709386-3-naresh.kumar.g@intel.com>
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

 While previously applied only to both tiles GT0(Graphics) and Media(GT1)
 the BMG G21(Battle image) platform via workaround Wa_14022085890,
 this 1.2 GHz minimum is now the default for GT0(Graphics) tile
 of BMG and CRI platforms.

 Setting this frequency floor(1.2GHz) default is critical in multi GPU
 environment for supporting effective Peer-to-Peer(P2P) transactions.

v2:
- Fix Indentation(Thomas)
- Add comment about power impact(Stuart)

v3:(Thomas/Ankur/Matt Roper)
- Add setting frequency to only GT0(Graphics) Tile of BMG/CRI

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5e5495a39a3c..2abfc2fff083 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -856,6 +856,21 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 	pc_init_fused_rp_values(pc);
 }
 
+static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	if (xe_gt_is_media_type(gt))
+		return false;
+
+	if (xe->info.platform == XE_BATTLEMAGE ||
+	    xe->info.platform == XE_CRESCENTISLAND)
+		return true;
+
+	return false;
+}
+
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
@@ -885,7 +900,19 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
-	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
+	/*
+	 * Setting GT RP min frequency to 1.2GHz by default for
+	 * GT0(Graphics) Tile of BMG and CRI.
+	 *
+	 * While BMG G21 WA will apply min freqeuncy for
+	 * both GT0(Graphics) and GT1(Media) Tile.
+	 *
+	 * This is an active frequency, so if the device is idle
+	 * we aren't expecting high power output across board
+	 *
+	 */
+	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
+	    pc_needs_min_freq_change(pc))
 		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
 
 out:
-- 
2.43.0

