Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D24C001DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD64C10E6E3;
	Thu, 13 Jul 2023 13:23:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CCA10E6E2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254604; x=1720790604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/7d/KK5VrVLvWVIn09ZZ8VzlkUlX6ve/xKaqQl4JHE=;
 b=aioTRbms6DR6O1qXK/tqoithpoQy6lJplyGPK2oVrbXdmZBnuEScdDTe
 eh7eTffVOPZYDdUuQWckEXAlkDzBxP02IyL4QDPCh4zdUReRJoF9ph/Lw
 oQVzQ1apICmRyP168RoTomsY7r5neMj1svH4fqR5bSaT9BBGdpz+ROCx1
 CQcmv4tAf6k/UzMCfIHo5plQ0qu9LdKJBzL+Oq2uA07prWfDyUymWZkoM
 qqtB/xTTXz82Bg/+IVyL7Ufg+1LGSIAc48THbNZNNwvIRtwFy3W3t/2pM
 rHIflXUqXmE5B0c3khNvb9DZgXLOt5+1DARV32HvqG7OGiVB8H1ph4Wn6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345497994"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="345497994"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787455344"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="787455344"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:22:55 +0100
Message-ID: <20230713132244.459605-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713132244.459605-12-matthew.auld@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v13 10/10] drm/xe: add lockdep annotation for
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

The atomics here might hide potential issues, also rpm core is not
holding any lock when calling our rpm resume callback, so add a dummy lock
with the idea that xe_pm_runtime_resume() is eventually going to be
called when we are holding it. This only needs to happen once and then
lockdep can validate all callers and their locks.

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
index 70f89869b8a6..7eb5d81b330c 100644
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
@@ -458,9 +464,27 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
+	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
+	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
+	 * For example if the (callers_locks) are ever grabbed in the
+	 * runtime_resume callback, lockdep should give us a nice splat.
+	 */
+	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+
 	xe_pm_runtime_get(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 	XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
+
+	lock_map_release(&xe_device_mem_access_lockdep_map);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
-- 
2.41.0

