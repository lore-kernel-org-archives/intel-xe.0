Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9079AC7EE29
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CA710E3BA;
	Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0F610E3AF
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ygE5bkltdduvI0wiO/0szAjZr3c2FEp40RfnQHITLKQ=;
 b=AMcZx0Os+NaDi9chDuPSb9l/gcH8/aCSoYMvpJCKGGy+7ZHhluDTC7GR
 hX54Jlp3i31fb/tu75E3XVkXMguGJ65glPTCgq6Kb60zUR27j870u6/Mx
 1vbJtgcfMzEoskZ7UwLXj5sIkn2Nro8QP49VXzIQkHy3fssugX9HKeIyR
 dLA+bO3fcKwPwJH7uB3ODhfqXWgJYMvVJnfA+IFhrRFbI14jEiDzyBMq4
 1AKRo8PRbda13z7OliM7PRaR9JK3wgY+loWRVuELrLdZynx3l9+efzJCS
 ZXi3eLZgyzd9w4cqk2+Lktfx3welKPEl7P8eorHXu0gHBHL34rce09pby w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323833"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323833"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439443"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439443"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:49 -0700
Message-Id: <20230504073250.1436293-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/xe: Add support for OOB workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are WAs that, due to their nature, cannot be applied from
a central place like xe_wa.c. Those are peppered around the rest of the
code, as needed. This gives them a new name:  "out-of-band workarounds".
These workarounds then have their names and rules grouped in a special
ELF section that the driver can loop through on initialization to report
the active workarounds.

Currently this only supports checks for the xe device info, not
supporting gt/engine checks. Those can be added later, with the downside
of not being able to be reported on driver probe.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |  2 ++
 drivers/gpu/drm/xe/xe.lds         |  8 ++++++++
 drivers/gpu/drm/xe/xe_device.c    |  4 ++++
 drivers/gpu/drm/xe/xe_rtp.c       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c        | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wa.h        | 19 +++++++++++++++++++
 8 files changed, 112 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe.lds

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 84ad0e949044..7c54fd998371 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -208,6 +208,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
 endif
 
+LDFLAGS_xe.o := -T $(srctree)/$(src)/xe.lds
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
diff --git a/drivers/gpu/drm/xe/xe.lds b/drivers/gpu/drm/xe/xe.lds
new file mode 100644
index 000000000000..fa84ecbc3cd6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe.lds
@@ -0,0 +1,8 @@
+SECTIONS
+{
+    .rodata.__xe_wa_oob ALIGN(8) : {
+        __start___xe_wa_oob = .;
+        *(__xe_wa_oob)
+        __stop___xe_wa_oob = .;
+    }
+}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..a07f56c9a2eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -31,6 +31,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
+#include "xe_wa.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -237,6 +238,7 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 
 int xe_device_probe(struct xe_device *xe)
 {
+	struct drm_printer p = drm_debug_printer("xe: ");
 	struct xe_gt *gt;
 	int err;
 	u8 id;
@@ -291,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
 	/* Allocate and map stolen after potential VRAM resize */
 	xe_ttm_stolen_mgr_init(xe);
 
+	xe_wa_dump(xe, &p);
+
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 88eaea597cf7..62d12dd23bc5 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -69,12 +69,21 @@ static bool rule_matches(const struct xe_device *xe,
 			match = xe->info.is_dgfx;
 			break;
 		case XE_RTP_MATCH_ENGINE_CLASS:
+			if (drm_WARN_ON(&xe->drm, !hwe))
+				return false;
+
 			match = hwe->class == r->engine_class;
 			break;
 		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
+			if (drm_WARN_ON(&xe->drm, !hwe))
+				return false;
+
 			match = hwe->class != r->engine_class;
 			break;
 		case XE_RTP_MATCH_FUNC:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = r->match_func(gt, hwe);
 			break;
 		default:
@@ -158,6 +167,19 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
 
+
+bool xe_rtp_match_entry_oob(struct xe_device *xe,
+			    const struct xe_rtp_entry_oob *oob_entry)
+{
+	const struct xe_rtp_entry entry = {
+		.name = oob_entry->name,
+		.n_rules = oob_entry->n_rules,
+		.rules = oob_entry->rules,
+	};
+
+	return rule_matches(xe, NULL, NULL, &entry);
+}
+
 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 8bc946694bfc..2fa14b5d51d7 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -6,6 +6,7 @@
 #ifndef _XE_RTP_
 #define _XE_RTP_
 
+#include <linux/compiler.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
 
@@ -20,6 +21,7 @@
  * Register table poke infrastructure
  */
 
+struct xe_device;
 struct xe_hw_engine;
 struct xe_gt;
 struct xe_reg_sr;
@@ -361,6 +363,26 @@ struct xe_reg_sr;
 void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 		    struct xe_gt *gt, struct xe_hw_engine *hwe);
 
+
+#define __XE_RTP_ENTRY_OOB(uniq__, section__, name__, ...) ({			\
+	static const struct xe_rtp_rule __PASTE(rule_, uniq__)[] = {		\
+		XE_RTP_PASTE_FOREACH(RULE_, COMMA, (__VA_ARGS__))		\
+	};									\
+	static const struct xe_rtp_entry_oob __PASTE(entry__, uniq__)		\
+	__used __aligned(sizeof(void *)) __section(section__) = {		\
+		.name = name__,							\
+		.n_rules =  _XE_COUNT_ARGS(__VA_ARGS__),			\
+		.rules = __PASTE(rule_, uniq__),				\
+	};									\
+	&__PASTE(entry__,  uniq__);						\
+})
+
+#define XE_RTP_ENTRY_OOB(section__, name__, ...)			\
+	__XE_RTP_ENTRY_OOB(__UNIQUE_ID(xe_rtp), section__, name__, __VA_ARGS__)
+
+bool xe_rtp_match_entry_oob(struct xe_device *xe,
+			    const struct xe_rtp_entry_oob *entry);
+
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 12df8a9e9c45..a70d697c87f4 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -95,4 +95,16 @@ struct xe_rtp_entry {
 	u8 flags;
 };
 
