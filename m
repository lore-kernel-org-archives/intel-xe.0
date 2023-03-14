Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7718C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32610E6A7;
	Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601C10E6A8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753845; x=1710289845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EM1SVUXMHPLd1ZdZvNaRWpu7dVaY2+drTZR+UxtDQIo=;
 b=irEu7rF3+mwFofhdUhDivCszQ9AGqYPvOqVE8DsmbKsC9BlPThlu+54b
 exbiah/CJNULn1gFLC3B0VqvzTtcZi54LtiA8/6in/XvZac1AXu5Uog68
 NaLvosktbyiupnDAsSZonnaypmKjPK/O1i3HU7dkGQl6NYJSCZziGGXWq
 qMukfob+Z82qgORTQSkvz2knbiMitp+wxeBGlj+uKsdWbpYxvOvhEDsfI
 0oujEO3TlVxOY2ee4evxnWiYuTwIpmG1NF3gSHNEefDGJetlOlX5sUiT5
 4lL/+QsY2fD8Yn/GQy2He9FAL5TBqMIQ85RxqwN3IwfyE9+5NCsL6gXm/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168023"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168023"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116681"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116681"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:01 -0700
Message-Id: <20230314003012.2600353-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/14] drm/xe: Print whitelist while applying
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Besides printing the various register save-restore, it's also useful to
know the register being allowed/denied access from unprivileged batch
buffers. Print them during device probe.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c        |  4 +++
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 41 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_whitelist.h |  7 +++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index c6f92fe9aad1..f6ed9e6e5697 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -20,6 +20,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
+#include "xe_reg_whitelist.h"
 #include "xe_rtp_types.h"
 
 #define XE_REG_SR_GROW_STEP_DEFAULT	16
@@ -194,6 +195,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg_sr_entry *entry;
+	struct drm_printer p;
 	unsigned long reg;
 	unsigned int slot = 0;
 	int err;
@@ -207,7 +209,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 	if (err)
 		goto err_force_wake;
 
+	p = drm_debug_printer(KBUILD_MODNAME);
 	xa_for_each(&sr->xa, reg, entry) {
+		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot).reg,
 				reg | entry->set_bits);
 		slot++;
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 2dd10e62718f..6c8577e8dba6 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -67,3 +67,44 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 {
 	xe_rtp_process(register_whitelist, &hwe->reg_whitelist, hwe->gt, hwe);
 }
+
+/**
+ * xe_reg_whitelist_print_entry - print one whitelist entry
+ * @p: DRM printer
+ * @indent: indent level
+ * @reg: register allowed/denied
+ * @entry: save-restore entry
+ *
+ * Print details about the entry added to allow/deny access
+ */
+void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
+				  u32 reg, struct xe_reg_sr_entry *entry)
+{
+	u32 val = entry->set_bits;
+	const char *access_str = "(invalid)";
+	unsigned range_bit = 2;
+	u32 range_start, range_end;
+	bool deny;
+
+	deny = val & RING_FORCE_TO_NONPRIV_DENY;
+
+	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
+	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
+	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
+	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
+	}
+
+	range_start = reg & REG_GENMASK(25, range_bit);
+	range_end = range_start | REG_GENMASK(range_bit, 0);
+
+	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
+	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
+	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
+	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
+	}
+
+	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
+			  range_start, range_end,
+			  deny ? "deny" : "allow",
+			  access_str);
+}
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
index 6e861b1bdb01..c76d81c528da 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
@@ -6,8 +6,15 @@
 #ifndef _XE_REG_WHITELIST_
 #define _XE_REG_WHITELIST_
 
+#include <linux/types.h>
+
+struct drm_printer;
 struct xe_hw_engine;
+struct xe_reg_sr_entry;
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 
+void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
+				  u32 reg, struct xe_reg_sr_entry *entry);
+
 #endif
-- 
2.39.0

