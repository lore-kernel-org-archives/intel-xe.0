Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AECBC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9F210E2C2;
	Mon,  8 May 2023 14:48:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0484A10E2C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557285; x=1715093285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ZiB+dOONV8kMC9x8snuyY14e8FX2gZqKkkIwXwyeUo=;
 b=QzLbACUkq7T3P/Er58zE53WJNMJLieUcxxDRQ4D+DgXefINSs5rHqMW8
 YltmNnwxUaVZ+K1xdIPzBK1xvznkj6trjrn+MKzVJ1ZudfvOoDteqAK11
 na+2lKWaDhW5//bO0RMa0QcahLj8n+mweB5Ta+efibFwB3Uqw1OomZH37
 4ldri1PF5FCZrJYfUp2qa2/Zf8/LN7efTyZz58ZGfyt/XIY5Axu3E7SpJ
 CDI1TKflrWNtpw78+rhrc1RaC4ZeE9xGAFn2FI2mJ+TRbF3RvjTKEhhx/
 5YssCVIuWMN8wUPK4wczAyZWTbSTVxC5SuKqRv/X4ThuavhI4OhSjma69 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348494178"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348494178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768096512"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768096512"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:48:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:18 +0300
Message-Id: <20230508144618.162140-19-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
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

