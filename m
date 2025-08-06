Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50ECC87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33110E729;
	Wed,  6 Aug 2025 06:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7a2BNMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D1F10E3A6
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKM4hr/zmfcBUsxoFZUcxC7WtsXe2Wk88IhWZZFgnQQ=;
 b=T7a2BNMiHtXMJzaTT64oQGAH1ERCDtrCjy5LuqQxTfbBL5S+nEKARDpE
 ibwA8ShcniWrQpsEbaW5Owcq5yTpoQwOkHF8+MtiLfehfCxOoomqT87rQ
 TdXCJ23wY06SSrcFSduuAks9XSQ1nUnJ1o90DOgHfaxxsdTd+oCg+FvVE
 6Esc42X4FKd+Qz/g71yc8R9Qw3Q14NLkgGrEWwyg33NioCH1tLyHfjTOm
 HJbmjKIPt1ZsZ9t47NC9KpvTwA6dJUwaOS7SzFgeyUSVGH+LQ7j1UgnKC
 k5SAvx95g9R+wBCzrdYv0WfucCYqhgZXoO6KPSxSMwZcHQEP5Vg2bhZ2I g==;
X-CSE-ConnectionGUID: jwyP+cYhSsS+mNprGsAmqQ==
X-CSE-MsgGUID: gkFjMoLNRuitGzhRXst+6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316932"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: 2/bU/GnISXKpL2+hpUBHfA==
X-CSE-MsgGUID: +REWA8msTrCs0010BDOBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868942"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 03/11] drm/xe: Implement xe_pagefault_reset
Date: Tue,  5 Aug 2025 23:22:34 -0700
Message-Id: <20250806062242.1090416-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Squash any pending faults on the GT being reset by setting the GT field
in struct xe_pagefault to NULL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 390394bbaadc..5aa03f89a062 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -50,6 +50,7 @@
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
+#include "xe_pagefault.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_mocs.h"
@@ -846,6 +847,7 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
+	xe_pagefault_reset(gt_to_xe(gt), gt);
 	xe_gt_pagefault_reset(gt);
 
 	xe_uc_stop(&gt->uc);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 14304c41eb23..aef389e51612 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -122,6 +122,24 @@ int xe_pagefault_init(struct xe_device *xe)
 	return err;
 }
 
+static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
+				     struct xe_pagefault_queue *pf_queue)
+{
+	u32 i;
+
+	/* Squash all pending faults on the GT */
+
+	spin_lock_irq(&pf_queue->lock);
+	for (i = pf_queue->tail; i != pf_queue->head;
+	     i = (i + xe_pagefault_entry_size()) % pf_queue->size) {
+		struct xe_pagefault *pf = pf_queue->data + i;
+
+		if (pf->gt == gt)
+			pf->gt = NULL;
+	}
+	spin_unlock_irq(&pf_queue->lock);
+}
+
 /**
  * xe_pagefault_reset() - Page fault reset for a GT
  * @xe: xe device instance
@@ -132,7 +150,10 @@ int xe_pagefault_init(struct xe_device *xe)
  */
 void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 {
-	/* TODO - implement */
+	int i;
+
+	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
+		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
 }
 
 /**
-- 
2.34.1

