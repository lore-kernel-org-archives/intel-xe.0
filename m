Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D655CC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED50112BFB;
	Mon, 29 Apr 2024 12:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKttIh4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03D7112BF8
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392948; x=1745928948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sTwhIt5ooJPXXIsrZoPvHLYjQJOt/8wk+G9YJM/9T/I=;
 b=QKttIh4Qwz5sfGU7r/yWI7XL5wTyqrXc165cgrqGwfEuxwcXKLWebAKw
 2aHz+eaaKDKIMxI/9UF/i5t+KRMAhRxNEmRZ8rBJ42v3eVc5Q3Yj9BgfK
 gtXUXJ+OeL0KXI4riZ/bX1LMteV/bQo5qgH0XUXliRw89eIRafWjG11Pz
 semjC9daG3+PjR31PDHjvgw2CdvkT/T5Vf8xJq/qICtzFPH+cmW30Lqmp
 IklYDONg9VYnFPVwwUGyKfR55Ag8eCUOralE7phNHNtVlGYl8DLqHznBy
 Zni4/twK+tIGJgcAdSWI9MB/cxdhoFieZXVJMqqHgi8829MePDzsxaBZJ g==;
X-CSE-ConnectionGUID: n4mlWj0eSUujFiMYqcOvhA==
X-CSE-MsgGUID: 7SyOzk9ES4icrlTDGEauTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878371"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:48 -0700
X-CSE-ConnectionGUID: 6sEt0g9yT9q4n8vdZ7DMgg==
X-CSE-MsgGUID: n6A05dJQQGm3dFxGD/OIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303347"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/8] drm/xe/device_sysfs: switch over to devm
Date: Mon, 29 Apr 2024 13:14:37 +0100
Message-ID: <20240429121436.33013-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

When hotunplugging the device we currently hit:

kernfs: can not remove 'vram_d3cold_threshold', no directory

Due to directory already being removed. Using drmm for sysfs device
stuff like vram_d3cold_threshold doesn't really make sense when you
consider hot unplugging of the pci device. In such a case the device is
removed however the drmm release action will only fire once the driver
instance can be released, which can be long after the device has already
been hotunplugged. Rather use devm which is directly tied to the device
and should be called when it is removed.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1432
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 21677b8cd977..7375937934fa 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -69,7 +69,7 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
-static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
+static void xe_device_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -85,5 +85,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
+	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
 }
-- 
2.44.0

