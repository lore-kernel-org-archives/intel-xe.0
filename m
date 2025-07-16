Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0696C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A306F10E692;
	Wed, 16 Jul 2025 20:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebD2YAQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9D310E68E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752699356; x=1784235356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9yl2tOP+I2TLgQv7EZ35ENXIX60Ri6s/2XOpbD4imY=;
 b=ebD2YAQHbGteI+MUUD3z3drns3yXQxqEy6Fkf7NZG4bWa+MOsb0nsqvK
 1L8NymMshDDT2yQqfJhwSm5sFaCvf5HRZ92DMuRMwRGX3CK3g8QTAiLBT
 soa4CNSNyZbkMbV+RA5mbaLrJ3/r1s0AkfSalUpQ2A7AaGw2y6LFmYbNr
 0De6q9eQp9SkS2mjnQogW4LOdbFGKCll12tH0WtqjZ92KIWimX5PLqi0z
 Ju3838m7Sk4+NUZaK68s9xSBMsrzvCg83tUAc4C66YKLkn2Yxq/DW6Yq2
 PGHK1XQsvDn9Arleci6zRJERy/k8thQFnB1OEFbuJlSYzKhQPmrO5+cqy Q==;
X-CSE-ConnectionGUID: meUc+Wp/QfaoyNfZQ1lpgw==
X-CSE-MsgGUID: 4mTkCtJiTRqqiYYpyDDE9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58770466"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58770466"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
X-CSE-ConnectionGUID: am2AmZFpTgOlogFPQbZHDQ==
X-CSE-MsgGUID: hrfc0tSATGqMnNoiP2QD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157686076"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Brian Welty <brian.welty@intel.com>
Subject: [PATCH 1/4] drm/xe/psmi: Add setting of PSMI feature flag
Date: Wed, 16 Jul 2025 13:55:44 -0700
Message-ID: <20250716-psmi-v1-1-674c13d7028e@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716-psmi-v1-0-674c13d7028e@intel.com>
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

PSMI allows to capture data from the GPU useful for early
validation. From the kernel side there isn't much to be done, just a few
things:

	1) Toggle the feature support in GuC
	2) Enable some additional WAs
	3) Allocate buffers

Here is the first step, with the next ones to follow.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Original-author: Brian Welty <brian.welty@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 drivers/gpu/drm/xe/xe_module.c   | 3 +++
 drivers/gpu/drm/xe/xe_module.h   | 1 +
 4 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1d1d6da37581..a117300501247 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -86,6 +86,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (!guc_to_xe(guc)->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
 
+	if (xe_modparam.enable_psmi)
+		flags |= GUC_CTL_ENABLE_PSMI;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 6f57578b07cb0..2a5256c24b9d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -107,6 +107,7 @@ struct guc_update_exec_queue_policy {
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
 #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
+#define   GUC_CTL_ENABLE_PSMI		BIT(7)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
 #define GUC_CTL_DEBUG			3
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 064093bf1adca..2e6ac082f7bee 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -57,6 +57,9 @@ module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
 		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
 
+module_param_named(enable_psmi, xe_modparam.enable_psmi, bool, 0444);
+MODULE_PARM_DESC(enable_psmi, "Enable PSMI capture support");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
 		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4c..a84af8eccb91d 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
+	bool enable_psmi;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;

-- 
2.49.0

