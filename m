Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B47ACA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A614E10E1F6;
	Mon,  5 Oct 2026 19:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQc5bukC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C1C10E5F5
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227175; x=1822763175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRbX9FkOMRHKxYIUuwfjmLhmthSof2cp0rUtpHI9o8I=;
 b=QQc5bukCk/OzXHcIAOqfF9Bv2YdFlgwgc5DcW+WzXlvwYCnZHo2OIlEw
 7kys9JnPWbYGaDbPBXFgqUzavEHsEUTDC9ka2W3OQaqF3/ENVIaiZ97eJ
 MC+RZRnCt35tNVhbuj1IIN5FTVSfmXW7ky+tcDjjBFrUJZ6iNmJr9phPm
 GVzW3yhGMAxsxr6NT8deum+NeDnjwXszH3MnVD928COHsxdZx+9OUo0Dk
 qsNh/3fY2rOaIsauDXWDQXVAIhCPZWpaLVKxo6XBcu0/9PRm7yndZLX48
 dxI9mHKb/wkil7MBQSHymwIbH4efIVhm1EMWWmaWj/bnWaCYGE6Uri9Oi Q==;
X-CSE-ConnectionGUID: fH9PxyvdSIKf4kq+BSPmNw==
X-CSE-MsgGUID: G3exNAuLRn+aALJ62C6lwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578416"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578416"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:14 -0700
X-CSE-ConnectionGUID: nj3W2cy8Sv6xUaut4irKSA==
X-CSE-MsgGUID: KzkzmZyvSRu0yH1G/6xJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690855"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:15 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/15] drm/xe: Guard configfs attribute reads in getters
Date: Mon,  5 Oct 2026 19:06:11 +0000
Message-ID: <20261005190611.332940-18-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
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

