Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F1C87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EEA10E312;
	Sun, 27 Jul 2025 17:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qz0d6LS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A9310E317
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636827; x=1785172827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wojYxNNKKLum7u3eLFSeBavyi1oIrs2zYj+A/sMX/+Q=;
 b=Qz0d6LS4HOYOFEWDNhkD/KsObICE7GWIxXuaA/JKf1z/WZrbkoPa4Wbu
 FT11si7rwpcy6hL5biU/Idnl1u+TfTBkE9rJp7GKyrunLNBx5DMsHj08g
 vCO/nxT4Om3Fy8TRyWfzekrBCr/fhrIweyildJ0Gf8QhcM00hgsIhmpPZ
 gIY+tI8os0QetG9hZChO80bCnXRPtG7ZaWG5fhKWRqMYWoVQz/yLukta+
 FA2CWn/M3zh75maiMBkoM8JgETVLswOlNJyRFbEyyidEg075knk1BPVTo
 LvkwnenVeb0K0evsHz9FD1GpE/j0D9NPh6jICxoacRItHV1Xh5tChj38D Q==;
X-CSE-ConnectionGUID: FtsA7k36TD6mUTw1z1i6FA==
X-CSE-MsgGUID: uO9CVBQKT/OIldUYQTrEOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046731"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:27 -0700
X-CSE-ConnectionGUID: hgR3pDHrTJ2Eu+dp7rpdeQ==
X-CSE-MsgGUID: xwHhCg4qRZaLB7iyNj4bDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556834"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 06/11] drm/xe/configfs: Rename configfs_find_group() helper
Date: Sun, 27 Jul 2025 19:20:03 +0200
Message-ID: <20250727172009.587-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_configfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index edd52b8f0543..f5a780b8bb80 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -305,7 +305,7 @@ static struct configfs_subsystem xe_configfs = {
 	},
 };
 
-static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
+static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev)
 {
 	guard(mutex)(&xe_configfs.su_mutex);
 	struct config_item *item;
@@ -328,14 +328,14 @@ static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
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
@@ -349,7 +349,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
  */
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_group_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
 
 	if (!dev)
 		return;
@@ -357,7 +357,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	scoped_guard(mutex, &xe_configfs.su_mutex)
 		dev->survivability_mode = 0;
 
-	config_item_put(&dev->group.cg_item);
+	config_group_put(&dev->group);
 }
 
 /**
@@ -371,14 +371,14 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
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

