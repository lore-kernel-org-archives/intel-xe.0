Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C1DEDF02E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 04:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438110E6CD;
	Thu, 12 Feb 2026 04:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5zcxTOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D29810E6CD;
 Thu, 12 Feb 2026 04:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770869748; x=1802405748;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=d1qaj414CZAI8QtmqSPzc0o/R5xKerAH/g1C5fQGIZk=;
 b=H5zcxTOLWqCmSf1wowV80n3Qrw/e82C4Inkp1J3EmlRFPgkjJspTToSV
 1QSLlOsmlOWcDz0xLlHOCVAyb9q7KDe0ElYJNj59/hgPCcJx2qwBj1Kzo
 8vFmmRxIxad6HGjzFPiAoiE28ifGHAPVVcdSiOMJ6/hLED2tigtXnaB+Y
 umg3WLxmiGThVO+5Gc43N00MEc0KI2gmZPuRxUlFd/VB+sD1mLuZ/2cXn
 80gWyBo/WyOyz0tZUKEmB/6ppheHEZaNYlFvMU5UpQFp9W6OEa/Ngr9GE
 Tbc/YEoCtpRXs5hFyJKfEU3T48UYV/Yy+dz8L+lqxC2Lwm85yO8bwZ2BP w==;
X-CSE-ConnectionGUID: oxquiupuTJSRgZgiUgVSfw==
X-CSE-MsgGUID: cx9kJTZlRxyoSOg8PAn9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75881020"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75881020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:15:47 -0800
X-CSE-ConnectionGUID: C6O2ODakQS+1QOoduY70vA==
X-CSE-MsgGUID: AuIg6SFPR4eBxJNbRmz3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="235437106"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 20:15:45 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 12 Feb 2026 09:44:19 +0530
Subject: [PATCH 1/2] drm/i915/display/cx0_phy_regs: Include Soc and os
 turnaround time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-timeout-v1-1-591fa766e8a1@intel.com>
References: <20260212-timeout-v1-0-591fa766e8a1@intel.com>
In-Reply-To: <20260212-timeout-v1-0-591fa766e8a1@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

The port refclk enable timeout and the soc ready timeout value mentioned
in the spec is the PHY timings and doesn't include the turnaround time
from the SoC or OS. So add an overhead timeout value on top of the
recommended timeouts from the PHY spec.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
index 658890f7351530e5686c23e067deb359b3283d59..152a4e751bdcf216a95714a2bd2d6612cbbd4698 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
@@ -78,10 +78,10 @@
 #define XELPDP_PCLK_PLL_ENABLE_TIMEOUT_US		3200
 #define XELPDP_PCLK_PLL_DISABLE_TIMEOUT_US		20
 #define XELPDP_PORT_BUF_SOC_READY_TIMEOUT_US		100
-#define XELPDP_PORT_RESET_START_TIMEOUT_US		5
+#define XELPDP_PORT_RESET_START_TIMEOUT_US		10
 #define XELPDP_PORT_POWERDOWN_UPDATE_TIMEOUT_MS		2
 #define XELPDP_PORT_RESET_END_TIMEOUT_MS		15
-#define XELPDP_REFCLK_ENABLE_TIMEOUT_US			1
+#define XELPDP_REFCLK_ENABLE_TIMEOUT_US			10
 
 #define _XELPDP_PORT_BUF_CTL1_LN0_A			0x64004
 #define _XELPDP_PORT_BUF_CTL1_LN0_B			0x64104

-- 
2.25.1

