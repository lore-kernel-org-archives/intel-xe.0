Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAEBE63F2D
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 05:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8EE10E13E;
	Mon, 16 Feb 2026 05:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7gGdMdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D39410E13E;
 Mon, 16 Feb 2026 05:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771218060; x=1802754060;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JXhBYgIys61HPZ61dOi4bYMtMptcLwITA5FR5YQ82fU=;
 b=j7gGdMdTjj+ARo+Es2ln5NQOVc+RR46avB10t/Z+UcQA8eaaDM8nNR0m
 +UrJZ0inJXQXmCARVkPx6RYK3306K4C3OjDkSsAR5U3lDAdYd3JJdvl1r
 ZHsvtwXX6SToyT2zPZC16gFT3VrCMvk37SYF9y7E902ugD2JGNo8ZE/oJ
 6NP4/deid/jgy86Lxz5JM47bxWhL7U4jqme3J+6sTt3vKfOe2CwR9uyVZ
 tHvVNRJBSs2/3kfju2YCEjUJ3q0NxwfgTNtD0xBuur3C4v3B1YC+to3q7
 68p8LbIUj8kJcNrPT/7YFLEKPfZHcqv1mmPLcLka4RHGNAK3WAmG56RQu Q==;
X-CSE-ConnectionGUID: ATkrDqGXRau3WCX0wjLLzQ==
X-CSE-MsgGUID: tFaTmiUtSqqOaKdVF46dLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="94929087"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="94929087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 21:01:00 -0800
X-CSE-ConnectionGUID: jHvhYCJJRMqD5JZHiUCYsw==
X-CSE-MsgGUID: z0bkoIMZRlON+UM9ro+jQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="212818500"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2026 21:00:57 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 16 Feb 2026 10:29:39 +0530
Subject: [PATCH v3 1/2] drm/i915/cx0_phy_regs: Include SoC and OS
 turnaround time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-timeout-v3-1-055522c22560@intel.com>
References: <20260216-timeout-v3-0-055522c22560@intel.com>
In-Reply-To: <20260216-timeout-v3-0-055522c22560@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>, Cole Leavitt <cole@unwrap.rs>
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

Reported-by: Cole Leavitt <cole@unwrap.rs>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14713
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

