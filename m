Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F44CC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C110E629;
	Tue, 15 Jul 2025 18:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngw0ubLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16B10E629
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603295; x=1784139295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+X+7Jt0Pmg4fl0aA6t6wI0y1xhY2Ltpf6raRXowVIZc=;
 b=ngw0ubLVJ0Bm0Ez81ppN1/5jEJEzGUQzYggN1DFeZqRvl/GZfKKS98/M
 n2ivCdn3BxhgS8Q0vDLABN3/wRXrIIDtQsJX2Kh+RhKDYyPOgIhS/GLN0
 9FWo1NSqVvXttPkIEAyDXjcG+mOV5xhr5nVitbJYk2SDiGgJlYDVyjRED
 YzGlSY7BVNZDAhomLSsPikAL+BeSJPISVxQI5EdxyQ4/u/oF6lV9egVL6
 UhpsqUPU02Kv30bKycsQOaxk2XwvDndDNKoFTapZC6X3OrIR/li6wNIxq
 1JM78sOLqTOcFq2Mkfr8pOQFHM8xG/yNz5jJTcyX7r3csU2kIYhqy6041 A==;
X-CSE-ConnectionGUID: YFLUWaM3QQqlxV1y4wIXbg==
X-CSE-MsgGUID: x+YnPNyuR0Kqu6oVjB7GNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65406516"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65406516"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:55 -0700
X-CSE-ConnectionGUID: GxNS5oCjQw6UUft4tRRjCw==
X-CSE-MsgGUID: i1LtvJFpRNSb2kjHehLFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162845991"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
Date: Tue, 15 Jul 2025 20:14:18 +0200
Message-Id: <20250715181419.807-5-michal.wajdeczko@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240711192320.1198-3-michal.wajdeczko@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
[michal] rebased, for drm-xe/topic/xe-for-CI
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 53d45779cbe9..dc4c8e861a84 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -193,6 +193,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -210,6 +211,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -225,6 +227,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
@@ -270,6 +273,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc dg2_desc = {
-- 
2.47.1

