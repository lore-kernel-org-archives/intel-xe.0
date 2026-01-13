Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE18DD31891
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124D910E59E;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1J9wZ1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57B810E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FpIKsdikLycTHjqLYYBu73q7phfsiLL6iw7vXLlcSTc=;
 b=N1J9wZ1LXbnQWWXycF50hMHVrDJ/OdZJwWvtUs1iGCB4X4qp7bDcju6s
 of/SJoz0OABSvD9NHln2uHMlNSdXsZeCjZfd9W7m5tpajqaof9wP4N9N5
 azKqZ77VgcarQSl8Fjqv3tcW4d0LKbnTA9TTQBVMTPYSj7MrFLwlFEATZ
 x1Td8Ukcgl2hE6ljmeI2MgZsPRl6+PMkAcaziU0xs0DTmje8/dWTPsHOK
 g2I9fLDGOhxP+SaLYZYY9+fDXyMkMSXHLh4ZD7uD0Hb+iAVwPz0E8OKRm
 PvJrKItLi+0WHc5JZURXCyYZQ7ZK3s0UxPCaTRLnXknosKlCxnfKbBmFR A==;
X-CSE-ConnectionGUID: lU1M0lZkQpGVZQGY9oa8zA==
X-CSE-MsgGUID: cVQl72p0QJ+jsfV3AARFNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311140"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311140"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: YNNzNQwLQbujUseiWnw1Fw==
X-CSE-MsgGUID: 6Vbo1Mx/SFSMbqzC/xl/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147384"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 36/79] drm/xe: Clean up headers in xe_huc_debugfs.c
Date: Tue, 13 Jan 2026 15:03:41 -0800
Message-ID: <20260113230315.3081153-117-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_huc_debugfs.c doesn't use anything from xe_device.h or xe_macros.h.
It also doesn't need xe_gt.h, only xe_gt_types.h.  Drop/replace the
unnecessary includes.  Also add an explicit include of drm_print.h,
which was being indirectly included previously.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc_debugfs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index df9c4d79b710..80829967b3d7 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -7,11 +7,10 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_huc.h"
-#include "xe_macros.h"
 #include "xe_pm.h"
 
 static struct xe_gt *
-- 
2.52.0

