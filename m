Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF87C77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 15:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6790310E62A;
	Fri,  5 May 2023 15:39:23 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332D310E629
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683301161; x=1714837161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHpGqOnWiOjFsWMXOolVNr+UcD9IsbZ7vKsXKitTZeU=;
 b=Pb9csP0BTRxfE/v1RSsrkNm4CBHeW0SetWgXmPyA0un8ub1goZxOZ7do
 lkg96CFCSY9HheOOZ/Us6Swds29/mc93y1te6A3ZfF113sG5DN5GBdngg
 ioGXAi5rTpih/YemkJWAEn4Ll2k02iWX+788ZlsXhC5+t55OYdS9AUhaa
 aMgU3RQlDQGLkjJFcIaSDsm1J4bWG0OKaO9MHe6o92l5lTWxDQXGGgcxA
 I4FBf0qsbEfBDNK9YiWE0S5CyC0s6YwZvqCs/17P0MGIqtO5Uw2wOY37l
 o7XFfyKYMYAdYCiEczDCEI9PWsRDISO56/M5EGgx0pvdqwUfdLE+e3196 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412467131"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="412467131"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787181688"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="787181688"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.254])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:39:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 16:38:53 +0100
Message-Id: <20230505153854.343944-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505153854.343944-1-matthew.auld@intel.com>
References: <20230505153854.343944-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: fix xe_device_mem_access_get() race
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
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 11 +++--------
 drivers/gpu/drm/xe/xe_device_types.h |  5 ++++-
 drivers/gpu/drm/xe/xe_pm.c           |  9 ++-------
 drivers/gpu/drm/xe/xe_pm.h           |  2 +-
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01c497bcf9a5..0a18b41a0e1a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -406,17 +406,12 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 
 void xe_device_mem_access_get(struct xe_device *xe)
 {
-	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
-
 	mutex_lock(&xe->mem_access.lock);
-	if (xe->mem_access.ref++ == 0)
-		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
+	if (xe->mem_access.ref == 0)
+		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
+	xe->mem_access.ref++;
 	mutex_unlock(&xe->mem_access.lock);
 
-	/* The usage counter increased if device was immediately resumed */
-	if (resumed)
-		xe_pm_runtime_put(xe);
-
 	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 59462933f67a..9e37189d5745 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -256,7 +256,10 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
-		/** @lock: protect the ref count */
+		/**
+		 * @lock: Serialize xe_device_mem_access users,
+		 * and protect the below internal state, like @ref.
+		 */
 		struct mutex lock;
 		/** @ref: ref count of memory accesses */
 		s32 ref;
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

