Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35303C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C859E10E621;
	Fri, 19 May 2023 23:19:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2C910E623
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538328; x=1716074328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f4qeFAjKGfOf/KVQMjcWzQn9c+z08k1HdUEChav4owQ=;
 b=EFanpxiKn9oCUjawXq8uoQWa8NgewyL3xiHqub9COC7kFSLmw2P1qzqJ
 woV+Ueix9JR1wRSBZfZo6wvERGsWi8v4wzp0bbpieQbDSQBUTcUSHdduN
 dmBfrJAisd9c3YxPshbCZl2sTWujTpWbly/gDyg+5Eimis7JLhzQa6Bap
 9MzxeGyF2ygXV2J3DXSnotWnCOAONakHysF71gLfYCw320ojUyouJL2nB
 dq+yqvWaAMjva0+j7geLSJvfMNhFUzytD4kGjlWP5nHVmdNuDWQr2a0at
 fEJ1ODaJeA4WhMCOOVOwkfm0gPyJPwgZlORjTlhXo3w8Vt1kfNrGk//W3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526341"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526341"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888691"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888691"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:01 -0700
Message-Id: <20230519231827.3572452-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/30] drm/xe: Add for_each_tile iterator
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As we start splitting tile handling out from GT handling, we'll need to
be able to iterate over tiles separately from GTs.  This iterator will
be used in upcoming patches.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c    | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f7acaf51a1fc..745dbb16d417 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -83,6 +83,10 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
 	xe->info.enable_guc = false;
 }
 
+#define for_each_tile(tile__, xe__, id__) \
+	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
+		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
+
 #define for_each_gt(gt__, xe__, id__) \
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
 		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1e1e401b25ae..0fb7ebb9653e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -549,8 +549,7 @@ static int xe_info_init(struct xe_device *xe,
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 	xe->info.step = xe_step_get(xe);
 
-	for (id = 0; id < xe->info.tile_count; ++id) {
-		tile = &xe->tiles[id];
+	for_each_tile(tile, xe, id) {
 		tile->xe = xe;
 		tile->id = id;
 
-- 
2.40.0

