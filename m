Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C6410A88E3
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 16:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B075710EB56;
	Thu, 26 Mar 2026 16:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="La1TjucC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B945110EB53
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774541806; x=1806077806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EcXi10ZR3TCLbMFfaJSh7v9O8GzbmyG5oDlqBaMyOX0=;
 b=La1TjucCvXwh0Gz+rldXp9clRbuXMMgkr8h3/1pZhN3Ng+Lep+pH4Euo
 59QSFW4V+wR2Wg9TgGqPWljW8th/VxbnLDvkAxtQhHKmYdgNaDxDfUfID
 dwP+K8VkAt34CEXnf1oiWNuNnStgv/Y5Kv6iP+Jh5EqkKeiOzkAtinRaU
 hKwTS4yPRN1UjapgFfz8qtA6gks2ObJOvmzBFScXyN7g2tQFLzi6XUO0p
 X0ogPePzijU8Z/WSwSzTh+Vc+KYV5G22jDxr3xVkGDR5m4ahEfPIpblby
 1SwbHrG6fGUqJrLLWgtwWWdXERLZlq65QuBBrSUvCgWLiic39PSxx4Qba Q==;
X-CSE-ConnectionGUID: Vm2W0BVESMCbveIO9fHvRw==
X-CSE-MsgGUID: L6suA6QSSaKZQ+eDJfkOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85911687"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="85911687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:16:46 -0700
X-CSE-ConnectionGUID: huJ/cbpJTg27WvMKolkYPw==
X-CSE-MsgGUID: +WSpr9wZTgClmoGEbvLfgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229990800"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:16:44 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_18044193044
Date: Thu, 26 Mar 2026 21:46:28 +0530
Message-ID: <20260326161628.3566067-1-varun.gupta@intel.com>
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

Add engine workaround Wa_18044193044 for graphics version
35.10 stepping A0..B0.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4ebaa0888a43..f92c6ffd4d0a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -560,6 +560,7 @@
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
 
 #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
+#define   BIT_APQ_OPT_DIS			REG_BIT(14)
 #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
 #define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 546296f0220b..b10cfd921b11 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -601,6 +601,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
 	},
+	{ XE_RTP_NAME("18044193044"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, BIT_APQ_OPT_DIS))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
-- 
2.43.0

