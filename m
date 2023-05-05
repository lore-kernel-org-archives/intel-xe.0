Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5A6C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 15:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544CD10E62B;
	Fri,  5 May 2023 15:39:25 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A5A10E62A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683301162; x=1714837162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1KELtoKbJ1ft1XvJFhyv3RnP7INnSgFlwF9/BC/fe6Q=;
 b=G2ak5g4ve3/AY6dhSQKHblpVFHf4lTYQH7UzzFoWa4Jbfe2/r6ADg00N
 sjJJL5DJI/drXQfisprkL6xB7bxoiw+u9+wD2zmOtNqetU3Ws2e8D1jNR
 lk6Zoc/dN3k4SHcpNe/+p0rtVaZBkntsS3mbzKmSlSZu00mzDrLT67Dk5
 J9Q+fheOGubW+a1BiB2wd4Aj8FUmi6byxit3kFpDrTuXZJsJ2/LedNVlG
 fileEhsjhH0XxaorxHqIo6tYGRG/thMlOCVrbXE5K2oYOaUYjrq2P3w9w
 YY6WQq6G8iIGh3GhJCBV1e8cEnS5mwDDPJOOLDHjoTVKoc7nikAhuhmK9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412467139"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="412467139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787181693"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="787181693"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.254])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:39:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 16:38:54 +0100
Message-Id: <20230505153854.343944-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505153854.343944-1-matthew.auld@intel.com>
References: <20230505153854.343944-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Use atomic for mem_access.ref
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
---
 drivers/gpu/drm/xe/xe_device.c       | 15 ++++++++++-----
 drivers/gpu/drm/xe/xe_device.h       | 16 +++++-----------
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0a18b41a0e1a..0b5409faa81c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -406,21 +406,26 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 
 void xe_device_mem_access_get(struct xe_device *xe)
 {
+	int ref;
+
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
index 9ab7e6134f89..cbae480a2092 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 void xe_device_mem_access_get(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
-static inline void xe_device_assert_mem_access(struct xe_device *xe)
-{
-	XE_WARN_ON(!xe->mem_access.ref);
-}
-
 static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
 {
-	bool ret;
+	return atomic_read(&xe->mem_access.ref);
+}
 
-	mutex_lock(&xe->mem_access.lock);
-	ret = xe->mem_access.ref;
-	mutex_unlock(&xe->mem_access.lock);
-
-	return ret;
+static inline void xe_device_assert_mem_access(struct xe_device *xe)
+{
+	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
 }
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9e37189d5745..e4b5c0993ae8 100644
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
2.40.0

