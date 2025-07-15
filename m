Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2ACC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393C510E626;
	Tue, 15 Jul 2025 18:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUd2L4IM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693D910E234
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603289; x=1784139289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeLfRlKrcsVHEAborRxPcc4/sXx8kjr4wT3LAC7NI74=;
 b=PUd2L4IMRc7M0iX1BdKYjVg6sDkfnXJfyE7ugvJL/vhAn45iuhg9/pvH
 hqpA1ra1wSLEtZjvnFUN4sG0ij9S7Dfsuv52mRW08iXrXujC0elcHtuTH
 K2WVMNNyEVb+0IuQOBXBGEWGHSFDc01EdTwOgzj+zxprnTDRXeG5sERIS
 VlBhYchlQOKgSSP4byPMJmyNFp4AvJJ5zgRb8BpLUso/8frMb3q/04vHV
 Lzc4kVFkj3MpIR9jZ/MhAruS4dP9pw0XKoX1cu+/CPOUvhjRTvHGWPOTI
 uxeUoAn91yDCzAFivZkflU991Jm7xxMy+VE0nSYjQlBOxDtNuNHWonjX/ w==;
X-CSE-ConnectionGUID: gWs0dRHOTH2CmuHhJQ6h4w==
X-CSE-MsgGUID: OZNmtC9cRh+4TYeXT4nyQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65406508"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65406508"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:48 -0700
X-CSE-ConnectionGUID: tfiUorqbS1aTW9nSkVmjPA==
X-CSE-MsgGUID: jtni4JicS8WZJ8O8OMnJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162845982"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] Revert "drm/xe: Enable SR-IOV for ADL/ATSM"
Date: Tue, 15 Jul 2025 20:14:15 +0200
Message-Id: <20250715181419.807-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250715181419.807-1-michal.wajdeczko@intel.com>
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
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

This reverts commit bbd6af134c0cf7934985fe2b4a5841f91760d61b.
This commit is from CI-topic branch and will be applied again.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 10 +---------
 drivers/gpu/drm/xe/xe_pci.c    |  4 ----
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 064093bf1adc..107ffe87808c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -20,12 +20,8 @@
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define DEFAULT_GUC_LOG_LEVEL		3
-#define DEFAULT_MAX_VFS			~0
-#define DEFAULT_MAX_VFS_STR		"unlimited"
 #else
 #define DEFAULT_GUC_LOG_LEVEL		1
-#define DEFAULT_MAX_VFS			0
-#define DEFAULT_MAX_VFS_STR		__stringify(DEFAULT_MAX_VFS)
 #endif
 
 #define DEFAULT_PROBE_DISPLAY		true
@@ -38,9 +34,6 @@ struct xe_modparam xe_modparam = {
 	.probe_display =	DEFAULT_PROBE_DISPLAY,
 	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		DEFAULT_FORCE_PROBE,
-#ifdef CONFIG_PCI_IOV
-	.max_vfs =		DEFAULT_MAX_VFS,
-#endif
 	.wedged_mode =		DEFAULT_WEDGED_MODE,
 	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
 	/* the rest are 0 by default */
@@ -86,8 +79,7 @@ MODULE_PARM_DESC(force_probe,
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
 		 "Limit number of Virtual Functions (VFs) that could be managed. "
-		 "(0=no VFs; N=allow up to N VFs "
-		 "[default=" DEFAULT_MAX_VFS_STR "])");
+		 "(0 = no VFs [default]; N = allow up to N VFs)");
 #endif
 
 module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc4c8e861a84..53d45779cbe9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -193,7 +193,6 @@ static const struct xe_device_desc adl_s_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
-	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -211,7 +210,6 @@ static const struct xe_device_desc adl_p_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
-	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -227,7 +225,6 @@ static const struct xe_device_desc adl_n_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
-	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
@@ -273,7 +270,6 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
-	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc dg2_desc = {
-- 
2.47.1

