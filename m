Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D68C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1210E51B;
	Tue, 20 Aug 2024 17:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwgeNVAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A936210E467
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174175; x=1755710175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NdqEKdn6vWwTxUK/HxzrjbNMyOkFOtJab7cuN1KhJs4=;
 b=PwgeNVATwo1IY03547rW5oqqKg0q6zfJSTDA4ZKHC6+McDp13H8/q+0e
 zbwQHBgJpzKc7IeLum8t8R+79BMSzLNPRDlhMXuOrKn8MOAqMnI6mCqhB
 M4Ud47zLAd1zB7mMjnS9fg5LKg5ktoDv6Thh7bH1LvVgruGSjiN+AeFYH
 7Ihip4D6C3zSsIQW2+sh0Hg+ElkyqAunU4I6av3uUz0DXPsAeDLFjrp72
 6yUvgzvNeyJ4cMjNmn1DEip0oY7fU8GG9RcqpPoZFRFRMFHz8gBNk8NGV
 Z+36t3wP0NqNqTSmEgMh7t4eLYfDCZYHFvBUiSG2ZtzhMHWA4Hne1Jqtg g==;
X-CSE-ConnectionGUID: MFVx9QBLT0yIaWp67kB8Jg==
X-CSE-MsgGUID: FgqBu20rTziiahzXHlBK9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33114123"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33114123"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:34 -0700
X-CSE-ConnectionGUID: EPjZZMHfQeq+k2mJFqalPw==
X-CSE-MsgGUID: 1JP7UUobSfCliDVbUm1Uwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60755984"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.143])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:32 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrala@intel.com
Subject: [PATCH v3 3/3] drm/xe/display: handle HPD polling in display runtime
 suspend/resume
Date: Tue, 20 Aug 2024 20:14:08 +0300
Message-Id: <20240820171408.192309-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820171408.192309-1-vinod.govindapillai@intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

In XE, display runtime suspend / resume routines are called only
if d3cold is allowed. This makes the driver unable to detect any
HPDs once the device goes into runtime suspend state in platforms
like LNL. Update the display runtime suspend / resume routines
to include HPD polling regardless of d3cold status.

While xe_display_pm_suspend/resume() performs steps during runtime
suspend/resume that shouldn't happen, like suspending MST and they
are missing other steps like enabling DC9, this patchset is meant
to keep the current behavior wrt. these, leaving the corresponding
updates for a follow-up

v2: have a separate function for display runtime s/r (Rodrigo)

v3: better streamlining of system s/r and runtime s/r calls (Imre)

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c              |  8 +++++---
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b2a0b4b5c45c..3dc55edd390a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -308,6 +308,18 @@ static void xe_display_flush_cleanup_work(struct xe_device *xe)
 	}
 }
 
+/* TODO: System and runtime suspend/resume sequences will be sanitized as a follow-up. */
+void xe_display_pm_runtime_suspend(struct xe_device *xe)
+{
+	if (!xe->info.probe_display)
+		return;
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend(xe, true);
+
+	intel_hpd_poll_enable(xe);
+}
+
 void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	struct intel_display *display = &xe->display;
@@ -355,6 +367,17 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	intel_display_power_suspend_late(xe);
 }
 
+void xe_display_pm_runtime_resume(struct xe_device *xe)
+{
+	if (!xe->info.probe_display)
+		return;
+
+	intel_hpd_poll_disable(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_resume(xe, true);
+}
+
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	if (!xe->info.probe_display)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 000fb5799df5..53d727fd792b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -38,6 +38,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe, bool runtime);
+void xe_display_pm_runtime_suspend(struct xe_device *xe);
+void xe_display_pm_runtime_resume(struct xe_device *xe);
 
 #else
 
@@ -67,6 +69,8 @@ static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
+static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index fcfb49af8c89..c247e1cb8aba 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -366,9 +366,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		xe_bo_runtime_pm_release_mmap_offset(bo);
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
-	if (xe->d3cold.allowed) {
-		xe_display_pm_suspend(xe, true);
+	xe_display_pm_runtime_suspend(xe);
 
+	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
@@ -431,12 +431,14 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
+	xe_display_pm_runtime_resume(xe);
+
 	if (xe->d3cold.allowed) {
-		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
 	}
+
 out:
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

