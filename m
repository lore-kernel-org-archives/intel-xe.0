Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC6C64EC7
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 08:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9664310E731;
	Tue, 14 Feb 2023 08:34:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B0510E817
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676363659; x=1707899659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GXe5keUIYDqmpYiGsyI8J0svH0C1EzalmOcEtSqD1D8=;
 b=nvBg8YWeHJSty/IFGd7gySucrKTdh2hN5ywwMZv47iP5fvsiiD6K/UdM
 AP3/ijBZfg6AEMI4e/dSRyGwliYM8FOSgVfb+lwqzsEk9em6qT9Mval2S
 qwAQDH5pvaFC3zSK26+qgTRbs+ZQuUG+59tW9Ii8B2ujCaG853dDkoaZm
 UAQn52O6oBz4poHM5FnL85Gnp6ZjoJJHQlqirMCnQdAhJKhPHeKI2MomQ
 16NqgRolcRtoM3rB3wXW6dEz+a5ZQGSzRAC5GG9CyOH2Yl3/uguZVGjea
 8E3C6l105c5Ncn6uYNylDJlJ10+FwY5H9phaSNsIvc56VezEOGabFOlbT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395727084"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="395727084"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:34:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757899390"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="757899390"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:34:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 00:33:19 -0800
Message-Id: <20230214083320.2199178-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230214083320.2199178-1-lucas.demarchi@intel.com>
References: <20230214083320.2199178-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/guc: Remove i915_regs.h include
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915_regs.h is not needed, particularly in a header file. What is needed
is i915_reg_defs.h for use of _MMIO() and similar macros.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
index 1e16a9b76ddc..513a7e0c8a5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/xe_guc_reg.h
@@ -9,7 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
-#include "i915_reg.h"
+#include "i915_reg_defs.h"
 
 /* Definitions of GuC H/W registers, bits, etc */
 
-- 
2.39.0

