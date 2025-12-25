Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD0E784AC
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E26B113F7D;
	Thu, 25 Dec 2025 01:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5JQk43O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797B4113F70
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625463; x=1798161463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4x3G0EcefWyoHe2sD9sOm1u/vKSwmw6R2fnYtemvsis=;
 b=S5JQk43OmsopAnO9o27L7vRYn7qsmyS5e3ng5jA7jHxYwANmO9JUswEL
 lFFleqDmR4rWYS5GWWXg754Va3+AAv+nr9XzlwIa1tqm+wAkNPPNiM7mJ
 bYtzgXFIJuTnLaq5UnEH1wRmyF3rz8VYBXhSRxX04DILAferSI/OKJcF5
 dhYPzRkoN2AHrClh648SjmkA7gxG3qk1jD1DTftMv8p6uKn/RJUEWvV90
 wXQePAoulqzSvCnw5vCaSAJwIjI1kqOjsgXulZG9821hbuAM0fw4bAxDo
 TiwYyiSZc9YcwfGB/zdElNtId+aqZRYA9/3NtNb8ul4DPYXlBZpUxHsxB Q==;
X-CSE-ConnectionGUID: gxfHLRdWSa+BdaGhN5iezA==
X-CSE-MsgGUID: ji9XjYoIQ4q2FH/1OOhVuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866366"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:42 -0800
X-CSE-ConnectionGUID: GkNLC/fURMy5dLPqyesBLQ==
X-CSE-MsgGUID: m7ISB2qJTSS+0FkXC2bj7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629152"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 12/13] drm/xe: Add CONFIG_DRM_XE_DEADLINE_WINDOW
Date: Wed, 24 Dec 2025 17:17:33 -0800
Message-Id: <20251225011734.341683-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Configures the deadline window. If a fence is not signaled within this
window before the set deadline, the deadline boost starts. The default
is 3 ms, but this allows OEMs to tune the deadline implementation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile   |  6 ++++++
 drivers/gpu/drm/xe/xe_deadline_mgr.c | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 7530df998148..b17ca4c67b8a 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -53,3 +53,9 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	  to apply to applicable user. For elevated user, all above MIN
 	  and MAX values will apply when this configuration is enable to
 	  apply limitation. By default limitation is applied.
+config DRM_XE_DEADLINE_WINDOW
+	int "Default deadline window (ms)"
+	default 3 # milliseconds
+	help
+	  Configures the deadline window. If a fence is not signaled within this
+	  window before set deadline, the deadline boost starts.
diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.c b/drivers/gpu/drm/xe/xe_deadline_mgr.c
index 5159ce35fdde..80a1bb72ea56 100644
--- a/drivers/gpu/drm/xe/xe_deadline_mgr.c
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -11,6 +11,12 @@
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
 
+#ifdef CONFIG_DRM_XE_DEADLINE_WINDOW
+#define XE_DEADLINE_WINDOW	CONFIG_DRM_XE_DEADLINE_WINDOW
+#else
+#define XE_DEADLINE_WINDOW	3
+#endif
+
 static void __xe_deadline_mgr_enter_deadline(struct xe_deadline_mgr *mgr)
 {
 	lockdep_assert_held(&mgr->lock);
@@ -96,8 +102,8 @@ static void __xe_deadline_mgr_update_deadline(struct xe_deadline_mgr *mgr)
 		hrtimer_cancel(&mgr->timer);
 
 		if (mgr->deadline != XE_DEADLINE_NONE) {
-			ktime_t deadline = ktime_sub(mgr->deadline,
-						     ms_to_ktime(3));
+			ktime_t sub = ms_to_ktime(XE_DEADLINE_WINDOW);
+			ktime_t deadline = ktime_sub(mgr->deadline, sub);
 			ktime_t now = ktime_get();
 
 			if (ktime_after(now, deadline)) {
-- 
2.34.1

