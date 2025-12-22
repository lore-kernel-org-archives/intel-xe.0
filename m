Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59084E6ADE4
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 20:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FFC10E2BE;
	Mon, 22 Dec 2025 20:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfU/+Saw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E11D10E05C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766434799; x=1797970799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPlJ+mqFR76T2AqJWdJ2pnbq/4q5mZI9dcZwvIjvyiI=;
 b=JfU/+SawoXJXZmYGpRqOE3u0wRF1I/k+9d8Pl9l7Ft/eQC7sgqbruC3+
 T+JI9YS7AtdNeSV+Yi1aE7aTazHX7qJAoJdTsCbAt1TFNAjZusvL2VVSm
 5vN3Oljr/XZw2L8J0HUFD0mEDoY63dcwfxm+we3tXrDcou+5hJEd1rCWJ
 nBlnNzFNRKvKiURVXAaJozrctzYCbzEXe9gKtwdMK4Q+do1KcehbE8Ycq
 DqWDIDLrTToknjB68zmH4WAU4ZWS5OV2XV3JXKc0kwlj/RNBfizgZvUHC
 ClSfkpP1P2dOkG3FI/0qlM+SkJNwcuciSrDHA9NHk3e9DAv2owmrJMNLD g==;
X-CSE-ConnectionGUID: T3Qnsg7fSj2+d8Wwkr9ipw==
X-CSE-MsgGUID: 484JPeRaT/mWDddqMGxu8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68335794"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="68335794"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 12:19:58 -0800
X-CSE-ConnectionGUID: rnpv48uhRVOCb3K3Fa+RMw==
X-CSE-MsgGUID: 2lJ1Omm1Rjmhab7NoIR76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="200100907"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 12:19:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v3 2/2] drm/xe/guc: READ/WRITE_ONCE ct->state
Date: Mon, 22 Dec 2025 20:20:00 +0000
Message-ID: <20251222201957.63245-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222201957.63245-4-jonathan.cavitt@intel.com>
References: <20251222201957.63245-4-jonathan.cavitt@intel.com>
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

Use READ_ONCE and WRITE_ONCE when operating on ct->state
to prevent the compiler form ignoring important modifications
to its value.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h | 6 ++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f2148a8bf208..dfbf76037b04 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -529,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
-	ct->state = state;
+
+	/*
+	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
+	 * xe_guc_ct_enabled.
+	 */
+	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
 		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5599939f8fe1..767365a33dee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
-	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
+	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
 }
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
-	return ct->state == XE_GUC_CT_STATE_ENABLED;
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
+	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
 }
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
-- 
2.43.0

