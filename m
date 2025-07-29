Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE1C87FCE
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7133910E6AB;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UWhKLaF5";
	dkim-atps=neutral
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6519810E061
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:05:43 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-2403ceef461so14474115ad.3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753787143; x=1754391943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjEVdBGPxD0W8El7dN3HXrDfs2OHok0DDlSf5KiXk5Y=;
 b=UWhKLaF5OpjdMyn6bbKwWQ46/NyQpmVIoHdf8L7A1ibVnL4+KCJfb0J5NUt0aPU0vl
 KSJ/NW5/N28pI5vWBIBll0f4AhsYasMJzfyIBF/os2wmDog87XNkGj3/pWGuUMSuToXa
 mfYGqfIopFRumR9AEOAjMGtqr61UOBWECDcAd78sUQzfXiaKkFZu90fUGQspo6OrSuH2
 Ww8IWE3mUBZOaSGv8tXBgPpoBC7nZEiGb+psCkFYNdypDZsGMZnfEItXTHAFPVqZ6O4x
 Tr4oAqwqkhl+FXs1eUwfb5eLSY6jnUyIHarXtzylOSEq8uYFwy0yjMuL0U5M54BFwq15
 X1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753787143; x=1754391943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjEVdBGPxD0W8El7dN3HXrDfs2OHok0DDlSf5KiXk5Y=;
 b=wxXDeeuztB6JrmDKQgBvs123pUnYquF3DJVO069W8mx0x0yp843YkhP3MnXJ2Xvguq
 Om/ocyVcgbvuUuSEan4+7/zM+oPUAsULhrJ2NM1uBsYpOsLqGIUjkhMcLE7yM7fCkbUi
 aEpr0Sx2Vw0zBw2LFsjrULCnxCdBn41yGqfo77SE6PegWNgQPbeYCHRTJoOw1LclugO4
 N4svVMu+HwTbLwQyj+vDAOR+WLG6ykEFgj2p7dhSiY+fR0IPacAXiWxH4XEEtozrS1Go
 YCcBLX4Nu3Vlx4ZcQNEFBcWJnEsW85LnmBpRedPVnRifw4ng4RrsRVaqQPwCvFIm2c6a
 GkYg==
X-Gm-Message-State: AOJu0YwXVKjyoQ9WJUfaU2NNpdZXA66IS3t7JEJ0kXVMD1ZZLIGUHFve
 uD2opJUrSrXmNmpNyfsdIYGJyAYNVo+oHFCkPbFqP2eLExV3jjuvBU4=
X-Gm-Gg: ASbGncvDpgGpKJrPfa9Q9NHyW+BU3AG9w8peZh/TEJwWUDsjb3wO67QSRNpW4sc3zTa
 r1dtbNaVaSINLgnlwDRbLxHnedFTflWuW+QxmbIMj3t8rCz3xcYzfYnhdzrGMyQUJIOb3/sRNgJ
 S79fxM/JSYk010/cpr356U3AosKINlJXNOMRuiyK0TsIdJFPtEqFpTzQUm37HbQd/a5USxAfKfC
 24aIUT5v4lLAHaQlldU1APtEEmuanawC+csF3XMG/7DNWf9bdKLa6G+rBCXszyhr6FiD5t02jO3
 7dtighCxLTHHebGoJEusTHkEl+J7JS8hJf892EcLghJH9w3NwS1oWxWZS/K4UJObuekXhRn2tzX
 TALbgTiie68Mh/Ymm9zZmqSFOPn5bgJE2/HWh6QUdBLff/cROAA==
X-Google-Smtp-Source: AGHT+IE/mo09xg1yVjETfxMDbiA4eaf9wMWWRdhI63ktdWg4p6m1+uKCAXUvOj4aHehwKxFNnXRsaw==
X-Received: by 2002:a17:903:3d05:b0:240:80f:228e with SMTP id
 d9443c01a7336-240080f2441mr120392335ad.52.1753787142745; 
 Tue, 29 Jul 2025 04:05:42 -0700 (PDT)
