Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D9C77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5B10E309;
	Wed,  3 May 2023 15:28:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F20010E30A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683127696; x=1714663696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1bN79R4O6szawNv7SiVu6Cq8U2ybADoqVR42zFdauiU=;
 b=XRYAkpif7zcrBR6Kcn2MTSq4Du+zg8PmGM/8tGE05cYs+70zn/cgaHCe
 qMwtidBqSG4EZW40sqOG7OTUIkPa6tKGHKaHFB/SiJ9VrLj6vZllrmQR+
 RIy5OCnfpcvBr6D1c1pTTJ61YjWJqihrJ4OiAWoojORPBYm8nymvX3Ak6
 UQKLoY8QKYZklnJ9j7dLuwwcfyS6P/APb/98PWNtB05a5dCvTlOuOE4x7
 blzK6qt8cYXyNvtGolTqBrbAf3TyWXCECnGml5FWNOVBjo2FnbelndnXg
 qmj/Vuvu3ZagFi6fSiVL7aCk6RDtt0cvrBK5OAsIiz0oAE2u2bmzSu2+D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="347503205"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="347503205"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="870973659"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="870973659"
Received: from dmadorsx-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:28:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:28:02 +0100
Message-Id: <20230503152802.49011-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix xe_device_mem_access_get() race
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

It looks like there is at least one race here, given that the
pm_runtime_suspended() check looks to return false if we are in the
process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED). We
later also do xe_pm_runtime_get_if_active(), but since the device is
suspending or has now suspended, this doesn't do anything either.
Following from this we can potentially return from
xe_device_mem_access_get() with the device suspended or about to be,
leading to broken behaviour.

Attempt to fix this by always grabbing the runtime ref when our internal
ref transitions from 0 -> 1, and then wrap the whole thing with a lock
to ensure callers are serialized.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 22 ++++++++++++----------
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_pm.c           |  9 ++-------
 drivers/gpu/drm/xe/xe_pm.h           |  2 +-
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..5f6554bb34d2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -209,6 +209,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err_put;
@@ -404,26 +406,26 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 
 void xe_device_mem_access_get(struct xe_device *xe)
 {
-	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
-	int ref = atomic_inc_return(&xe->mem_access.ref);
+	int ref;
 
+	mutex_lock(&xe->mem_access.lock);
+	ref = atomic_inc_return(&xe->mem_access.ref);
 	if (ref == 1)
-		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
-
-	/* The usage counter increased if device was immediately resumed */
-	if (resumed)
-		xe_pm_runtime_put(xe);
+		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
+	mutex_unlock(&xe->mem_access.lock);
 
 	XE_WARN_ON(ref == S32_MAX);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
 {
-	bool hold = xe->mem_access.hold_rpm;
-	int ref = atomic_dec_return(&xe->mem_access.ref);
+	int ref;
 
-	if (!ref && hold)
+	mutex_lock(&xe->mem_access.lock);
+	ref = atomic_dec_return(&xe->mem_access.ref);
+	if (!ref && xe->mem_access.hold_rpm)
 		xe_pm_runtime_put(xe);
+	mutex_unlock(&xe->mem_access.lock);
 
 	XE_WARN_ON(ref < 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1cb404e48aaa..e8d320f93852 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -257,6 +257,11 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
+		/**
+		 * @lock: Serialize xe_device_mem_access users, and protect the
+		 * below internal state.
+		 */
+		struct mutex lock;
 		/** @ref: ref count of memory accesses */
 		atomic_t ref;
 		/** @hold_rpm: need to put rpm ref back at the end */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..b2ffa001e6f7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -210,14 +210,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
 	return pm_runtime_put_autosuspend(xe->drm.dev);
 }
 
-/* Return true if resume operation happened and usage count was increased */
-bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 {
-	/* In case we are suspended we need to immediately wake up */
-	if (pm_runtime_suspended(xe->drm.dev))
-		return !pm_runtime_resume_and_get(xe->drm.dev);
-
-	return false;
+	return !pm_runtime_resume_and_get(xe->drm.dev);
 }
 
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6a885585f653..1b4c15b5e71a 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -19,7 +19,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
-bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 
 #endif
-- 
2.40.0

