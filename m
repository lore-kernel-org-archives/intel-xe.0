Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1659EC7115C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1A910EBEC;
	Fri, 20 Jun 2025 21:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWkD07tS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D76910EBCF
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750456165; x=1781992165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UveMRC4JFrlGd+it8z95G0YOqGUPxRcRxy5FPYu0Ck=;
 b=fWkD07tSfJCxnBGSPGm5JexSKAewt3SDG/b+arHSrZ9Igrc5P3LaOFGh
 EwORDrpjcV+6F5uOvdwOUAyGjtENDD1+ID/W9uAGSba3IMxbg7RhzSSw2
 0YykJVSYy6FthcqiW5FOPb6ddXnTla21+y/3BhjL57JukZSDGrW7anj7x
 pIQpFRXNlDcfojrBcZ9iW/TINGotIKuhnDhd93TMP7scVPZwh0Clo56SM
 qpgXhYpgXnOeCoFuNO1erYvxdk60ycbGlKnmX83fn+nXiY0yw7wG9CzBM
 k/vtSkaZwXLxV7MGiNJJGSXX3DorXeNS9fF+dqTYFCasooFRLOJ/CDSw4 Q==;
X-CSE-ConnectionGUID: 2ikXdCvsROqCKVnwXC8LRA==
X-CSE-MsgGUID: 230h7Zh5SZyU0Wkv1Jr7XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40336500"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="40336500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:25 -0700
X-CSE-ConnectionGUID: ppj6Jr/5TleTmpUDE2oduA==
X-CSE-MsgGUID: gN/6XGalRUGtpKwHih/3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="151158393"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:24 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 1/5] drm/xe: add xe_soc_wa infrastructure
Date: Fri, 20 Jun 2025 14:49:16 -0700
Message-ID: <20250620214920.718179-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620214920.718179-1-matthew.s.atwood@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
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

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/Makefile            | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 27 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_soc_wa_oob.rules |  0
 3 files changed, 29 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_soc_wa_oob.rules

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 40d01751b49e..6b22e95002d5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
+generated_soc_oob := $(obj)/generated/xe_soc_wa_oob.c $(obj)/generated/xe_soc_wa_oob.h
+quiet_cmd_soc_wa_oob = GEN     $(notdir $(generated_soc_oob))
+      cmd_soc_wa_oob = mkdir -p $(@D); $^ $(generated_soc_oob)
+$(obj)/generated/%_soc_wa_oob.c $(obj)/generated/%_soc_wa_oob.h: $(obj)/xe_gen_wa_oob \
+		 $(src)/xe_soc_wa_oob.rules
+	$(call cmd,soc_wa_oob)
+
+
+
 # Please keep these build lists sorted!
 
 # core driver code
@@ -338,4 +347,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_soc_wa_oob.h
diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index ed9183599e31..0484ed44e5d6 100644
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
+static int parse(FILE *input, FILE *csource, FILE *cheader, bool soc)
 {
 	char line[MAX_LINE_LEN + 1];
 	char *name, *prev_name = NULL, *rules;
@@ -96,7 +96,10 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 		}
 
 		if (name) {
-			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
+			if (soc == false)
+				fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
+			else
+				fprintf(cheader, "\tXE_SOC_WA_OOB_%s = %u,\n", name, idx);
 
 			/* Close previous entry before starting a new one */
 			if (idx)
@@ -117,8 +120,10 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 	/* Close last entry */
 	if (idx)
 		fprintf(csource, ") },\n");
-
-	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
+	if (soc == false)
+		fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
+	else
+		fprintf(cheader, "\t_XE_SOC_WA_OOB_COUNT = %u\n", idx);
 
 	return 0;
 }
@@ -157,9 +162,15 @@ int main(int argc, const char *argv[])
 		}
 	}
 
-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
+	char *soc = strstr(args[ARGS_CHEADER].fn, "soc_");
+	if (soc == NULL)
+		fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, "XE_WA_OOB", "XE_WA_OOB");
+	else
+		fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, "XE_SOC_WA_OOB", "XE_SOC_WA_OOB");
+
+	bool prefix = soc != NULL ? true : false;
 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
-		    args[ARGS_CHEADER].f);
+		    args[ARGS_CHEADER].f, prefix);
 	if (!ret)
 		fprintf(args[ARGS_CHEADER].f, FOOTER);
 
diff --git a/drivers/gpu/drm/xe/xe_soc_wa_oob.rules b/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.49.0

