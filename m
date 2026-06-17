Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE6CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 08:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909D310EEBC;
	Wed, 17 Jun 2026 08:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/CnvliA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76D510EEBC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781684481; x=1813220481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ZimRMhoTuTguSnJ0DfwO3FdF1LHAXFvk+rqOhhzTsc=;
 b=b/CnvliAqpyzUuYgTrpb9j8npwvB0YB3IHNtLSTUahE4aK22hTpOU+W4
 f8xPBRZZlJlL8nZjNnOOXdh+c6LixR5fo6/UKwoF+ywdO9KIZKWpim/vT
 R4aK/Lm/Ou34JspUfMGXLJBhN7fZRlprzmSEszGtLksku7KkvOak2gX4V
 sUpWmZfFd9OcPt+xMjrqmRi10K3St7NlHSF2tD3DgYiJaPtrGABcGYjwh
 tuhGJjiI4QBxigVvQnf7NrW9NUBh5VZnLb9cOuhdXENIWYGNpU0aM8B12
 BC22BI59mK/NTf+Z7JopMJtabzGh0PhIrP1pdLpp4jLshtYcbY4coAqAx A==;
X-CSE-ConnectionGUID: hd7EnibTTbCgAg6G+AYgFw==
X-CSE-MsgGUID: Oh9TfGZpQkCf/3t+QTk2WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82479758"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82479758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:21:20 -0700
X-CSE-ConnectionGUID: nDZl/ZzqRRmUf+4vzbhSjw==
X-CSE-MsgGUID: fp+OiLPeSymtDkoGF7TUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="245624524"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:21:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm block
 signalling
Date: Wed, 17 Jun 2026 13:51:05 +0530
Message-ID: <20260617082104.610620-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

A circular locking dependency is reported between xe_pm_block_map and
dev->clientlist_mutex:

  &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map --> &dev->clientlist_mutex

The dependency chain is:
1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
   xe_display_pm_suspend() which calls drm_client_dev_suspend()
   acquiring clientlist_mutex. (xe_pm_block_map -> clientlist_mutex)

2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
   prelim_xe_eudebug_file_close() acquires discovery_lock.
   (clientlist_mutex -> discovery_lock)

3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
   (discovery_lock -> vm->lock)

4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
   which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)

Fix this by moving drm_client_dev_suspend() before
xe_pm_block_begin_signalling() in xe_pm_suspend(), and
drm_client_dev_resume() after xe_pm_block_end_signalling() in
xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
edge in the dependency chain.

The drm_client_dev_suspend/resume calls are safe to move because they
only blank/unblank the fbdev console and don't depend on display power
state or any operations within the block signalling scope.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 ---
 drivers/gpu/drm/xe/xe_pm.c              | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 810d93fefcbc..ec65dcbc3fdc 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -304,7 +304,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	 * properly.
 	 */
 	intel_display_power_disable(display);
-	drm_client_dev_suspend(&xe->drm);
 
 	if (intel_display_device_present(display)) {
 		drm_kms_helper_poll_disable(&xe->drm);
@@ -461,8 +460,6 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_opregion_resume(display);
 
-	drm_client_dev_resume(&xe->drm);
-
 	intel_display_power_enable(display);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 99562f691080..d00c620d0926 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -10,6 +10,7 @@
 #include <linux/suspend.h>
 #include <linux/dmi.h>
 
+#include <drm/drm_client_event.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
 
@@ -177,6 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	int err;
 
 	drm_dbg(&xe->drm, "Suspending device\n");
+	drm_client_dev_suspend(&xe->drm);
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
@@ -219,6 +221,7 @@ int xe_pm_suspend(struct xe_device *xe)
 err:
 	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
 	xe_pm_block_end_signalling();
+	drm_client_dev_resume(&xe->drm);
 	return err;
 }
 
@@ -292,10 +295,12 @@ int xe_pm_resume(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Device resumed\n");
 	xe_pm_block_end_signalling();
+	drm_client_dev_resume(&xe->drm);
 	return 0;
 err:
 	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
 	xe_pm_block_end_signalling();
+	drm_client_dev_resume(&xe->drm);
 	return err;
 }
 
-- 
2.52.0

