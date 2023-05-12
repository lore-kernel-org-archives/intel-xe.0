Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED6FC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 07:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEBD10E107;
	Fri, 12 May 2023 07:43:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA510E107
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683877421; x=1715413421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lCUTQVmn4DrtHMcoaiwv0gEM08h8P6qcGLUyGXqwyqw=;
 b=DE9JRkxkJ6KdFpLce556se9QRxgUSGuHdShgHVS4w1TbMMgGpIM8NVxm
 Vk3TpUQIgfOE8Anj2LOfW6k9sjw1+M0pHe9J95846yl1KYUg3fA1Cchau
 8rw+/IzJWIkqlC4o1MILtY7D6uV6KrlzS4RGNyO7UHsCx8hsbioAQT01r
 K6djNf6v213hgLwOn/gh5Eu/Ge9GneUZPJD94I2oaIv0C6fM+Pn3ZCqB6
 fFg2VH1ytCVZOvpketkibgDWZQDb/LI/qQGKRExMwX+fSEXddUNNapb2a
 /WSMqAwlmMj+1BUoMrlx+cyGBG2jnKs4OdilML8JKAx1+8WVX1ZI7UmEx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352975533"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="352975533"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="946523816"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="946523816"
Received: from mshimon1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.243])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:43:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 10:43:34 +0300
Message-Id: <20230512074335.1293293-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The dependency on display/intel_display_reg_defs.h is removed by
upstream commit 6e4e9fbd5ba0 ("drm/i915/gt: drop dependency on
VLV_DISPLAY_BASE").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7ae5fa5a8ff7..af80d2fe739b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -7,9 +7,7 @@
 #define __INTEL_GT_REGS__
 
 #include "i915_reg_defs.h"
-#ifdef I915
 #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
-#endif
 
 /*
  * The perf control registers are technically multicast registers, but the
-- 
2.39.2

