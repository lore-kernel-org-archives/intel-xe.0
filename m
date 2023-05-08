Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435BDC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207BC10E2DB;
	Mon,  8 May 2023 14:47:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3B010E2DB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557276; x=1715093276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5LXywmdabT9UY1CIa9XUiMx7v0nmdmh75Nb6t/h/rb8=;
 b=mJs10WSZTFLH35FPlBMRAXJrsMiskrpWwbsWdgPDEwl1GqTqMSYxsi+8
 KyqU/SkMf7T8XJnHc76UEwHNRw0D5aaxf1ecJ31ClGyijuC/sLmOROptg
 N/07r42AcnIMKG/JQYEWX/HcjIr3k5LvB1uzW58pSuLNx4uAAa1UhO3sH
 Ol6zNoWiWH+bSCzlVvOfBK8eHpsEBkdotAgM22RFw7PXtpSyzk8oUSWa/
 Bi0F+r1IoENlt1bQTZmPaQYp6cMk8AzSmqTdEWaD/OFt334L4DCqT2RiN
 MDiSPv886WG2nwCMxlg+Vyl0KHiX6jwe+SLGCwDJjd9/onZLeGmcNKsol A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348494144"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348494144"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768096487"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768096487"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:16 +0300
Message-Id: <20230508144618.162140-17-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/18] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are some implicit dependences on i915_drv.h -> intel_uncore.h in
i915, work around them.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index b55a42f06862..ddc0ad39b154 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -17,6 +17,7 @@
 #include "i915_reg_defs.h"
 #include "intel_pch.h"
 #include "i915_utils.h"
+#include "intel_uncore.h"
 #include <linux/pm_runtime.h>
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-- 
2.39.2

