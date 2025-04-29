Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72797C3ABA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 13:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3955C10E486;
	Tue, 29 Apr 2025 13:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfqFkcoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA6810E486
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745933439; x=1777469439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8l1kPJGXwWrO/V4WsoZl0voT18wWobcv1PbMIrao+a8=;
 b=bfqFkcohl9/55jp4RYHWzGrvsVHBFENfvDrjrphyb++sxRE7k+RD7bZi
 rv4OkyG6Cb16FdpInMQClqV3UTXUpD+JVw+2D8RjT5waN75UBrTLWsexY
 cyMZczRjcO4mcRA+xG3AKnOg2eXNG6bcvxz6rY5vY8Tzh7s9L15XV76wr
 YvDsiifGQ1WFickFZNu8qpT4Koz5AmkKBAh5k+9+ZvChcU/kP7gjLIrZ9
 5O9eCYeWticX05GKWPMVRKYrL2sSL3Ky7alOVCj7zyRYtmsw+MZJRc+Rk
 GlHs71Dg0ZFHAufoN6X5ieh0iiU/njyqsNCNq2bgu62g7R7b4YjTY28GT w==;
X-CSE-ConnectionGUID: JmQFu+NMSfaWW8v9mnL4jA==
X-CSE-MsgGUID: /h+uaIgSRG+AA3Z7su2xLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46672614"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="46672614"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 06:30:39 -0700
X-CSE-ConnectionGUID: O67EDBoKT8WhT4nzqybXNw==
X-CSE-MsgGUID: OPgExGfnTli9F8MWwiim+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="133721546"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 06:30:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: [PATCH] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Tue, 29 Apr 2025 19:16:49 +0530
Message-ID: <20250429134649.4747-1-satyanarayana.k.v.p@intel.com>
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
avoid this issue, a new helper function is created and when fault is injected
into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
avoided which suppresses ct dumps in the log.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2447de0ebedf..3a49e432f74a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1770,6 +1770,12 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static noinline int xe_should_fail_ct_dead_capture(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
+
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
 	struct xe_guc_log_snapshot *snapshot_log;
@@ -1778,6 +1784,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
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

