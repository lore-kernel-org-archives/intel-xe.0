Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91120E6F093
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 22:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF2810E03C;
	Fri,  1 Nov 2024 22:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZZk/o4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E343310E03C
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730499831; x=1762035831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FXElGj6i42YIFN2Hf7UrV88s7sCREBs+OK3tHy7m6mI=;
 b=hZZk/o4hn8tF6X4r4JcZ/HLIbVdfrv8tEMycgbeoUSQaGQuxOSFLEact
 JcyT3EouCNI4HXk1IVUVqaDY/XsSrJJ26AgxIyaEuF2RVbSCq03pzi6Qe
 hajU2LVOuh7xYKp0IEZBv9nG90+xBiUy2ndSXCGr8j4IClCf5qZrakfOH
 mzo5rTb8dBKAfyRqPA/skex5LKOaT15XVbG3GFL5SE6n7dlD3MGVYs7Zc
 lnjIHwxPxXDkJcAosVTAGHLXcIaYuAEDvwCMzHoZuBbY/LcA3lC7vPQxD
 y1xWcEcjVZ1E773J07hFpvGrYm+9bfU8UDIk3Eyhq4fT/lZu9bCTKIV9b Q==;
X-CSE-ConnectionGUID: u127k+q4SDuYFPBUlcrzgg==
X-CSE-MsgGUID: crCFLsAiSXOONP80lKxOSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47728438"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47728438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 15:23:51 -0700
X-CSE-ConnectionGUID: t5MZLtW9RNS7dpmNn4WXIw==
X-CSE-MsgGUID: jo05ZzG1TPWgNvRoSxCtdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="83434299"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 15:23:50 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Date: Fri,  1 Nov 2024 22:23:50 +0000
Message-ID: <20241101222350.108367-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

When performing a guc_mmio_regset_write, we add all the registers in the
reg_sr list to the save/restore list, but do not do the same for the
nonpriv registers.  Add them in.

v2:
- Add all NONPRIV registers to avoid undefined behavior (Harrison)
- s/whitelist/nonpriv

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Lucas de Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 943146e5b460..b0afb89d9d90 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
+	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
+
 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
 
 	if (XE_WA(gt, 1607983814))
@@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 	xa_for_each(&hwe->reg_sr.xa, idx, entry)
 		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
 
+	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
+		guc_mmio_regset_write_one(ads, regset_map,
+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
+					  count++);
+
 	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
 		if (e->skip)
 			continue;
-- 
2.43.0

