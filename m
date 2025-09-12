Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A47CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD7010EBEB;
	Fri, 12 Sep 2025 09:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceyMDIdJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0149B10EBEB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669811; x=1789205811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cfvUSCcxP5XQx+xGZGVazEJVAOxLcMNE0k52yUk+RtQ=;
 b=ceyMDIdJIrkHcWrGubKQOic9k5Wn7CWeyda0T+TXj6YTyktCQTt7aaYZ
 NIs7M2cQcqL33jkk120ccV6OVxejcL/b45wSLrzTya3bTvW4Qhm72SgbJ
 R+v7b8yf85B6JPEitn+pRK7RzF9jMx8OlEEugb6Rnka3tna7WFeCtbB6s
 GkxynCKC/EIewfTfshulB8wTQ42m+OZlENn8xorurntsyesy49y7v8l8y
 bZAJ1lS0VKaVK8iMvOKCg62hxLW25BicDIXg7zZlFC4gYhs2iWG84VsX+
 I6HVFmzPqiXJKFFbh8CfQsgm8Qlro9uwWm1tcYDz1/LfrrB+WyyqywIQK A==;
X-CSE-ConnectionGUID: uYDiSp+1SKiNnmFFNz6UQw==
X-CSE-MsgGUID: +01fWTh5QUKN3tSpP50WPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159856"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159856"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:50 -0700
X-CSE-ConnectionGUID: pkwJJZ7QTrWz5fcaDkZdiA==
X-CSE-MsgGUID: 6o48fdqEQrW7gzca6VdOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311737"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:48 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 9/9] Fix runtime PM handling of Xe work period worker
Date: Fri, 12 Sep 2025 09:03:52 +0000
Message-ID: <20250912090354.2619418-10-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The autosuspend delay for the xe device is set to 1000 msecs. This
means that the RPM framework would wait for 1000 msecs before initiating
the runtime suspend. Since the Xe work period kworker runs approximately
every 500 msecs, taking a full runtime PM reference from our kworker
would cancel any pending suspend requests and would resume the device
synchronously from within our kworker. In other words the opportunistic
runtime suspend would never come to pass with our kworker running every
500 msecs.

To address this issue, we only take a runtime PM reference in our work
period kworker, if the device is already awake. Otherwise we mark the
kworker as suspended and skip the rescheduling of our kworker.

In the runtime resume callback for our xe device, we check which of the
xe users are in a suspended state and reschedule the work for these xe
users.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c   |  4 ++++
 drivers/gpu/drm/xe/xe_user.c | 28 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_user.h |  7 +++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5e8126ca8e27..0e4dbf9880e4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -25,6 +25,7 @@
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
+#include "xe_user.h"
 #include "xe_wa.h"
 
 /**
@@ -558,6 +559,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD))
+		xe_users_runtime_resume(xe);
+
 	if (IS_SRIOV_VF(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
index 50fb43d03b7b..3fa3a590ca9e 100644
--- a/drivers/gpu/drm/xe/xe_user.c
+++ b/drivers/gpu/drm/xe/xe_user.c
@@ -60,7 +60,12 @@ static void xe_work_period_worker(struct work_struct *work)
 	last_active_duration = user->active_duration_ns;
 	last_timestamp = user->last_timestamp_ns;
 
-	xe_pm_runtime_get(xe);
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		WRITE_ONCE(user->suspended, true);
+		xe_user_put(user);
+		mutex_unlock(&user->lock);
+		return;
+	}
 
 	list_for_each_entry(xef, &user->filelist, user_link) {
 
@@ -118,6 +123,7 @@ struct xe_user *xe_user_alloc(void)
 	mutex_init(&user->lock);
 	INIT_LIST_HEAD(&user->filelist);
 	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
+	WRITE_ONCE(user->suspended, false);
 	return user;
 }
 
@@ -160,3 +166,23 @@ struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
 
 	return NULL;
 }
+
+void xe_users_runtime_resume(struct xe_device* xe)
+{
+	struct xe_user *user = NULL;
+	unsigned long i = 0;
+
+	mutex_lock(&xe->work_period.lock);
+	xa_for_each(&xe->work_period.users, i, user) {
+		if (READ_ONCE(user->suspended) == true) {
+			xe_user_get(user);
+
+			if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
+				xe_user_put(user);
+
+			WRITE_ONCE(user->suspended, false);
+		}
+	}
+	mutex_unlock(&xe->work_period.lock);
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index 7c30bf470aa7..cd6cf3e15329 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -49,6 +49,11 @@ struct xe_user {
 	 */
 	struct delayed_work delay_work;
 
+	/**
+	 * @suspended: is the work period suspended for this user
+	 */
+	bool suspended;
+
 	/**
 	 * @id: index of this user into the xe device users array
 	 */
@@ -110,5 +115,7 @@ static inline void xe_user_put(struct xe_user *user)
 	kref_put(&user->refcount, __xe_user_free);
 }
 
+void xe_users_runtime_resume(struct xe_device* xe);
+
 #endif // _XE_USER_H_
 
-- 
2.49.0

