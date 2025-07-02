Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C9FC83038
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F261010E77B;
	Wed,  2 Jul 2025 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVHSvoQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AFE10E062
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484640; x=1783020640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IhnD0+uIzX2ZLIdHaEDw2OTsUccMpSEMymojhTyEuwI=;
 b=SVHSvoQCQZxCqNH720R1DRfip8BCUyPbFoSZjOArRxN7bS9uWCD4Yr/l
 3g3Ys0zy82fa65H7zuIvKtm7lDVOE3/NlaBgY6flWCXxLFhCnQ/uTBPTV
 LkmlXFlqP4VbFFqJgrBnTdv8yV0PW5gQQ6CnZol21HoGytcyylRLwRgKv
 NSw8MX0v4NKpIRsv4f7lMnjmY+0IIoiawCYMqxFIPRjnVzNfn4Hb7aGmR
 KXH2g9eDrhNkZBCHB95lNgB+zok5vxg2q21W4VZcece8sFpyKhN8PZW4J
 Sx9e+/a3+OyLOehraE94dQ0tlxmBu5RSwbVYu9pG/VrDLv56wqCUG00aM g==;
X-CSE-ConnectionGUID: 5vdCg7rfT0mfOvQnEAbbjQ==
X-CSE-MsgGUID: 0dM9CrXvTiCseOvu6vCZbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039093"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039093"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:40 -0700
X-CSE-ConnectionGUID: HcNdZZObQAq9xIFKc+gfSw==
X-CSE-MsgGUID: edHbfsZtQ7OiuoHMIR8SNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615517"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:40 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 1/6] drm/xe: add xe_device_wa infrastructure
Date: Wed,  2 Jul 2025 12:30:31 -0700
Message-ID: <20250702193036.1417416-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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
v5: derive prefix from argument rather then hard coding the values.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/Makefile               | 11 ++++++-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
 drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 38 ++++++++++++++++++-----
 3 files changed, 41 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1d97e5b63f4e..48d4aa9d4ecc 100644
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
@@ -340,4 +349,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index ed9183599e31..341840926f60 100644
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
+static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
 {
 	char line[MAX_LINE_LEN + 1];
 	char *name, *prev_name = NULL, *rules;
@@ -96,7 +96,7 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 		}
 
 		if (name) {
-			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
+			fprintf(cheader, "\t%s_%s = %u,\n", prefix, name, idx);
 
 			/* Close previous entry before starting a new one */
 			if (idx)
@@ -118,7 +118,26 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
 	if (idx)
 		fprintf(csource, ") },\n");
 
-	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
+	fprintf(cheader, "\t_%s_COUNT = %u\n", prefix, idx);
+
+	return 0;
+}
+
+static int fn_to_prefix(const char *fn, char *prefix, size_t size)
+{
+	if (!strncpy(prefix, fn, size - 1))
+		return -ENAMETOOLONG;
+
+	for (char *p = prefix; *p; p++) {
+		switch (*p) {
+		case '.':
+			*p = '\0';
+			return 0;
+		default:
+			*p = toupper(*p);
+			break;
+		}
+	}
 
 	return 0;
 }
@@ -141,6 +160,7 @@ int main(int argc, const char *argv[])
 		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
 	};
 	int ret = 1;
+	char prefix[128];
 
 	if (argc < 3) {
 		fprintf(stderr, "ERROR: wrong arguments\n");
@@ -148,6 +168,9 @@ int main(int argc, const char *argv[])
 		return 1;
 	}
 
+	if (fn_to_prefix(basename(args[ARGS_CHEADER].fn), prefix, sizeof(prefix)) < 0)
+		return 1;
+
 	for (int i = 0; i < _ARGS_COUNT; i++) {
 		args[i].f = fopen(args[i].fn, args[i].mode);
 		if (!args[i].f) {
@@ -157,9 +180,10 @@ int main(int argc, const char *argv[])
 		}
 	}
 
-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
+	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
+
 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
-		    args[ARGS_CHEADER].f);
+		    args[ARGS_CHEADER].f, prefix);
 	if (!ret)
 		fprintf(args[ARGS_CHEADER].f, FOOTER);
 
-- 
2.49.0

