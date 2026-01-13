Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC9CD30CFA
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBF810E578;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6PH8fv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE7610E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345419; x=1799881419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fgQqnC2snaWEnkewX+8hAzLvmiOqcWSMUct+myV9URM=;
 b=j6PH8fv5o1O6OWi+YgObWiod8jGnAo91BP7BJdosMHXhYy8ag4zrPyPt
 Qwm0Mwyq+bjRwVIviuzB9ndeNY+EKRP0rBLLkcsISkWEqAMJvxTDx9Jqr
 SsGkRfxSdX5+CGOr6GtOCRfM3OxkicSmbFtUBvtTyD6PtEccu4QmMS2dq
 HAVhdtGzHRNynSdJ+NQiCxWuFJNQECAU2laP1c+DZMbvuQR+soA4alx6+
 roR46Xdx1BPtfwkDU0H+cg/mqzmzcNr3Bf62mSY8nkdstkJ05mJ9beAjI
 5w/HGV9OmuwzvO5wFgcliL62yARh+VvoKnSOjihhMjKed7ZbHdJp77FdJ g==;
X-CSE-ConnectionGUID: gIokbnchSKaRLckNg8B4iw==
X-CSE-MsgGUID: /l74xYvdTx2pFPIy8TQrGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311106"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311106"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: aiCsO2L8QzmD63Pi2r9uHA==
X-CSE-MsgGUID: S/Xi+CrVQnOtzJieyg45ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147255"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 02/79] drm/xe: Drop unused header in xe_bo.c
Date: Tue, 13 Jan 2026 15:03:07 -0800
Message-ID: <20260113230315.3081153-83-matthew.d.roper@intel.com>
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

xe_bo.c does not use anything from xe_gt.h; the include is only needed
by the kunit code in tests/xe_bo.c.  Move the include to the test file
to match its actual usage.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 1 +
 drivers/gpu/drm/xe/xe_bo.c       | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 2278e589a493..b7d8e45804cf 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -18,6 +18,7 @@
 #include "tests/xe_test.h"
 
 #include "xe_bo_evict.h"
+#include "xe_gt.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 917e50c276ac..e9180b01a4e4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -26,7 +26,6 @@
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
-- 
2.52.0

