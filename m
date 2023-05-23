Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC5C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 09:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D8110E41B;
	Tue, 23 May 2023 09:47:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6F10E41B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684835258; x=1716371258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yy4tJkQ+YJ4gk7DDPcAUJExQpOMkyGCdBlRwcZSgxfo=;
 b=Az2HYrJECme//QSXzSI0Y7xsatvyDSlxAHpTmIKJyOwPb1dbsZ49GH4F
 re+SLT5QOFJhS0XahI8ikIDsFQV/61lMD9RmYn1M4VnAQmRytwCOU6xJr
 a7t2lwQ/5yfJL+Sw4rU4DF+HcauvUSAIZzYhWUiLeZ+v35WsrgOheowKs
 mdbZuABzzs0rAHfXwOqm6ofL2pj1FSKG04wvUeq3E6qGkxGm3/8vAB5D3
 /dWKXzJ9pP/2VNITe//SFpzBhMmeaZAkRGjGxlIXWbiBAuIwCjXdpy/fX
 1a1QrHuAQTXH6RwYMR0WhDODF0D8k/vh36Zt4/MGB55wSPCQRUIHWZAJ1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337777433"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="337777433"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="736797267"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="736797267"
Received: from eakeogh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.142])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:47:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 10:47:20 +0100
Message-Id: <20230523094727.162266-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 1/8] Revert "drm/xe: Use atomic instead of
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
 drivers/gpu/drm/xe/xe_device.c       | 19 +++++++++++--------
 drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  4 +++-
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd4a4a6e0b94..ff15da9d96ac 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -224,6 +224,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err_put;
 
+
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	return xe;
 
 err_put:
@@ -412,25 +415,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
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
index 77d1cc6514c4..4d1af6663ab1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -260,8 +260,10 @@ struct xe_device {
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

