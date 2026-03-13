Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A1105F7A6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 12:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBC210EBDB;
	Fri, 13 Mar 2026 12:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu/O8OkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3C10EBDB
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773405623; x=1804941623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uzXpbTYuaQetHxGj5KWIe8QzYzfGDBIIVvj6wb6mDfM=;
 b=mu/O8OkLGYZqnMmBmiZsYKuIgy2elbLTovA6FYoEtmPpnKPyA3kJbUPt
 4wGfG+V71v9QTOJlCLkhDknkquIOqLbTjmiEyzZyXOls+sL2Yea7eZiAk
 +T/56vWPmRUbh7+N3A+a2kTXoyemmllXkHGyHKjnevmcwrg1AgpUgPKP5
 pZPkzpNbAyMSjVGq2IL49rSEnbbIvtPkGeH7r/Xrp7APp2999DM5EBdnx
 TGqxvPNmadSuq739z1DRCD/R4QvEOJmSHKEcG/i9iI8Ps0ekX/Ykr7jD7
 k9U2aTBcQj0HfQHmB4nX6/CmIn+Qq02gOixvj/3ETp+6w7wJaDaBTN9L5 A==;
X-CSE-ConnectionGUID: KuP9+sv6SqeYaEQ60h9yuA==
X-CSE-MsgGUID: 3NznnhfBQUSjMUnmotASXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77118123"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="77118123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:40:22 -0700
X-CSE-ConnectionGUID: J4bR/kTVSdiNyuXtHD4z0Q==
X-CSE-MsgGUID: ciH7cAApSsSaeTo3CVXGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="226119294"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:40:21 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: luciano.coelho@intel.com,
	cc=uma.shankar@intel.com
Subject: [PATCH] drm/i915/dmc: RFC: Reduce wakelock hold time
Date: Fri, 13 Mar 2026 18:11:57 +0530
Message-ID: <20260313124157.2889931-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

The __intel_dmc_wl_release() schedules a delayed workqueue which
releases the wakelock after a fixed timeout of 50 ms. Until the
delayed work runs, the wakelock remains held and prevents entry
into deeper DC states.

Reduce DMC_WAKELOCK_HOLD_TIME from 50 ms to 5 ms to evaluate
whether the delay can be shortened and allow earlier DC-state
entry after wakelock release.

This is an RFC to collect feedback and verify that reducing
the hold time does not introduce regressions.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index 73a3101514f3..ddf1a1f1ebc3 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -46,7 +46,7 @@
  * atomic variant of waiting MMIO.
  */
 #define DMC_WAKELOCK_CTL_TIMEOUT_US 5000
-#define DMC_WAKELOCK_HOLD_TIME 50
+#define DMC_WAKELOCK_HOLD_TIME 5
 
 /*
  * Possible non-negative values for the enable_dmc_wl param.
-- 
2.43.0

