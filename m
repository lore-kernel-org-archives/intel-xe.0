Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1546DCCD182
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D3310E420;
	Mon,  6 Oct 2025 11:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaiDn7wQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0572910E3FD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749045; x=1791285045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TsVB6urw20I/S8RxhF9Hv6rSU9FBo6A5zmB7tGCeBIY=;
 b=aaiDn7wQ7TU5SJL9wW0DNavH2hQ1JwR/pEgagH6EwUMK5fk+KRzf1z8J
 OM2NXUetnFCl76AV0VZeWeft3FoaocE7+hT4inGBqRwsguTgH5M/4iUyK
 y9PK+kqxMCfqGq0aNpL74Pw8olbAOw0TNuWkuyRpcDZmn68JxPsbrfCTS
 scMyE/3ukSvA9sxJw8Nq3jAdlNQCoCZc5F5kfSoDXKgbfTymDSv2fx90a
 8oFXnPjpe0NbG8Ta0yP5dbABl8fPJWfqXh97h2w9/nP8Vg+Sm1hsnWEnR
 BPz2I0oR5+WjtNU33W/xSXqfaOj+yEX+nzhRwAp+ciiCNcWKYAr9OyuOb w==;
X-CSE-ConnectionGUID: pSz4HhERTqybu94p5aFR0g==
X-CSE-MsgGUID: RZ9YeVQJRiq+XdQ1bDKslg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020395"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:45 -0700
X-CSE-ConnectionGUID: KwIH3MR8Qw2n2X81ZoeWsA==
X-CSE-MsgGUID: Wp2RUsEQQZS+CEymstOsGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655237"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 19/30] drm/xe/vf: Kickstart after resfix in VF post
 migration recovery
Date: Mon,  6 Oct 2025 04:10:27 -0700
Message-Id: <20251006111038.2234860-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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

GuC needs to be live for the GuC submission state machine to resubmit
anything lost during VF post-migration recovery.  Therefore, move the
kickstart step after `resfix` to ensure proper resubmission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 36eedfc3c5eb..2a988eb3e904 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1141,13 +1141,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
-	/*
-	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
-	 * must be working at this point, since the recovery did started,
-	 * but the rest was not enabled using the procedure from spec.
-	 */
-	xe_irq_resume(gt_to_xe(gt));
-
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
@@ -1167,6 +1160,13 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	if (skip_resfix)
 		return -EAGAIN;
 
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	xe_irq_resume(gt_to_xe(gt));
+
 	return vf_notify_resfix_done(gt);
 }
 
@@ -1190,11 +1190,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
-	vf_post_migration_kickstart(gt);
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
 
+	vf_post_migration_kickstart(gt);
+
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
-- 
2.34.1

