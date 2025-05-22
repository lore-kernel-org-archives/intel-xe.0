Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926D9C54756
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 08:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180FD10EC62;
	Thu, 22 May 2025 08:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLMBMevl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9B710EC62
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747902150; x=1779438150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZnuykYmbBwNt2f4qIBtxRMP72X2ULkb9dnwMER/7AGM=;
 b=BLMBMevloeWIXamxTiIXYP1NkFK0v8fC2oPs5avRdr5dnwx2HuMXMLvJ
 opd2cxsj8qmUldceNQs1I181VXTTstbqbrjb1HQgfa3RQvBbC2K0Wk9yt
 2XuWUqL6T0BRkcVk3YWZBGcJYosL9dpsbGH4+lZqjU9s5I0DsffV5BwGt
 CtrEJEUwTLNYsdMry5ZquOGzeVzfsI0in7yH5fk1u/qbLy744eH/EauCm
 dSfO2bDeMOUwSrRF0UYThpOeZnv+yLNzbM5+r9jtwaqpoQ0/AloFDQR8t
 9ZluOvgnPWAiFiiEZzQ1+ojMb4v/ldx4EZIm7B1zYDQj83zCnpedynOyg g==;
X-CSE-ConnectionGUID: 0YVVrbAGRQicIkej0Xbm1A==
X-CSE-MsgGUID: N94LGVbeSA29ZLKfsdT9cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49965944"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49965944"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 01:22:29 -0700
X-CSE-ConnectionGUID: rHL7wzSaRmu/cz/qy4kZRA==
X-CSE-MsgGUID: TaHEchyURYSMG3BvKDI7xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140553682"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa007.fm.intel.com with ESMTP; 22 May 2025 01:22:26 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v5] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Thu, 22 May 2025 08:00:20 +0000
Message-Id: <20250522080020.2787294-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/gpu/drm/xe/xe_device.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..e1b4087a2974 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1120,6 +1120,24 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 	xe_pm_runtime_put(xe);
 }
 
+/**
+ * xe_is_injection_active() - Helper function to test whether a fault
+ * inject test is running.
+ *
+ * This is a helper function that the driver can use to detect whether
+ * a fault injection test is running in order to suppress excessive debug
+ * output. By default, the return value is fixed as zero but it can be modified
+ * by the fault injection framework to return an error.
+ *
+ * Returns:
+ * 0 if no fault is injected.
+ * Injected error if fault is injected.
+ */
+int xe_is_injection_active(void)
+{
+	return xe_inject_fault();
+}
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..13a43fe4fb64 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -195,6 +195,20 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+/*
+ * As fault is injected using this function, need to make sure that
+ * the compiler does not optimize and make it as a inline function.
+ * To prevent compile optimization, "noinline" is added.
+ */
+static noinline int xe_inject_fault(void) { return 0; }
+ALLOW_ERROR_INJECTION(xe_inject_fault, ERRNO);
+#else
+static inline int xe_inject_fault(void) { return 0; }
+#endif
+
+int xe_is_injection_active(void);
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
2.34.1

