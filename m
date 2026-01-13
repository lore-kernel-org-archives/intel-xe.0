Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D900D318A8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DE110E5BD;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA3ePnFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFB710E579
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMZEqETZ8WlTCucUe9J2KW366crLwsXbMpnUvJm5l4Y=;
 b=JA3ePnFfDGbDeEFZtadIXZDfeEtIOeGETaHMuVKxXy2K63EBeC/v4NZC
 nuZb+Gk4qoN2XUPpv0FwKibJC8zYzLVYAOZ3YN3f02iTPZlrXg7x8GVLm
 EA2YSLodgPihhOqhstAuCS3cTSDndvGHZvRS35TUcHO34475MUW0MiIEK
 sffqxRgQ04QqWTS8oiv/RZ3zqkGzo0qbN+shhma/xqhicWJri4OTRHi5+
 3XT0MTqCyGBqQdfodbc5EOGjOmjP1PmXmzZoeLbKVAicA+shPzi1ic4/z
 bQuebH5GyEWWaUlTDLQ/LNKn1YCOGcnEK9JrVcR1NZv9XKt2NdXFnWxt3 w==;
X-CSE-ConnectionGUID: uH/DoR5JT9a1s0U0lJ0mHA==
X-CSE-MsgGUID: WCXAdOkzRBuCAcbRWom/nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311177"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: 60xYwEXJSJS2nrdLpfbOtA==
X-CSE-MsgGUID: 3REWGGrbQqSmzMNEoyh1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147464"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 70/79] drm/xe: Cleanup headers in xe_uc_debugfs.c
Date: Tue, 13 Jan 2026 15:04:15 -0800
Message-ID: <20260113230315.3081153-151-matthew.d.roper@intel.com>
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

xe_uc_debugfs.c doesn't directly use anything from xe_gt.h; it only
needs to implicit inclusion of xe_uc_types.h.  Directly include the UC
type header and drop the GT header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_uc_debugfs.c
index 24a4209051ee..45119993f5cb 100644
--- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
@@ -7,12 +7,12 @@
 
 #include <drm/drm_debugfs.h>
 
-#include "xe_gt.h"
 #include "xe_gsc_debugfs.h"
 #include "xe_guc_debugfs.h"
 #include "xe_huc_debugfs.h"
 #include "xe_macros.h"
 #include "xe_uc_debugfs.h"
+#include "xe_uc_types.h"
 
 void xe_uc_debugfs_register(struct xe_uc *uc, struct dentry *parent)
 {
-- 
2.52.0

