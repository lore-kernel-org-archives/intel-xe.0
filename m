Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED2C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 20:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4AE10E0B5;
	Fri, 24 Jul 2026 20:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnHm4644";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDB910E0B5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 20:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784924748; x=1816460748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yboYk9saZoLMBDdbCM558cR1uURQ9mJSZ4sGEZzgYmE=;
 b=MnHm4644tyUH+cvUCFgnLt/9sIeSJ1LdqOR6eu4kEk50ziqYZIVTPufX
 ZGdwh3JyBVZ2t4BBfw2w86ok63/80df1/yVHacCa6c9mPU2ciR6x7FcBU
 NeLdWah6+i9QM4XPSQYoFcdBdfUBltR7iT2tudGvdpe3xU6O4oPbZ/4XE
 xL31tQGNv9b/LpBzoO+9MhDJ3M7Tq9bgbZY0tkTweCDbZKyfMgGfZPiWA
 pxVsSedFwtfMjAdAJuWXaGYicliIK0rhrUIE4iUqor5125dxhwOMe9iIo
 snyfjTpt1ETGKZGMIxhRhi7NBcka07ngj9xDt2GC312Fk4RuvU03efg5c g==;
X-CSE-ConnectionGUID: Vfy1tEiiSMys2RiNZ69h4w==
X-CSE-MsgGUID: wRPHxgfkRe+3YEIEjHw4dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85540916"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="85540916"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:25:48 -0700
X-CSE-ConnectionGUID: GaBI/3/lRMyCDastXxfC4A==
X-CSE-MsgGUID: o2kb+ebkQj+PrbhnBVFhbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="254874785"
Received: from dut4402arlh.fm.intel.com ([10.105.10.136])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:25:45 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 9/9] drm/xe: Taint kernel when debug configfs parameters are
 set
Date: Fri, 24 Jul 2026 20:25:46 +0000
Message-ID: <20260724202539.53850-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724202539.53850-11-stuart.summers@intel.com>
References: <20260724202539.53850-11-stuart.summers@intel.com>
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

Writing any debug configfs attribute indicates the system is running
in a non-standard configuration that may mask bugs or produce misleading
behaviour. Taint the kernel with TAINT_TEST on each successful write so
bug reports clearly reflect when debug settings were active.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6,claude-sonnet-5
---
 drivers/gpu/drm/xe/xe_configfs_debug.c        | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug_params.c |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index b068c64e42bf..4542f3311f4b 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/cleanup.h>
 #include <linux/find.h>
+#include <linux/panic.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
@@ -33,6 +34,10 @@
  * and driver debugging and are not stable ABI. Using them is "at your own
  * risk".
  *
+ * Writing any debug attribute taints the kernel with ``TAINT_TEST``. This
+ * makes it visible in bug reports when a non-standard or unsafe configuration
+ * was active.
+ *
  * See the top-level ``Xe Configfs`` documentation in ``xe_configfs.c``
  * for how to create, probe and remove configfs devices. Once a device
  * directory exists, the driver populates it with a ``debug/`` subdirectory
@@ -524,6 +529,7 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 
 	if (!count) {
 		memset(wa_bb, 0, sizeof(tmp_wa_bb));
+		add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
 		return len;
 	}
 
@@ -543,6 +549,8 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 
 	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
 
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
 	return len;
 }
 
@@ -694,6 +702,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 
 	dev->config.debug.engines_allowed = val;
 
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
 	return len;
 }
 
@@ -783,6 +793,8 @@ static ssize_t gt_types_allowed_store(struct config_item *item, const char *page
 
 	dev->config.debug.gt_types_allowed = typemask;
 
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
 	return len;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.c b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
index c868e3f49ea4..482363833e13 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug_params.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
@@ -29,11 +29,15 @@
  * This file also generates the xe_configfs_get_<name>() accessors used
  * by the rest of the driver to read a parameter's effective value; see
  * the DOC section below.
+ *
+ * Setting these parameters taints the kernel since these are intended
+ * for debug and testing purposes only.
  */
 
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
 #include <linux/kernel.h>
+#include <linux/panic.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
@@ -65,6 +69,7 @@ static ssize_t _name##_store(struct config_item *item, const char *page, size_t
 	if (xe_configfs_is_bound(dev)) \
 		return -EBUSY; \
 	dev->config.debug.params._name = val; \
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK); \
 	return len; \
 }
 
@@ -101,6 +106,7 @@ static ssize_t _name##_store(struct config_item *item, const char *page, size_t
 	if (xe_configfs_is_bound(dev)) \
 		return -EBUSY; \
 	dev->config.debug.params._name = val; \
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK); \
 	return len; \
 }
 
-- 
2.43.0

