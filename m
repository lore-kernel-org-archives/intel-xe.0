Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3111EEC2B5
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 16:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49AB10E5E4;
	Tue, 24 Feb 2026 16:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eavspBNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9737D10E5ED
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771950960; x=1803486960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=frkGv9Kwx3fviav7KeIrEc+9YX6MNaqwEqXTKakrgfY=;
 b=eavspBNhw8YbWpZH0GDzyHE8ex0KUwuCUbmb29gp5ayixrKXHoIxl4qg
 C/NENADN4b0fSL+8XR8o8adBkVtgjAQopzOeoJGHoDow+BNGfUyG1OJIY
 FhSJXHC8P635Urw1awCAapuNat2Jfn+WDd+zu7VZJZpaR5/irAZYn/19g
 W9bBVM6nWhEdtKW2A97jf8Gijl+7vk1QF6CPMKqJSRBHiEX6SYqYePBgd
 n7yQszh/et4dKIFk36/fKm8CopOQuH52a8CNhPsWlnTNA77gNNQm5ZHyH
 ygg9PiYP5XuKXiFTB/NdhBoUnWwnyPXou6ytSEee/UMX14dypA3G0n2qE Q==;
X-CSE-ConnectionGUID: ogxJihogQrmrDm//3dmC5A==
X-CSE-MsgGUID: rzYekY6iRIeuc4QH7xy/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73040149"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73040149"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:35:58 -0800
X-CSE-ConnectionGUID: XRSoR1mgTOG0e16k7q/sPw==
X-CSE-MsgGUID: r7hAkgkuREKMAzlnouHnHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220555635"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 08:35:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 6/7] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Tue, 24 Feb 2026 11:35:54 -0500
Message-Id: <20260224163555.218750-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224163555.218750-1-zhanjun.dong@intel.com>
References: <20260224163555.218750-1-zhanjun.dong@intel.com>
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

If the firmware fails to load in GT resets the device is wedged also
initiating a GuC state cleanup.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d9aa845a308d..75091bde0d50 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -157,23 +157,19 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 
 	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
 	if (err)
-		goto err_out;
+		return err;
 
 	uc->guc.submission_state.enabled = true;
 
 	err = xe_guc_opt_in_features_enable(&uc->guc);
 	if (err)
-		goto err_out;
+		return err;
 
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
-		goto err_out;
+		return err;
 
 	return 0;
-
-err_out:
-	xe_guc_sanitize(&uc->guc);
-	return err;
 }
 
 /*
@@ -205,19 +201,19 @@ int xe_uc_load_hw(struct xe_uc *uc)
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (ret)
-		goto err_out;
+		return ret;
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-		goto err_out;
+		return ret;
 
 	ret = xe_guc_pc_start(&uc->guc.pc);
 	if (ret)
-		goto err_out;
+		return ret;
 
 	ret = xe_guc_rc_enable(&uc->guc);
 	if (ret)
-		goto err_out;
+		return ret;
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
@@ -232,10 +228,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
-
-err_out:
-	xe_guc_sanitize(&uc->guc);
-	return ret;
 }
 
 int xe_uc_reset_prepare(struct xe_uc *uc)
-- 
2.34.1

