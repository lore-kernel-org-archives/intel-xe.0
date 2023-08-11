Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE5C04A94
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4532510E6B2;
	Fri, 11 Aug 2023 16:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEE710E6B1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nww0CA0eKopXWDgwdARG7FOS6Qc1hFIJZQpps6eD4bE=;
 b=k6EY8SrdExw2uSzAh1V5pfxi6KEID6fJmX0RCf/nt2DAUAYkG1BRQgZu
 FsiAFZ1GRVtng1nShXZ3Q6GW4+1lwpYTwykerTOdKb6A4M+uq1xtbQYfF
 PHimSvirfRwT4rD77ujxl6DLLf/oaUgBzllvMgP37BNH+VfLoz73zYkG1
 VaLN2SqwCwu761+TpwecnHmJvPBt9ssZxjkG6pqXKQPhqAl+f1LTdQN/C
 ZqGvm0OcyXhbEbW38zAzItM5RB2lw3+taHzraroJB3iNt3A4WxcbMeLnO
 gQu75w+mf7T3/dhrw27ppuzmCueuvLI+ZpN8ISheG+pNBefi4u4RgkPYw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044336"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300478"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300478"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:16 -0700
Message-Id: <20230811160618.477297-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/15] drm/xe/lnl: Add LNL platform definition
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

LNL is an integrated GPU based on the Xe2 architecture.

Bspec: 70821
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 include/drm/xe_pciids.h                | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 70d5f25c0d208..5e3ffe76cc460 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -342,6 +342,12 @@ static const struct xe_device_desc mtl_desc = {
 	.has_display = true,
 };
 
+static const struct xe_device_desc lnl_desc = {
+	PLATFORM(XE_LUNARLAKE),
+	.has_4tile = true,
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -382,6 +388,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
+	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index abbb8a1f29a8e..e378a64a0f863 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -21,6 +21,7 @@ enum xe_platform {
 	XE_DG2,
 	XE_PVC,
 	XE_METEORLAKE,
+	XE_LUNARLAKE,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 43afd973e153b..29f07a00ac0fd 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -207,4 +207,9 @@
 	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
 	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
 
+#define XE_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)
+
 #endif
-- 
2.40.1

