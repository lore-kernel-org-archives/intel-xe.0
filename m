Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1F0CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB410EB90;
	Thu, 11 Sep 2025 21:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3UJ635k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8610EB86
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757624721; x=1789160721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DSn9AK4Up4lBAVD/DHuB6PYYHcQeC91QsY2DnosLwwg=;
 b=U3UJ635k+LsbGI5RaFbLk42wwtd8OOMfliZq0dajrwURgYAZbPEvNfHJ
 kucO7sG4BIB9uaKtykDIU1MVROykFqJkQC7bHl1zu5cgJReQF1eOu0IzL
 hDQ2eG4GGhfP1nVYGiTBjzm8qW5hUSAsYpEPUWtdG1uYGI8Diav7+JWgr
 sf6bkzjPFWS/hucXO6qcQ3fooDdgO/HzEY3Y3Ccm5BXtp1U9GanjeBlEa
 DiqFFwSmEXNKqvEwf3IgRYM09Yj6w4r49uxsMmAj5KfGD4t3adXvXPSee
 FWuS0i9OlgXDUuwOftHIxcvQigwUlCZ6PwFiaPUW9m6QrT4ZU/lcjz3QK Q==;
X-CSE-ConnectionGUID: vU3LyEplS0+uNwBl2ciaFw==
X-CSE-MsgGUID: eLRSY1KJRcSqnfMyfrem6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71070353"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="71070353"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:05:21 -0700
X-CSE-ConnectionGUID: 4GzKW36yQFabI8c0qUGffA==
X-CSE-MsgGUID: 0orXDQPcQcCCJ0rS93zv2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="173361335"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2025 14:05:20 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 3/3] drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to
 only PHY A
Date: Fri, 12 Sep 2025 02:35:14 +0530
Message-ID: <20250911210514.389014-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
References: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
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

On PTL, no combo PHY is connected to PORT B. However, PORT B can
still be used for Type-C and will utilize the C20 PHY for eDP
over Type-C. In such configurations, VBTs also enumerate PORT B.

This leads to issues where PORT B is incorrectly identified as using the
C10 PHY, due to the assumption that returning true for PORT B in
intel_encoder_is_c10phy() would not cause problems.

From PTL's perspective, only PORT A/PHY A uses the C10 PHY.

Update the helper intel_encoder_is_c10phy() to return true only for
PORT A/PHY on PTL.

Bspec: 72571,73944
Fixes: 9d10de78a37f ("drm/i915/wcl: C10 phy connected to port A and B")
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 801235a5bc0a..e8b354d1c513 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -39,13 +39,10 @@ bool intel_encoder_is_c10phy(struct intel_encoder *encoder)
 	struct intel_display *display = to_intel_display(encoder);
 	enum phy phy = intel_encoder_to_phy(encoder);
 
-	/* PTL doesn't have a PHY connected to PORT B; as such,
-	 * there will never be a case where PTL uses PHY B.
-	 * WCL uses PORT A and B with the C10 PHY.
-	 * Reusing the condition for WCL and extending it for PORT B
-	 * should not cause any issues for PTL.
-	 */
-	if (display->platform.pantherlake && phy < PHY_C)
+	if (display->platform.pantherlake && phy == PHY_A)
+		return true;
+
+	if (display->platform.pantherlake_wildcatlake && phy == PHY_B)
 		return true;
 
 	if ((display->platform.lunarlake || display->platform.meteorlake) && phy < PHY_C)
-- 
2.51.0

