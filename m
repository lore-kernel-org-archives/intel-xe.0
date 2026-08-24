Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB6CC5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 22:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B2A10E321;
	Mon, 24 Aug 2026 22:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Id4mMJFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028710E321
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787609181; x=1819145181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ozynUwvTABXNnkesSH3PJpY/IjytksHUh6YGvXrCUI=;
 b=Id4mMJFeqm+GCGZrZCoCGuDxZmqJ7hFFa7hqL4qSI+cbcTTgFX5LKcHh
 N1mpY/Wk4WmnlRUEORO3OTmlY1Y7KnMPMf8655juoVV1jRlGCKHAlBkD3
 U7F4gVGrLnGJlolL3nU/XsiGtWcAqUJSzJE3hRw2U3bpaeRhthO6Ir2aY
 4uEGhG7BOWboNewwUS1dBcFsOE3QS/av295S8sP3ZbCZfZ5muPmGkUXlg
 OHiWpM1A8xNxC+OxLDpWINo5kWJmFzcsBB9MbdqORO5htSfHMFQ9a5wtB
 SMt7jdzsMWzvxh1VjBrOnsoFpVQh7qRUDMYntXpIZzF2h1MeUjdQZ2F0X A==;
X-CSE-ConnectionGUID: iCvjbRJgREiVkPY7xgcwwg==
X-CSE-MsgGUID: e3rwx7HZTNurww+uH464ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87836396"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="87836396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 15:06:21 -0700
X-CSE-ConnectionGUID: 5HdX+ijDSee1VLqpQhAmzA==
X-CSE-MsgGUID: sBGxuG9gTpOeFsUXCDFzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="297024659"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO josouza-mobl7.intel.com)
 ([10.124.222.31])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 15:06:19 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe/xe3p: Restore sampler fault for uninitialized surface
 state
Date: Mon, 24 Aug 2026 15:04:58 -0700
Message-ID: <20260824220458.520358-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Xe3p changed the default behavior of a fault in sampler when surface state
address is 0x0.
With the default behavior some default values are used instead of trigger the
fault, what would make pretty hard to debug bugs.

So here programing SAMPLER_MODE to change back to the default and expected
behavior.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 48c515d91882..e6e51d04ca57 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -503,13 +503,14 @@
 #define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
 #define ROW_INSTDONE				XE_REG_MCR(0xe164)
 
-#define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
-#define   ENABLE_SMALLPL			REG_BIT(15)
-#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11, 10)
-#define   SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
-#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
-#define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
-#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
+#define SAMPLER_MODE					XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
+#define   ENABLE_SMALLPL				REG_BIT(15)
+#define   SMP_WAIT_FETCH_MERGING_COUNTER		REG_GENMASK(11, 10)
+#define   SMP_FORCE_128B_OVERFETCH			REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
+#define   SC_DISABLE_POWER_OPTIMIZATION_EBB		REG_BIT(9)
+#define   SAMPLER_ENABLE_HEADLESS_MSG			REG_BIT(5)
+#define   FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE	REG_BIT(4)
+#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE		REG_BIT(0)
 
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 139434946f8f..5273dea83df6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -602,6 +602,11 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
 	},
+	{ XE_RTP_NAME("Force fault for uninitialized surface state"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, XE_RTP_END_VERSION_UNDEFINED),
+				              FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE))
+	},
 
 	/* Xe3p_XPC */
 
-- 
2.55.0

