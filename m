Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19D3C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE63110E118;
	Thu,  2 Mar 2023 14:23:59 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB1510E506
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767038; x=1709303038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hi33Kl0IXrCsPAVKsyBfzr+Qv2zJxCPb6VJQuZlyfJU=;
 b=g7v0OAtYI//xpRX97XjwRWAwMaGLWXJ/ZQfckGWckpC6CRKvgeiGn0JV
 gzRCHWtMX3G+SMDGnAUV2U/aAXZpHPkD/3JjYnyKavRIOdDpigiCSMZZ4
 uqC2SNBPWb9RID71jWg9lzqKXqHfmATNxZ6EBWbktUvL05Z18yvXr2z9r
 xLDjaR9tRSODshSlpYpym19zoy8Rm0Ichb8aMxv6znFHUvWKyNf2G0rYt
 vnfhGEHKLs6G2ARR3k42AQxxY3Reg1Bjmd/6pkmFUbJThiq2Nieo30riF
 Z7lDMtTgE0BRwreJ9JGydVN9FoRWrHx5zwewCaDCXo5yflasDbdUfYYN5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397301319"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="397301319"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739086239"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="739086239"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:27 +0200
Message-Id: <20230302141230.2804699-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/8] drm/xe: drop redundant ../ from includes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The -I order handles the precedence.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c   | 2 +-
 drivers/gpu/drm/xe/display/ext/intel_dram.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 60950cfaf6dc..a5f2e77e6fde 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -44,7 +44,7 @@
 #include "intel_psr.h"
 
 #include "i915_drv.h"
-#include "../intel_de.h"
+#include "intel_de.h"
 
 #define intel_uncore_read(uncore, reg) intel_de_read(dev_priv, (reg))
 #define intel_uncore_read64(uncore, reg) intel_de_read64(dev_priv, (reg))
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
index 84a96e6ece18..a2df0c502c34 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_dram.c
@@ -7,7 +7,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
-#include "../intel_de.h"
+#include "intel_de.h"
 #include "intel_dram.h"
 #include "intel_mchbar_regs.h"
 
-- 
2.39.1

