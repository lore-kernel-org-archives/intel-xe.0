Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DF7C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 21:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71610E080;
	Wed, 11 Jun 2025 21:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCC+VMN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA310E080
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 21:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749675955; x=1781211955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y6LwwldsiL7hq1dVFIXWncpcF1YKGw2GvC4PijOoHcc=;
 b=aCC+VMN2NL3/CG52VnC6gwQssalbD+6JI1FJh2Ynq1OU2mG+L6O5k0EP
 ynA5ffPjWHhuNhoXSQFbwGyGv4epl2hsTldbt1io8frtb+SzoJwxp6DuO
 Ao4Zi0U1bQEfz5yX9C2z5K3GNJHiywKGlnkCwBTNgx7ivBm9XotVpMEKw
 Y4KfwMrdhNzlwzj9ckSBtU0iVvtbQhFgjIVkInRwyB6Lt/WxB8sPghCoB
 2bFBC3iQ2K2P+QDcEAHNZrnTJMqxVdsB3NticeP8/TKdZQzDEJmAWHLye
 VBZvEBLtdjYu9VROQP7EnjcGjSGWLBKpb1Mr1XaTbI/xbLwycw6BeHLEk g==;
X-CSE-ConnectionGUID: EA++ERqvTNyakR0GflYWBQ==
X-CSE-MsgGUID: Bt6ZkiR8Rqmkhqbc0hb4Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="54462481"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="54462481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:05:54 -0700
X-CSE-ConnectionGUID: +4fwckcETHWRP+Wel8lXTw==
X-CSE-MsgGUID: V0wb0r9FRCSLq96qlnpDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152198742"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2025 14:05:53 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Date: Wed, 11 Jun 2025 14:05:53 -0700
Message-ID: <20250611210553.3756700-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

The GuC has an option to write log data via NPK. This is basically a
magic IO address that GuC writes arbitrary data to and which can be
logged by a suitable hardware logger. This can allow retrieval of the
GuC log in hardware debug environments even when the system as a whole
dies horribly.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
 drivers/gpu/drm/xe/xe_module.c | 4 ++++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e16d19b44bcc..9c0e3113f7d5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -35,6 +35,7 @@
 #include "xe_guc_submit.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_platform_types.h"
 #include "xe_sriov.h"
 #include "xe_uc.h"
@@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 	else
 		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
 
+	if (xe_modparam.guc_log_target)
+		flags |= FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_target);
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 1c4dfafbcd0b..fc8c681819b9 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -21,6 +21,7 @@
 struct xe_modparam xe_modparam = {
 	.probe_display = true,
 	.guc_log_level = 3,
+	.guc_log_target = 0,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
@@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-res
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
 
+module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
+MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
+
 module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,
 		 "GuC firmware path to use instead of the default one");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..4d978f6f26b6 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -14,6 +14,7 @@ struct xe_modparam {
 	bool probe_display;
 	u32 force_vram_bar_size;
 	int guc_log_level;
+	int guc_log_target;
 	char *guc_firmware_path;
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
-- 
2.49.0