Received: from git-send-email.moeko.lan ([139.227.17.83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe30bc1fsm75929025ad.5.2025.07.29.04.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:05:42 -0700 (PDT)
From: Tomita Moeko <tomitamoeko@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Tomita Moeko <tomitamoeko@gmail.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 6.12 1/4] Revert "drm/xe/gt: Update handling of
 xe_force_wake_get return"
Date: Tue, 29 Jul 2025 19:05:22 +0800
Message-ID: <20250729110525.49838-2-tomitamoeko@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250729110525.49838-1-tomitamoeko@gmail.com>
References: <20250729110525.49838-1-tomitamoeko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

This reverts commit d42b44736ea29fa6d0c3cb9c75569314134b7732.

The reverted commit updated the handling of xe_force_wake_get to match
the new "return refcounted domain mask" semantics introduced in commit
a7ddcea1f5ac ("drm/xe: Error handling in xe_force_wake_get()"). However,
that API change only exists in 6.13 and later.

In 6.12 stable kernel, xe_force_wake_get still returns a status code.
The update incorrectly treats the return value as a mask, causing the
return value of 0 to be misinterpreted as an error. As a result, the
driver probe fails with -ETIMEDOUT in xe_pci_probe -> xe_device_probe
-> xe_gt_init_hwconfig -> xe_force_wake_get.

[ 1254.323172] xe 0000:00:02.0: [drm] Found ALDERLAKE_P (device ID 46a6) display version 13.00 stepping D0
[ 1254.323175] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] ALDERLAKE_P  46a6:000c dgfx:0 gfx:Xe_LP (12.00) media:Xe_M (12.00) display:yes dma_m_s:39 tc:1 gscfi:0 cscfi:0
[ 1254.323275] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping = (G:C0, M:C0, B:**)
[ 1254.323328] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] SR-IOV support: no (mode: none)
[ 1254.323379] xe 0000:00:02.0: [drm:intel_pch_type [xe]] Found Alder Lake PCH
[ 1254.323475] xe 0000:00:02.0: probe with driver xe failed with error -110

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5373
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 105 +++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 30ec13cb5b6d..3b53d46aad54 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -98,14 +98,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	u32 reg;
+	int err;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (WARN_ON(err))
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
@@ -115,13 +115,13 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	u32 reg;
+	int err;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
@@ -129,15 +129,15 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (WARN_ON(err))
 		return;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 	reg &= ~CG_DIS_CNTLBUS;
 	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 /**
@@ -407,14 +407,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err, i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
-		err = -ETIMEDOUT;
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
 		goto err_hw_fence_irq;
-	}
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -449,12 +446,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	XE_WARN_ON(err);
+
 	return 0;
 
 err_force_wake:
 	dump_pat_on_error(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -464,14 +463,11 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 static int all_fw_domain_init(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err, i;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_force_wake;
-	}
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (err)
+		goto err_hw_fence_irq;
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_wa_process_gt(gt);
@@ -537,12 +533,14 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(err);
 
 	return 0;
 
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
@@ -555,12 +553,11 @@ static int all_fw_domain_init(struct xe_gt *gt)
  */
 int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto out;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
@@ -578,7 +575,8 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	xe_gt_enable_host_l2_vram(gt);
 
 out_fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+out:
 	return err;
 }
 
@@ -746,7 +744,6 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static int gt_reset(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	if (xe_device_wedged(gt_to_xe(gt)))
@@ -767,11 +764,9 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_out;
-	}
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (err)
+		goto err_msg;
 
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_stop_prepare(gt);
@@ -792,7 +787,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(err);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
@@ -800,7 +796,8 @@ static int gt_reset(struct xe_gt *gt)
 	return 0;
 
 err_out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
@@ -832,25 +829,22 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_suspend_prepare(&gt->uc);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (err)
 		goto err_msg;
 
 	err = xe_uc_suspend(&gt->uc);
@@ -861,15 +855,14 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
 
-err_msg:
-	err = -ETIMEDOUT;
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+err_msg:
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -877,11 +870,9 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 }
 
 /**
@@ -906,12 +897,11 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (err)
 		goto err_msg;
 
 	err = do_gt_restart(gt);
@@ -920,15 +910,14 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
 
-err_msg:
-	err = -ETIMEDOUT;
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+err_msg:
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.47.2

