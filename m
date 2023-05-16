Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B711C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 17:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F0010E353;
	Tue, 16 May 2023 17:33:28 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5892810E353
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684258407; x=1715794407;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HGVp0/jfppjNpj6v3t11anY+sf+8WWzlfKNRd0sGEms=;
 b=KHsIKERlkT0fbOsp/nzK0A5D52c3O7l2wT6NXruqIY+DYMAUGHlV/+5m
 DoVCm47X/Nwg9nPtQ/bQ5oQ3mvdnSJmgN+zlHq56dt8FB6nd7rY9CZQvU
 /PD1J0FottZcESZqua9gwuqbnkHW749BqcR1PFEE7RPnH0T7lVzd4XyVN
 jeF3jzg1h6hKhIEXuGjq7KQtkTUaIs8Pf4ioaVcoj7F16zhnZ/psGJvPX
 /c0WvC7ylbOVrHm4zV1NEiHx5UKBlrc14lws1TmlJysqW2hozAmLmFBgq
 ZjrVLXxB7N47y2ZosYdwkJU0MlulTM0EtluBr0SGQP2+pNhSPICTB4D1O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331904078"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331904078"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="791146486"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791146486"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:33:26 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 18:32:57 +0100
Message-Id: <20230516173258.181118-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516173258.181118-1-matthew.auld@intel.com>
References: <20230516173258.181118-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 6/7] drm/xe: Use atomic for mem_access.ref
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
 drivers/gpu/drm/xe/xe_device.c       | 34 ++++++++++++----------------
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 55f974b1ee78..01ef88bf099d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -403,30 +403,23 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
 }
 
-void xe_device_assert_mem_access(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	XE_WARN_ON(!xe->mem_access.ref);
-}
-
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
 {
-	bool ret;
-
 	if (xe_pm_read_callback_task(xe) == current)
 		return true;
 
-	mutex_lock(&xe->mem_access.lock);
-	ret = xe->mem_access.ref;
-	mutex_unlock(&xe->mem_access.lock);
+	return atomic_read(&xe->mem_access.ref);
+}
 
-	return ret;
+void xe_device_assert_mem_access(struct xe_device *xe)
+{
+	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
 }
 
 void xe_device_mem_access_get(struct xe_device *xe)
 {
+	int ref;
+
 	/*
 	 * This looks racy, but should be fine since the pm_callback_task only
 	 * transitions from NULL -> current (and back to NULL again), during the
@@ -446,23 +439,26 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
 	if (xe_pm_read_callback_task(xe) == current)
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

