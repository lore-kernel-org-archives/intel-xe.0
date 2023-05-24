Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DE5C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE0410E292;
	Wed, 24 May 2023 17:57:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D5F10E5B0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951060; x=1716487060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXGQuEKHJANjfjb5HUwQ0moHWUdK2qyiP6SVhfVxZZs=;
 b=ccA56W/YOT3ybbCGju2uhAODlW3voOitkUNH/3OEewUd2e3gm/wNtgvs
 RWGkoZxFldQhvldMZ7TZBZ1kuEvaCWBYABuXY2KVzrpTV22Kswx3Kez/I
 WAPgnQuvnZX5Rr3hdRc3EjWYYlOL8/UI8/aejOhiutvM3PFqIkCWkEsbx
 dYKi2ldqE7KSxGqevh4mwtSFdpPXJkcvuOy8EiISExlRQaVP5eYGOSWhx
 LDsoZnha09Su6mrf8fb4AElE6HIgLsmutHd20g8yvf5bVH7y9oXB57OSL
 3+hesYZzBB/GYklYTTyWy9s3JJBbFikaD8PBjYru8PAbGF012BQccaqNp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333266947"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333266947"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698629061"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698629061"
Received: from cannonro-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:57:00 +0100
Message-Id: <20230524175701.320653-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
References: <20230524175701.320653-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 8/9] drm/xe: add lockdep annotation for
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
when we are holding it. This only need to happen once and then lockdep
can validate all callers and their locks.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 695419a64ec0..2e246d7c2ba2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -224,6 +224,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err_put;
 
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	return xe;
 
 err_put:
@@ -436,6 +438,22 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
+	lock_map_acquire(&xe->mem_access.lock.dep_map);
+
 	if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
 		bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
 		int ref;
@@ -448,6 +466,8 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	} else {
 		XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
 	}
+
+	lock_map_release(&xe->mem_access.lock.dep_map);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9e79857c267c..fa33b3093dba 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -260,6 +260,14 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
+		/**
+		 * @lock: Dummy lock used as lockdep aid to hopefully ensure
+		 * that lockep can more easily see any potential deadlocks when
+		 * calling xe_device_mem_access_get().
+		 *
+		 * Doesn't protect anything.
+		 */
+		struct mutex lock;
 		/** @ref: ref count of memory accesses */
 		atomic_t ref;
 		/** @hold_rpm: need to put rpm ref back at the end */
-- 
2.40.1

