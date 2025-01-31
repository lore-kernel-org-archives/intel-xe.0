Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF56C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 17:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFF910E405;
	Fri, 31 Jan 2025 17:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrW8S5NO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86C10E405
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738343863; x=1769879863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X4xAk0fm1LW8XSSFmJdasjON4pA3xfDAsGY1NF+pYBs=;
 b=PrW8S5NOmY3h2eeYXlTTrh2j3ar4V6tqFvgM0Z5BLNLmpCrDuZ5cBiec
 gXleJQ1iBrPLU6aVGZiePMXFwokze41sI0DrgL6s30WfR0JNBd9Xu5tjt
 2c6Fd4UL03lvip+vztQgt5ARKuHuyzNxtvOPgNxCCIp55OyiYBi5l/A9S
 8f43Gb6IP+lKojFPC0CQl98np4kScTq34mcYk1jZWmURhtRkbH1/kj33h
 A2BjQub0bGeM67lSogsqXGlMi/nnn2LVM6B54lGZXZrhmrw9QSj+wS2x2
 L10hu8OuStHXURIz8lZKeYNepe3jIzUWmYFp4w2FyJjdjJScZSrJExx+l w==;
X-CSE-ConnectionGUID: s7JxcsctSmyHJ9PitP4z8A==
X-CSE-MsgGUID: lE3f9k+JRteIKNRlD5/rKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38801595"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38801595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 09:17:43 -0800
X-CSE-ConnectionGUID: TqExHUX7Q2Cn22Qq2qDWOw==
X-CSE-MsgGUID: WqwYG6EIR6SpMjXYRACnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="109580909"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 09:17:42 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/debugfs: Add node to dump guc log to dmesg
Date: Fri, 31 Jan 2025 09:17:16 -0800
Message-ID: <20250131171716.3998432-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Currently xe_guc_log_print_dmesg() is unused, as it's expected
developers to add those calls when needed. However it makes it hard to
guarantee it's working as nothing is testing it. Add a node in debugfs
so it can be tested. This is purely for testing purposes since with the
device probed and working, the guc log can be obtained by the regular
debugfs file.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 0aff1d462bc01..c569ff456e741 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -48,6 +48,18 @@ static int guc_log(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_log_dmesg(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m->private);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_log_print_dmesg(&guc->log);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static int guc_ctb(struct seq_file *m, void *data)
 {
 	struct xe_guc *guc = node_to_guc(m->private);
@@ -77,6 +89,7 @@ static int guc_pc(struct seq_file *m, void *data)
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
+	{"guc_log_dmesg", guc_log_dmesg, 0},
 	{"guc_ctb", guc_ctb, 0},
 	{"guc_pc", guc_pc, 0},
 };
-- 
2.48.0

