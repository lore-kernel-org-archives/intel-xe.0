Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2ACC56208
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 23:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAE610F037;
	Wed,  5 Aug 2026 23:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GW7l96AG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837DF10E1CB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 23:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785972024; x=1817508024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dq7oskvSkw5mVDEOlEBRDzazw4GdH7q01OQNdPb/fhk=;
 b=GW7l96AGh6Z5slTGvE2erpKfeOwFo24BrNzacAc/31AYr17uebK+EKxV
 FQ98GBEQTx+vQXRAgWfDCLLt0XmzSiM6iSLFWHR/Q7xx2UT1w43LAuGlX
 7yrLQM75XL5T6bRhSQU5KwehGB6whpaccXQY954zzWOlWyUtD6wDiV2MI
 qk7/YmxlHfDR+FA7KBdrpjHnf0Rdywp44wKIRp29uFtHgOtxOeDbUwp/K
 e5YxuD/BwmLhGQLoNiU4kP0Hz0y41BtvUjtmyHLUtYPZZoVZoTrTioXb5
 IU3RJrZcSV4LpGBeb72aZNp1D1/KAEOPE4zpVvuJlI/lLszvvB3NkiAr3 Q==;
X-CSE-ConnectionGUID: hJfIuuDyQ/+yD2IPGuAAPA==
X-CSE-MsgGUID: SK8FzqHURc6ZdjiNgxAKZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97206420"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="97206420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:20:24 -0700
X-CSE-ConnectionGUID: TrUX5OpdTd6nxwR84R0jBw==
X-CSE-MsgGUID: Mqz2Q0g2Sjyh+LFfGUwyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="261395855"
Received: from dut4475arls.fm.intel.com ([10.105.10.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:20:24 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/10] drm/xe: Guard configfs attribute reads in getters
Date: Wed,  5 Aug 2026 23:20:22 +0000
Message-ID: <20260805232021.337103-13-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805232021.337103-12-stuart.summers@intel.com>
References: <20260805232021.337103-12-stuart.summers@intel.com>
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
Assisted-by: Copilot:claude-opus-5
---
 drivers/gpu/drm/xe/xe_configfs.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..0a85043a9dd0 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1185,7 +1185,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.survivability_mode;
 
-	mode = dev->config.survivability_mode;
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -1199,7 +1200,8 @@ static u64 get_gt_types_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.gt_types_allowed;
 
-	mask = dev->config.gt_types_allowed;
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
 	config_group_put(&dev->group);
 
 	return mask;
@@ -1243,7 +1245,8 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.engines_allowed;
 
-	engines_allowed = dev->config.engines_allowed;
+	scoped_guard(mutex, &dev->lock)
+		engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
 
 	return engines_allowed;
@@ -1263,7 +1266,8 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	ret = dev->config.enable_psmi;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1284,7 +1288,8 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	if (!dev)
 		return true;
 
-	ret = dev->config.enable_multi_queue;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1308,10 +1313,12 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
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
@@ -1335,8 +1342,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
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

