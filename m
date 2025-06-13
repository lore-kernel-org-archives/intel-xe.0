Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6CC7114A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0710610E9EB;
	Fri, 13 Jun 2025 20:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS/ioRio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082A410E9A6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844847; x=1781380847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQt2OBApqVAksZQ1VKx6Gjj7rcHvWUmCxen21l/qBdc=;
 b=WS/ioRiokSBW8QZm9epUskEy01y2+GWwgHTF/47mjKtMGE72fTVtITbw
 9U7KUM3A/+cAjmU6ySqNMq3S7bKka50xNLx8ogqVQuhHNjjmd6Wrbu8Q7
 KF3miR9R1N8swURhL0cCR+bEUyUaw0hRD3c54c4JHs0nspg+QW13hCSar
 Ks4sSV8jy7Qrwqg1Mwx7T0nFJh53eJGHcf3LnZ4swtGrkUjekB7AhKrHl
 0QBito+b2lnATWdNVpZvLJ/HzXwmwy36gk/2R1Mc04TaabO/IUxze2uTK
 g2nSOXYgy+gtkoGr1Jxn7tQne1JkfAKK0vT+KgYG3MU/fPCX2urnvniFu g==;
X-CSE-ConnectionGUID: TDG/WydoTmKSQSkeH/xt2g==
X-CSE-MsgGUID: TwDy1zFJQICJcP4LbTHjjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52054314"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52054314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:47 -0700
X-CSE-ConnectionGUID: AEHVi0jmS0eRyGX2+C3zLw==
X-CSE-MsgGUID: dxRGEGNvRle0t2ajNzWVLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152875675"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Annotate default for guc_log_level param
Date: Fri, 13 Jun 2025 13:00:38 -0700
Message-ID: <20250613-guc-log-level-v2-2-cb84a63e49fe@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

Reword the parameter description so it's clear what's the default and
what are the verbose levels.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4809afa7ce3f9..192908fa074cb 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -18,9 +18,15 @@
 #include "xe_observation.h"
 #include "xe_sched_job.h"
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define DEFAULT_GUC_LOG_LEVEL	3
+#else
+#define DEFAULT_GUC_LOG_LEVEL	1
+#endif
+
 struct xe_modparam xe_modparam = {
 	.probe_display = true,
-	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
+	.guc_log_level = DEFAULT_GUC_LOG_LEVEL,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
@@ -43,7 +49,8 @@ module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
 
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
-MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
+MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
+		 "[default=" __stringify(DEFAULT_GUC_LOG_LEVEL) "])");
 
 module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,

-- 
2.49.0

