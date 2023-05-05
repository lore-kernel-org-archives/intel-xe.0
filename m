Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3722EC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 15:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016C410E629;
	Fri,  5 May 2023 15:39:22 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845F310E629
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683301160; x=1714837160;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gVuNeY0FI+PY6oB4388tsafxDKOExA5lz27nSBUSTXY=;
 b=E/u4aD2jmhZ8FoKKIQKkzFaw6fHka69CiwV24O0X2ogRbyetPC6zfPN8
 93Z3gpmDEvBmY8A3ZvAEgK2HgqOl+Xwl3L3f0y7CTE+GNrAhDqVPcA5JN
 ArZkIXrCUXsm47TjJQo9gBBYQHOWPp1EPLS66CbBDZGNL0Qs+EIWKCO9d
 YvzVEeiZA3qKQwOJBcxZm0g/6NfO2Zdgg1xkAcHAyTHXvdF8vmz6r8lBn
 uyhH1LCY7Ye1AzUVwC9Vp3QrGjOrJ9x1ieQRNa7aT1fBRKiN04YLyf/EM
 yruTMtj7OyrXoovhMT5Hg+01/nj5nL6IGpzjx+v4z1HbD4LBUeBDfCzh5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412467127"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="412467127"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787181679"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="787181679"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.254])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:39:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 16:38:52 +0100
Message-Id: <20230505153854.343944-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] Revert "drm/xe: Use atomic instead of mutex
 for xe_device_mem_access_ongoing"
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

This reverts commit c3712d924f6b5022498f4357009943c326389f9c.

We add a similar version back, once we fix the locking inside
xe_device_mem_access.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 18 ++++++++++--------
 drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  4 +++-
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..01c497bcf9a5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -217,6 +217,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err_put;
 
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	return xe;
 
 err_put:
@@ -405,25 +407,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
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
index 3a11caaf874b..59462933f67a 100644
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
2.40.0

