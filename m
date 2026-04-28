Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47E7FF886D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 10:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A9210E322;
	Tue, 28 Apr 2026 10:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeXXnpFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220110E322
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777371338; x=1808907338;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FQ4SvPW3NR93YbjPKYrX92Sj0J1eOJAQd3MJb4sFT0Q=;
 b=NeXXnpFkG/kdjZ5dEafPv278GXqpZiUPTTObYP69cjFJnk2AmRxovqdI
 6425Usd+uTt4hRBLJKlqwYDhv60F6Qudq1BuAQH1D1syMOxkzieaiHnJV
 hswpomC0kqoua0AGfvQEDGIMGV4jwWQlHW2U7Unvtu8DwCR+am94drDBh
 2Wo4d2gciV+3/CSb5Z7miDmJPnBQZrPeVyAISS5glyhasAWdP/8mmZtA7
 tJAaxxCtm/tknWgYNx8g02Z5es+Qqjsty7i+KeLEX8kuhKBr6S3krG/bT
 /ZEWy+5LjHEwABozYtxCAwmf0MddiRp1fm/IP8+g2MlYmGd01+if5S4Ru w==;
X-CSE-ConnectionGUID: jBCp3912QzGrArKDOI3BrA==
X-CSE-MsgGUID: PdXZVYQYR6CWlq5OOeZMQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89737491"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="89737491"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 03:15:37 -0700
X-CSE-ConnectionGUID: kZfJ8OLeRaydcsMWqQ4SKw==
X-CSE-MsgGUID: j2/vGf9MQUOvRg+Ks3+7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233787427"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa008.jf.intel.com with ESMTP; 28 Apr 2026 03:15:36 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 vinay.belgaumkar@intel.com, tejas.upadhyay@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add wa_14025941587 for xe3 and xe3p platforms
Date: Tue, 28 Apr 2026 15:45:19 +0530
Message-ID: <20260428101519.2032607-1-tilak.tirumalesh.tangudu@intel.com>
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
Apply wa_14025941587 to Graphics Versions 30.00 to 35.11

v2: Use xe_rtp_match_not_sriov_vf, move to local variable
    Remove warn and other knits            - Matt R

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c  | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..05127be3d9d9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -569,7 +569,10 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	u32 maxcnt_units_ns = 640;
 	bool inhibit_switch = 0;
 
-	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
+	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
+	    XE_GT_WA(gt, 14025941587)) {
+		u32 mincnt_idledly_ns = 5000;
+
 		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
@@ -579,11 +582,17 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
-						    idledly_units_ps);
-			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
-		}
+		if (XE_GT_WA(gt, 16023105232) &&
+		    (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)))
+			idledly = (maxcnt - 1);
+
+		if (XE_GT_WA(gt, 14025941587) &&
+		    (idledly < mincnt_idledly_ns || inhibit_switch))
+			idledly = mincnt_idledly_ns;
+
+		idledly = DIV_ROUND_CLOSEST((idledly * 1000),
+					    idledly_units_ps);
+		xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b80..0c0c56c3c833 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -65,3 +65,4 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14025941587    GRAPHICS_VERSION_RANGE(3000, 3511), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.46.0

