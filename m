Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2559CEDF030
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 04:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D371D10E6D4;
	Thu, 12 Feb 2026 04:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+1x/cQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD28310E6D4;
 Thu, 12 Feb 2026 04:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770869750; x=1802405750;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0QCtpGoBjg8KzKYshd9mvfy7nkNZ1yuuOgf+G2dzDOE=;
 b=N+1x/cQIQzgjsLr7WoB/cg/ooELG6oSxS6gA1Y1TKuloLIVHb332pY5t
 QJ3fiQzoT/rbW29dCxHiP3PNXyvzd1SXIFdCfCjkzjbsfhEUnbxOzXGqS
 IF1F0AZJ2+kisPyj1cPs9abQBQc3V3rsdYE/LnUqRM+SNxicvFqeBMvjx
 8R5aQPGmcbkckC91dx1P3V0qni4x49bjuQCbHTDH5n/IiysIeDEa7+mH+
 F9j15VAdAbEKelQrQk+YzouM/lL6SIpdLIcPaTo8j0Tq4GTx9DfceTMV8
 aXdObBx23DLEegPjCD2jmm0XPi0VOrTWAPS+R9CVS6Nj1XjSwr3b9y190 A==;
X-CSE-ConnectionGUID: /YVum55gRt28tSsoZ+D4sQ==
X-CSE-MsgGUID: idhh606JRmCIqQz007PAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75881026"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75881026"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:15:49 -0800
X-CSE-ConnectionGUID: Mx8yP6leTWWgeYE04kyrqQ==
X-CSE-MsgGUID: oUpVdNriQ46w+8bHlwHV9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="235437109"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 20:15:48 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 12 Feb 2026 09:44:20 +0530
Subject: [PATCH 2/2] drm/i915/display/lt_phy_regs: Add SoC/OS turnaround time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-timeout-v1-2-591fa766e8a1@intel.com>
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

On top the timeouts mentioned in the spec which includes only the PHY
timeouts include the SoC and the OS turnaround time.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
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

