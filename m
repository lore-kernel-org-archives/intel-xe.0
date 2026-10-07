Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA434CA600A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6C10F7E4;
	Wed,  7 Oct 2026 21:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1SnYtGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692D510F7DC
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407671; x=1822943671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RR0J+kH/x9JYTvctdS2zBnPHKyBST1n+HbsmaKqVOKU=;
 b=Q1SnYtGDBY0kH8j6rogaUnrPzxur6H08OVffH6pwc6pCD5KoYcSCQ97p
 Uk3lV1sZGPj/lrx9WmFJiZsDbZVWqAXefMCp5xFvy5aOODgn+a/0Q7oHp
 HEF+w1Nwa+N85/xL2cQ2bOOTdUJif6Q2lrRK5fe3M7HpeAOwnS/d+pZ4a
 YUdUN0eCRC4AgjBu/bgMce1xyRn0i4+kzKSLNmGmWW0be8/A+3uy7QDcD
 LqXc3NrxiMih4uT4BZl1Qdh0We0KOaPwl0Y1zDx4XSrB1+2nA5eedd4f9
 36p6ximVKa+fje/aX07J7X5SgfStzFcslKUMSLxhLK8mBabZ8bFp+8wk5 g==;
X-CSE-ConnectionGUID: /7Cl4hrmRqmb4jsuknYRIA==
X-CSE-MsgGUID: PjEpFrDmQHu80RvQmcOP5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77171"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77171"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:31 -0700
X-CSE-ConnectionGUID: Fxcy6V8rROenBCJFCgqfTg==
X-CSE-MsgGUID: LfHck8upQ76ri1vz7gIo/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526846"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:30 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 08/12] drm/xe/pat: Report missing PAT table using
 structured xe_log API
Date: Thu,  8 Oct 2026 02:44:13 +0530
Message-ID: <20261007211417.2093611-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace drm_err() with xe_log_err() using the PAT component tag
when a platform has no matching PAT table entry.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

---
v2:
 - correction in the error code.(shashiko)
---
---
 drivers/gpu/drm/xe/xe_pat.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 0ac64a6a3098..3dfcd364ac67 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
@@ -692,8 +693,9 @@ int xe_pat_init_early(struct xe_device *xe)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
-			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		xe_log_err(xe, PAT, -ENODATA,
+			   "Missing PAT table for platform with graphics version %d.%02d!\n",
+			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 		return -ENODATA;
 	}
 
-- 
2.54.0

