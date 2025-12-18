Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDC6D711C7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BFE10EB74;
	Thu, 18 Dec 2025 21:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SoGvA14k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F8810EAD9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766093390; x=1797629390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F8xXbht2SokzE5kU1vRHIQKZdMwwrYQCqNQrtYCnW4M=;
 b=SoGvA14kPy1Mzyy8cFVfl2f6wEk6zfXx2XiQZawEGWYDsE/iPEZya3cw
 gwiYKWho3zTTneBHmz05Y7qNa2TaCClKXng3EtNGRRJDYtOnevga2TTPV
 B/R4mcL4VFt1nQ6PvJimZBilLfFHasYGvfdvU/oGftIBEfL+vtLu9fug9
 cVOxLfTt7JMmDZ4x0lObcUzqxuiAEvvuKDBtPwk1UnJyOlpMRxFAxZDmn
 apmwTMABJ7L2qZC724yUqur70eVZeWmaFCnIGdM0jh27/5Ojw2JuF5jrC
 U95VrEJYvwD03bIO6wEmRCNUe9jbUm3tCadBUWgjeugdB+WYVhrj5mHaz A==;
X-CSE-ConnectionGUID: voZ/35lcSfSH9de+FmbiGQ==
X-CSE-MsgGUID: 7mwh3Hl3QZajoVqBzJ+WHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67808713"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67808713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:49 -0800
X-CSE-ConnectionGUID: GMDgqWlfTiaD5G/h5ojifg==
X-CSE-MsgGUID: weXKW/QZTlu7xjm7kJyVjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198594098"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, dixit.ashutosh@intel.com
Subject: [PATCH v2 4/4] drm/xe/guc: READ_ONCE ct state in xe_guc_ct_initialized
Date: Thu, 18 Dec 2025 21:29:51 +0000
Message-ID: <20251218212946.16577-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218212946.16577-6-jonathan.cavitt@intel.com>
References: <20251218212946.16577-6-jonathan.cavitt@intel.com>
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

Use READ_ONCE when reading ct->state in xe_guc_ct_initialized to prevent
the compiler from ignoring this operation.

Fixes: 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
 drivers/gpu/drm/xe/xe_guc_ct.h | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c59e38189cf0..24857c2c8cb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -530,7 +530,10 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
 
-	/* WRITE_ONCE pairs with READ_ONCE in xe_guc_ct_enabled. */
+	/*
+	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
+	 * xe_guc_ct_enabled.
+	 */
 	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5f2811a06833..767365a33dee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -30,7 +30,8 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
-	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
+	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
 }
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
-- 
2.43.0

