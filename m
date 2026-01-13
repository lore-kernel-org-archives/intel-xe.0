Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD11D30CF8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ED610E56E;
	Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UT047Pl+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365FB10E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iFrf46Xb8js0MBAiDdnBqZK2r7HAfryk9MAr/kNFBZU=;
 b=UT047Pl+HvjL8aISlb/IzlkbQe7cuYLy4ehUS+m5JFtp0/YBkYuZ1VL4
 fJnMGmHR/qD2VdTythWFcy1xlsO3JRlOo+ryz2pKqVe3D2hEt/uGC5rzb
 Oy4Z6qXLt4k5jZgcPHNExMq/Gl2BZn7Mmw3G/6SCfMhYv0DLKGPEWTD3F
 46QYkHNe8+KAs1WSz0ZH5lneJHcbul4rY/Kwyo5qQ+sjX3dfYwzUi7hP5
 IvrgL5oLsPZ9iFLw+49veGyZ1qr+gDXEWzemskJjxIInqmxog6L5WBRCN
 mzAtKsa5A1uQ+JuGa9l5q916xPYq4JB4hC1dC2U7iEf55Yg+UvsZBnHeN w==;
X-CSE-ConnectionGUID: /WAzcE0rSmKTHFgg/kyb0Q==
X-CSE-MsgGUID: e6Fz/n+/RqKS6147GtSh2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311113"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: vZNLx7isSe2uLZIfrAhbEA==
X-CSE-MsgGUID: XX4VM1oFThKtQSDp1u9qAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147277"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 09/79] drm/xe: Cleanup headers in xe_gsc_debugfs.c
Date: Tue, 13 Jan 2026 15:03:14 -0800
Message-ID: <20260113230315.3081153-90-matthew.d.roper@intel.com>
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

xe_gsc_debugfs doesn't use anything from xe_macros.h or xe_device.h.
Furthermore xe_gt.h is not necessary, only the corresponding 'types'
header.  Drop/replace the unnecessary includes.  Also add an explicit
include of drm_print.h which was being indirectly included.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_debugfs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.c b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
index b13928b50eb9..d4977e666946 100644
--- a/drivers/gpu/drm/xe/xe_gsc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
@@ -7,11 +7,10 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_gsc.h"
-#include "xe_macros.h"
 #include "xe_pm.h"
 
 static struct xe_gt *
-- 
2.52.0

