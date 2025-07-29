Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8CBC87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9733010E619;
	Tue, 29 Jul 2025 11:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyUgFX2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B7F10E61D
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789357; x=1785325357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AfgNS1ktiGrwE8snqqCoPjmJDoPQNj69Srn+bNaiua0=;
 b=CyUgFX2yT5MpfxhGQlb8OdIGMSQJy3mDl80Zb2Ycw5hdjozgLeI+2s51
 M5lTZ/0opICucXyj4FCIXW4SCTnj5DaOITi0esv2KmQDeI2lYQ4LDM+6n
 klSZsVxXNfF0cmD0qMYw5N9+6Gs21GKpfjij7pwpKuO+pqwxnrS8O+JX/
 USYKLI/471yrAwBQ43So/J1sqS7bKSbG/Xx78Is9k4/1sr7UEQo3YaxOp
 kCmmfnpeNT+zTGmCpO4Os4vtdeMjCYd55LnvUsihulPFbVYwCLCZpQX2+
 TZOZjVizBBStaKxh4OSXy7rNtMTBzzH4ZQ/XMxNj17yrGLO3ofO+Pdg4T A==;
X-CSE-ConnectionGUID: qOwisZk0Q0iy7cE3Ve6+OQ==
X-CSE-MsgGUID: zqh7MIrKRD+l5Q77bGOcKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755588"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:36 -0700
X-CSE-ConnectionGUID: 3osHAzuxQUmrRxxr3CONSg==
X-CSE-MsgGUID: Wia6f0gfQ3m5V3dEFmfl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946920"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 06/11] drm/xe/configfs: Rename configfs_find_group() helper
Date: Tue, 29 Jul 2025 13:42:10 +0200
Message-ID: <20250729114215.177586-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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

This helper name shouldn't suggest that it iss a part of the core
configfs API family. While around switch to use different helper
to release a reference.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index d69b5f248e59..acdee616d118 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -309,7 +309,7 @@ static struct configfs_subsystem xe_configfs = {
 	},
 };
 
-static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
+static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev)
 {
 	struct config_item *item;
 
@@ -334,14 +334,14 @@ static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
  */
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_group_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
 	bool mode;
 
 	if (!dev)
 		return false;
 
 	mode = dev->survivability_mode;
-	config_item_put(&dev->group.cg_item);
+	config_group_put(&dev->group);
 
 	return mode;
 }
@@ -355,7 +355,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
  */
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_group_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
 
 	if (!dev)
 		return;
@@ -364,7 +364,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	dev->survivability_mode = 0;
 	mutex_unlock(&dev->lock);
 
-	config_item_put(&dev->group.cg_item);
+	config_group_put(&dev->group);
 }
 
 /**
@@ -378,14 +378,14 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
  */
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 {
-	struct xe_config_group_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
 	u64 engines_allowed;
 
 	if (!dev)
 		return U64_MAX;
 
 	engines_allowed = dev->engines_allowed;
-	config_item_put(&dev->group.cg_item);
+	config_group_put(&dev->group);
 
 	return engines_allowed;
 }
-- 
2.47.1

