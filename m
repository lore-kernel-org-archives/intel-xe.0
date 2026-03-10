Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D09FD88CA
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0E510E78F;
	Tue, 10 Mar 2026 22:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkoucPlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18DD10E28A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773183044; x=1804719044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=frkGv9Kwx3fviav7KeIrEc+9YX6MNaqwEqXTKakrgfY=;
 b=lkoucPlD/KxkttayBRN9ejDqZOf8fboEaYSCJN7hGrNKAL49Opq2O+jE
 2SA0vv8DAVRdNGIEGcBSExYE5vDc8WrDiGAEie3LiBYLflC2b3wdFBRIP
 ZncqRwBJL/EtEyptHpFG0L7AuGKSDeT37H0C/LL72LJt1bBOgMVB9aKYa
 ogFQd0yEefmo7V4k3yLG9mokRfeEi+zBFf9gcJ6vgOy7vV0hIKsvUTH/z
 CE9mNVZNiBjziji2GxcnU2TSYNH71ha0wVrDoVk/L/lLdj11sFHNvZxAx
 OwQueceA8ZQ/kodhwh/2YzK9oF4PkZZyDlUi1U4LIDifGNtY3ItM8f/jH A==;
X-CSE-ConnectionGUID: YXSZsNYQSLqW+S4EbDzAwQ==
X-CSE-MsgGUID: GRbho3XxTsOWkkDLUxV0CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61817889"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="61817889"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:43 -0700
X-CSE-ConnectionGUID: xyrRZgb7SIqpWdIXEMMc9g==
X-CSE-MsgGUID: wv0tJGN1Rxe2jyy8sVgupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220441004"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 15:50:42 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v9 6/7] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Tue, 10 Mar 2026 18:50:38 -0400
Message-Id: <20260310225039.1320161-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310225039.1320161-1-zhanjun.dong@intel.com>
References: <20260310225039.1320161-1-zhanjun.dong@intel.com>
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

