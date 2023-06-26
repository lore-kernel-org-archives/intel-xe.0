Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC93EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B786310E1CC;
	Mon, 26 Jun 2023 10:51:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8FF10E1E3
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776681; x=1719312681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6xqJ+a/Ibk/3st/D1r54WyQ3fMfV5LX8ixQbmY0jX/U=;
 b=TcWg3nK2iHOnQ5HQDCt7d9a3wjJwqQS1jhriVU1g+81dCnmEpxde7tjI
 3T0rT7IQzYYuKJkXUaY2SRvtISkUvasIpoDNGznbZQxeQfUkEu0gDNnBc
 RpSCNUYwDEsyordw+YLWA61NnSEJAjP7fL9S2PLCYVDRz0aWTqRU+3ubV
 /xfzVSLlLWQJB1r+cV4kh4ePpPbDCiFvOkHJyXLY3/rt70PClik0mI+ug
 P34yn17wRd5AjmqxUdiLYxveGBK+WUYQR2JlyPpwsqA+a6o4SQyNDgLaG
 8oJIZF2ZzwF20FvAshwS+7CGn0YNIDGho3gem8iHhpTuYa2p8oOheUEX8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361280009"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361280009"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182891"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182891"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:51 +0100
Message-ID: <20230626105037.43780-28-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 13/13] drm/xe: add lockdep annotation for
 xe_device_mem_access_get()
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The atomics here might hide potential issues, so add a dummy lock with
the idea that xe_pm_runtime_resume() is eventually going to be called
when we are holding it. This only needs to happen once and then lockdep
can validate all callers and their locks.

v2: (Thomas Hellström)
 - Prefer static lockdep_map instead of full blown mutex.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1dc552da434f..923a23528da9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -35,6 +35,12 @@
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
 
+#ifdef CONFIG_LOCKDEP
+static struct lockdep_map xe_device_mem_access_lockdep_map = {
+	.name = "xe_device_mem_access_lockdep_map"
+};
+#endif
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_file *xef;
@@ -443,6 +449,22 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	/*
+	 * Since the resume here is synchronous it can be quite easy to deadlock
+	 * if we are not careful. Also in practice it might be quite timing
+	 * sensitive to ever see the 0 -> 1 transition with the callers locks
+	 * held, so deadlocks might exist but are hard for lockdep to ever see.
+	 * With this in mind, help lockdep learn about the potentially scary
+	 * stuff that can happen inside the runtime_resume callback by acquiring
+	 * a dummy lock (it doesn't protect anything and gets compiled out on
+	 * non-debug builds).  Lockdep then only needs to see the
+	 * mem_access.lock -> runtime_resume callback once, and then can
+	 * hopefully validate all the (callers_locks) -> mem_access.lock. For
+	 * example if the (callers_locks) are ever grabbed in the runtime_resume
+	 * callback, lockdep should give us a nice splat.
+	 */
+	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+
 	if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
 		bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
 		int ref;
@@ -455,6 +477,8 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	} else {
 		XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
 	}
+
+	lock_map_release(&xe_device_mem_access_lockdep_map);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
-- 
2.41.0

