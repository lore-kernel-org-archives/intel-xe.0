Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DBB109E54B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 06:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C10510E2E1;
	Thu, 26 Mar 2026 06:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIecqc8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875E410E2E1
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774507300; x=1806043300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zbo7VbPD/ROJSDsBVZ1lti5h7hjduj85LrWYUklV9w4=;
 b=kIecqc8x53J3vElgceyH4hFGxW1fNT56LiV+Iz2tNPEvY5b/Tw87xDZ+
 uH4EBWSK2AC3WqFJSU4fQB781J5PdDmSxCYldJD+DFItVKYOQzaIavpTq
 PeINoXnPkv4aSKIBq4bfu/RBCJYV9h+K+5uRYFwhaPKOxvUPbSADoOUlD
 ifo7PAnZItbdTF0jHDT/pf2zUs71/FrYZrr1VgO4De+DgRUbC08zsjykm
 N24JiU6TW4+Lozub+DgCvFcZO6hLEE8jEEBTsS8unGsykottCP0NroCq/
 5xteQ13Zp1PrdDCanAUKVmwgN1s0Vc/R5U9BvO/FHuSCsStXdzY5G2KDN A==;
X-CSE-ConnectionGUID: OMD9tN99TRqQ/kBACBRbNQ==
X-CSE-MsgGUID: NMlGJ76LTGaYRp8CmH2jWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85863006"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85863006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:41:40 -0700
X-CSE-ConnectionGUID: ZpNPBbxDR1Ck+gFZ22s8lQ==
X-CSE-MsgGUID: H6LTQyWzSAKXkTazEwpGVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="262830470"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa001.jf.intel.com with ESMTP; 25 Mar 2026 23:41:38 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, stuart.summers@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Thu, 26 Mar 2026 12:04:09 +0530
Message-ID: <20260326063407.985568-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326063407.985568-3-naresh.kumar.g@intel.com>
References: <20260326063407.985568-3-naresh.kumar.g@intel.com>
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

v4:(Stuart)
- Move WA check to pc_needs_min_freq_change function

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5e5495a39a3c..f92feee3592d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -856,9 +856,26 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 	pc_init_fused_rp_values(pc);
 }
 
+static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	if (XE_DEVICE_WA(xe, 14022085890))
+		return true;
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
-	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
 	int ret;
 
 	lockdep_assert_held(&pc->freq_lock);
@@ -885,7 +902,18 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
-	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
+	/*
+	 * Setting GT RP min frequency to 1.2GHz by default for
+	 * GT0(Graphics) Tile of BMG and CRI.
+	 *
+	 * While BMG G21 WA will apply min frequency for
+	 * both GT0(Graphics) and GT1(Media) Tile.
+	 *
+	 * This is an active frequency, so if the device is idle
+	 * we aren't expecting high power output across board
+	 *
+	 */
+	if (pc_needs_min_freq_change(pc))
 		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
 
 out:
-- 
2.43.0

