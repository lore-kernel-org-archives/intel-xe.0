Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCADC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 08:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BBF10E7CD;
	Wed, 26 Jun 2024 08:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMK/GXWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750FB10E7C7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719391403; x=1750927403;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iTafsX4BtYes0Uikt/mKYwwsJC29/N66hug2NO0iKyw=;
 b=TMK/GXWsjnRO9GqjIJ47wm7/XtypXNf2vzdGhLwtLACBUI0zbcyxLidM
 c2HUdaomOdgkuZ5Zc8hwUSuOu3W/8tXfBsq0L2HXepSpXi2uyFQUb8UOm
 c3Zh/g89BRNI0nqHf46vRJ2EjIE9mx/UFGHIQ24QxdaRF9qG4DofBNW5I
 18Im+rKwZsIOBbtuS32e97EeKi5YS1coOIDXMhfwY0i9D0YOom419lV4Q
 6RvePHd2rOhPYzepeCWh7SvIqkxREeb2piv1/6YCBjzK4JiU8J69IYJIu
 8ACcNCNj8k3MA7qYNs/EP8YV0FH4HMqFbv4yJSrr6n7v46dH+y+20l/jf w==;
X-CSE-ConnectionGUID: N0pNtcAKSl6gX7F9pBYTkA==
X-CSE-MsgGUID: wQSM5qRiSUik5yaxhrxRCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33982792"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="33982792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 01:43:23 -0700
X-CSE-ConnectionGUID: CNJ4jIkgSES7bZrT+6iwiQ==
X-CSE-MsgGUID: wK4qQXZ+TruPdgWejkA0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48532647"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 01:43:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] HAX: Try SR-IOV on ADLP/ATSM
Date: Wed, 26 Jun 2024 10:43:04 +0200
Message-Id: <20240626084304.1345-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240626084304.1345-1-michal.wajdeczko@intel.com>
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
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

