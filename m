Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4072CA5FFF
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A274510ED5F;
	Mon,  5 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afY4YKOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC41F10ED5E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791211272; x=1822747272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=45kP56I0F08Bgl3Y0qoEIiGcrkw4ODZpQUV8FQ6gfjo=;
 b=afY4YKOC571DJzJfyfhntWdeYxigTqoaVYLRUYhuoekTahae+yDfktlw
 GEYdKDEOQj+Kn4fey4bVkjS1XhRCrI2znVZ5INeDsAY3h5N/YIv1WQlJl
 imtFTNQJfeVoY//daszQTDjIof2bInI/Qj9xntyd/08MaNMnq1hgHCxDM
 nfBnhpXN+tIvONF7Ic9r9bzU0SHa154NxCVIGi5xV+5fzVYsBpnDRZ2YH
 oqVCXBO8uSkATjBl+cPOfuYj+bH4aKchWGaTK/0GZm5zDCCKFFE+uQdGj
 WI4j4oC1mXCY/kQu1rKXXda9mYpg7LkOZnRYe+H/RNcx2YEaFERgU/BPM w==;
X-CSE-ConnectionGUID: NWUFSMz1QeeVVV7ctWmn/g==
X-CSE-MsgGUID: Xvvyqq8gTNWxeojD1IWrQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90918301"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="90918301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:11 -0700
X-CSE-ConnectionGUID: N2X/F+PQTRCa2T6eR7Y5JA==
X-CSE-MsgGUID: MQcVupruR/KR9YfQtH0OWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="276961752"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/shrinker: hold a stable RPM ref across scan
Date: Mon,  5 Oct 2026 15:41:03 +0100
Message-ID: <20261005144059.1569162-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005144059.1569162-5-matthew.auld@intel.com>
References: <20261005144059.1569162-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Now that we use async RPM get, with the custom worker gone, we can
eliminate the get/put dance and just always hold a stable ref over the
entire scan, and just have the inner layer ping the async status with
if_active(), if required. If it's still not awake we skip just like
before, but when it does wake up we now don't need to worry about races
where the device potentially goes back to sleep, since at no point do we
drop the outer ref.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 44 +++++++++++++++-----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 518f77acf1dd..267b0290be8e 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -52,24 +52,6 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
 	write_unlock(&shrinker->lock);
 }
 
-static bool __xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
-{
-	struct xe_device *xe = shrinker->xe;
-
-	if (xe_pm_runtime_get_if_active(xe))
-		return true;
-
-	if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait()) {
-		xe_pm_runtime_get(xe);
-		return true;
-	}
-
-	xe_pm_runtime_get_async(xe);
-	xe_pm_runtime_put(xe);
-
-	return false;
-}
-
 static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
 {
 	if (runtime_pm)
@@ -102,7 +84,7 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 
 		if (mem_type != XE_PL_SYSTEM && !rpm &&
 		    xe_device_is_l2_flush_optimized(xe)) {
-			if (!__xe_shrinker_runtime_pm_get(shrinker))
+			if (!xe_pm_runtime_get_if_active(xe))
 				break;
 			rpm = true;
 		}
@@ -190,6 +172,13 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
 
+static bool xe_shrinker_needs_rpm(struct xe_device *xe)
+{
+	return (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe) &&
+		ttm_backup_bytes_avail()) ||
+		xe_device_is_l2_flush_optimized(xe);
+}
+
 /*
  * Check if we need runtime pm, and if so try to grab a reference if
  * already active. If sync RPM get fails, queue an async RPM get that
@@ -202,19 +191,28 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
 {
 	struct xe_device *xe = shrinker->xe;
 
-	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
-	    !ttm_backup_bytes_avail())
+	if (!xe_shrinker_needs_rpm(xe))
 		return false;
 
 	if (!force) {
 		read_lock(&shrinker->lock);
-		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
+		if (xe_device_is_l2_flush_optimized(xe))
+			force = shrinker->purgeable_pages || can_backup;
+		else
+			force = nr_to_scan > shrinker->purgeable_pages && can_backup;
 		read_unlock(&shrinker->lock);
 		if (!force)
 			return false;
 	}
 
-	return __xe_shrinker_runtime_pm_get(shrinker);
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait())
+			xe_pm_runtime_get(xe);
+		else
+			xe_pm_runtime_get_async(xe);
+	}
+
+	return true;
 }
 
 static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
-- 
2.55.0