+/**
+ * struct xe_rtp_entry_oob - Entry in an out-of-band rtp table
+ *
+ * Like struct xe_rtp_entry, but there is no action associated with it, since it
+ * only serves to match the rules
+ */
+struct xe_rtp_entry_oob {
+	const char *name;
+	const struct xe_rtp_rule *rules;
+	u8 n_rules;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b0bb2f4438f4..f8d780fff6bb 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -72,8 +72,8 @@
  *      engine registers are restored in a context restore sequence. This is
  *      currently not used in the driver.
  *
- * - Other:  There are WAs that, due to their nature, cannot be applied from a
- *   central place. Those are peppered around the rest of the code, as needed.
+ * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
+ *   a central place. Those are peppered around the rest of the code, as needed.
  *   Workarounds related to the display IP are the main example.
  *
  * .. [1] Technically, some registers are powercontext saved & restored, so they
@@ -90,6 +90,9 @@
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
+extern const struct xe_rtp_entry_oob __start___xe_wa_oob[];
+extern const struct xe_rtp_entry_oob __stop___xe_wa_oob[];
+
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
@@ -608,3 +611,21 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
 	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
 }
+
+/**
+ * xe_wa_dump - dump all active workarounds known by the driver
+ * @xe: xe device
+ * @p: DRM printer
+ */
+void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
+{
+	const struct xe_rtp_entry_oob *entry_oob;
+
+	drm_printf(p, "OOB Workarounds\n");
+	for (entry_oob = __start___xe_wa_oob;
+	     entry_oob < __stop___xe_wa_oob;
+	     entry_oob++) {
+		if (xe_rtp_match_entry_oob(xe, entry_oob))
+			drm_printf(p, "\t%s\n", entry_oob->name);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index cd2307d58795..53d377c45f71 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,9 @@
 #ifndef _XE_WA_
 #define _XE_WA_
 
+#include "xe_rtp.h"
+
+struct drm_printer;
 struct xe_gt;
 struct xe_hw_engine;
 
@@ -15,4 +18,20 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 
+void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
+
+/**
+ * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
+ *         other more specific type
+ * @xe: xe device instance
+ * @name: Workaround name
+ * @...: xe_rtp_rule array by using XE_RTP_RULES()
+ */
+#define XE_WA(xe__, name__, ...) ({						\
+	const struct xe_rtp_entry_oob *entry__ = XE_RTP_ENTRY_OOB("__xe_wa_oob",\
+								  name__,	\
+								  __VA_ARGS__);	\
+	xe_rtp_match_entry_oob(xe__, entry__);					\
+})
+
 #endif
-- 
2.40.1

