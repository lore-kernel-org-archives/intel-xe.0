Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC6CC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179A10E411;
	Mon,  8 Jul 2024 20:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAF91I9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C34C10E3FC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720470070; x=1752006070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BoH6HC6q/EW7Vc4//iqKPOuhAngqb9hM+CELlC68qQo=;
 b=SAF91I9Nkhsqhqj/7yMafIzqX9QD2NDBawLJ0SqAiuU3ibV3E75oUIg5
 wD8FOOyP4TWcGMQldoOZoVm2HpCU10qndWzrImbySfEB4FTzJsDYCLTKT
 aZIY/vr1cVV3EmLnB0OyV7h30ctpga3juL2NMb0UqEbXbQarMZ7W0whGd
 QzwsprDxcA4QPrzka7zBkFdd/UalWDecL13+xqxaSJdzgPxA31r8ucsRV
 m5iDUCFEq0QSL8rOsJ1hCWqPqCswoSQQ+mapZDf6/njMYM5YFk+S2Ai7s
 H5IIfxt9226FyA+lpm8UWWDN2oFDY7iKHkkoh289KiI8rGr1Xl+eFRh1O g==;
X-CSE-ConnectionGUID: mBcufdFBSm+Iy2NOKDkguA==
X-CSE-MsgGUID: Gs0ihNXESde3BtAEm/RZSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43114139"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="43114139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:07 -0700
X-CSE-ConnectionGUID: aQAI6rZvQKmmIBiIuVzuoQ==
X-CSE-MsgGUID: 5Te4qH9ESNK7j5Msu3sXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47494977"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH 1/5] drm/xe: Move part of xe_file cleanup to a helper
Date: Mon,  8 Jul 2024 13:20:59 -0700
Message-Id: <20240708202103.3347869-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

In order to make xe_file ref counted, move destruction of xe_file
members to a helper.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 36 +++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..babb697652d5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -90,24 +90,12 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static void xe_file_close(struct drm_device *dev, struct drm_file *file)
+static void xe_file_destroy(struct xe_file *xef)
 {
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_file *xef = file->driver_priv;
+	struct xe_device *xe = xef->xe;
 	struct xe_vm *vm;
-	struct xe_exec_queue *q;
 	unsigned long idx;
 
-	/*
-	 * No need for exec_queue.lock here as there is no contention for it
-	 * when FD is closing as IOCTLs presumably can't be modifying the
-	 * xarray. Taking exec_queue.lock here causes undue dependency on
-	 * vm->lock taken during xe_exec_queue_kill().
-	 */
-	xa_for_each(&xef->exec_queue.xa, idx, q) {
-		xe_exec_queue_kill(q);
-		xe_exec_queue_put(q);
-	}
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	mutex_lock(&xef->vm.lock);
@@ -125,6 +113,26 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	kfree(xef);
 }
 
+static void xe_file_close(struct drm_device *dev, struct drm_file *file)
+{
+	struct xe_file *xef = file->driver_priv;
+	struct xe_exec_queue *q;
+	unsigned long idx;
+
+	/*
+	 * No need for exec_queue.lock here as there is no contention for it
+	 * when FD is closing as IOCTLs presumably can't be modifying the
+	 * xarray. Taking exec_queue.lock here causes undue dependency on
+	 * vm->lock taken during xe_exec_queue_kill().
+	 */
+	xa_for_each(&xef->exec_queue.xa, idx, q) {
+		xe_exec_queue_kill(q);
+		xe_exec_queue_put(q);
+	}
+
+	xe_file_destroy(xef);
+}
+
 static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_GEM_CREATE, xe_gem_create_ioctl, DRM_RENDER_ALLOW),
-- 
2.38.1

