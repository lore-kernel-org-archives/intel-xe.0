Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FEAC369A4
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 14:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEC210E8E1;
	Wed,  9 Apr 2025 14:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcwF+lkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE6310E8D2
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744207808; x=1775743808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MBaC3UdISQ9AhQY36n9+uH9TUH1A7PCjQ53ne+PMhzs=;
 b=UcwF+lknb88dYHzAOMkL8tMnXZX6OyweQ/0AY+hffUPJrR4+qWT80QBv
 Cvrm/lsxL/68kFW8lBofI9IPHcb91tjPa0NDQNSPvfqbD6I1DMSyeozPl
 DQM3CRDzpi3YkeT6aqz3HFPHFGsH+1Iv1T+EllLmxNazWOSiqcq+hcZtn
 OudVZVQ2xR2rW+G+gqwQJyFCaW6sTfm4RG9+tL92dv5ZpoWsmwLqvafPO
 3RVEXYG8w2ah5YiYwaik9IZfKcnoekreFRpATmsOFvMPhE1oE+8lKRsCE
 uz33hpvmjhGjdVgdaZOk4mUREuBHUJYWQdvVmtAe8cXYgphRLjHf9U3kz A==;
X-CSE-ConnectionGUID: iXRdTzsHS3GbeR0ERSlwPg==
X-CSE-MsgGUID: QCd8DZvxRG+/9minBI6TFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68164029"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="68164029"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:10:08 -0700
X-CSE-ConnectionGUID: njTEmsJ5TxWKdix10zy9MQ==
X-CSE-MsgGUID: w1U0DHjdQ0Ojf5cYOdZiIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128514316"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:10:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe: Allow to drop vram resizing
Date: Wed,  9 Apr 2025 07:09:56 -0700
Message-ID: <20250409-bar-resize-param-v1-1-75bf4df38aa0@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250409-bar-resize-param-1926ac62db90
X-Mailer: b4 0.15-dev-9a9c7
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

The default behavior if the LMEMBAR doesn't match the maximum possible
size is to try to resize it. However the user might want to keep, even
for testing the behavior with small BAR, whatever size was set via
sysfs. Change the module parameter to int and check for negative value.

Cc: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 4 ++--
 drivers/gpu/drm/xe/xe_vram.c   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 475acdba2b550..7309c0c9bc0d0 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -41,8 +41,8 @@ MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
 
-module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
-MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
+module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
+MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
 
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b1f81dca610dc..e421a74fb87c6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -49,7 +49,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
  */
 static void resize_vram_bar(struct xe_device *xe)
 {
-	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_bus *root = pdev->bus;
 	resource_size_t current_size;
@@ -66,6 +66,9 @@ static void resize_vram_bar(struct xe_device *xe)
 	if (!bar_size_mask)
 		return;
 
+	if (force_vram_bar_size < 0)
+		return;
+
 	/* set to a specific size? */
 	if (force_vram_bar_size) {
 		u32 bar_size_bit;



