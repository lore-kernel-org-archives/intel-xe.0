Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4302CCA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 22:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0C410E2A9;
	Mon,  5 Oct 2026 22:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEjsMlus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D2C10EEA4
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 22:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791238000; x=1822774000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRbX9FkOMRHKxYIUuwfjmLhmthSof2cp0rUtpHI9o8I=;
 b=NEjsMlusTBhi4nzvurNHYbLj4PhLqGtFKNGug+crkftGNCiUIxLPNKtB
 wcsLeMQJxpZOId3Ewao8zNckPBqwtPgeBCsid2BTbLRFXPVtoo/4pau9a
 fmEz+TyHpb7ZKROH4e2f+DmPIlbItPMtdSYUGrTpdvx3RqdxE5xDbmCrB
 RyAcFl1XnWdIerqNb3iwg3pdPFTlHCjzdGKaldXVUBCi3mciJFqgZy0Y5
 /opbwPPC48f62O9evkyNgd8byaWaOutIq/Y9wkELGyMkpPyCvhpzaA5fz
 4HDzg2uiKYanAx97GhihdJMo7EfcYPo7GxO//5Ico9WydYjIwaCGReSm1 Q==;
X-CSE-ConnectionGUID: NNE7xacUQ8OR7COxpISJng==
X-CSE-MsgGUID: 5Dfe+xIhRbim4lJQUUIJcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="109410166"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="109410166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
X-CSE-ConnectionGUID: QChu0ObISx+/bFp9ekRSqg==
X-CSE-MsgGUID: v3ILZWTITYKpJS3nojJcVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274732153"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/15] drm/xe: Guard configfs attribute reads in getters
Date: Mon,  5 Oct 2026 22:06:37 +0000
Message-ID: <20261005220636.602826-18-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005220636.602826-17-stuart.summers@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
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

The configfs getters read dev->config members without holding dev->lock,
so a concurrent store can tear the value being returned. The store paths
and a few of the getters already take the lock; make it consistent by
wrapping every read of dev->config in the getters with a scoped_guard(),
covering the surrounding checks that consume those values as well.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index ad4bfd3c0703..e1cf5af958bc 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1282,7 +1282,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.survivability_mode;
 
-	mode = dev->config.survivability_mode;
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -1296,7 +1297,8 @@ static u64 get_gt_types_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.gt_types_allowed;
 
-	mask = dev->config.gt_types_allowed;
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
 	config_group_put(&dev->group);
 
 	return mask;
@@ -1340,7 +1342,8 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.engines_allowed;
 
-	engines_allowed = dev->config.engines_allowed;
+	scoped_guard(mutex, &dev->lock)
+		engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
 
 	return engines_allowed;
@@ -1360,7 +1363,8 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	ret = dev->config.enable_psmi;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1381,7 +1385,8 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	if (!dev)
 		return true;
 
-	ret = dev->config.enable_multi_queue;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1421,7 +1426,8 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.disable_vram_page_offline;
 
-	ret = dev->config.disable_vram_page_offline;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.disable_vram_page_offline;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1445,10 +1451,12 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 	if (!dev)
 		return 0;
 
-	if (cs)
-		*cs = dev->config.ctx_restore_mid_bb[class].cs;
+	scoped_guard(mutex, &dev->lock) {
+		if (cs)
+			*cs = dev->config.ctx_restore_mid_bb[class].cs;
 
-	len = dev->config.ctx_restore_mid_bb[class].len;
+		len = dev->config.ctx_restore_mid_bb[class].len;
+	}
 	config_group_put(&dev->group);
 
 	return len;
@@ -1472,8 +1480,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	if (!dev)
 		return 0;
 
-	*cs = dev->config.ctx_restore_post_bb[class].cs;
-	len = dev->config.ctx_restore_post_bb[class].len;
+	scoped_guard(mutex, &dev->lock) {
+		*cs = dev->config.ctx_restore_post_bb[class].cs;
+		len = dev->config.ctx_restore_post_bb[class].len;
+	}
 	config_group_put(&dev->group);
 
 	return len;
-- 
2.43.0

