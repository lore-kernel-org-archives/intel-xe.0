Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B099CC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 20:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481110E23A;
	Fri, 10 May 2024 20:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6087J8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4C710E23A
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715373530; x=1746909530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFmKVMbKvILxEdqtan8XU8zMThSNKTu5QpBCLGvBpQQ=;
 b=A6087J8IPdQ79Bo1cR24leZTofXdVue+Yjjo7SZpplvMvn+KBPfcg3Bo
 bOINOS1m/NWJoGwkss3YWxibOr+q57ZJVis3dp2sqvgwVzCDJSEpWg3Lj
 3qB3mZ9JsJkDHvPmI38556Ok2WmLdCVdOc6zAw00xf/+W7PQkFcYwvKk/
 Eu4/ELgXlcVzGx1rN89ip0ysI7ax/Sr4NDBBi+J0Mm0tpYpweC5tXVuQs
 ESq9d55+0Xkx5QPK5sL0IzMwIuGfZ7kmUygq7uWnJRrUs+542MP8H+N0N
 ssikbpG8n1wKoAmuyWjpNcnpGqjGZ83nicYMA49eAzASgyLVoRoD+sKsm g==;
X-CSE-ConnectionGUID: GPMo47heR4KqEj6Z2TroXw==
X-CSE-MsgGUID: mjY1RPvfT+msyg/+r/Esgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28886827"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28886827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:38:50 -0700
X-CSE-ConnectionGUID: Railc9OwTBGYUqRC2UVkyQ==
X-CSE-MsgGUID: SnfowOOJRJ20yyV29fWplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29577966"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:38:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/uc: Move GuC submission init to post hwconfig step
Date: Fri, 10 May 2024 22:38:10 +0200
Message-Id: <20240510203810.1952-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240510203810.1952-1-michal.wajdeczko@intel.com>
References: <20240510203810.1952-1-michal.wajdeczko@intel.com>
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

We shouldn't need anything from the GuC submission code until we
finish GuC initialization in post hwconfig step.

While around add diagnostic message if we fail uC init.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c |  9 +++++++++
 drivers/gpu/drm/xe/xe_uc.c  | 10 +++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..b1bb94914028 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_db_mgr.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
@@ -356,6 +357,14 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
+	ret = xe_guc_submit_init(guc);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
+	if (ret)
+		return ret;
+
 	ret = xe_guc_pc_init(&guc->pc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 45035e38388b..0186eafc947d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -10,10 +10,9 @@
 #include "xe_gsc.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
-#include "xe_guc_db_mgr.h"
 #include "xe_guc_pc.h"
-#include "xe_guc_submit.h"
 #include "xe_huc.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
@@ -58,13 +57,10 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
-	ret = xe_guc_submit_init(&uc->guc);
-	if (ret)
-		goto err;
-
-	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
+	return 0;
 
 err:
+	xe_gt_err(uc_to_gt(uc), "Failed to initialize uC (%pe)\n", ERR_PTR(ret));
 	return ret;
 }
 
-- 
2.43.0

