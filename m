Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469C1CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 13:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9810F178;
	Thu, 28 May 2026 13:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Za6Ds97L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1C10F178
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779974452; x=1811510452;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wveJoH7P7gMzjZCwOlNEgwiPEpjps9bvIdhCp+Tny8c=;
 b=Za6Ds97LWGY9aYx5MPrUvVdFeiG/lwvEEgMWqLQcCSEcA4U1hAG17cj5
 WCUxjq4hxjxeCf01L7eR+KOSfcvKyML7n59dzxT2hkPHf8bAfkEH//0kL
 pWPHOMK57NJhtyzADbqXlW6NQCEqOdYwNyoicYdE35y2Hop2e36gdPQm6
 ZyRWK/PUziW4ZdsXRZs7pLLQORxICEA370JoFCqChH43gQoHdZih7mF39
 O61Nx8iTAHKYoxty4/Mi5OH457Yekw2WAsPir57QGoIZJ/H/lFmWTYIxL
 EWMKURtm6lQVWJhrJGc6g/HZ/391Qx25K8lpDFXIQjEL9v8s1ppQQaeoC w==;
X-CSE-ConnectionGUID: wY9Qk5gVRsSmdvYuqcfmJw==
X-CSE-MsgGUID: HYWVyvl8R6ajr8ODR0pzRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91925546"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91925546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 06:20:51 -0700
X-CSE-ConnectionGUID: MEiz1LAeQp6xFJ2OvqTbbw==
X-CSE-MsgGUID: IIJaY6CORh2ZCPtbowh9cQ==
X-ExtLoop1: 1
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 28 May 2026 06:20:49 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 vinay.belgaumkar@intel.com, tejas.upadhyay@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add wa_14025941587 for xe3 and xe3p platforms
Date: Thu, 28 May 2026 18:50:30 +0530
Message-ID: <20260528132030.2054973-1-tilak.tirumalesh.tangudu@intel.com>
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

v3: Add verbose comment - Tejas

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c  | 26 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c66ff6f3d3c..dd8eec098bdf 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -584,8 +584,12 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
 	u32 maxcnt_units_ns = 640;
 	bool inhibit_switch = 0;
+	bool wa_applied = false;
+
+	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
+	    XE_GT_WA(gt, 14025941587)) {
+		u32 mincnt_idledly_ns = 5000;
 
-	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
 		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
@@ -595,8 +599,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
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
+		    (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch))) {
+			idledly = (maxcnt - 1);
+			wa_applied = true;
+		}
+
+		if (wa_applied) {
+			idledly = DIV_ROUND_CLOSEST((idledly * 1000),
 						    idledly_units_ps);
 			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 		}
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b80..2d531b8a946f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -62,6 +62,6 @@
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
-
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14025941587    GRAPHICS_VERSION_RANGE(3000, 3511), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.46.0

