Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AED9C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37010E563;
	Tue, 28 Nov 2023 15:04:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3343D10E565
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701183858; x=1732719858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okyy6jv0G6cnthlxH+LR4kk+Y9qkSb7oRbW6JOoz1Sc=;
 b=f7jGAcngHdfEBhn2+3ZDDucT1Cg6onBz3gqcy2SqzvRgGkGZ4kNH3/ov
 F2z+K0daV0JrBoItus2k9UCkQKGGNNCci1iMauCLD3e3Lc4W472+uOv2+
 cpDo8aPmXraw1EoT1bF/U48x9yRqIC97Q2TaofCejlPe71RsMqn3/Gwlp
 slW3fEQi73JGtDOyvxCvdpWMYY1U4uO696S39wDS1T2Hrevc1qOVcK76/
 7lngANKR6WTaC/4wW4J386TroHJyb2a/XWIs/n7E/xoSrAeAAM3JwYspy
 Vp+Rx++ZqfPQueWyUkxIbkLU6dKdcC1UZonwOS48J0ujytJJOIFktsHDo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395757868"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="395757868"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892096582"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892096582"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga004.jf.intel.com with ESMTP; 28 Nov 2023 07:04:12 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 20:43:31 +0530
Message-Id: <20231128151333.4068550-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 1/3] drm/xe: Track if platform has csc uid
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

Some platforms, like ATS-M has CSC firmware calculated unique
device id. This flag will help to identify if platform has it.

V2:
  - Rebase to resolve pre-merge conflict

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2712905c7a91..268a40639ec5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -264,6 +264,8 @@ struct xe_device {
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @has_csc_uid: device has CSC FW calculated uid, used for generating uuid */
+		u8 has_csc_uid:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cb762c11dd0f..cf4f7de5b04e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -61,6 +61,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 
 	u8 has_llc:1;
+	u8 has_csc_uid:1;
 	u8 has_sriov:1;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
@@ -300,6 +301,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_csc_uid = true,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -579,6 +581,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_csc_uid = desc->has_csc_uid;
 	xe->info.has_sriov = desc->has_sriov;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
-- 
2.25.1

