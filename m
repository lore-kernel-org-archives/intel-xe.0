Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0A0CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975FD10E6D7;
	Mon, 12 Oct 2026 23:29:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7A10E60E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791847762; x=1823383762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpARh8i1/PHkrMCMGe5dOgGgZPydbAGialZy9aX6C3Y=;
 b=HHU5f/DJO497P0I5TDsJzwLG77EAMkjC12zN6ETivnaLfm+6I2D+Rg28
 gllxgtb9KaArXPt0eG1BMgK6Dsr5Jc2sIi5tK4ZLe+SWOASn8ee32bFcP
 sRuH3w7WihL9wlWYr492x0R0axNRvACzMOnwi+cK3by/Rox500xjElev/
 MR+/JeIcAmYjlwqhv8G42McWTn80pQFP6OdhuMvqnYcVpsHn6H4EBmezr
 946GlFXwqaeXJ/pGuRHIYEcSRNuhWHQHjTroMgLb3HQCSsMkFYojpTeHK
 WDUwOa65v/fdrtduS6g4isO4F7QkYxc2LicqtLkxvM/k+91N/BWso8q2s w==;
X-CSE-ConnectionGUID: VlKJ4YmOTl6oTylYcQ6uhA==
X-CSE-MsgGUID: G00/+0bqRumwBBiXli0zpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="450712"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="450712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:16 -0700
X-CSE-ConnectionGUID: 6GMypIzDQk6BRkkemUAIPA==
X-CSE-MsgGUID: jRctX4eESY2RNIGjgoDxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1337842"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, aravind.iddamsetty@intel.com,
 mallesh.koujalagi@intel.com, alan.previn.teres.alexis@intel.com,
 julia.filipchuk@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v7 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
Date: Mon, 12 Oct 2026 16:29:11 -0700
Message-ID: <20261012232907.83649-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
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

Define ct_dead_capture for non-debug as well to simplify future
refactor. Rename it to process_ct_dead since non-debug mode does not
capture anything.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: (Daniele)
- Reorder defines
- s/ct_id/ct_error_id/
- s/ct_dead_capture/process_ct_dead/
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7c2a45fe8ad2..a00b5e761e96 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -59,7 +59,6 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
 	return gt_to_xe(ct_to_gt(ct));
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
 	/* Internal states, not error conditions */
 	CT_DEAD_STATE_REARM,			/* 0x0001 */
@@ -82,8 +81,12 @@ enum {
 	CT_DEAD_CRASH,				/* 0x8000 */
 };
 
+#define ct_error_id(reason_code)  CT_DEAD_##reason_code
+static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
+#define CT_DEAD(ct, ctb, reason_code)	process_ct_dead((ct), (ctb), ct_error_id(reason_code))
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 static void ct_dead_worker_func(struct work_struct *w);
-static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
 
 static void ct_dead_fini(struct xe_guc_ct *ct)
 {
@@ -162,9 +165,6 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
 	ct->fast_req[slot].fence = fence;
 	ct->fast_req[slot].action = action;
 }
-
-#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
-
 #else
 
 static void ct_dead_fini(struct xe_guc_ct *ct) { }
@@ -173,13 +173,6 @@ static void ct_dead_init(struct xe_guc_ct *ct) { }
 static void fast_req_report(struct xe_guc_ct *ct, u16 fence) { }
 static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
 
-#define CT_DEAD(ct, ctb, reason)			\
-	do {						\
-		struct guc_ctb *_ctb = (ctb);		\
-		if (_ctb)				\
-			_ctb->info.broken = true;	\
-	} while (0)
-
 #endif
 
 /* Used when a CT send wants to block and / or receive data */
@@ -2280,7 +2273,7 @@ ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
 int xe_is_injection_active(void) { return 0; }
 #endif
 
-static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
+static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
 	struct xe_guc_log_snapshot *snapshot_log;
 	struct xe_guc_ct_snapshot *snapshot_ct;
@@ -2387,4 +2380,10 @@ static void ct_dead_worker_func(struct work_struct *w)
 
 	spin_unlock_irq(&ct->dead.lock);
 }
+#else
+static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
+{
+	if (ctb)
+		ctb->info.broken = true;
+}
 #endif
-- 
2.55.0

