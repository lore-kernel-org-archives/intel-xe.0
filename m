Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DB4C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E085610E817;
	Fri, 26 May 2023 16:44:22 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E347710E817
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119454; x=1716655454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dYnK8XfyplzSm8AQwmeJnyzm5v+Z075jq6FQVTfJxjM=;
 b=lPyeOr2XkuMtQ0T3Z8pvEarzSgMI6pk5NeMQuEAyhWw20CgLLxKRiPWB
 sXWg1fgsjbWWwsgxYWaogl3mxZQqXFy3KTpJQBau5nyMOdUud5kpGiQR3
 4YARpalsmZzh7bCO0gxmtDuwIE+qxg8vAzbzZf5mS2d3lH+ET0QrJXbVv
 y8KCRRx7MznCtWtEU1eeZJoFdlYGO2t7SKBACLM6TPkQvCDHVEVZp1V1L
 7Wony9pS0/MmAy9qZJoIETHr1M8yIs7ljqm87EVnfq6lato8uYfAh+jSO
 nIRpp/Wfmietl7xLHzfZYVj69WFAqWteNUasDBx3vgWDV8iTjfTWJj2O2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628387"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628387"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151485"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151485"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:50 -0700
Message-Id: <20230526164358.86393-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 13/21] drm/xe/guc: Port Wa_22012773006 to xe_wa
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let xe_guc.c start using XE_WA() for workarounds, starting from a simple
one: Wa_22012773006. It's also changed to start with graphics version
12, since that is the first supported by xe.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile        | 2 +-
 drivers/gpu/drm/xe/xe_guc.c        | 6 +++---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c73d832a067e..da1e447c08c7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_wa.o: $(generated_oob)
+$(obj)/xe_guc.o $(obj)/xe_wa.o: $(generated_oob)
 
 # Please keep these build lists sorted!
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index a8e249205bff..08362db6a886 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc.h"
 
+#include "generated/xe_wa_oob.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
@@ -20,6 +21,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_uc_fw.h"
+#include "xe_wa.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
@@ -134,9 +136,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 flags = 0;
 
-	/* Wa_22012773006:gen11,gen12 < XeHP */
-	if (GRAPHICS_VER(xe) >= 11 &&
-	    GRAPHICS_VERx100(xe) < 1250)
+	if (XE_WA(gt, 22012773006))
 		flags |= GUC_WA_POLLCS;
 
 	/* Wa_16011759253 */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e69de29bb2d1..b54f70eeccf4 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -0,0 +1 @@
+22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
-- 
2.40.1

