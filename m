Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79382C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 18:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02710E7B5;
	Wed, 25 Jun 2025 18:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRlgoinc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8510E236
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750874896; x=1782410896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rabj5AEgzEIkX32aOvH6g7bFIJvOXXgKA+EmGdZXE3Y=;
 b=ZRlgoincOa1ZAu7oWxlmKDRooNLf3KeHBYQUQwsLdWjOXwpC18fVdgiN
 IQCx3RTSNHLjBvBJpEynoQMLMg+1MucffQ15lhuooJTRKHrYEMGtogIii
 X+WSFuOeDF2pkUL7ctxfk9IrYPgAvg6xwNDUHSXuyJsVNAwCTSk8SNAzR
 NO5caCUCa8buEtJixnSQDAF63l1EJFxxyCWmbGJfFjCe+BtjCSjYmepmj
 XreFYeyTt4mu1kyGxMGIhn0JIdvnKbs4lUvPZ6XZaA6bmXwOMVoJHsz0x
 YsbAtQ7vvkIaOwsQrxveicjV1lWxFbZoG5yTqa/XUywSaaBHGHPkZm33T A==;
X-CSE-ConnectionGUID: FKqzUxH+QxSgZOcuzy3pUw==
X-CSE-MsgGUID: 4ZoHm0bURFaFfhrvqLOC6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53293582"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53293582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:16 -0700
X-CSE-ConnectionGUID: zgZJDgJlQl+kwCA9iIolZw==
X-CSE-MsgGUID: Fi6caULZQd6qRreW1ZAZUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="175941834"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:15 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 1/5] drm/xe: add xe_device_wa infrastructure
Date: Wed, 25 Jun 2025 11:08:07 -0700
Message-ID: <20250625180811.17112-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625180811.17112-1-matthew.s.atwood@intel.com>
References: <20250625180811.17112-1-matthew.s.atwood@intel.com>
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

There are some workarounds that must be applied before gt init,
wa_150154044425 for example. Instead of sprinkling them conditionally
throughout the driver as we did for i915 generate an oob.rules file
reusing the RTP infrastructure to make these easier to track.

v2: rename xe_soc_wa to xe_device_wa

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/Makefile               | 11 ++++++++-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
 drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 27 ++++++++++++++++-------
 3 files changed, 29 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index eee6bac01a00..64498ce2a839 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
+generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
+quiet_cmd_device_wa_oob = GEN     $(notdir $(generated_device_oob))
+      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
+$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
+		 $(src)/xe_device_wa_oob.rules
+	$(call cmd,device_wa_oob)
+
+
+
 # Please keep these build lists sorted!
 
 # core driver code
@@ -339,4 +348,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index ed9183599e31..d8bb26317f28 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -18,8 +18,8 @@
 	" *\n" \
 	" * This file was generated from rules: %s\n" \
 	" */\n" \
-	"#ifndef _GENERATED_XE_WA_OOB_\n" \
-	"#define _GENERATED_XE_WA_OOB_\n" \
+	"#ifndef _GENERATED_%s_\n" \
+	"#define _GENERATED_%s_\n" \
 	"\n" \
 	"enum {\n"
 
@@ -52,7 +52,7 @@ static char *strip(char *line, size_t linelen)
 }
 
 #define MAX_LINE_LEN 4096
-static int parse(FILE *input, FILE *csource, FILE *cheader)
+static int parse(FILE *input, FILE *csource, FILE *cheader, bool device)
 {
 	char line[MAX_LINE_LEN + 1];
 	char *name, *prev_name = NULL, *rules;
@@ -96,7 +96,10 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 		}
 
 		if (name) {
-			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
+			if (device == false)
+				fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
+			else
+				fprintf(cheader, "\tXE_DEVICE_WA_OOB_%s = %u,\n", name, idx);
 
 			/* Close previous entry before starting a new one */
 			if (idx)
@@ -117,8 +120,10 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 	/* Close last entry */
 	if (idx)
 		fprintf(csource, ") },\n");
-
-	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
+	if (device == false)
+		fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
+	else
+		fprintf(cheader, "\t_XE_DEVICE_WA_OOB_COUNT = %u\n", idx);
 
 	return 0;
 }
@@ -157,9 +162,15 @@ int main(int argc, const char *argv[])
 		}
 	}
 
-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
+	char *device = strstr(args[ARGS_CHEADER].fn, "device_");
+	if (device == NULL)
+		fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, "XE_WA_OOB", "XE_WA_OOB");
+	else
+		fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, "XE_DEVICE_WA_OOB", "XE_DEVICE_WA_OOB");
+
+	bool prefix = device != NULL ? true : false;
 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
-		    args[ARGS_CHEADER].f);
+		    args[ARGS_CHEADER].f, prefix);
 	if (!ret)
 		fprintf(args[ARGS_CHEADER].f, FOOTER);
 
-- 
2.49.0

