Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B53CA6006
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A543210EE60;
	Mon,  5 Oct 2026 19:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMoMfls1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7387D10EE45
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227177; x=1822763177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MkymJiVShvSrYgVQQr+uD5A4LoH9DAvqUNGloi5UUCo=;
 b=XMoMfls1pzr+LdnVC4qf0/ThlyIL+vDn1wSje8gh4gf3MCXJoo9JtAh8
 VuW7Fi7O3g+LRtA95mkecgbOMklLdA9i3N9hH2PyHpOjjQwqTYLNBQugL
 pAL1tHZWlxKiUDPsHTIoePLATiZ4gm9oPD8GuYnU/KANoscpN3UUaHgqz
 9EMIqjxskh/7VMzPWo0lONB2QjNZs+N+qRR3r8SBY47E1hhahBiiiXtYt
 v+KsqQyQCfNatXUpZRXiwFWGKbgO2+eYE6yvtSaZvk8k96Kuk3efmHAM2
 zDGGJSS/Ky7Soz2+dHP1tnEtBcvfYpU98bmoHJDOXCvYazh/ny03r85h5 w==;
X-CSE-ConnectionGUID: lwidEBpLRkGix60TKheA5A==
X-CSE-MsgGUID: JXvI70eNT1e90EWVQFbZ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578429"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:17 -0700
X-CSE-ConnectionGUID: QMX2W6SnRWyyfkJnUV7r8A==
X-CSE-MsgGUID: pFaSko+ST1yaeX9dPM64SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690898"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:17 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 14/15] drm/xe: Taint kernel when debug configfs parameters are
 set
Date: Mon,  5 Oct 2026 19:06:24 +0000
Message-ID: <20261005190611.332940-31-stuart.summers@intel.com>
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

Writing any debug configfs attribute indicates the system is running
in a non-standard configuration that may mask bugs or produce misleading
behaviour. Taint the kernel with TAINT_TEST on each successful write so
bug reports clearly reflect when debug settings were active.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs_debug.c        | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug_params.c |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index 3524706bc654..aa8b73cb2a64 100644
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
@@ -553,6 +558,7 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 
 	if (!count) {
 		memset(wa_bb, 0, sizeof(tmp_wa_bb));
+		add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
 		return len;
 	}
 
@@ -572,6 +578,8 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 
 	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
 
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
 	return len;
 }
 
@@ -724,6 +732,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 
 	dev->config.debug.engines_allowed = val;
 
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
 	return len;
 }
 
@@ -814,6 +824,8 @@ static ssize_t gt_types_allowed_store(struct config_item *item, const char *page
 
 	dev->config.debug.gt_types_allowed = typemask;
 
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
 	return len;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.c b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
index b85bd82c8c94..5a69d4b15442 100644
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

