Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB4C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 08:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62CD10E0D7;
	Tue,  8 Sep 2026 08:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iowyZZug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F329810E0D7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788856704; x=1820392704;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZO7X+7Q6d/XSn3zJW+GZ8/ma2AuSBrnaXLimqJiMmsE=;
 b=iowyZZug5qS/c08RhYspiLZKFNrMKxdtP2+f2AUfb9BAuSjQ78M0K7dY
 nI29+m9gW4lbyc1AK3c7FEk5IytolzhFdUiTQQf+yNcu5aJEFL47g9ljm
 lqWGjgxvoVbEe+a24dB9JNZbGDYb+JfYc0I8GAIQ4IW5N/dI3OlIzF43m
 OPCnfoQJdiqurNLcXpaT0rIgsq2HblukPGpS0/ll7+etSzYETyIwgCKkn
 ZyZSMYmeYERp1ADEKKP6cJjTT5g6Z5h78HcMGsokDlK4JZSN8rNfX95sQ
 xhFKHvY2A6cnpylEneP5e1AcSHk3ByC7RExBrC8H9yfIQPk3uQAfrvxAw w==;
X-CSE-ConnectionGUID: uvOkIVGZTmmXntCk4L5aPQ==
X-CSE-MsgGUID: a4+la/nkSZm+SBx/EFE5/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89456558"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89456558"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:38:24 -0700
X-CSE-ConnectionGUID: mjzrSNk/S7iEKIHiTYWsLw==
X-CSE-MsgGUID: Y+C/BD9FSzOxUNuC5G4LMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274717369"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa004.jf.intel.com with ESMTP; 08 Sep 2026 01:38:23 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Tue,  8 Sep 2026 14:06:56 +0530
Message-ID: <20260908083656.51704-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Avoid IDLEDLY timer programming lessthan 5 micro secs.
Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
and Media Versions 13.01 to 35.03

v2: Use xe_rtp_match_not_sriov_vf, move to local variable
    Remove warn and other knits            - Matt R

v3: Add verbose comment - Tejas

v4: Restore IDLE_DLY register on engine reset.
    Add it to GUC save-restore list. -Vivek

v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
v6: Avoid clearing inhibit switch - Bala
    Refactor code accordingly by adding idle_reg_val.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 52 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 3 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ff8eee3831aa..58a3f6293ce4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	if (XE_GT_WA(hwe->gt, 16023105232))
+	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
 		guc_mmio_regset_write_one(ads, regset_map,
 					  RING_IDLEDLY(hwe->mmio_base),
 					  count++);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 010499766fce..5a87f26d7dd4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -588,25 +588,57 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 static void adjust_idledly(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
-	u32 idledly, maxcnt;
+	u32 idledly, idledly_reg_val, maxcnt;
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
 	u32 maxcnt_units_ns = 640;
-	bool inhibit_switch = 0;
+	bool inhibit_switch = false;
+	bool wa_applied = false;
 
-	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
-		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
+	    XE_GT_WA(gt, 14025941587)) {
+		u32 mincnt_idledly_ns = 5000;
+
+		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
-		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
-		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
+		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
+		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
 		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
-						    idledly_units_ps);
-			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
+		/* Wa_14025941587: applied prior to Wa_16023105232,
+		 * as the latter has higher priority, although conflict
+		 * is not expected.
+		 */
+		if (XE_GT_WA(gt, 14025941587) &&
+		    idledly < mincnt_idledly_ns) {
+			idledly = mincnt_idledly_ns;
+			wa_applied = true;
+		}
+
+		if (XE_GT_WA(gt, 16023105232) &&
+		    xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
+			idledly = (maxcnt - 1);
+			wa_applied = true;
+			/* inhibit_switch override to keep
+			 * semantics of Wa_16023105232
+			 */
+			if (inhibit_switch)
+				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
+		}
+
+		if (wa_applied) {
+			idledly_reg_val &= ~IDLE_DELAY;
+			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY,
+						 DIV_ROUND_CLOSEST(idledly * 1000,
+								   idledly_units_ps));
+			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
+				  hwe->name, idledly, maxcnt,
+				  !!inhibit_switch, gt->info.timestamp_base);
+			xe_mmio_write32(&gt->mmio,
+					RING_IDLEDLY(hwe->mmio_base),
+					idledly_reg_val);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index dd69ad07f7a9..27af7f2eb095 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,3 +72,5 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14027054324	GRAPHICS_VERSION(3511)
+14025941587    GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
+	       MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.46.0

