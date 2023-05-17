Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC27AC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 15:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FFD10E448;
	Wed, 17 May 2023 15:23:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED7A10E446
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684337020; x=1715873020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7e34mIN4zZgeTMlOQ9eq5IBYDqc8zr2BnrjAg01968=;
 b=Gk/7nw0Jgi5Q0xZLT0rH81QBivGp8laU4HHyYH5zQ0BU1O/p+30DR2BQ
 OxB3qFWXlelSRr/ameCpM4QJ4Z+tFFR5eCaIvnhAIH4zUFOC23VqKUYvS
 C6e+E7+YVkc8c6FGhTmmPuz6UzDqxcyjiXxFh0/SfMYt6T5biJH9ZZSYC
 GswnQmWLTiYfDYESubYYnsDnyxyLAsOO6f5Y7mzf/knmve0Y9AkD7VDE9
 Abe+pSc6JLdiHOxL/FQeoyOqvbf0elVY5ZNtWrfAWqfUpQ43ahaa6sEop
 vONORfkf0YHWwHg/8w6s3ckxTA6JXrshwsfUtE47Vd3DGz5XKM6WLD18Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438132135"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="438132135"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 08:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846129298"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="846129298"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO
 mwauld-desk1.intel.com) ([10.252.15.194])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 08:23:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 16:22:39 +0100
Message-Id: <20230517152244.348171-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517152244.348171-1-matthew.auld@intel.com>
References: <20230517152244.348171-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/7] Revert "drm/xe: Use atomic instead of
 mutex for xe_device_mem_access_ongoing"
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

This reverts commit c3712d924f6b5022498f4357009943c326389f9c.

We add a similar version back, once we fix the locking inside
xe_device_mem_access.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 18 ++++++++++--------
 drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  4 +++-
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f7f6a6a97757..d0297ee432b2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -216,6 +216,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err_put;
 
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	return xe;
 
 err_put:
@@ -404,25 +406,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 void xe_device_mem_access_get(struct xe_device *xe)
 {
 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
-	int ref = atomic_inc_return(&xe->mem_access.ref);
 
-	if (ref == 1)
+	mutex_lock(&xe->mem_access.lock);
+	if (xe->mem_access.ref++ == 0)
 		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
+	mutex_unlock(&xe->mem_access.lock);
 
 	/* The usage counter increased if device was immediately resumed */
 	if (resumed)
 		xe_pm_runtime_put(xe);
 
-	XE_WARN_ON(ref == S32_MAX);
+	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
 {
-	bool hold = xe->mem_access.hold_rpm;
-	int ref = atomic_dec_return(&xe->mem_access.ref);
-
-	if (!ref && hold)
+	mutex_lock(&xe->mem_access.lock);
+	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
 		xe_pm_runtime_put(xe);
+	mutex_unlock(&xe->mem_access.lock);
 
-	XE_WARN_ON(ref < 0);
+	XE_WARN_ON(xe->mem_access.ref < 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index cbae480a2092..9ab7e6134f89 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -90,14 +90,20 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 void xe_device_mem_access_get(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
-static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	return atomic_read(&xe->mem_access.ref);
-}
-
 static inline void xe_device_assert_mem_access(struct xe_device *xe)
 {
-	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
+	XE_WARN_ON(!xe->mem_access.ref);
+}
+
+static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
+{
+	bool ret;
+
+	mutex_lock(&xe->mem_access.lock);
+	ret = xe->mem_access.ref;
+	mutex_unlock(&xe->mem_access.lock);
+
+	return ret;
 }
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cbd18b839236..0b6860156574 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -256,8 +256,10 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
+		/** @lock: protect the ref count */
+		struct mutex lock;
 		/** @ref: ref count of memory accesses */
-		atomic_t ref;
+		s32 ref;
 		/** @hold_rpm: need to put rpm ref back at the end */
 		bool hold_rpm;
 	} mem_access;
-- 
2.40.1

