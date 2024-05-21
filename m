Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13524C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA7B10E876;
	Tue, 21 May 2024 14:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUVSBzyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879CF10EB36
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716301394; x=1747837394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFIuTpAV4keBT/V5HrJW5Ox/OOMVH2tEMQJH6bUwl1Y=;
 b=FUVSBzyRDdFf3uUbwfydUHrubIlVc9RM0RwBzOfbKCwdh4ouauYoH4yA
 RrDEljudoQRCfrVUL1WEaY1kjwA8Z3QWRN58QVKfsSYXweO0AYEBT3yEb
 IH+9BlyoO1c2IPD9Howr7A8HzeFETR7EC/Md00Air52XkH8immb1B1pK2
 Zyp5EyI61cjHgKq3ODrz0RpAV5m/egB/RTXt9pyzo5an8NjpVBEpeAbMg
 VBaEcDM5b5MeBHSb58IYrWmY+S1/KlRFhN6Vmbu3uws7CHBMuEpu4BPw8
 Ctpj+kaAoqf1ac0LtBegEpTRwZV5ks528uGUr+08uE+CXOMcLLXYJARyx g==;
X-CSE-ConnectionGUID: GyxrBR7AQs+fjuxXGJOPjw==
X-CSE-MsgGUID: oJNHy0IYRe6wm6p4SXiskw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23075833"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23075833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:14 -0700
X-CSE-ConnectionGUID: QQcIlnvaQ9uB66BHZHSfMA==
X-CSE-MsgGUID: V1M1vM/5Rp6poZQAPxEenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37711480"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/3] drm/xe: Drop undesired prefix from the platform name
Date: Tue, 21 May 2024 16:22:56 +0200
Message-Id: <20240521142257.756-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521142257.756-1-michal.wajdeczko@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
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

We don't have to use exact names of the enumerators as the
potentially user-facing platform names. When constructing
platform descriptor fields, use the unique platform tag and
add the XE_ prefix only to the generated enum field.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b30fe4849038..34ff997439f0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -75,7 +75,7 @@ __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 #define PLATFORM(x)		\
-	.platform = (x),	\
+	.platform = XE_##x,	\
 	.platform_name = #x
 
 #define NOP(x)	x
@@ -222,7 +222,7 @@ static const struct xe_media_desc media_xe2 = {
 static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
-	PLATFORM(XE_TIGERLAKE),
+	PLATFORM(TIGERLAKE),
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -231,7 +231,7 @@ static const struct xe_device_desc tgl_desc = {
 static const struct xe_device_desc rkl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
-	PLATFORM(XE_ROCKETLAKE),
+	PLATFORM(ROCKETLAKE),
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -242,7 +242,7 @@ static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
-	PLATFORM(XE_ALDERLAKE_S),
+	PLATFORM(ALDERLAKE_S),
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -257,7 +257,7 @@ static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
 static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
-	PLATFORM(XE_ALDERLAKE_P),
+	PLATFORM(ALDERLAKE_P),
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -270,7 +270,7 @@ static const struct xe_device_desc adl_p_desc = {
 static const struct xe_device_desc adl_n_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
-	PLATFORM(XE_ALDERLAKE_N),
+	PLATFORM(ALDERLAKE_N),
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -283,7 +283,7 @@ static const struct xe_device_desc dg1_desc = {
 	.graphics = &graphics_xelpp,
 	.media = &media_xem,
 	DGFX_FEATURES,
-	PLATFORM(XE_DG1),
+	PLATFORM(DG1),
 	.has_display = true,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -295,7 +295,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
-	PLATFORM(XE_DG2), \
+	PLATFORM(DG2), \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
@@ -325,7 +325,7 @@ static const struct xe_device_desc dg2_desc = {
 static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
-	PLATFORM(XE_PVC),
+	PLATFORM(PVC),
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -334,19 +334,19 @@ static const struct xe_device_desc pvc_desc = {
 static const struct xe_device_desc mtl_desc = {
 	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
-	PLATFORM(XE_METEORLAKE),
+	PLATFORM(METEORLAKE),
 	.has_display = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
-	PLATFORM(XE_LUNARLAKE),
+	PLATFORM(LUNARLAKE),
 	.has_display = true,
 	.require_force_probe = true,
 };
 
 static const struct xe_device_desc bmg_desc __maybe_unused = {
 	DGFX_FEATURES,
-	PLATFORM(XE_BATTLEMAGE),
+	PLATFORM(BATTLEMAGE),
 	.has_display = true,
 	.require_force_probe = true,
 };
-- 
2.43.0

