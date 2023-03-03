Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D23C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A46510E07E;
	Fri,  3 Mar 2023 10:53:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837C410E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840798; x=1709376798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DUvdfKYXs2BabN5ydq8ujsPErKZEK+vslCAfiGkmd+E=;
 b=BtI91krO1IXBud7Ir3j1fWDE+Y2zYqhidR4fwfoW85WAgeQXnzN3yoQt
 S03CLDi0Kz92I7rRTQDCdpQ+GmbARGVMpd1MqGNcsl480eQCCWt15JFrP
 E6gHB2GAimTSjJWiXUOYL0sbGnlnkyODTNH2fxOAv8Uo7xoFprSeFi3B8
 ek6SN5wHmTJfX3teOeFRY6u0FUxaNgSBFN6d569DeLCgZ5ch3pFQ282EH
 6pAShV9CnJ4enwTYQ1flg0wiZ73rsmJhv+/WT37HToJkgyj8SrWEb4MjA
 15umPZOX/Hs90fPvv5WHveVXSZtLK/l5feS478pm2Mhs2+7mqgNxVlnjc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337332476"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="337332476"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004542662"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004542662"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:19 +0200
Message-Id: <20230303105222.3550161-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/8] drm/xe: drop redundant ../ from includes
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

The -I order handles the precedence. Avoid the relative include.

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

