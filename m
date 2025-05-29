Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE7C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 17:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D945810E02E;
	Thu, 29 May 2025 17:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="it0ll3dT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ACC10E02E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748540377; x=1780076377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lz3O7HH41vj4WZoaKovx8bX38ziuWAIPEI+HgA+EMfs=;
 b=it0ll3dTLU6JYDPvpzevKIFDbnsRTI/GDqZc8YWW0HUSjZi1Fw2/nFwF
 58F3CkiySm7K9I4fCguwgpam9hec2KeLyMDEH3hcYwiu0dlTW9Is5jeJR
 VevVr5pN0SEElHQXGzWXYhmFs7iD0UuC7WLw3vIknzy9a265ZWS9MxXt5
 DiL/BcLB0hWIEqWBdl0GcEFkCrDf2HdKBAoBZjbmKQ5hSssfFRkIRQ9nX
 8OerHuLaHKfHXUorykxYJRpAq1xcc20FHmw0poe6hv9whDDRF73Ckd0Xv
 ea/rVul7FhAtCTn6qiGu9NYkOnxuZ+czcnRPbW8KsQIMgBUMGuqdAGVZt A==;
X-CSE-ConnectionGUID: gS6csbNLS4CfG/LlqoTn8w==
X-CSE-MsgGUID: LaMBNIq6Qye59ycEIUzdKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50316504"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50316504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:39:36 -0700
X-CSE-ConnectionGUID: W0ULuD5cRhGHnO70S1fxmA==
X-CSE-MsgGUID: 7Wtt78BzRr6c4s9nBQhHQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143968034"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:39:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH] drm/xe/hwmon: Simplify and fix 32b wrap
Date: Thu, 29 May 2025 10:39:25 -0700
Message-ID: <20250529-xe-hwmon-wrap-v1-1-60d3f1eed17d@intel.com>
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

Cc: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index eb293aec36a0f..afb9eef2c681e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -306,16 +306,11 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
-	u64 reg_val;
+	u32 reg_val;
 
 	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
 							channel));
-
-	if (reg_val >= ei->reg_val_prev)
-		ei->accum_energy += reg_val - ei->reg_val_prev;
-	else
-		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
-
+	ei->accum_energy += reg_val - ei->reg_val_prev;
 	ei->reg_val_prev = reg_val;
 
 	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,



