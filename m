Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277DECDB482
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E568E10E4CB;
	Thu, 12 Oct 2023 12:58:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4A110E4C9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115521; x=1728651521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zUM1rq8IQig4vfjFur7vVKGEwUe6dAZ9UdPoHRWIGHE=;
 b=NeZiXGwYKM58WZo3TNUm4PSxxEpURmc0bBcwVJJdtxX83OFjHhf9deoH
 ajYeI0o43tWT8gtb/jqrPKvS1BOfgPrUkvIXqMzRRRUptCV46FFOpQjg9
 9TbtZabTaVsGQLPXOUIn30GQ2MJUn4EMNtIYnMuazQUhc87Pep0nnGMtV
 Wn+DwZOiOAm0DH8s2Wx5svf/6O05bFQQyO+2mWI6DzQeSdeK2ypR76xYB
 mdcLA/Z7um2umhDGcHImelmQFERMphO+DN9MtSZ2EJNGT6C9aBOdb61dV
 ZBmQzE3dwPTfR2U9qaEejdjQesIXk/Vz7AA2Y2KdpZsLm4NPI5ElsKq4G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259054"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259054"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541454"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541454"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:38 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:05 +0530
Message-Id: <20231012125410.2127337-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915/dmc: xe way of
 getting at stepping"
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

This reverts commit a0cdbefc3aea03c1d3f30460c1d89678705d57bb.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 51e0463518fb..1623c0c5e8a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -30,18 +30,6 @@
 #include "intel_dmc.h"
 #include "intel_dmc_regs.h"
 
-#ifndef I915
-#include "xe_uc_fw.h"
-
-#define INTEL_UC_FIRMWARE_URL XE_UC_FIRMWARE_URL
-
-__printf(2, 3)
-static inline void
-i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
-{
-}
-#endif
-
 /**
  * DOC: DMC Firmware Support
  *
@@ -321,11 +309,8 @@ static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *i915,
 			struct stepping_info *si)
 {
-#ifdef I915
 	const char *step_name = intel_step_name(RUNTIME_INFO(i915)->step.display_step);
-#else
-	const char *step_name = xe_step_name(i915->info.step.display);
-#endif
+
 	si->stepping = step_name[0];
 	si->substepping = step_name[1];
 	return si;
-- 
2.25.1

