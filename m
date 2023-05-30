Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0C6C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240DD10E436;
	Tue, 30 May 2023 21:16:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B7010E433
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481366; x=1717017366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PcXY8vcw6ODZ/MF6OyUPXAXfJnD25lqKo5eQkE+0B14=;
 b=KsUnPJ2Z+mSazyvKuV89Klhsvy5JAqMXN0OwNrqhSHE+QhvMk0pKTZCp
 bE0BqrCUcflc6IARK13UM2Eha9cvJ5rTJx2NOwXTl6+F/1k5x6jwHoHGR
 v7L1EHUJlPL2Wp+BFmgnpdi1WZ7uD9E8S3P3UkTEalZL0aJ5rQwHCY8ZM
 HXhBMW8XWGkzY26AUKKRxUJo3dTHt2tmsUOpzakR26O33j84mt+kBKZL1
 dZRkNiv0aYlW3MiyyFsCkKRznDXfFzNi0u0in26kZ8qWRrxG3UY5GuC6U
 4BHuvbL6ZKSI6B2LKj/qZ9Oe2QywYkof+QhJ5YUSbNxlIWuLlfajfT6wP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311929"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311929"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139383"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139383"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:23 -0700
Message-Id: <20230530211549.2632538-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 05/31] drm/xe: Add for_each_tile iterator
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
index 551ba20083b9..91d5dc59aa7e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -559,8 +559,7 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for (id = 0; id < xe->info.tile_count; ++id) {
-		tile = &xe->tiles[id];
+	for_each_tile(tile, xe, id) {
 		tile->xe = xe;
 		tile->id = id;
 
-- 
2.40.1

