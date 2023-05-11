Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC1C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCDD10E593;
	Thu, 11 May 2023 03:47:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0610E590
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776850; x=1715312850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bt0xey5bwhQMGg1vRM4CkmC4K3n5uHkUxabXqkn3zbY=;
 b=g0cO8xSPlHz4LIuKvnd8dp7I3teYR21X3BF5r2RliMKQQh/ZKjlD6bSl
 3LgxQalYUhgkzYHZRLXObyNUahE/hh7VJaOD+tH/yaZh2M0JOBcTWC3rE
 9h9yM5OM9o909pki4Gbt1WV1V/Dy3qeEp5/2iLYfVDUr/B579nRbN1ChS
 FwoPuwj4B9kmZ9yWpt2GvaF9VczkzGldppppBvc33rTXsxr0KRe5E03dM
 k5ZtQ1izrwlJwzbvNyPvtbMRZeHVgcqkxUwvdPVw2VIBNaJevpXiHqCCg
 /M0M17FCABGI9w7HM8m9JhTzXKi3QLpArNLEMhigbdZ11Owky2K9VP39w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850632"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203185"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203185"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:00 -0700
Message-Id: <20230511034722.1929038-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/26] drm/xe: Add for_each_tile iterator
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
index 87c328106aca..bef65d3a440e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -525,8 +525,7 @@ static int xe_info_init(struct xe_device *xe,
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 	xe->info.step = xe_step_get(xe);
 
-	for (id = 0; id < xe->info.tile_count; ++id) {
-		tile = &xe->tiles[id];
+	for_each_tile(tile, xe, id) {
 		tile->xe = xe;
 		tile->id = id;
 
-- 
2.40.0

