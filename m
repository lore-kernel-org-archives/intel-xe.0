Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DE6C7EE2D
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BE710E380;
	Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A55F10E380
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZiImB8+TP7aET3YFNWNkZoIBB8TW6dt9ZIzPPq9mFQ=;
 b=A6a24W6w1bLqIQ4WAJ6jR5MnTqq0GiNWBq+eE8f/8Ct/tCUt60zzb/VM
 WZ9Axb8OnTLSwplPVSIDsA4eQJ1p930ivkGyE3+PT6njT7oJrkJ43vt4Q
 pPaHf2oZuS4tFalZk1kLb4Vf9gPZvVFR6ZyCDNZVu/HrVdrXK61Aq/zEn
 QB7OVEBblCTQZbiq6coBa9I5vSvaBhCzAKU4wEft1jR9UIXyj/RkgXp2I
 fWcBAqJ7F0Lg1DhCO9CKyETahVWO54otNbgg3HXaq+YkKe+rnqFHCgGe8
 K4rWecpHvXzjQlQOTgDPBKcs8obvm/Coxlmy7V66jqm98M/ipIGMQiR0W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013391"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013391"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530873"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530873"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:49 -0700
Message-Id: <20230516221950.3512818-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 8/9] drm/xe: Add support for OOB workarounds
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are WAs that, due to their nature, cannot be applied from
a central place like xe_wa.c. Those are peppered around the rest of the
code, as needed. This gives them a new name:  "out-of-band workarounds".

These workarounds have their names and rules still grouped in xe_wa.c,
inside the xe_wa_oob array, which is generated at compile time by
xe_wa_oob.rules and the hostprog xe_gen_wa_oob. The code generation guarantees
that the header xe_wa_oob.h contains the IDs for the workarounds that match
the index in the table. This way the runtime checks that are spread throughout
the code are simple tests against the bitmap saved during initialization.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  14 +++
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c   | 165 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c           |  40 ++++++-
 drivers/gpu/drm/xe/xe_wa.h           |   9 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |   0
 7 files changed, 227 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
 create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b6c41cd7dbe3..fcf04951a309 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -26,6 +26,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
 
 subdir-ccflags-y += -I$(srctree)/$(src)
 
+# generated sources
+hostprogs := xe_gen_wa_oob
+
+XE_WA_OOB := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
+
+quiet_cmd_wa_oob = GEN     xe_wa_oob.[ch]
+      cmd_wa_oob = $^ $(XE_WA_OOB)
+
+$(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
+	@mkdir -p $(@D)
+	$(call cmd,wa_oob)
+
+$(obj)/xe_wa.o:  $(XE_WA_OOB)
+
 # Please keep these build lists sorted!
 
 # core driver code
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ac6898a28411..45df4354ac1f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -280,6 +280,8 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
+	xe_wa_process_oob(xe);
+
 	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b8d7864950c4..456299836d0f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -273,6 +273,8 @@ struct xe_device {
 		unsigned long *engine;
 		/** @lrc: bitmap with active LRC workarounds */
 		unsigned long *lrc;
+		/** @oob: bitmap with active OOB workaroudns */
+		unsigned long *oob;
 	} wa_active;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
new file mode 100644
index 000000000000..bf829348058a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <ctype.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+
+#define HEADER \
+	"// SPDX-License-Identifier: MIT\n" \
+	"\n" \
+	"/*\n" \
+	" * DO NOT MODIFY.\n" \
+	" *\n" \
+	" * This file was generated from rules: %s\n" \
+	" */\n" \
+	"#ifndef _GENERATED_XE_WA_OOB_\n" \
+	"#define _GENERATED_XE_WA_OOB_\n" \
+	"\n" \
+	"enum {\n"
+
+#define FOOTER \
+	"};\n" \
+	"\n" \
+	"#endif\n"
+
+extern const char *program_invocation_short_name;
+
+static void print_usage(FILE *f)
+{
+	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
+		program_invocation_short_name);
+}
+
+static void print_parse_error(const char *err_msg, const char *line,
+			      unsigned int lineno)
+{
+	fprintf(stderr, "ERROR: %s\nERROR: %u: %.60s\n",
+		err_msg, lineno, line);
+}
+
+static char *strip(char *line, size_t linelen)
+{
+	while (isspace(*(line + linelen)))
+		linelen--;
+
+	line[linelen - 1] = '\0';
+
+	return  line + strspn(line, " \f\n\r\t\v");
+}
+
+#define MAX_LINE_LEN 4096
+static int parse(FILE *input, FILE *csource, FILE *cheader)
+{
+	char line[MAX_LINE_LEN + 1];
+	char *name, *prev_name = NULL, *rules;
+	unsigned int lineno = 0, idx = 0;
+
+	while (fgets(line, sizeof(line), input)) {
+		size_t linelen;
+		bool is_continuation;
+
+		if (line[0] == '\0' || line[0] == '#' || line[0] == '\n') {
+			lineno++;
+			continue;
+		}
+
+		linelen = strlen(line);
+		if (linelen == MAX_LINE_LEN) {
+			print_parse_error("line too long", line, lineno);
+			return -EINVAL;
+		}
+
+		is_continuation = isspace(line[0]);
+		name = strip(line, linelen);
+
+		if (!is_continuation) {
+			name = strtok(name, " \t");
+			rules = strtok(NULL, "");
+		} else {
+			if (!prev_name) {
+				print_parse_error("invalid rule continuation",
+						  line, lineno);
+				return -EINVAL;
+			}
+
+			rules = name;
+			name = NULL;
+		}
+
+		if (rules[0] == '\0') {
+			print_parse_error("invalid empty rule\n", line, lineno);
+			return -EINVAL;
+		}
+
+		if (name) {
+			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
+			fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_RULES(%s) },\n",
+				name, rules);
+		} else {
+			fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RULES(%s) },\n",
+				rules);
+		}
+
+		idx++;
+		lineno++;
+		prev_name = name;
+	}
+
+	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
+
+	return 0;
+}
+
+int main(int argc, const char *argv[])
+{
+	enum {
+		ARGS_INPUT,
+		ARGS_CSOURCE,
+		ARGS_CHEADER,
+		_ARGS_COUNT
+	};
+	struct {
+		const char *fn;
+		const char *mode;
+		FILE *f;
+	} args[] = {
+		[ARGS_INPUT] = { .fn = argv[1], .mode = "r" },
+		[ARGS_CSOURCE] = { .fn = argv[2], .mode = "w" },
+		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
+	};
+	int ret = 1;
+
+	if (argc < 3) {
+		fprintf(stderr, "ERROR: wrong arguments\n");
+		print_usage(stderr);
+		return 1;
+	}
+
+	for (int i = 0; i < _ARGS_COUNT; i++) {
+		args[i].f = fopen(args[i].fn, args[i].mode);
+		if (!args[i].f) {
+			fprintf(stderr, "ERROR: Can't open %s: %m\n",
+				args[i].fn);
+			goto err;
+		}
+	}
+
+	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
+	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
+		    args[ARGS_CHEADER].f);
+	if (!ret)
+		fprintf(args[ARGS_CHEADER].f, FOOTER);
+
+err:
+	for (int i = 0; i < _ARGS_COUNT; i++) {
+		if (args[i].f)
+			fclose(args[i].f);
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index bc2665737836..f789be2cf8c3 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -9,6 +9,7 @@
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
 
+#include "generated/xe_wa_oob.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
@@ -73,8 +74,8 @@
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
@@ -569,8 +570,31 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	{}
 };
 
