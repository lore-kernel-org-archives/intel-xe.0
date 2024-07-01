Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922F3C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 19:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462810E039;
	Mon,  1 Jul 2024 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7QefJqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6088410E039
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719862239; x=1751398239;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k52n2qs6kbIh3CgDGvPO9oVm4DozeBF4+jCty9oJo4k=;
 b=l7QefJqWyVQzl6JcCUKyXgnaBY4/CTnVug0GukO+PDto/xJNaYDO0Rtu
 tFi0rtTdaLrN4Z3Jusmh6Kg4ychyzlnvw8V7bQ3Lqq5lLc5CvQZMoxFvo
 4AxLgAVAHxpbumeN192LLkBEqVcU8vTJUjSIgab/PFfNMjcdiYVLzdof/
 qK6RWVTU/E+O2lMKGKe2b/pHaxPhNSldKpMsvDVUaUUFH99GAxmW4+jaM
 1Rd3q+xELRM0gLgN0Kp1YwXfe7AYAgQ7o/KRqCPq7NjXMTgfYZ3Vc3A8V
 kyBc1jrX36QgwNRtQq6Euuv8oUeuy6c4aPkFwo+pSJ8cr2c0OtHmVG4tT A==;
X-CSE-ConnectionGUID: kNVjWeewSmuNMOpwhJsKxA==
X-CSE-MsgGUID: QqbcboMRQbuuQpN9azC3aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16836517"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="16836517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:30:39 -0700
X-CSE-ConnectionGUID: uZfpjLI4ToWi5mgSZfgkMQ==
X-CSE-MsgGUID: o2MFY57pQBGybmTmmDATfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="45755744"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:30:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Demote GuC IDs usage message to debug
Date: Mon,  1 Jul 2024 21:30:30 +0200
Message-Id: <20240701193030.978-1-michal.wajdeczko@intel.com>
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

Printing message at INFO level about available GuC IDs is not that
important, DEBUG level is enough. It will also match message about
available doorbells:

 [ ] xe ... [drm:xe_guc_id_mgr_init [xe]] GT0: using 65535 GuC IDs
 [ ] xe ... [drm:xe_guc_db_mgr_init [xe]] GT0: using 256 doorbells

While at it, use proper "GuC" name.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index cd0549d0ef89..e845425d670b 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -97,8 +97,8 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	if (ret)
 		return ret;
 
-	xe_gt_info(idm_to_gt(idm), "using %u GUC ID%s\n",
-		   idm->total, str_plural(idm->total));
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
+		  idm->total, str_plural(idm->total));
 	return 0;
 }
 
-- 
2.43.0

