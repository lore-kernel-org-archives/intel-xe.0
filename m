Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3E4D6D237
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5310EA17;
	Thu, 18 Dec 2025 15:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4cSDf2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8E710EA17
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072132; x=1797608132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Or7/46ZOQOlhI3vOHpIGcbAODXktTLT1j20S3gVEA3M=;
 b=B4cSDf2oEttTzxXTeE4kLEkCowIOJ+PGF1IjMkDUlACzl26Z7mklEJNp
 b8w5Ka+0JixAc4z3ln7gehEFRSyuDqsYX5xtgONTGtbdtbWvrlw7mhAU+
 Kw37/3Np9EI1/YMyDjQQmpR3xWWX0R+EfGL3bINNe+2IAIW86q8Flv61b
 +xsXnMyh/wbYUjfAUMLQ5HHsKktGHto1K1PRA724v1XiqIR5cCdlK0Bzl
 yQTiGPZqyrOzVsA0Gi+gFSEa9LK7VnNizhsviLXXvpWwLDyWs/LZOZMMk
 tNgMw02xPo4kOnNb+JP/nwEgAecwba82owzPM3slrItH+dvzeO/NqgpCN g==;
X-CSE-ConnectionGUID: 9UjzmOJ8S22hGpud9NLqkA==
X-CSE-MsgGUID: fV0MKb+CSYuw4XTyA+2Vng==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906278"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:32 -0800
X-CSE-ConnectionGUID: tbKXxJmATkWbu8de04V+cg==
X-CSE-MsgGUID: 6yQn3i9yS3qXlUQ/CQ/ZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042236"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:31 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 6/6] drm/xe/xe_guc_ct: Justify WRITE_ONCE/READ_ONCE usage
Date: Thu, 18 Dec 2025 15:35:34 +0000
Message-ID: <20251218153527.6436-14-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
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

Usage of READ_ONCE and WRITE_ONCE requires comments justifying it.
Some recently added uses had cross-dependencies with each other, but
needed to be added separately, so introduce the justifications now when
it makes more sense to.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++++
 drivers/gpu/drm/xe/xe_guc_ct.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 20ac0438ffb6..24857c2c8cb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -529,6 +529,11 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
+
+	/*
+	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
+	 * xe_guc_ct_enabled.
+	 */
 	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index cb1335f1d66f..8d318b094f33 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -30,11 +30,13 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
 	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
 }
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
 	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
 }
 
-- 
2.43.0