+static __maybe_unused const struct xe_rtp_entry oob_was[] = {
+#include <generated/xe_wa_oob.c>
+	{}
+};
+
+static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
+
 __diag_pop();
 
+/**
+ * xe_wa_process_oob - process OOB workaround table
+ * @gt: xe device instance
+ *
+ * Process OOB workaround table for this platform, marking as active the
+ * workarounds that need to be applied.
+ */
+void xe_wa_process_oob(struct xe_device *xe)
+{
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
+
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob,
+						  ARRAY_SIZE(oob_was));
+	xe_rtp_process(&ctx, oob_was);
+}
+
 /**
  * xe_wa_process_gt - process GT workaround table
  * @gt: GT instance to process workarounds for
@@ -633,12 +657,13 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
  */
 int xe_wa_init(struct xe_device *xe)
 {
-	size_t n_lrc, n_engine, n_gt, total;
+	size_t n_oob, n_lrc, n_engine, n_gt, total;
 
 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
 	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
-	total = n_gt + n_engine + n_lrc;
+	n_oob = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
+	total = n_gt + n_engine + n_lrc + n_oob;
 
 	xe->wa_active.gt = drmm_kzalloc(&xe->drm, sizeof(long) * total,
 					GFP_KERNEL);
@@ -647,6 +672,7 @@ int xe_wa_init(struct xe_device *xe)
 
 	xe->wa_active.engine = xe->wa_active.gt + n_gt;
 	xe->wa_active.lrc = xe->wa_active.engine + n_engine;
+	xe->wa_active.oob = xe->wa_active.lrc + n_lrc;
 
 	return 0;
 }
@@ -666,5 +692,9 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
 	drm_printf(p, "\nLRC Workarounds\n");
 	for_each_set_bit(idx, xe->wa_active.lrc, ARRAY_SIZE(lrc_was))
 		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
-}
 
+	drm_printf(p, "\nOOB Workarounds\n");
+	for_each_set_bit(idx, xe->wa_active.oob, ARRAY_SIZE(lrc_was))
+		if (oob_was[idx].name)
+			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 32ab34d9237f..f7da9f5b9340 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -12,6 +12,7 @@ struct xe_gt;
 struct xe_hw_engine;
 
 int xe_wa_init(struct xe_device *xe);
+void xe_wa_process_oob(struct xe_device *xe);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
@@ -19,4 +20,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
 
+/**
+ * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
+ *         other more specific type
+ * @xe__: xe device instance
+ * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
+ */
+#define XE_WA(xe__, id__) test_bit(XE_WA_OOB_ ## id__, (xe__)->wa_active.oob)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.40.1

