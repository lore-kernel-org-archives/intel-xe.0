Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0745FC83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4BC10E120;
	Wed,  9 Jul 2025 22:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1St0Ier";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2AA10E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099369; x=1783635369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cv75rH+BuHNL1AVF7Tdf1WTsrgXz5Zh02k4MNiPEShU=;
 b=C1St0Ier4RrQ8PN0/hMCzDT9zK9XVxLo9AyzSRKVAU7k9qWoia4UMX58
 h1vzrjOaJPnx1SeDA49DEChLLG7Pwe6Ci3VdpIApUu+uTJhzMO0mDd+D8
 /Rxbzjd7Wz+g5AX7I3MSOIQBH2Tac1IVpLBKnMIFbREqq1my8CJ3i83mo
 LzygQwkBPbWD8yGJuoeVQlfqu6RJ+Fx1GjTx7yp1ixj5oCT/Esk7uKyNH
 wGPfl8wRV0jV780tD03nhqSh75xeMTc8bJ8g9PtbxmfkBBwjDlHnxhJ77
 yVnEZhxh+2Fpj+/MGnMA+CQd9u7GzXfdZVg0Wy9IQOwljq1ueONC6+8RR A==;
X-CSE-ConnectionGUID: /egFZH+gR7KpU+hOqttkcA==
X-CSE-MsgGUID: Ucphl9y4RXKQtR5pGqhbSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518054"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54518054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:09 -0700
X-CSE-ConnectionGUID: eXAg/ccXTteLZ32GmkrMfA==
X-CSE-MsgGUID: T8gb6HZOR0yKGsViJNsazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193096133"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:09 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v6 1/6] drm/xe: prepare xe_gen_wa_oob to be multi-use
Date: Wed,  9 Jul 2025 15:16:00 -0700
Message-ID: <20250709221605.172516-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709221605.172516-1-matthew.s.atwood@intel.com>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
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

There is a need for additional oob rules files. Make the current gen
file more robust to support more files.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 45 +++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index ed9183599e31..6581cb0f0e59 100644
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
@@ -118,7 +118,33 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
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
+	size_t len;
+
+	fn = basename(fn);
+	len = strlen(fn);
+
+	if (len > size - 1)
+		return -ENAMETOOLONG;
+
+	memcpy(prefix, fn, len + 1);
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
@@ -141,6 +167,7 @@ int main(int argc, const char *argv[])
 		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
 	};
 	int ret = 1;
+	char prefix[128];
 
 	if (argc < 3) {
 		fprintf(stderr, "ERROR: wrong arguments\n");
@@ -148,6 +175,9 @@ int main(int argc, const char *argv[])
 		return 1;
 	}
 
+	if (fn_to_prefix(args[ARGS_CHEADER].fn, prefix, sizeof(prefix)) < 0)
+		return 1;
+
 	for (int i = 0; i < _ARGS_COUNT; i++) {
 		args[i].f = fopen(args[i].fn, args[i].mode);
 		if (!args[i].f) {
@@ -157,9 +187,10 @@ int main(int argc, const char *argv[])
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

