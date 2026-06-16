Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2152FCD98CF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 10:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BBC10E9E9;
	Tue, 16 Jun 2026 10:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAYjwKBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E423B10E16D;
 Tue, 16 Jun 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781604973; x=1813140973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cLruvrsd0Y/Jwyg+bGKQtdkFaWUNI4F5yWge/8EzhdM=;
 b=mAYjwKBewjB4VRkxboJqqmIxjlakEpmQT2WaCfspehno6IxD8aO5glGL
 xVnph+2Lu7wjCSFbpcj8wD7hSpFLTDErcUXUz2p35NnmZRb/EanWerK4r
 V67585e71D+YHdXNL6X1Mv9QtOFRdwEagIB1LBZUnBeWEY2hcQEpMf//c
 AmsXF1QX6k72fC2NbQ/ggrIJTET4WHrAWJWsTvsrM7qQZnzLAPWSTlUju
 BYD2LsxEvAKHZ3BLHDBU1EDtg5QwEthREOb8rBrd0sPvy8fow4BYtFIOl
 yxywTIJTw1mkCt8ayoli53/Ci7wIwTvogOs+s8gfhTzdwz6E8hYUPheEZ Q==;
X-CSE-ConnectionGUID: EF0ehpadRJ63wtfp4i2ncQ==
X-CSE-MsgGUID: DM+wXmmQSvifHoQLpfRXKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93747345"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93747345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 03:16:12 -0700
X-CSE-ConnectionGUID: WN2Y7tcDSc+IpiBsB6R7KQ==
X-CSE-MsgGUID: 1b36BmZ8QSqv06DCUIFNMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247794374"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.193])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 03:16:11 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 matthew.d.roper@intel.com, shawn.c.lee@intel.com
Subject: [PATCH] drm/i915/display: update to the BW buddy configuration
Date: Tue, 16 Jun 2026 13:15:53 +0300
Message-ID: <20260616101553.226298-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Bspec has been updated for xe2_lpd+ platforms on how to handle
the bw buddy prgramming in case no matching memory configuration
is found w.r.t the current page mask table. The recommendation
is to keep the default settings for the related registers as it
is without explicitly disabling the bw buddy.

Bspec: 68871
Suggested-by: Ville Syrjala <ville.syrjala@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../drm/i915/display/intel_display_power.c    | 43 +++++++++++++------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2e51dfcd5dce..dcfd78f48622 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1631,23 +1631,40 @@ static void tgl_bw_buddy_init(struct intel_display *display)
 		    table[config].type == dram_info->type)
 			break;
 
+	/*
+	 * If we don't recognize the memory configuration, explicitly disable
+	 * the address buddy logic in pre-xe2_lpd platforms as it was before.
+	 * In xe2_lpd+ cases, page masks must be set to 0 if no matching
+	 * configuration is found in the table. So keep the default settings
+	 * as it is. By default, BW_BUDDY_CTL bit 31 is 0 (bw buddy enabled)
+	 * and BW_BUDDY_PAGE_MASK is 0x0
+	 *
+	 * TODO: Revisit the buddy page masks table when bspec updates the
+	 * table with the correct number of channels for each dram type.
+	 */
 	if (table[config].page_mask == 0) {
 		drm_dbg_kms(display->drm,
 			    "Unknown memory configuration; disabling address buddy logic.\n");
-		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
-			intel_de_write(display, BW_BUDDY_CTL(i),
-				       BW_BUDDY_DISABLE);
-	} else {
-		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask)) {
-			intel_de_write(display, BW_BUDDY_PAGE_MASK(i),
-				       table[config].page_mask);
-
-			/* Wa_22010178259:tgl,dg1,rkl,adl-s */
-			if (intel_display_wa(display, INTEL_DISPLAY_WA_22010178259))
-				intel_de_rmw(display, BW_BUDDY_CTL(i),
-					     BW_BUDDY_TLB_REQ_TIMER_MASK,
-					     BW_BUDDY_TLB_REQ_TIMER(0x8));
+
+		if (DISPLAY_VER(display) < 20) {
+			for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
+				intel_de_write(display, BW_BUDDY_CTL(i),
+					       BW_BUDDY_DISABLE);
 		}
+
+		return;
+	}
+
+	/* We found a matching configuration. Program the BW_BUDDY registers. */
+	for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask)) {
+		intel_de_write(display, BW_BUDDY_PAGE_MASK(i),
+			       table[config].page_mask);
+
+		/* Wa_22010178259:tgl,dg1,rkl,adl-s */
+		if (intel_display_wa(display, INTEL_DISPLAY_WA_22010178259))
+			intel_de_rmw(display, BW_BUDDY_CTL(i),
+				     BW_BUDDY_TLB_REQ_TIMER_MASK,
+				     BW_BUDDY_TLB_REQ_TIMER(0x8));
 	}
 }
 
-- 
2.43.0

