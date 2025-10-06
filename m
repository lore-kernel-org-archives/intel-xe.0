Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B3CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D518A10E0D1;
	Mon,  6 Oct 2025 14:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TS8ayaCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0511B10E418
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762620; x=1791298620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vSSAjd0plBET8AiHubApJZYGmmWvV5yUC1Z5iqwYhz8=;
 b=TS8ayaCh+gMwpLlZ17EeKIAELS35B4HRryFbsM5gMOooclRLypenTspF
 4S1KMDhZozVP0eOo+PKFDjvnfHioUAF1ZlvcMPX9zswsZ17gFokxZnTTB
 6njlFKAgMYH2DOUVnZVDWXNlgsLvNQY0GdptWlmBw11g7pjT7bvUmAT+g
 db4HyHcLcV4G5Q8GYxnamB1exjb6tngzbG8iIWSvfgMpKKEBcd4q06Lmu
 F0xKw3yGcDWKNhbsYJigbrwtI6rwrezy7ESitmtJ37+JGP7JaczwtIzBw
 fx/46Ida48PTKGRqCnfDGnsEA7YKZLB+y7D0rN5vwIa1DkG1Yoj+KEaS3 g==;
X-CSE-ConnectionGUID: s2bXjGP1STKHYABZpNxc2Q==
X-CSE-MsgGUID: sPB4z87PQqa9aNNNWVvKkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143182"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:57:00 -0700
X-CSE-ConnectionGUID: B63/4vVJRge2EkDQMPl4CQ==
X-CSE-MsgGUID: wNnPon09R3Oj2Y0peWzZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507669"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:56:57 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 7/8] drm/xe: Handle xe_work_period destruction
Date: Mon,  6 Oct 2025 14:20:28 +0000
Message-ID: <20251006142034.674435-8-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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

This patch adds the xe_work_period destruction procedure.
We iterate over all entries in the xe::work_period::users
xarray and cancel any pending delayed work. Then destroy
the xarray itself.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_user.c   | 10 +++++++---
 drivers/gpu/drm/xe/xe_user.h   |  6 ++++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 61ba76144721..1436a10244c5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -434,6 +434,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
+	xe_user_fini(xe);
+
 	ttm_device_fini(&xe->ttm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
index fb54d2659642..90664c36e221 100644
--- a/drivers/gpu/drm/xe/xe_user.c
+++ b/drivers/gpu/drm/xe/xe_user.c
@@ -250,6 +250,12 @@ int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
 	return 0;
 }
 
+void xe_user_fini(struct xe_device *xe)
+{
+	xe_user_cancel_workers(xe);
+	xa_destroy(&xe->work_period.users);
+}
+
 void xe_user_cancel_workers(struct xe_device *xe)
 {
 	struct xe_user *user = NULL;
@@ -257,10 +263,8 @@ void xe_user_cancel_workers(struct xe_device *xe)
 
 	mutex_lock(&xe->work_period.lock);
 	xa_for_each(&xe->work_period.users, i, user) {
-		if (user && xe_user_get_unless_zero(user)) {
-			cancel_delayed_work_sync(&user->delay_work);
+		if (cancel_delayed_work_sync(&user->delay_work))
 			xe_user_put(user);
-		}
 	}
 	mutex_unlock(&xe->work_period.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index 0d184464687c..d7ac58cb3db8 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -72,6 +72,8 @@ struct xe_user {
 
 int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
 
+void xe_user_fini(struct xe_device *xe);
+
 void xe_user_cancel_workers(struct xe_device *xe);
 
 void xe_user_resume_workers(struct xe_device *xe);
@@ -86,6 +88,10 @@ int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
 	return 0;
 }
 
+static inline void xe_user_fini(struct xe_device *xe)
+{
+}
+
 static inline void __xe_user_free(struct kref *kref)
 {
 }
-- 
2.49.0

