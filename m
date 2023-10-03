Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D685E7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B1410E2AD;
	Tue,  3 Oct 2023 14:35:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F79610E2AD
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343731; x=1727879731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnWp8lPhVOwV9pIdScr5D9PGpvl/L4aU9gOmlzOvPPU=;
 b=ix9M02cS/z3Tuhi3u9l8eCxavfnwBt2tn43LDVm0qDdBM4POacwGIKYp
 v66ah9y10aAOdUB+UkM/jsZpstC3Od1LUoWbzHcdTpSDwyqIr5dYQnC5J
 r7S3Ls3Dxdh1FisxZSnzf9xr4UB+FLUV/skPEEr4S5Po+ME7pCArfEMF6
 HjqDWKpVjD9GC0ZxtPSorH+qpY60zd/klc81BHCNkhzuQfqYQRxk7QzXh
 Z7aPaVvBoW8y3EDN/XbCIy8WsUgueluKIXY+0mpldFF3zCrcoMKlvPvHr
 G2nuqWo0QsPAuuVDbOin8PCIVbwhkImO+LUnd6tf9nJACjzttVbssZDRz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413799707"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="413799707"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082041744"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="1082041744"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:52 +0300
Message-Id: <224dfa5edfae9bf0867f8372059acf5eef9dbdbf.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/10] fixup! drm/xe/display: Implement display
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

Checks for CONFIG_DRM_XE_DISPLAY are useless in xe_display.c, because
it's not built when CONFIG_DRM_XE_DISPLAY=n.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 68729997e1fe..82d2c42629ce 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -3,8 +3,6 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-
 #include "xe_display.h"
 #include "regs/xe_regs.h"
 
@@ -438,5 +436,3 @@ void xe_display_probe(struct xe_device *xe)
 	unset_display_features(xe);
 }
 __diag_pop();
-
-#endif
-- 
2.39.2

