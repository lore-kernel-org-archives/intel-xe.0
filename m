Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A44C2BD05
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 12:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF2310E409;
	Mon, 24 Jun 2024 12:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eW9dE3Pf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1D510E409
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719230533; x=1750766533;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qe5uXSrSl/ceSSesN4A6Ex3bU90qEFyMA4N8PCxdrNA=;
 b=eW9dE3Pf7cLtAmThZYtqJATzG7twqqcRzRNyUTwvXgQVrr52WW50VD6h
 A+m5sGg/KS71MAK1Sj/qLG23Wd96fy1nVAr5VKfeFV4YEpOBXUwnsxBZn
 d730GMFQYv8kughbj1+j5NMqjeXV2V44Xg7otj5y7cFx69KCPHBmvjBSU
 4+rehbl31ZWrPslF7TQztliPOZFF0ksvjKKLZWmAn0xcIUxgDcct6OgEE
 GgI18w30w1d8H2MqxpWDRLfXDzlO/pQefFoZaLJV6A9ZhloI8oZsD5eY9
 GVB+RDgbV81Sz1FaKKBga15eR1Gk9fdPeJAm/37chi+7j5d/Kn0RXkA4J A==;
X-CSE-ConnectionGUID: b5MIK2zkT0enaayefJjDuw==
X-CSE-MsgGUID: edwDYOOBTh6nK/Zk99lNmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16427193"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16427193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:02:12 -0700
X-CSE-ConnectionGUID: p80toL7wT2Oc2HDtlJG0WA==
X-CSE-MsgGUID: +yhntZ23Tl2Jo1x6Fo2xYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43956083"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:02:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] HAX: Try SR-IOV on ADLP/ATSM
Date: Mon, 24 Jun 2024 14:02:03 +0200
Message-Id: <20240624120203.1169-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

