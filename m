Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC689C7EE2D
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 17:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A974D10E214;
	Mon, 22 May 2023 17:22:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E219B10E1C9
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684776156; x=1716312156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xeRBgqvWaMTUwcKY97FleVExQ1VKiiBfQBIpMoLJn38=;
 b=VAaJJy8U6u6s2PrzfoXIEWQceRE3++8JDyPSANaz8Pn8O8KXau3T9k9b
 9nah6IkKiNTHHZvCsefgIoJB2BEH2+LbKRvItsvXVhxEWQkTCsUykXD12
 MY8fcpNC/UYzGyQNSt4oSoWs3oI/pSQOllHwJksw10NHFxeFb506NbrpA
 ZPaeEBVeE2urTwZDboqEWHXjW1FahfHIPpIH3osxr4R//CEdVegvUmRsK
 B+TEePNNMVwTujoYVV7ngO6euAP33q5wGyL3EghY5LpguAPy9jPFu5gs1
 iySji+ewdVA2ZgMHuFFPbm2mY5/IymhxLdEINQPSFVm8d974xF61L5PA+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="342439601"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="342439601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 10:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="793409314"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="793409314"
Received: from amigon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.128.230])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 10:22:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 18:22:11 +0100
Message-Id: <20230522172211.90678-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522172211.90678-1-matthew.auld@intel.com>
References: <20230522172211.90678-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 7/7] drm/xe: Use atomic for mem_access.ref
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
 drivers/gpu/drm/xe/xe_device.c       | 34 ++++++++++++----------------
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++---
 2 files changed, 18 insertions(+), 22 deletions(-)

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
index b5a56e112c0a..f1515aff8437 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -261,9 +261,9 @@ struct xe_device {
 	 */
 	struct {
 		/**
-		 * @lock: Protects @ref and serializes multiple callers.
+		 * @lock: Serializes multiple callers.
 		 *
-		 * Also used as lockdep aid to hopefully ensure that it sees
+		 * But mainly used as lockdep aid to hopefully ensure that it sees
 		 * that the runtime_pm callbacks can be called while holding
 		 * @lock, and therefore any locks that the caller is holding
 		 * also have a clear dependency on the @lock and any locks the
@@ -274,7 +274,7 @@ struct xe_device {
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

