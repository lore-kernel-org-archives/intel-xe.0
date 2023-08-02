Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A55C001DF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 07:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D7010E4C4;
	Wed,  2 Aug 2023 07:05:49 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038AC10E4C4
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 07:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690959947; x=1722495947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8BocdH69iqHD17/5bkbPDaVC2Pcq6BJg3BC4cObCexA=;
 b=C1uJjQgtWRspEWV1JLB6UUmdMruyMUm7ymJBHM6PeR6SnOkBcuoSvwIk
 WMHxZz/rglO5qKSKv6VAB9QdvqfA82GF0FHhkDDOmYZGwon+dWwxuE7wN
 Mbpk2GmMiJINFl6ckt7GajaRTjBi9dKVW0vJuSOfmaHlmN6NnUEZqoy/o
 9Aws6Byi60Qv8wMAO2k2UL2XcXLlidGl5Up9cl+0mqIo9R/gO0xZE9UQV
 lePkHLyQqG/Lgj8FYcbAj2R1D+LHA3Vr+T6w771eyr2YCHtCDtntXjfw4
 RCOMc/gesyvGg1UKJ8KbX3mEAOeRFcnc6xnAwwXOLtsnhB6sEC1CLMp5Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359542076"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="359542076"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 00:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732268407"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="732268407"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 00:05:39 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  2 Aug 2023 12:34:49 +0530
Message-Id: <20230802070449.2426563-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pm: Add vram_d3cold_threshold for d3cold
 capable device
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Do not register vram_d3cold_threshold device sysfs universally
for each gfx device, only register sysfs and set the threshold
value for d3cold capable devices.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 8bb8e154e5f8..0f06d8304e17 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -165,8 +165,11 @@ void xe_pm_init(struct xe_device *xe)
 	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
 
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
-	xe_device_sysfs_init(xe);
-	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+
+	if (xe->d3cold.capable) {
+		xe_device_sysfs_init(xe);
+		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+	}
 
 	xe_pm_runtime_init(xe);
 }
-- 
2.38.0

