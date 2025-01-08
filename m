Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6CBE77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 13:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA6810EBC3;
	Wed,  8 Jan 2025 13:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3VxGVeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDB410E8B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736344451; x=1767880451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wb9npVXN504jp70D77js1TLROm7flzGLzKtSnZ6d3O0=;
 b=P3VxGVePmx6pxtbEcRG4Bnu9cmxBhM1mJAHNB5pkIY483fhLEs6DPXSQ
 uZb/Fcn/uQ2RS0iWtursz2ikNEd+Yt7Mj9Ig6tPQvUgHPxJmUKXTnB82w
 2Qrfr9y54EBbsmHmyRKvqOnjkxMz1JDMurl9LabqDUlHk/0EZoHYXy2ro
 jQNoYoQ81OmS8aRTIeXz++uiIXpe1L/1qi6TI8a7BizgAj5bxNMzPNNH2
 0j+9rHk4QXp+v2qCTzt2tbLCR5kmhzV+RP8sOuVQeuYInNSFH3XIk6FOE
 8z1l65GPoSpBPfKJ2g1vzYDyiPHSyFRYqgUyy1vwV9u7lZ5TZUhXdBfaT g==;
X-CSE-ConnectionGUID: 8Eqx1wS6SXyr0ijRSItFPQ==
X-CSE-MsgGUID: F43fGCxpTzqHXvmnycD3AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40248259"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="40248259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 05:54:11 -0800
X-CSE-ConnectionGUID: giKVwH36SoCt9+5E3YJc0Q==
X-CSE-MsgGUID: kE1WBdfEQIKxDMHRxCAsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107719756"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 05:54:09 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/ptl: Apply Wa_14023061436
Date: Wed,  8 Jan 2025 15:13:23 +0100
Message-ID: <20250108141323.311601-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Enable WMTP for the BTD kernel to address Wa14023061436 by setting the
proper TDL Chicken Bit.

v2: Apply it on engine_was[] as this register is not part of LRC(Matt)
    Apply it for first_render_or_compute in case this gets extended to
    compute only platforms(Matt).

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 162f18e975da..b4283ac030f4 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -500,6 +500,9 @@
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
 
+#define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
+#define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
+
 #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
 #define   WR_REQ_CHAINING_DIS			REG_BIT(26)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 570fe0376402..744dba4fdb58 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -613,6 +613,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_COUNTER,
 				   SMP_FORCE_128B_OVERFETCH))
 	},
+	{ XE_RTP_NAME("14023061436"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
+	},
 
 	{}
 };
-- 
2.46.0

