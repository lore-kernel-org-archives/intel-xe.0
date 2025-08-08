Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC53C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E110E97C;
	Fri,  8 Aug 2025 17:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHrq+MZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4E510E1EB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAPlf+xeMdPuYWHCpTMr2ueBXV9OnYYdQt6yIoPa0dk=;
 b=UHrq+MZfKQk2Mu3HD1uWr0Xg3wRnFIVtD4qZ0OK/P/SvkDOVhIMc5gsM
 LpyopgSpCpImFK4h3IHiLrkp4bdZEcIxNppRZGwImRYB4e8OTORrldgj5
 mntI4z8LOFRGHWdnbplHZSErGU6xsSX2axWmX6ZKiskF/Oj8wzcTJqAJU
 u/QpLL2OYurhyOSMk7EXRCA8foz38t1NgyjAqXURT54JS7u9nAMIHBjPE
 KxNz3GsfVwLPAjEhNZpyvqGeZdnl0tlnn/Zu5mu6s4G3AkA7yXssbcPXw
 AnfSnNI6RjIcmFo/EJpPevWc9DOaQhQT/gnbYxrj/6dt7y1sBjFifwnwO g==;
X-CSE-ConnectionGUID: F6+NMo+wSIuB1CpsRmj/Kg==
X-CSE-MsgGUID: 3O2c2qRXQraSJYvxCShJZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109824"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: OX2RVUE4TQ+INONJK/h47A==
X-CSE-MsgGUID: 9tMZ45V6SaGSYrCCI0e7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387419"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 08/13] drm/xe/configfs: Use guard() for dev->lock
Date: Fri,  8 Aug 2025 10:29:51 -0700
Message-ID: <20250808-psmi-v3-8-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Instead of the manual lock()/unlock() pattern, use guard() which will
make things easier for handling errors or early returns.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8cf6b1375b7d4..4c2d4ff6a70f5 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitops.h>
 #include <linux/configfs.h>
+#include <linux/cleanup.h>
 #include <linux/find.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -164,9 +165,8 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	if (ret)
 		return ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.survivability_mode = survivability_mode;
-	mutex_unlock(&dev->lock);
 
 	return len;
 }
@@ -248,9 +248,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 		val |= mask;
 	}
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.engines_allowed = val;
-	mutex_unlock(&dev->lock);
 
 	return len;
 }
@@ -272,9 +271,8 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	if (ret)
 		return ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.enable_psmi = val;
-	mutex_unlock(&dev->lock);
 
 	return len;
 }
@@ -454,9 +452,8 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.survivability_mode = 0;
-	mutex_unlock(&dev->lock);
 
 	config_group_put(&dev->group);
 }

-- 
2.50.1

