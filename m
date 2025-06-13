Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A5C7114A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7F410EA53;
	Fri, 13 Jun 2025 19:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIXK7ywq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E810EA49
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843121; x=1781379121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iuIy/ZsOalZ5Zo9vyqou2eGYoVQzUvwD+gbAjIFTFhw=;
 b=DIXK7ywqMpKphCMXu+hNzjMEriWV+Vvzrbowi2nbUdEpEdf8jrqagenC
 FFWPgPTD4iHmkDpyE22uLPNSdDOJNRB/3Yatoaou+nkHEBjqjwjSby/oF
 XD3NmAVTNXn2GwifF6DO1jG+qXJSfgZJj+3NBClKtIJuCZFBI2TrN/4kd
 pneuPP6/iOUBqi6ItpEPCp1wHyjDZsZY4mI1wzR8KtG+varjK2mUYePzy
 Ek9JFkP4LKNomb2qeWbXwDRI2MgjWnWzxBfvhNMO0cIkOUnKNwuLtwdvU
 Q0jlOGg9sY70Uf5Au3OQTbh2vJN+f4ExNyLGnLlN5/6J91MuONcwHtfyH Q==;
X-CSE-ConnectionGUID: SIF3nv6YRW6/FrYafLuw8Q==
X-CSE-MsgGUID: XS38NUVbTlq1LllnGvTA0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510521"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:32:01 -0700
X-CSE-ConnectionGUID: G28qfyF1R8+mpbRxJs1fYg==
X-CSE-MsgGUID: +DqwdzRqT/mTnnyymw39Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722670"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:32:00 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Date: Sat, 14 Jun 2025 01:01:45 +0530
Message-Id: <20250613193146.3549862-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

WCL added a c10 phy connected to port B. PTL code is currently
restricting c10 to phy_a only.

PTL doesn't have a PHY connected to PORT B; as such,there will
never be a case where PTL uses PHY B.
WCL uses PORT A and B with the C10 PHY.Reusing the condition
for WCL and extending it for PORT B should not cause any issues
for PTL.

-v2: Reuse and extend PTL condition for WCL (Matt)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 83c8df9dbc0c..ed8e640b96b0 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -39,7 +39,13 @@ bool intel_encoder_is_c10phy(struct intel_encoder *encoder)
 	struct intel_display *display = to_intel_display(encoder);
 	enum phy phy = intel_encoder_to_phy(encoder);
 
-	if (display->platform.pantherlake && phy == PHY_A)
+	/* PTL doesn't have a PHY connected to PORT B; as such,
+	 * there will never be a case where PTL uses PHY B.
+	 * WCL uses PORT A and B with the C10 PHY.
+	 * Reusing the condition for WCL and extending it for PORT B
+	 * should not cause any issues for PTL.
+	 */
+	if (display->platform.pantherlake && phy < PHY_C)
 		return true;
 
 	if ((display->platform.lunarlake || display->platform.meteorlake) && phy < PHY_C)
-- 
2.34.1

