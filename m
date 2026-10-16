Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CF1CCA46D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9DF11261F;
	Fri, 16 Oct 2026 07:18:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED75211260C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135125; x=1823671125;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xthlxIkkPCpvtDGd+I5tfsLwvvEzF8MhTOo5r+fillY=;
 b=OweN5fh1x12DykW97rHshE3Gwod34cpgwwE3lR9E6sRGSLU7i8bqxOp+
 mt0W7ol0pqZhyQzO6N+bKCyTJDOO4/8BJribxhMBWYHsT6XK9rmr3uOPp
 2dZre/X0ZW02VQZ/C1Hf/gq0yKAqEhMaJ3kpMz2wcw0EwwJepCLBA44VA
 GxbxQUR782moeKNWm4lu5aWLy4IcwewbrIZco+pLGqZ8rWIbh8q5iMfoV
 DVBJL7zJxVJZoRehjmE4+pQC/p1+A+mfcMZReem2y5bNXQ7/H8OPcmEaH
 N1VsKAWyAPU6JlZu11RGibGf0qWV2e3/UTqGsH/EQaoyHMxcPIZ4+Pt8l Q==;
X-CSE-ConnectionGUID: bC7O9HH1SXycGpjooGAWWg==
X-CSE-MsgGUID: f0+tnrVjRI6uyVVpVshB2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813631"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:43 -0700
X-CSE-ConnectionGUID: o1ph6CGzQueQhTUYhS2FGg==
X-CSE-MsgGUID: w5A6t2RpRuWZizKyuQ88yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787241"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:42 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 02/18] drm/drv: Export drm_dev_srcu_synchronize()
Date: Fri, 16 Oct 2026 12:48:12 +0530
Message-ID: <20261016071832.222574-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

drm_dev_unplug() marks a device as unplugged and waits for existing
drm_dev_enter() users to finish before releasing device resources.

Drivers may need the same publish-and-drain sequence for their own
device state without unplugging the device.

Export drm_dev_srcu_synchronize() so drivers can publish their state and
wait for existing DRM SRCU readers to finish.

The Xe driver will use this helper to block device access during PCI
error recovery and permanent wedge isolation.

The SRCU domain is shared by all DRM devices, so synchronization also
waits for existing drm_dev_enter() sections on other devices.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 17 ++++++++++++++++-
 include/drm/drm_drv.h     |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 0cdc606af8d1..0f25103e9037 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -476,6 +476,21 @@ void drm_dev_exit(int idx)
 }
 EXPORT_SYMBOL(drm_dev_exit);
 
+/**
+ * drm_dev_srcu_synchronize - Drain device SRCU readers
+ * @dev: DRM device whose state change is being synchronized
+ *
+ * Wait for existing drm_dev_enter() users to finish.
+ *
+ * The SRCU domain is shared by all DRM devices. Readers for other DRM
+ * devices may also delay this function.
+ */
+void drm_dev_srcu_synchronize(struct drm_device *dev)
+{
+	synchronize_srcu(&drm_unplug_srcu);
+}
+EXPORT_SYMBOL(drm_dev_srcu_synchronize);
+
 /*
  * Mark the device as unplugged and wait for any in-flight drm_dev_enter()
  * critical sections to complete.
@@ -489,7 +504,7 @@ static void drm_dev_synchronize_unplug(struct drm_device *dev)
 	 * finished.
 	 */
 	dev->unplugged = true;
-	synchronize_srcu(&drm_unplug_srcu);
+	drm_dev_srcu_synchronize(dev);
 }
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b23830494ed4..27361fbad6dc 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -482,6 +482,7 @@ void drm_dev_put(struct drm_device *dev);
 void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
+void drm_dev_srcu_synchronize(struct drm_device *dev);
 void drm_dev_unplug(struct drm_device *dev);
 int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
 			 struct drm_wedge_task_info *info);
-- 
2.43.0

