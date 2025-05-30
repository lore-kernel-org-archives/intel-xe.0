Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F9EC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 22:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F061910E8A1;
	Fri, 30 May 2025 22:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiJ2YUFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9408510E8A1
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748644344; x=1780180344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DeCGI+DH0ngtmDgT/0w6kIPtBMpcGQ9fz7K0TiWFPng=;
 b=AiJ2YUFJFPqUY0Z+vMYSsDgtoznXks8+QGxHDdcKZTrYqa3iGRNU73l0
 kZLuRyFLZ1FkDNEateTyHydnpxBIzcWjgr5I4x+gcMZBPVXYaGjsK7kLF
 z/nMW2Xhhv36BHvs1Kp7W4N7IcziEvIIoU8QY7b9Bjp/r0xNxNdj4rjTy
 c7LVGywKoKGAgOXdYTA1z+5uxCnqkwq3QbqUuo5CPJglFYlTmfNUuIlaD
 TOw8UKe+xKS395t2BToRXJD0vDRpZrawI0t7FfZ4ncEWy8QaTHHdb25i2
 IsBYpS5ILpU2KDqImHqgDa3KuoP0XYW+lw61gRJj9imiUpvJk631sFXuF g==;
X-CSE-ConnectionGUID: 8nTQzDqGQQKTcyMDpDtHsg==
X-CSE-MsgGUID: 6rg3dP8QQT+ibYaB6NmOGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49867467"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="49867467"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 15:32:23 -0700
X-CSE-ConnectionGUID: sUWX/fRxR1SrGAc909VBLw==
X-CSE-MsgGUID: qJ5/ApxjQMumj/8EsiAB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="181200189"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 15:32:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Simplify and fix 32b wrap
Date: Fri, 30 May 2025 15:31:57 -0700
Message-ID: <20250530-xe-hwmon-wrap-v2-1-ce653db7fe4a@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250527-xe-hwmon-wrap-1a7e16a007c3
X-Mailer: b4 0.15-dev-d9694
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

Like done in commit eaa287069a70 ("drm/xe/guc_submit: Simplify and fix
diff calculation"), just use u32 for wrapping the value, which is
simpler and more correct: when wrapping on 32b, the accumulated value
was off by one.

Also, do not mix the u64 value from pmt with the u32 value used for the
calculation.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Rebase - now there's a u64 coming from pmt that was mixed as
  "reg_val", so use separate variables.
- Removed previous r-b due to the code changes. Raag, please let me know
  if you are still ok with this
- Link to v1: https://lore.kernel.org/r/20250529-xe-hwmon-wrap-v1-1-60d3f1eed17d@intel.com
---
 drivers/gpu/drm/xe/xe_hwmon.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 778354c91f598..0d32e977537ca 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -436,7 +436,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
-	u64 reg_val;
+	u32 reg_val;
 	int ret = 0;
 
 	/* Energy is supported only for card and pkg */
@@ -446,29 +446,27 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	}
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
+		u64 pmt_val;
+
 		ret = xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
 					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
-					&reg_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(reg_val));
-		if (ret != sizeof(reg_val)) {
+					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
+		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
 			*energy = 0;
 			return;
 		}
 
 		if (channel == CHANNEL_PKG)
-			reg_val = REG_FIELD_GET64(ENERGY_PKG, reg_val);
+			reg_val = REG_FIELD_GET64(ENERGY_PKG, pmt_val);
 		else
-			reg_val = REG_FIELD_GET64(ENERGY_CARD, reg_val);
+			reg_val = REG_FIELD_GET64(ENERGY_CARD, pmt_val);
 	} else {
 		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
 								channel));
 	}
 
-	if (reg_val >= ei->reg_val_prev)
-		ei->accum_energy += reg_val - ei->reg_val_prev;
-	else
-		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
-
+	ei->accum_energy += reg_val - ei->reg_val_prev;
 	ei->reg_val_prev = reg_val;
 
 	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,



