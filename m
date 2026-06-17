Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F2CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 04:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF7210E08E;
	Wed, 17 Jun 2026 04:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jh0Lm/E3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A926410E08E;
 Wed, 17 Jun 2026 04:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781669914; x=1813205914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aAnc83OCCwRwqXStaFTB1KS9mnzkH1umRdopPKLSP8c=;
 b=jh0Lm/E3azU3COzoyCoY48eiAL4b+Y0bOCa60G+Kt50ebLom0drtv0FE
 qWdUGxuYk6wTxeMSgYTnuKyZoZEMopFQnMVkHZHcVGFsPlAW3TgQSkaJn
 T1wmHAZGyw1gB4SnFfELMxKlHQIL5mvq0S7pIxYXKt/9LalIcAy3f7FIr
 aUimtqmTI6XMGBhGLgOCWbWnZFgpjYj6H8HH7sUw29axupSgpo+C0V1+X
 sec94km8zhtu6/LU3roxG2GHPal5XZMeFq9FXWiVz0gKRUhViJPd0sVxz
 Tf0X/I1Z6Mc5QFJR4lWYCGOa477H+0X/r42vJ1JgAY4EuCGOVoeQTbmFI g==;
X-CSE-ConnectionGUID: dJceTj5YRsSrUcijTD5jRg==
X-CSE-MsgGUID: b8buHLHzSkKtdhWNzMumqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82235862"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82235862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:18:33 -0700
X-CSE-ConnectionGUID: 8ZgpprhkTUmyJZtAYgRTwg==
X-CSE-MsgGUID: uuNEEBxlTxezmGidFj2UyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="272024102"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2026 21:18:32 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/cx0: Remove unnecessary hdmi link rate function
 declaration
Date: Wed, 17 Jun 2026 09:48:08 +0530
Message-Id: <20260617041807.162927-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

intel_cx0_phy_check_hdmi_link_rate is not used by anyone but is still
declared. Remove it.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
index 1428e7a5a318..95c20eb4b4b7 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
@@ -60,7 +60,6 @@ void intel_cx0_phy_set_signal_levels(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state);
 void intel_cx0_powerdown_change_sequence(struct intel_encoder *encoder,
 					 u8 lane_mask, u8 state);
-int intel_cx0_phy_check_hdmi_link_rate(struct intel_hdmi *hdmi, int clock);
 void intel_cx0_setup_powerdown(struct intel_encoder *encoder);
 bool intel_cx0_is_hdmi_frl(u32 clock);
 u8 intel_cx0_read(struct intel_encoder *encoder, u8 lane_mask, u16 addr);
-- 
2.34.1

