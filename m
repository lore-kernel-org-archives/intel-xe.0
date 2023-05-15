Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A4C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 14:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7360E10E20A;
	Mon, 15 May 2023 14:41:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD8E10E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684161672; x=1715697672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5t6zB+7SqrGao27tnnmKVySPphX0yDG5kMhbavnIsA=;
 b=ZBdVIeCC99kztsptK++Y5bnRd/7W3Y7XtZ953zcK+FMLzuJOBdgBLM/B
 +N9y22obaUABfX5HEkmLg9hjbjdmn7vIfJw7rbXhzWNV29w+aEBIcccg+
 1ZjPpQHxU9L5cxpdkzL3LCYPa50y31WMT8P2Qk0tCXnmHxZLOt3kdOAC5
 x+GX/5iyvyvskRz2BVKTaHEk8FdgU3wzat5x8olE6apiZsTHZSZzvyzxX
 8OHHc2bXEO6/LftGZTcDJbG5AhXePXRZO5XGXhBIkxQFRfUcZgpIthCtG
 7CQI7vMVnV6N/B7Fr1aR3JvOZmLglJHQKquggz6bEwT9JmwA4iGhgMdAB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340569365"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="340569365"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 07:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="700974585"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="700974585"
Received: from kaelanhx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.149])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 07:41:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 15 May 2023 15:40:27 +0100
Message-Id: <20230515144027.82857-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515144027.82857-1-matthew.auld@intel.com>
References: <20230515144027.82857-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/6] drm/xe: Use atomic for mem_access.ref
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

xe_guc_ct_fast_path() is called from an irq context, and cannot lock
the mutex used by xe_device_mem_access_ongoing().

Fortunately it is easy to fix if we switch the ref over to an atomic.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 15 ++++++++++-----
 drivers/gpu/drm/xe/xe_device.h       | 19 +++++--------------
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 123343bc33b0..9509565a28d7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -405,6 +405,8 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 
 void xe_device_mem_access_get(struct xe_device *xe)
 {
+	int ref;
+
 	/*
 	 * This looks racy, but should be fine since the pm_callback_task only
 	 * transitions from NULL -> current (and back to NULL again), during the
@@ -424,23 +426,26 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	 * for example just on the 0 -> 1.
 	 */
 	mutex_lock(&xe->mem_access.lock);
-	if (xe->mem_access.ref == 0)
+	if (atomic_read(&xe->mem_access.ref) == 0)
 		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
-	xe->mem_access.ref++;
+	ref = atomic_inc_return(&xe->mem_access.ref);
 	mutex_unlock(&xe->mem_access.lock);
 
-	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
+	XE_WARN_ON(ref == S32_MAX);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
 {
+	int ref;
+
 	if (READ_ONCE(xe->pm_callback_task) == current)
 		return;
 
 	mutex_lock(&xe->mem_access.lock);
-	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
+	ref = atomic_dec_return(&xe->mem_access.ref);
+	if (ref == 0 && xe->mem_access.hold_rpm)
 		xe_pm_runtime_put(xe);
 	mutex_unlock(&xe->mem_access.lock);
 
-	XE_WARN_ON(xe->mem_access.ref < 0);
+	XE_WARN_ON(ref < 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 7a4ba5212d9c..4aab3658e0ae 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -90,26 +90,17 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 void xe_device_mem_access_get(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
-static inline void xe_device_assert_mem_access(struct xe_device *xe)
-{
-	if (READ_ONCE(xe->pm_callback_task) == current)
-		return;
-
-	XE_WARN_ON(!xe->mem_access.ref);
-}
-
 static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
 {
-	bool ret;
-
 	if (READ_ONCE(xe->pm_callback_task) == current)
 		return true;
 
-	mutex_lock(&xe->mem_access.lock);
-	ret = xe->mem_access.ref;
-	mutex_unlock(&xe->mem_access.lock);
+	return atomic_read(&xe->mem_access.ref);
+}
 
-	return ret;
+static inline void xe_device_assert_mem_access(struct xe_device *xe)
+{
+	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
 }
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0f4f00fa4d18..c291fe66b1c1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -258,11 +258,11 @@ struct xe_device {
 	struct {
 		/**
 		 * @lock: Serialize xe_device_mem_access users,
-		 * and protect the below internal state, like @ref.
+		 * and protect the below internal state.
 		 */
 		struct mutex lock;
 		/** @ref: ref count of memory accesses */
-		s32 ref;
+		atomic_t ref;
 		/** @hold_rpm: need to put rpm ref back at the end */
 		bool hold_rpm;
 	} mem_access;
-- 
2.40.1

