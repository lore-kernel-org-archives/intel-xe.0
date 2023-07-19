Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672C7EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDA010E42D;
	Wed, 19 Jul 2023 08:39:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B5310E436
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755949; x=1721291949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g+JRJ0I5GyJ8N69lNnjfm33AMy8LBiEfwgEdr+uH1E8=;
 b=H4676cTX3g6g2/v1dEQGac5uBqmdTknOZqTYKvL22bFpvvdjM1Zrps9l
 +YZdvUqZR5LHJIRXfqVsbWZa2zqk9yGOJCkeF15bLP746E/TBmKceGXMW
 BM00A7B/8ZJYEhZA6ZNJIrx64wj8OhXgNe16YyFohfJyeZ7CYV5CdkOah
 0E3VgIBpDyvIG0SagKLq1ytKDOxuQ+bCIMFEiwbzxvV+gGQus5kgG1tNl
 XDB5G2qWyAQYi7auoFdHpUrSyWLYaieTXuETjQsLHKjdt/L8HWU29qdxw
 664mxu+Mc05eEzW5uVqV55CND7FBroSef3MtLbk4QP+dBISBl8WxgkwCx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345999088"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345999088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603376"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603376"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:12 +0100
Message-ID: <20230719083801.182123-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719083801.182123-12-matthew.auld@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 10/10] drm/xe: add lockdep annotation for
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ba2b83925ded..1c57944014e0 100644
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
@@ -458,10 +464,28 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
 
 	XE_WARN_ON(ref == S32_MAX);
+
+	lock_map_release(&xe_device_mem_access_lockdep_map);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
-- 
2.41.0

