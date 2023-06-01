Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D2FC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7301510E5C3;
	Thu,  1 Jun 2023 20:30:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AFF10E5C2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651431; x=1717187431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBPEQSU19KeDJlI+MDjNJgHKoLbo1Q0SmO1Tp1HU5hc=;
 b=R40Zt3yRq0Lhi4NcDhU+iU/60GtQv4LOhjEi8N4eEAm9IWbUhmZYdGQ/
 0jFx6WDKpPrjuQDm6NW3ypq2mk+Z+6OrapRcHreowWvCoz+DieAbB79es
 enqiP7AIFX1+ZfGiOiNRI8bZxuFTv3sOcoP/o7jeh7azi4KbGs8OUE3Gl
 64eMVC0D3lBNoLs1ViOtws4ahrwl4L6rS1JzTTRM07vQaHCWPeHjr9NqA
 vulwOccjjBkwvd9TDs1MXeB66Yflm8iACawbhm8qVgl/2oum9ivHlEyBQ
 Ao5CH/UaZjBF3HcaYxPqasxNYIsFBCmWw31agy9ZYEKlePGGZ9C5p1iwd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102504"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102504"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493221"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493221"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:29:59 -0700
Message-Id: <20230601203025.615494-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 05/31] drm/xe: Add for_each_tile iterator
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As we start splitting tile handling out from GT handling, we'll need to
be able to iterate over tiles separately from GTs.  This iterator will
be used in upcoming patches.

v2:
 - s/(id__++)/(id__)++/  (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c    | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f7acaf51a1fc..3516ac1dcbc4 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -83,6 +83,10 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
 	xe->info.enable_guc = false;
 }
 
+#define for_each_tile(tile__, xe__, id__) \
+	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
+
 #define for_each_gt(gt__, xe__, id__) \
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
 		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2e5a15219964..9e0d26329dd7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -558,8 +558,7 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for (id = 0; id < xe->info.tile_count; ++id) {
-		tile = &xe->tiles[id];
+	for_each_tile(tile, xe, id) {
 		tile->xe = xe;
 		tile->id = id;
 
-- 
2.40.1

