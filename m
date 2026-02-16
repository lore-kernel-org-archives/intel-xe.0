Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B134E63F2E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 05:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB1B10E153;
	Mon, 16 Feb 2026 05:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSnjiuY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813E10E142;
 Mon, 16 Feb 2026 05:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771218063; x=1802754063;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=47MAfgVy33HiZplpX8HQkF2EutU3fokF53UkfRJlzSg=;
 b=VSnjiuY4ZP38swGEohQ2NO4k7gCuOm1ZqG7Q7T9UwyfuiBFPT/fOtj4S
 bZVyDwAGG96ollBrxred7wiA9H+pcFY9vugEp/LQbDK9Vfi+PcTg5eVKf
 hvaDdVDK17/5MdlVrusSHX4qCGA6G839eVZ0eDZR6aTR3F7SQyEyALRnA
 hpsQsBd/3QEe3iWuuAug1vtC3/thJj58SAKytPBQ9s8LpryNeSeEKcqeS
 lfPMPF7GqXiHINn8f+ri8Rhisyb07CMhp1bo+LP7E/Y/a8P3A1l4yboL9
 I65xdgHNIWlX9Xf7z/gePqMJ76kQ+U0wYrzYdZSwUdjiUfHRssgeWm1fK A==;
X-CSE-ConnectionGUID: 3Qv5Yh/+SsqxEI6ncDkPVw==
X-CSE-MsgGUID: 6u4ZAuTeSGCZobI7Tt18oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="94929091"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="94929091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 21:01:03 -0800
X-CSE-ConnectionGUID: QnIoxcs5Rqqns3PTI7LaZg==
X-CSE-MsgGUID: 8yZVACsQRPe6XQFE6PtZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="212818525"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2026 21:00:59 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 16 Feb 2026 10:29:40 +0530
Subject: [PATCH v3 2/2] drm/i915/lt_phy_regs: Add SoC/OS turnaround time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-timeout-v3-2-055522c22560@intel.com>
References: <20260216-timeout-v3-0-055522c22560@intel.com>
In-Reply-To: <20260216-timeout-v3-0-055522c22560@intel.com>
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

On top the timeouts mentioned in the spec which includes only the PHY
timeouts include the SoC and the OS turnaround time.
The overhead value is based on the stress test results with multiple
available panels.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
index 37e46fb9abde4156ebd7ad1eb6cbbc12e7026b23..ff6d7829dbb9c50b2001d079b435b894faf9659e 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
@@ -6,12 +6,12 @@
 #ifndef __INTEL_LT_PHY_REGS_H__
 #define __INTEL_LT_PHY_REGS_H__
 
-#define XE3PLPD_MSGBUS_TIMEOUT_FAST_US	500
+#define XE3PLPD_MSGBUS_TIMEOUT_FAST_US		500
 #define XE3PLPD_MACCLK_TURNON_LATENCY_MS	2
-#define XE3PLPD_MACCLK_TURNOFF_LATENCY_US	1
+#define XE3PLPD_MACCLK_TURNOFF_LATENCY_US	10
 #define XE3PLPD_RATE_CALIB_DONE_LATENCY_MS	1
-#define XE3PLPD_RESET_START_LATENCY_US	10
-#define XE3PLPD_PWRDN_TO_RDY_LATENCY_US	4
+#define XE3PLPD_RESET_START_LATENCY_US		10
+#define XE3PLPD_PWRDN_TO_RDY_LATENCY_US		10
 #define XE3PLPD_RESET_END_LATENCY_MS		2
 
 /* LT Phy MAC Register */

-- 
2.25.1

