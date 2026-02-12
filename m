Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D57EDF04E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 06:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C710E6E4;
	Thu, 12 Feb 2026 06:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALnPhGQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460BC10E6E2;
 Thu, 12 Feb 2026 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770878149; x=1802414149;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aZMNS1PvWVi0fj+PnIIUdfVLb2/jLaX/JELVHyr1KWw=;
 b=ALnPhGQ85YUziFvRorvJTvPB9g78Zpj/m4pZncY2gTVO/CWvpWSL7Dqr
 Kp5w+1Oj7HGvRAjImfuJ0M02nlgmJRQ7k5cAv2KozKRnEomXxU+1USMan
 Qio6gqrxYjIELgnOwRHZG7toTT/j6AtbRp0DMsGv8QZj4mPnc9O+c+47p
 7W/OTTCITquZ8QKMKgiW7GljqRvXL1vrMzjaZ36ZaUMSzJsi7fMzzKvVD
 SOtYFekrIbkJEj3mKrf0qnwB5cX0pbraqP6+HRTFVlMiWBNN8jO77cykV
 P7XcccBEfqaRiFPvy8nmB9caa6yIXPSgKS1jjWHevpecACRA9ywT1Rdua Q==;
X-CSE-ConnectionGUID: jewCqbhwQ9Gcq6eTEP9dSQ==
X-CSE-MsgGUID: 6FRsrcMGTm2a0pwvVCVyJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74642595"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="74642595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:35:49 -0800
X-CSE-ConnectionGUID: 7CFtsYJ5Qky6urDvL3kJuA==
X-CSE-MsgGUID: alQjc0U5TX2VlrcvBLfxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212591657"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 22:35:47 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 12 Feb 2026 12:04:21 +0530
Subject: [PATCH v2 1/2] drm/i915/cx0_phy_regs: Include SoC and OS
 turnaround time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-timeout-v2-1-74bccad5018d@intel.com>
References: <20260212-timeout-v2-0-74bccad5018d@intel.com>
In-Reply-To: <20260212-timeout-v2-0-74bccad5018d@intel.com>
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
The overhead value is based on the stress test results with multiple
available panels.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

