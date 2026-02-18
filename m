Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F48E9A03B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 11:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6210E5A7;
	Wed, 18 Feb 2026 11:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZciYsAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2AF10E5A7
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771414879; x=1802950879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6O9+2teCuGLX9KLaBJ+uqFBr4Ye1iORnM5SgCFkSwNo=;
 b=bZciYsAW5/7nLpnTXsEixFWO02Znu0YPY5L/AQ6biJJ8jBt5y7Ohlnud
 kSmLKM8LkVSdO1nQ7zYSoPY9qVXKC/1QHyFxg6j68fAku0h4ksSrWNjPY
 PO6TTrTbCL3vOdKMrPnycLcp6v+0iye7NBQXvUNv//ox6U+piRmJF552I
 qFsgEe5YajeF25SjnCgLL0PBWzM3EPvxBG+Vb+LjbWa1+lHVtCHquxSg/
 odIZG7jlB2vXC9uSqnCYDmlPXQ49Op0mm53l9ohbjqOsFfr95aF1mlxPc
 Ks5JoMYTtRKvsRQhXO2hgLM43O6gzKsw617Cj5plOdf8EFIw6rx3PFKuN Q==;
X-CSE-ConnectionGUID: dsRhoettRcCkw3ya4HOyOg==
X-CSE-MsgGUID: pvpMN7iXT7ON+QAlnci/3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71688760"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="71688760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 03:41:18 -0800
X-CSE-ConnectionGUID: ckniX+PyQCaMqU6Zb/8wfQ==
X-CSE-MsgGUID: 3MaZKmLFTwapIPhfGGPQ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="237169414"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 03:41:16 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Read accepted power limit for CRI
Date: Wed, 18 Feb 2026 17:17:22 +0530
Message-Id: <20260218114722.2215386-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Update xe_hwmon_pcode_read_power_limit to read the accepted
power limit using the new mailbox param introduced from CRI.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 5 +++--
 drivers/gpu/drm/xe/xe_pcode_api.h | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index baf277955b33..8e1cbf7afed0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -192,8 +192,9 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
 						  hwmon->boot_power_limit_read ?
-						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
-						  &val0, &val1);
+						  (hwmon->xe->info.platform >= XE_CRESCENTISLAND ?
+						   READ_PL_RESOLVED : READ_PL_FROM_PCODE) :
+						  READ_PL_FROM_FW), &val0, &val1);
 
 	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 85cc7478b787..636b9dfb11da 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -47,8 +47,9 @@
 #define	WRITE_PSYSGPU_POWER_LIMIT		0x7
 #define	READ_PACKAGE_POWER_LIMIT		0x8
 #define	WRITE_PACKAGE_POWER_LIMIT		0x9
-#define	READ_PL_FROM_FW				0x1
 #define	READ_PL_FROM_PCODE			0x0
+#define	READ_PL_FROM_FW				0x1
+#define	READ_PL_RESOLVED			0x2
 
 #define   PCODE_THERMAL_INFO			0x25
 #define     READ_THERMAL_LIMITS			0x0
-- 
2.25.1

