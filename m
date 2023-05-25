Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F9DC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6538010E787;
	Thu, 25 May 2023 21:34:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78BC10E786
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pmg3Th7oK4MBCJC6Ok+bkaT+q2mgwTmBgl0IFhq4YJI=;
 b=WCNYzSJe/haG+CsoBQr6THyPy1U9OiKoqf4Qgqls7ldmxRDZMlcdHa5T
 mqZ+geHUfQ+AqPtOA0WBPCz3b1PSW7PNbYwpQWqkgWsTyrd/jMCvXlkRs
 dARuhaHtifopnJ8vnVxnVniZUQxiAVDBsvya1uMMF7zNU6EeTGfHt2KY6
 Gtw6AL/aL6ygcEiZReJBsH8fXpOHzpjU4m+aFWV2N/TtqhaIAwWceWRoF
 Ir44LvdKKyCC9uYWVruR1yNEfNbPMCKXBgOo1NrGc4xM2MjAx45uGhTiK
 vsRopU5SIMdnR9Bwjq5zovSesVo+wFvpWIo3Fovw1am+I5WNWA0u5iyeH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377913"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377913"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970759"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970759"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:59 -0700
Message-Id: <20230525213407.3907094-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 13/21] drm/xe/guc: Port Wa_22012773006 to xe_wa
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 6 +++---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

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

