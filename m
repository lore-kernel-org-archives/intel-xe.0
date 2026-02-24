Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF58F4BB89
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 20:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FD610E32E;
	Tue, 24 Feb 2026 20:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kr09VfzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B7A10E32E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771965379; x=1803501379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4MRNxWFwKlp4kg1f9FsBICV9f8Y2HWpjlp2FmLJL4TM=;
 b=kr09VfzEen68ykcFVXaPfooDGX+Gyvs/K80uOP7+XZachckH7cT/Zl+c
 +KoOBGJORG9O5hBj8YB0vFRnzwHINO/4lwTW8paDPpqHyGUAH8lYhVgzl
 HZQFucs3XG7+DurWby7g3WHAvYZr5w06WUfVQv8JoKsjvoMHbYJ9ybF1S
 oaoJPHAzRrfKCrSPWsOXnQzh/7u0uTkcGKpB9hCH7KiqnyTdPJx6qnAHc
 oH+rnMbKgaOcahKzT1jiSCBsr2D866w6uphAJ44JaqolHuGjmZ9yKSNQ9
 KuiF7+kc+J2LrJcabeXQd8742tENe3J9z8+Lzt/OliMmRyQ2A8E3onfeT w==;
X-CSE-ConnectionGUID: QA3I7Q/ORhm/Pu4sFmxdhA==
X-CSE-MsgGUID: 2nX27tjwSsedzM1OLNnjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72029527"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72029527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 12:36:18 -0800
X-CSE-ConnectionGUID: gJwcjVWfTp+vLprDxZfQUw==
X-CSE-MsgGUID: P5X/eSX0QfCF5Xt5P0bHYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215898088"
Received: from dut4094arlh.fm.intel.com ([10.105.8.70])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 12:36:18 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: shuicheng.lin@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Date: Tue, 24 Feb 2026 20:36:16 +0000
Message-Id: <20260224203616.365912-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: John Harrison <John.C.Harrison@Intel.com>

GuC provides the ability to gather logs through a hardware interface
called NPK. For certain debugging scenarios this can be advantageous
over getting logs from memory (or in addition to).

Add a hook for this alternate debugging mode via a modparam similar
to what is used for GuC log level. This translates into a parameter
passed to GuC during load time.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
 drivers/gpu/drm/xe/xe_module.c   | 4 ++++
 drivers/gpu/drm/xe/xe_module.h   | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 5d5d41d067c5..194500fb0ab2 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -12,6 +12,7 @@
 #else
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
+#define XE_DEFAULT_GUC_LOG_TARGET		0
 
 #define XE_DEFAULT_PROBE_DISPLAY		true
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54d2fc780127..10bf63c20a14 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -79,7 +79,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
 		flags |= GUC_LOG_DISABLED;
 	else
-		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
+		flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
+				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
+
+	if (xe_modparam.guc_log_target)
+		flags |= FIELD_PREP(GUC_LOG_DESTINATION,
+				    xe_modparam.guc_log_target);
 
 	return flags;
 }
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 903d3b433421..1a8127e508e4 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -23,6 +23,7 @@
 struct xe_modparam xe_modparam = {
 	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
 	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
+	.guc_log_target =	XE_DEFAULT_GUC_LOG_TARGET,
 	.force_probe =		XE_DEFAULT_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
 	.max_vfs =		XE_DEFAULT_MAX_VFS,
@@ -51,6 +52,9 @@ module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
 		 "[default=" __stringify(XE_DEFAULT_GUC_LOG_LEVEL) "])");
 
+module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
+MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
+
 module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,
 		 "GuC firmware path to use instead of the default one");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 79cb9639c0f3..bab43dbacaa0 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -14,6 +14,7 @@ struct xe_modparam {
 	bool probe_display;
 	int force_vram_bar_size;
 	int guc_log_level;
+	int guc_log_target;
 	char *guc_firmware_path;
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
-- 
2.34.1

