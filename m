Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C20C54FC6
	for <intel-xe@archiver.kernel.org>; Sat, 24 May 2025 14:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB5C10E091;
	Sat, 24 May 2025 14:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gu/mFCfr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C5B10E091
 for <intel-xe@lists.freedesktop.org>; Sat, 24 May 2025 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748097000; x=1779633000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+v+JFX/pel2jS3hATeJwwhv5dW/Zq65Rgu8SBgVzeVU=;
 b=gu/mFCfr/pD9tpr9uG5/jI8RlJhxtaMW+3n7uPUUMzWDbes3RLXhISmf
 Y1M+SdTw8cNGtfM99BxReKP7hdK1BRFv6eTuEhE2E38eCH2eX7l++xsKE
 lI/58AEr1dTPa2/vn2Ysv+djiqeveGchkBUxmWcrfjBUNis2kcnkvV1ZF
 znEsV0XE8iXMXBV+gu3OoiIEDkd+Q1zaiOO32PbNrFgwESHU8F8cp1h7I
 51a/zg5NoEhC+KzuqAi8rlr1p49OaAX8lmQro0MvyVZtaUSckPaq4U2Bn
 viBP3gb9Qi2f2SE5ysPnS+W/c2licyD1HhvJ3MioxDebuvl7gx3e8E6Ci Q==;
X-CSE-ConnectionGUID: 2udDQuqHRrSijTgvudurDA==
X-CSE-MsgGUID: cLfyZ2/kSeKoLNx5Je28TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50281766"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="50281766"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 07:29:56 -0700
X-CSE-ConnectionGUID: ctHN/XipTgeMfDttOsh7MA==
X-CSE-MsgGUID: eKvlwFjnRduiJeV7gIYflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="142584789"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 24 May 2025 07:29:54 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v6] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Sat, 24 May 2025 20:16:13 +0530
Message-ID: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
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
injected into this xe_inject_fault() helper function, ct dead capture
is avoided which suppresses ct dumps in the log.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

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
 drivers/gpu/drm/xe/xe_device.h | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..9dd31facc9d8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -195,6 +195,23 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+/*
+ * This is a helper function which assists the driver in identifying if a fault
+ * injection test is currently active, allowing it to reduce unnecessary debug
+ * output. Typically, the function returns zero, but the fault injection
+ * framework can alter this to return an error. Since faults are injected
+ * through this function, it's important to ensure the compiler doesn't optimize
+ * it into an inline function. To avoid such optimization, the 'noinline'
+ * attribute is applied.
+ */
+
+static noinline int xe_is_injection_active(void) { return 0; }
+ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
+#else
+static inline int xe_is_injection_active(void) { return 0; }
+#endif
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 822f4c33f730..89f992feba31 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2040,6 +2040,12 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
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

