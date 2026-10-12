Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF1ECA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBAF10ECAB;
	Mon, 12 Oct 2026 05:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D5A10EC95
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782373; x=1823318373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3wHp77WRgxKIs2LXFJ2R+UhEkTp/OWqmfDdV6V3wOk=;
 b=VsNvLAKD0+u/fpRyN+lgoCjHZK2pb+TFbkuioLPY5/D9m6zQ7QpZxjtV
 xX6riFHydPiXbftnHienC+zCpjVZIULCWX9WyJdzE3fFSNY93kEjM1C/c
 Eq+7Vv8a+bPuHtvnMAEDh1eUeY6WqljJ5hDxexrFp1ASeU0v2YOeJ+UcG
 d3oOJVdiwOkql7AdJWabe/S5Trk6kJyx6x+z8+Zw7YS0weH2CQbxXRX5T
 eaJEs2SK3h+yr7coUyM8u5z50pFJqQ9lFYz0aGG3B7QpxAm5nQ2fepQG2
 REVbrTcAvPhkKlZqgB4CyEAnHPqm9fqpZ5+Fzn0H7IyU0nvfyQ/dcuvhB Q==;
X-CSE-ConnectionGUID: gvD8RPsGQZ6NewSu3M6NhA==
X-CSE-MsgGUID: uiqBHUz4TTaipJETSG5dMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390509"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390509"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:40 -0700
X-CSE-ConnectionGUID: UDCJeoMnRTGUGnt17hbDqA==
X-CSE-MsgGUID: ybiyHzXpR0mQBEJivz8u4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735927"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:39 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 08/12] drm/xe/pat: Report missing PAT table using
 structured xe_log API
Date: Mon, 12 Oct 2026 10:48:19 +0530
Message-ID: <20261012051823.2201360-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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

