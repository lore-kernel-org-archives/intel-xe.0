Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F4EC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2063410E0CB;
	Wed,  3 May 2023 13:11:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BABD10E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119506; x=1714655506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ZiB+dOONV8kMC9x8snuyY14e8FX2gZqKkkIwXwyeUo=;
 b=fiR4JKtTMBOalJSCnpCYjdbg1H69FPrSA+EwrnfkJO89SmKwTtnY69FL
 0h5v1qC5I/M+zAATs6m5JXq+H3sxjnwsi/kZyDQFwkWvVWHaIYlIq8uRw
 OJqlv729cH7T+PjLJ/b9UVJRE85u2UiHhdt3aATOcrZ9ho9iZm0q8ghGK
 /rCRE9pKuwug/1XmLttLvcTpD+5ThaN/FvLFbs7Ssq2Psq6/JjZlb+C1t
 32+b7PuxQz/ZD/iY4mzscy4H9M3SkZR3Y7bVS1s4vUA88I8s6pR2P7uyi
 Cqv/KYEiMl+D3d8Krvb1nHv0EL8WDiH7OEytNsokNERTi6BLh75UCMe6C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350726873"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="350726873"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026493613"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="1026493613"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:10:05 +0300
Message-Id: <20230503131005.1602412-19-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 18/18] fixup! drm/xe/display: Implement display
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

Use the compat glue layer pcode functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_dram.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
index a2df0c502c34..3e8c413280a5 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_dram.c
@@ -10,6 +10,7 @@
 #include "intel_de.h"
 #include "intel_dram.h"
 #include "intel_mchbar_regs.h"
+#include "intel_pcode.h"
 
 struct dram_dimm_info {
 	u16 size;
@@ -390,7 +391,7 @@ static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv)
 	u32 val = 0;
 	int ret;
 
-	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
 			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
 	if (ret)
 		return ret;
-- 
2.39.2

