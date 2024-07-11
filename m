Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8537EC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0310E959;
	Thu, 11 Jul 2024 19:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6nqN8TR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADA810E2F4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720725815; x=1752261815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6GzuwuX2CMTdcQSs1ZyKQZCce4YEAkJYE3veXzuN7U=;
 b=M6nqN8TRsHaQRBXAoqzqfDl2tYIWBzwJoQiT1vRuGHzodWzCKWCdigBP
 7JBKQUaESVWQvG4Si6A0JCKuFN1Y0ENRznvho7nklfAHdedwlwvUqU9Rd
 RXN+Z4z7/agpGH7VHsvB0thvljIaEibpV+I1TsNd91WCTl6hnIKG7duqk
 OQfM1gPhsOPywHr7Wd9yyVZd19kyRQnBXNCNyd1GMTi+DaWv71BYQ7ZF3
 fvuqv1WA9DNxQGKyzmRbWqs74xeKQstFRwANguuTY0ETjZ2BZ7+eSGQbD
 DCy8Xq5nJiJF3VnpGVV81Ey6XGkDktPFuCwZWyfWA7b0KQsxsq/EKf/CP w==;
X-CSE-ConnectionGUID: SXOPgZgdTfaaKSxMIOfuYQ==
X-CSE-MsgGUID: 1lIhY2T+Qem3ncIrjC+RWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28808972"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28808972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:23:35 -0700
X-CSE-ConnectionGUID: HL+A9QFoTTCdEEi0Kj6rlw==
X-CSE-MsgGUID: xZnad1XOR8eHrhD60EAMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79790286"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:23:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Enable SR-IOV for ADL/ATSM
Date: Thu, 11 Jul 2024 21:23:20 +0200
Message-Id: <20240711192320.1198-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240711192320.1198-1-michal.wajdeczko@intel.com>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
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

We should now have sufficient changes in the Xe driver changes to
run it on ADL and ATSM platforms in the PF mode, to configure VFs
and successfully probe driver on the enabled VF devices.

While some more changes are likely still needed to fix all corner
cases, we will not find them without running any tests. To start
testing this feature by the CI, we need to mark which platforms
have basic SR-IOV support and let the driver run in the PF mode.

Since this feature support is still in the early testing stage,
make all enabling available only for CONFIG_DRM_XE_DEBUG=y and
keep it on CI topic branch.

Note that from this point, on selected platforms, the Xe driver
will be acting as a PF driver, will some SR-IOV specific changes
compared to running in the non-virtualized (native) mode.

However, those specific changes are visible mostly on the debugfs,
and should not impact normal driver execution, unless VFs will be
manually provisioned or explicitly enabled.

Once we finish adding the remaining SR-IOV tests to the CI and fix
any issues that we find in the meantime, we will replace this patch
with proper series outside the topic branch.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/600604/?series=135296&rev=1
---
This patch is for drm-xe/topic/xe-for-CI
---
 drivers/gpu/drm/xe/xe_module.c | 3 +++
 drivers/gpu/drm/xe/xe_pci.c    | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 499540add465..7bb99e451fcc 100644
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
index 53b67f39c7d5..7326a33030d4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -241,6 +241,7 @@ static const struct xe_device_desc adl_s_desc = {
 	PLATFORM(ALDERLAKE_S),
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
@@ -256,6 +257,7 @@ static const struct xe_device_desc adl_p_desc = {
 	PLATFORM(ALDERLAKE_P),
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
@@ -269,6 +271,7 @@ static const struct xe_device_desc adl_n_desc = {
 	PLATFORM(ALDERLAKE_N),
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.require_force_probe = true,
 };
 
@@ -307,6 +310,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc dg2_desc = {
-- 
2.43.0

