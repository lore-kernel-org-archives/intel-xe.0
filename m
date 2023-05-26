Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F4C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3390B10E800;
	Fri, 26 May 2023 17:10:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEEE10E1DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685121053; x=1716657053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MeBLJE+XGShv9JMewC3bNiKKd/kSfX11gFoTf8Ph8y0=;
 b=JcroCE3SMS0KVYpvvPb5aC9mnhsrlMUVJ/FUs4ygQG3nrExXMxvCN+uT
 r2JrNG/b+D8lzhN8/wAkg31F34hzey5IIj6y96V8azuyo69qdblUQBNiO
 nevoyKLs8uO8Sv02uimpFsBAo2bm6+aIofaq9JPmPMCYyoud0SYPh9yks
 5lwjVU2KSz0PKcpUSAPp4qnb7N94Pn4h+ZPHfxd9B84Xe4V9TvoENq5MW
 f2v7x/ewx6mVX9NgQFY/gUb5mVt4QAxfUs/jgUaTGMxYKZNgRt1n+FSHO
 6TT1dFZbILnEaOUAVNfHfuF/xvpWpG+ZLNBP48lRrz73GSm16n6QyTbjT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353094992"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353094992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879603454"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879603454"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:43 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 10:12:02 -0700
Message-Id: <20230526171204.2754550-5-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe/rpls: Add RPLS Support
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add RPLS support that was missing apart from the PCI IDs.

v2: s/RPLS/RAPTORLAKE_S (Anusha)

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)
---
 drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 33027091cc30..0d1dff5896af 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -194,6 +194,8 @@ static const struct xe_device_desc rkl_desc = {
 	.require_force_probe = true,
 };
 
+static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
+
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -201,6 +203,10 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
+		{},
+	},
 };
 
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
@@ -339,6 +345,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
 	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index cb50e9b77816..c12ae7243f9f 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -27,6 +27,7 @@ enum xe_subplatform {
 	XE_SUBPLATFORM_UNINITIALIZED = 0,
 	XE_SUBPLATFORM_NONE,
 	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
+	XE_SUBPLATFORM_ALDERLAKE_S_RPLS,
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
-- 
2.25.1

