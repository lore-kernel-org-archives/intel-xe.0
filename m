Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E200C3271E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 13:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694CB10EAE3;
	Thu,  4 Jul 2024 13:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4wwmVrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA79110EAE3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720098315; x=1751634315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f6GzuwuX2CMTdcQSs1ZyKQZCce4YEAkJYE3veXzuN7U=;
 b=C4wwmVrhZuQa0s7q78uG3GfkBgSlDW1lfFzv3wpT5Y498EIydRgvouX5
 aUY0mzQMxnm6/QhP7I++edemoLY2tcEYTZPOULTG4U+RPFuiMCKHuWDOa
 AFdjy1X5mAx4rDzvM31J8QVHOPePfr1/n5iWzkNuO6nk7V/j04H6tyFvh
 WFFkb6D7sasahgdr8aTct3b/fhAZzQoOH5dvX0UUHCdyh6xqRzuj56dtK
 5IhEX2Hzaf28haylBfbJhiROCtMkx8I0/qzl1mayipb33HzVm17wSl5cm
 v/N4oRCWUs3EEAjZ9UY5HFZQq9lUoUZIjNXoNcXRE5XQqBcJllgxFiO3C w==;
X-CSE-ConnectionGUID: ifx7BHuLR1WLDWsI7bbjGA==
X-CSE-MsgGUID: 9TG+/my3Q6agj/aegUNbEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28523794"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28523794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 06:05:13 -0700
X-CSE-ConnectionGUID: bndx5crUTRWCHxgpNIBiog==
X-CSE-MsgGUID: Y4Xp3LdcRuO+hn5uLSUeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51553856"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 06:05:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Enable SR-IOV for ADL/ATSM
Date: Thu,  4 Jul 2024 15:04:15 +0200
Message-Id: <20240704130415.1066-1-michal.wajdeczko@intel.com>
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

