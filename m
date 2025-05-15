Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C55C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 10:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C09C10E247;
	Thu, 15 May 2025 10:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrtWGkZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DAE10E247
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747303421; x=1778839421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8rdWihaByvBlR6bHbjlmsgMU44+4CnifSrdkkfSt1p0=;
 b=jrtWGkZFW8ZsC81I+NjciiDpeAKnp9MY5+hZ0hIoFn+0/kUk7INkiDo1
 J1+d65NqIqCVxu6QvNLqmHBAGAn8gn6jlqLLTYAcmEQbBSXL6V+jK3iPt
 Y48+c9fi3zZxAgFNsnQKLeXLVdCD3FYQJX9W5Y8hJYgOuX+snWW+DlZSZ
 rszas/dVW42ehBnRIfYjjTxAOg04Sikari5IIPBB9GJ9QMyT5ND/xPwgh
 4WxL6GmABVm3zUednupxx9Y3fB0YlUwJzfnvCYUbJMEkH6L35l0VZ0gvB
 gg5/vxjxsbyJn5PFyhP/B5ihpnXw/xjMdpEA6ukjLW/uYruZhZGkMR6gX A==;
X-CSE-ConnectionGUID: HR71nnTCTCeYOOoT8fKNwA==
X-CSE-MsgGUID: kdfrBGlDRDivvEQyneoGmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60244131"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="60244131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 03:03:39 -0700
X-CSE-ConnectionGUID: YpqXDZfvS3qHF2qgMX93og==
X-CSE-MsgGUID: oXoTnTQzTwyYDB6VuPtZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="169254653"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa002.jf.intel.com with ESMTP; 15 May 2025 03:03:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Thu, 15 May 2025 15:49:52 +0530
Message-ID: <20250515101952.19317-1-satyanarayana.k.v.p@intel.com>
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
injected into this xe_is_injection_active() helper function,
ct dead capture is avoided which suppresses ct dumps in the log.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

V3 -> V4:
- Updated the name of helper function and moved to xe_device.h file.

V2 -> V3:
- Added inline function to avoid compilation error in the absence of
CONFIG_FUNCTION_ERROR_INJECTION.

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_device.h | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..b937d585083b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -195,6 +195,24 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+/**
+ * is_injection_active() - Helper function to inject fault.
+ *
+ * This is a helper function to inject fault into ct_dead_capture().
+ * As fault is injected using this function, need to make sure that
+ * the compiler does not optimize and make it as a inline function.
+ * To prevent compile optimization, "noinline" is added.
+ */
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+static noinline int xe_is_injection_active(void)
+{
+	        return 0;
+}
+ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
+#else
+static inline int xe_is_injection_active(void) { return 0; }
+#endif
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ff6edf1b14f4..a6964d13f3a3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1963,6 +1963,12 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
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

