Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF75C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 12:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDA310E53A;
	Tue, 10 Jun 2025 12:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="addasGqb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146B710E53A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749559960; x=1781095960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7uQJQLOhBch/fCkl83CrYHVRmP32cIySuF5IYgfS2xQ=;
 b=addasGqbieBDlGAvbmNM+w93T+3zx3Gfw6m+hG4RqBLd6gXnkIgWVG2i
 gWt+ej04UIpogIGt2Ev9g+1uTooaoUyYAY/U16N073zfZ9p2uIkxCchPX
 VAEF8UrGtnFkZfa7G24lR6Qew6en1ewqIOBFV5QdlJqwAzvu2wGZHPd7z
 KLHSQLQXLyGyv4Bodnq1lOQHy09FgIthgmPia2CZdvFHR2kpkowEEOTl+
 JFSUH7O5eiBL5UYMbzzJi6YGHoulVky0eE8I7Aq2zc/Nki1lbuA0MLYnz
 0X1Zt/zhDeAaZTgslmFWasIPz7wyP+BqZmnvHkPu5cvf8diENY+jt2I9a A==;
X-CSE-ConnectionGUID: WDNdfABRQzmNPTPFHIZVRg==
X-CSE-MsgGUID: v2F1SXmiRZ6PD0YmS7vCvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="74198720"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="74198720"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:52:39 -0700
X-CSE-ConnectionGUID: 7sItIIYZT/2MbCk8kIq5eA==
X-CSE-MsgGUID: MZkDNnrNSt+Bs+hhETwObg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="151635885"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 10 Jun 2025 05:52:38 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v7] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Tue, 10 Jun 2025 18:39:00 +0530
Message-ID: <20250610130900.18800-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
functions, the CI test systems are going out of space and crashing. To
avoid this issue, a new helper function is created and when fault is
injected into this xe_is_injection_active() helper function, ct dead capture
is avoided which suppresses ct dumps in the log.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---

V6 -> V7:
- Moved the xe_is_injection_active() function from .h file to .c file as
compiler is optimizing static function defined in header file into inline
function which is not injecting fault into helper function.

V5 -> V6:
- Fixed review comments.
- Updated helper function description.

V4 -> V5:
- Fixed review comments.

V3 -> V4:
- Updated the name of helper function and moved to xe_device.h file.

V2 -> V3:
- Added inline function to avoid compilation error in the absence of
CONFIG_FUNCTION_ERROR_INJECTION.

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 822f4c33f730..5d1d4c33857e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2030,6 +2030,24 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+/*
+ * This is a helper function which assists the driver in identifying if a fault
+ * injection test is currently active, allowing it to reduce unnecessary debug
+ * output. Typically, the function returns zero, but the fault injection
+ * framework can alter this to return an error. Since faults are injected
+ * through this function, it's important to ensure the compiler doesn't optimize
+ * it into an inline function. To avoid such optimization, the 'noinline'
+ * attribute is applied. Compiler optimizes the static function defined in the
+ * header file as an inline function.
+ */
+static noinline int xe_is_injection_active(void) { return 0; }
+ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
+#else
+static inline int xe_is_injection_active(void) { return 0; }
+#endif
+
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
 	struct xe_guc_log_snapshot *snapshot_log;
@@ -2040,6 +2058,12 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
 	if (ctb)
 		ctb->info.broken = true;
+	/*
+	 * Huge dump is getting generated when injecting error for guc CT/MMIO
+	 * functions. So, let us suppress the dump when fault is injected.
+	 */
+	if (xe_is_injection_active())
+		return;
 
 	/* Ignore further errors after the first dump until a reset */
 	if (ct->dead.reported)
-- 
2.43.0

