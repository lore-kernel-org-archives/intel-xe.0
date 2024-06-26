Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8267DC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 11:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3554210E84F;
	Wed, 26 Jun 2024 11:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hj1ZM5oU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DCD10E841
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719400721; x=1750936721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UrUOiKpz6ELICQzkiLDUhksgTkCx2dQlmM7gGY5sgls=;
 b=hj1ZM5oU1H0s3YmfxiTRVZBpaoJK5O7W/NxxAtSD1o5Rl95C3sevxV72
 m3oBFqBNkFxwus5WBviZb+Zm568ca+lOZn/DQG054szJvyvywTekcnAsP
 7pnt/G8hE9duWUWpGWumCNSz0NHDTZJmHskS31KvrnyNMWEvnT68sJeQr
 ZMnHLwZh9zw0aP2STF7O7zgghCPsXCIyTVVI+3pBqVhsSD3AMDQefoEoz
 lRfkV1ZDkbwxE9sJHubwg4K5kMSa8/4r/sjNKkWxGKXIS9JCknkvAc/SZ
 HKPxbR7IW0WmRNIW70zF4Jn10Vxpk7dHxtTqp/MbRyvF+5q96xucbXlwx g==;
X-CSE-ConnectionGUID: 36XKMSUPSWS8NkJPSkOh1A==
X-CSE-MsgGUID: bV6iNdgaRqKG1BYO7an5kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16149288"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16149288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:18:41 -0700
X-CSE-ConnectionGUID: NFT5NSwdQw2rmSepNy787Q==
X-CSE-MsgGUID: K2CshlX3TleybFVBoINBcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="81510198"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:18:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] HAX: Try SR-IOV on ADLP/ATSM
Date: Wed, 26 Jun 2024 13:18:27 +0200
Message-Id: <20240626111827.1389-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240626111827.1389-1-michal.wajdeczko@intel.com>
References: <20240626111827.1389-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_module.c | 3 +++
 drivers/gpu/drm/xe/xe_pci.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 893858a2eea0..66d1089f6021 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -18,6 +18,9 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+#ifdef CONFIG_PCI_IOV
+	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
+#endif
 	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4b91a9878f41..cdc2f630194b 100644
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

