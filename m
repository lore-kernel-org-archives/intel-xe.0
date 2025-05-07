Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820D5C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 12:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EF410E189;
	Wed,  7 May 2025 12:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Su7nXJMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68FD10E189
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746622786; x=1778158786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TdlCuJzFTSTt+4ReGD+svRG3YLAqSCo64arBfIJguTM=;
 b=Su7nXJMSPgTFTheryXsQvp1V20AOjZ01qwbfb0nv84JkyUBto1+sg0Au
 hxa8AFDb5djO3Wn1h653IjBLGn8fd3GGLjr0sh8pLlDZ5Zy5zzGCBwmBF
 buyrgCmZlyn1jD282Gc5C2CV5XOdIFJ6RXionMKYlD4igkarqKaXrnXXk
 eRUYqs31OLnHjlXkxyYhwPujNN5YW6MP3HTHsbWSibZ2rLvj+hjGyChgi
 /0bdyaJDmm/u3wiBHHYSj39EQQWLoLhMs1gvCMZxzpiuaafRoWNxDuKTE
 mt/wWrEMFsFEItRbjkoS6ykL5rtNsAqf+1vzm2tXkRRpkrMoWojBDMF+i g==;
X-CSE-ConnectionGUID: hxLNPOCrSIidjI/WiZSyrg==
X-CSE-MsgGUID: 2i7ULXrRQJWB3xFDTkI6tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="35983694"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="35983694"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 05:59:45 -0700
X-CSE-ConnectionGUID: pSwIp3zDRYmkITr6RvlZeg==
X-CSE-MsgGUID: eQIvOtxXRJu3CjS59BwQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135813646"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 07 May 2025 05:59:43 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Wed,  7 May 2025 18:45:58 +0530
Message-ID: <20250507131558.19572-1-satyanarayana.k.v.p@intel.com>
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
injected into this xe_should_fail_ct_dead_capture() helper function,
ct dead capture is avoided which suppresses ct dumps in the log.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>

---
Cc: Jani Nikula <jani.nikula@intel.com>

V2 -> V3:
- Added inline function to avoid compilation error in the absence of
CONFIG_FUNCTION_ERROR_INJECTION.

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2447de0ebedf..d959cc2e7b40 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1770,6 +1770,24 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+/**
+ * xe_should_fail_ct_dead_capture - Helper function to inject fault.
+ *
+ * This is a helper function to inject fault into ct_dead_capture().
+ * As fault is injected using this function, need to make sure that
+ * the compiler does not optimize and make it as a inline function.
+ * To prevent compile optimization, "noinline" is added.
+ */
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+static noinline int xe_should_fail_ct_dead_capture(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
+#else
+static inline int xe_should_fail_ct_dead_capture(void) { return 0; }
+#endif
+
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
 	struct xe_guc_log_snapshot *snapshot_log;
@@ -1778,6 +1796,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 	unsigned long flags;
 	bool have_capture;
 
+	/*
+	 * Huge dump is getting generated when injecting error for guc CT/MMIO
+	 * functions. So, let us suppress the dump when fault is injected.
+	 */
+	if (xe_should_fail_ct_dead_capture())
+		return;
+
 	if (ctb)
 		ctb->info.broken = true;
 
-- 
2.43.0

