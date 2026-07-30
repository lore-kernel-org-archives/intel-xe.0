Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E6BC54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 04:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5064310EDB9;
	Thu, 30 Jul 2026 04:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SY6702bw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419A10EDB9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 04:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785387567; x=1816923567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=snvoXu87DwDekObyk5xbP75DvKUl48sejonWSX0EtX0=;
 b=SY6702bw+1vRxeUDSh+Y6O5EMMmZQGV7nloCwd3JpeT6mzrfJwWYkHgy
 KgkXOdEpgJltWqrCZl1Xh51LBLE12g57oDZ4GnrSjlnFDXXmXDZuJ+Y7Z
 JVC8ybqxnbRhSTFpKRIaEU5zPozGOwe9hru+o1zb3DkN4frrMyExJHjGQ
 bh70RlXFaAVACum/z25LeIcuoNq8Si5dgH+lwRCavBHwI7Thw3EJFQfCS
 g9Q5Bb72xYphhhS53vKB5R07k1aEG1/P0ISD9Zzo0IooRdt7nT+7UfvfK
 ALZNS/gsUgygRkA67gNsGHsxiW8/8Jp61UwuLYLQIpGs+u3d3H4fFzCE4 Q==;
X-CSE-ConnectionGUID: cSNf+ugcT9+peUlB94Od3A==
X-CSE-MsgGUID: im8zMDiXRwKMsyPa9/aPtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73534527"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="73534527"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 21:59:20 -0700
X-CSE-ConnectionGUID: lh6/Xy92S1u3yPgSARh+uA==
X-CSE-MsgGUID: iiLlNLcnTP+iSG2KqSnPug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="255890321"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 21:59:18 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/pm: do not warn about missing runtime PM protection
 after hot-unplug
Date: Thu, 30 Jul 2026 11:06:36 +0530
Message-ID: <20260730053635.1515929-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

After hot-unplug, device_del() disables runtime PM. A deferred fd close
can still run later during process exit and destroy remaining exec queues,
which may call xe_pm_runtime_get_noresume().

At this point pm_runtime_get_if_in_use() fails because runtime PM has
already been disabled, so xe_pm_runtime_get_noresume() warns with
"Missing outer runtime PM protection". This is expected after hot-unplug
and does not indicate a missing outer runtime PM guard from the caller.

Skip the warning when the DRM device is already unplugged.

Observed with new IGT core_hotunplug subtests:
  igt@core_hotunplug@hotreplug-with-load
  igt@core_hotunplug@hotunplug-rescan-with-load

v2: Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
    and instead exclude hot-unplug from the WARN in
    xe_pm_runtime_get_noresume(). (Matthew Brost)

Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a5289a9df8d2..a038687d5b2c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -10,6 +10,7 @@
 #include <linux/suspend.h>
 #include <linux/dmi.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
 
@@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
 
 	if (!ref) {
 		pm_runtime_get_noresume(xe->drm.dev);
-		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
+		drm_WARN(&xe->drm,
+			 !drm_dev_is_unplugged(&xe->drm) &&
+			 !xe_pm_suspending_or_resuming(xe),
 			 "Missing outer runtime PM protection\n");
 	}
 }
-- 
2.50.1

