Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A310BA430
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 06:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAED10ECB5;
	Fri, 27 Mar 2026 06:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP2wRS57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5810ECB3;
 Fri, 27 Mar 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774593824; x=1806129824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxG+YxZbwpHmxN8UrSRq3JiIjjgqeBahM2p8ixMdXeY=;
 b=LP2wRS576J5xcazAIbkUSEedkM4QfhvQf3yQOrQzo1P3TrdLQBDmQr4m
 zCIopg6wTfJZYGRYNabCZBFpQoNBeFNCTlwOPrE4lGY1HVCZVNKNkcCBd
 RrQixUXwbczensxGOKBfXx5SXRhw0g+UkpWLebPe+CmXhZtqQJecXH08Z
 /w9b3KsW8zYnnNbG86ryGHkTWCwWB09qwhr/drAgzHmRSBvQnPDZ2MC5b
 vmqBhz69Y1yM0Zsgjwqr0IHAD6CAiMAwFxA7eZVxqlI7KKPGpTzGuPi+q
 jTZ1MqITb131FbcRfXnBkE9pzBYC7FQNqpV0+2bdh9NhpfYlESYVI5mN6 A==;
X-CSE-ConnectionGUID: /RfbyxxDR2aAPNqaOofzmg==
X-CSE-MsgGUID: /hn5Zc5RT4aY3KMsOT/A1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75684251"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75684251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 23:43:43 -0700
X-CSE-ConnectionGUID: Z5cfiofrRSuOBdv5Q2D6Ow==
X-CSE-MsgGUID: ULOtdydXSlKkyUbqK7nVzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="222313857"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 23:43:42 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v5 2/2] drm/i915/dmc: Enable PIPEDMC_ERROR interrupt
Date: Fri, 27 Mar 2026 12:14:53 +0530
Message-ID: <20260327064453.2241523-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327064453.2241523-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260327064453.2241523-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable PIPEDMC_ERROR interrupt bit for display version 35+.

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)
Changes in v3:
- Add Bspec reference (Suraj Kandpal)
Changes in v4:
- Add TODO to check the enablement of PIPEDMC_ERROR for PTL (Suraj Kandpal)
Changes in v5:
- Move TODO to the beginning of pipedmc_interrupt_mask() (Suraj Kandpal)

Bspec: 70296
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 1d2e09471ba4..2104164e136e 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -505,8 +505,13 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
+	/*
+	 * TODO: Check if PIPEDMC_ERROR bit enabling causes errors
+	 * on PTL, enable it if validation passes
+	 */
 	if (DISPLAY_VER(display) >= 35)
-		return PIPEDMC_FLIPQ_PROG_DONE;
+		return PIPEDMC_FLIPQ_PROG_DONE |
+			PIPEDMC_ERROR;
 
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
-- 
2.43.0

