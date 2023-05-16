Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF51EC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 10:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0FC10E21E;
	Tue, 16 May 2023 10:54:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F63710E21E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684234471; x=1715770471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fZGmRCC03wRjOVrwhl9o8Ld3ed3LSSAUFFVb7+R62zw=;
 b=Ed8NfngrAVPqYv+aXvwhISVHAemoVGqask/1vLIFjg8jBhe8akvRKmur
 HLFG4cKZxZAOSeDMETf4FUgm1QPgeAls/1VThR5KhrJzVav3r3X111oJb
 YkS2ZgOTpQofG0VHlY9ADSNTc+/HLLta9nfv94sBSSHfR8tmAIOZPFS7q
 Prycbfga0gT+hMUUtNiWe9Dxcd+bsnBMF5D/ozCS4sCSmqqtGsYykz8Zx
 qB5BC8yaA7gpj9jnkDMWX7Dwgni4IGQGOPAxBJn8J5E24hKYub+SwTShs
 0l9/mp/AdnOYxFxpxQywXENYAkwp7Wfky3wZUOw3zZ3CfqZflfKtu6JHb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331064947"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331064947"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="704354456"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="704354456"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:54:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 11:53:52 +0100
Message-Id: <20230516105357.148846-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/6] Revert "drm/xe: Use atomic instead of
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
index 6490a04614ce..d91193c41d2e 100644
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

