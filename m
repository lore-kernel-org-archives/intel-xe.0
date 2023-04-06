Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C40C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE9D10E36C;
	Thu,  6 Apr 2023 20:18:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA3F10E36C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680812332; x=1712348332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQG63e7z2f04YksBW/M0kAAeRvGzeCK8O8O7II4waCg=;
 b=Astj/ZrpTIjhZD3XIKmiw9C7Y6sjpIefYNQ8fL+eX6czXLkBPGhMcKfQ
 zWADS8DDEqb1HUVTzT2PNuktmi421H86rCyyFc4seMr/OhbUL/Pid4xjI
 5Hzv3J5pImHsh0/Ni3alg5NAEWxJ7tV+/enj7pOT/UVjtoA1qxLEW3m2w
 c4eeuQl3kGbXRJDtiR1nkS56i3pLgxk7wDKLjMdna9UaUuRbaV1o+/1O0
 aVZ3DOWx7nlYBanUkwHDEw8tPwT4PhiUrkAHJN6iZlO2Q1nf9ZBut6JYQ
 g5LGRfdGlmVNldN4vXXgJI2SWv9+tNhDV6c0gFhwr2wCvWAQycD6utPyZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322482249"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322482249"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751775465"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="751775465"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:18:38 -0700
Message-Id: <20230406201845.1797532-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406201845.1797532-1-matthew.d.roper@intel.com>
References: <20230406201845.1797532-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/9] drm/xe: Set require_force_probe in each
 platform's description
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Set require_force_probe explicitly in each platform's description
structure rather than embedding it within the FOO_FEATURES macros.  Even
though we expect all platforms currently supported by the Xe driver to
be under force_probe protection, this will help prepare for some other
upcoming restructuring.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d9d91eda9ee4..658c664fcf72 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -134,7 +134,6 @@ static const struct xe_media_desc media_xelpmp = {
 
 /* Keep in gen based order, and chronological order within a gen */
 #define GEN12_FEATURES \
-	.require_force_probe = true, \
 	.dma_mask_size = 39, \
 	.max_tiles = 1, \
 	.vm_max_level = 3, \
@@ -145,6 +144,7 @@ static const struct xe_device_desc tgl_desc = {
 	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_TIGERLAKE),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -156,6 +156,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -169,6 +170,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_P),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -188,6 +190,7 @@ static const struct xe_device_desc dg1_desc = {
 	GEN12_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -195,7 +198,6 @@ static const struct xe_device_desc dg1_desc = {
 };
 
 #define XE_HP_FEATURES \
-	.require_force_probe = true, \
 	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
@@ -221,13 +223,13 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
 		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3), \
-	.require_force_probe = true, \
 	.vram_flags = XE_VRAM_FLAGS_NEED64K, \
 	.has_4tile = 1
 
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.require_force_probe = true,
 	XE_HP_FEATURES,
 
 	DG2_FEATURES,
@@ -236,6 +238,7 @@ static const struct xe_device_desc ats_m_desc = {
 static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.require_force_probe = true,
 	XE_HP_FEATURES,
 
 	DG2_FEATURES,
@@ -267,6 +270,7 @@ static const struct xe_device_desc pvc_desc = {
 	XE_HP_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
+	.require_force_probe = true,
 	.extra_gts = pvc_gts,
 	.has_flat_ccs = 0,
 	.platform_engine_mask = PVC_ENGINES,
-- 
2.39.2

