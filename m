Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3486C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 20:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594AA10E266;
	Mon, 24 Jun 2024 20:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqy0XTCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15D010E160
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719262670; x=1750798670;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Qe5uXSrSl/ceSSesN4A6Ex3bU90qEFyMA4N8PCxdrNA=;
 b=kqy0XTCiEJ+HCXBRti1/J0R7Dp7hnHjX5RFxLTBvh7JbEHN6qKjZki1F
 1x16SdCQWwk1bf2S4LFLLZT5nvIRbf5MZD194WFXbM1R4xE20xJeI2N7x
 SsuDSYxDP4Fd2Pdf+lg0nZD5ICzqcbYhZMW8AhmWtFIIx+TZj3kTln+lp
 Ny/1J+vmn8j650Ef9cFPvhZCRcir5IedXJJtlx8wRRuiXuf9oubiay8S4
 YO5xdY6GBsRvu3oR4FnucKbkutIRbcDB70g8Ck2PSKyQzXUtaiBsmPIVa
 wLPDhr1ZPqcesL+6E3+IAzP9JpdA0nJkMQycTSVewS3T8Rk8yG8PeAKgC A==;
X-CSE-ConnectionGUID: qUEjTRl2S4eq50X65plzuw==
X-CSE-MsgGUID: 2jNoQ3bkQO+2skCepQGhZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="12225347"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="12225347"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 13:57:50 -0700
X-CSE-ConnectionGUID: Ag3lMDj6TB+fjvlcucuo3Q==
X-CSE-MsgGUID: eZwE6LPrTfK+u8j366pesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43513563"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 13:57:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] HAX: Try SR-IOV on ADLP/ATSM
Date: Mon, 24 Jun 2024 22:57:37 +0200
Message-Id: <20240624205737.1213-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240624205737.1213-1-michal.wajdeczko@intel.com>
References: <20240624205737.1213-1-michal.wajdeczko@intel.com>
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

This is for CI only. DO NOT REVIEW. DO NOT MERGE.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 1 +
 drivers/gpu/drm/xe/xe_pci.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 893858a2eea0..c0cf3b8ad815 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -18,6 +18,7 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
 	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ebff5ea79b1d..488a444b7b5c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -261,6 +261,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -307,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc dg2_desc = {
-- 
2.43.0

