Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716A7C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 19:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97210E1C9;
	Thu, 13 Jun 2024 19:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMpMgKRV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94A010E1C9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718308635; x=1749844635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HewBjSTezjUl3Tq45i50Y5WCnK7S/6o7tGNbgG7xkaY=;
 b=bMpMgKRVHWwK9S6m96uHuWZ6FMFO57q5orid6iL7EJzZC8OfSXsuIqEi
 xiLPgzGZbSh6yVTC0hCmwFf8fTSieI8bROwCjXwBdeQlmFvNw29vYotSc
 GxSWFkpUvrcs9Xb9XQE+1uQYHWuvsnlYsZuUh1Mo6YH5QBCStCveN9ag5
 KKl7Ar3gD84ByGC4xmp2BisXUImC2rqyJm5UsF66qLLxgIi0TxFGUHV4P
 1mde7H/yFTKEXLC0ljvVhaQu0dHHp/NHCoT4f9/RkQBbp3USRw1zeAitY
 InRbuTCZuoeiqpbsIE2F+VuzTC+3k63J4wBpI4ZOSieSWyZihPbOCMwN8 Q==;
X-CSE-ConnectionGUID: tA/gjOEESvuI4O2sJ1nTbA==
X-CSE-MsgGUID: fZDDDA2nQ5O5lgBAyExZpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25839087"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="25839087"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 12:57:14 -0700
X-CSE-ConnectionGUID: zZyXK4ZJTKqgxphy3fhNAg==
X-CSE-MsgGUID: lnpXs0fAQlKAhOsY589ODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40335849"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 12:57:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Drop duplicated declaration
Date: Thu, 13 Jun 2024 21:57:02 +0200
Message-Id: <20240613195702.2164-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The declaration of xe_reg_whitelist_process_engine() function does
not fit into "xe_wa.h" and is already a duplicate.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 1 +
 drivers/gpu/drm/xe/xe_wa.h        | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0a83506e1ad8..52f12009678e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -26,6 +26,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
+#include "xe_reg_whitelist.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 1b24d66f9d80..db9ddeaf69bf 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -17,8 +17,6 @@ void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
-
-void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 
 /**
-- 
2.43.0

