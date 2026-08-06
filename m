Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB984C561E6
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 08:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9126210E2BE;
	Thu,  6 Aug 2026 08:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxmMdtEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B53610E2C2
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786004372; x=1817540372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=psG9fNXG9qZ4lzp9Jwq7u/bhZz+B4Dx9iYiV/aktLcY=;
 b=DxmMdtEmpIjKSywtBjZ5+w4QsfWN1Ua0hu/p6zGpVJpVtZjU0OnF62fA
 ehXbi2Um+zfx4UwqOyHBMow8Z8WjJO5NdXcPqgXiZnf6izKBZMwjr2c5d
 jM7sUBeByGjdHQhuzG2XMMRHT3JTBsKdoUBBQA39ojCHWuGpjMz1hC1Xb
 EoGU9Nvgk9d9AuszC5fJzkTST4M4B5e75sqIy3m/soYZH6zD0nePPswyr
 O1N6OoIm0pkLXnFq570UB+fTA70F9XWg6QlfiDKTi2HN/5E+LJRL+O32I
 8IyhebVIXWG4FnSxTK4s2099nkP9Eui73N0ooHulQBvgRDxP7oxPULWy8 Q==;
X-CSE-ConnectionGUID: 7JeIL4vsRWSqMfvDGCYP2A==
X-CSE-MsgGUID: n7szIRHERWepVOItcINuYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86619389"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86619389"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 01:19:32 -0700
X-CSE-ConnectionGUID: rHEuCEafQ5WyygkewwTgqw==
X-CSE-MsgGUID: YSAsYwcgTFaUu0fPc5HKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="264026761"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2026 01:19:31 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/pm: do not warn about missing runtime PM protection
 after hot-unplug
Date: Thu,  6 Aug 2026 14:27:12 +0530
Message-ID: <20260806085711.437110-2-nitin.r.gote@intel.com>
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

Exec queues are owned by user fds and are destroyed when the fd is closed.
After hot-unplug this can happen from a deferred close during process
exit, after the device has been removed and runtime PM has been disabled.
The queue destroy path can call xe_pm_runtime_get_noresume(), and since
runtime PM is disabled pm_runtime_get_if_in_use() returns no reference,
so it warns about "Missing outer runtime PM protection".

This is a false positive for the hot-unplug teardown case. The device is
already unplugged, and the queue destroy path that triggered this warning
was checked and does not touch hardware state after unplug. GuC has already
been sanitized by guc_fini_hw(), so no H2G is sent and the hardware
teardown path is no longer reachable.

Skip the warning when the DRM device is already unplugged.

Observed with new IGT core_hotunplug subtests:
  igt@core_hotunplug@hotreplug-with-load
  igt@core_hotunplug@hotunplug-rescan-with-load

v2:
 - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
   and instead exclude hot-unplug from the WARN in
   xe_pm_runtime_get_noresume(). (Matthew Brost)

v3:
 - Clarify that the queue destroy path was checked and does not touch
   hardware state after unplug. (Matthew Auld)

Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub-Copilot:claude-opus-4.8
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

