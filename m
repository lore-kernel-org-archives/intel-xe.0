Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE66CCCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 19:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AD710F156;
	Wed, 29 Apr 2026 19:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/teaE3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DCC10F154
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 19:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777490593; x=1809026593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IW8YZuwMgYs2t9P3b3BBvy4DdAXK82K+eIR7nz3XClQ=;
 b=c/teaE3KVYl+i6t1kV0qt+MDREB45bn2S09Ccis1lN3FlisvGQ8HjY5H
 sR8lkqY45q4EGQ8CkmjSGZkF9ispf5EMSaSOPzNZNFg9mBoP4plFS2B5H
 CzCyqSTpk+d8Pr6I2eodquvd4sS3ElU9pJUznSBG7WU10iERcQW2r731I
 70K/uQQ1MwgauNWIUL4IhF8X2OUW7nEEFJid+MDeDpm0KOnRTVOISOhvz
 NiUfBoMbkYcTl5wP1VC+5YVsEVIsmWps1SbR2S/ZTgP2eKPTIhRcmMAnp
 7tv7Q4BFCIyuQTwZMFYO5T6DVFdzginBgZqPwpPs+mNAAo++ZP7lZ90PX w==;
X-CSE-ConnectionGUID: YlK13Ln6SHaJ8SQys7YInQ==
X-CSE-MsgGUID: MozIIOqhSW+VWoFLLxBqGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89029090"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89029090"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:23:13 -0700
X-CSE-ConnectionGUID: pgXAHwFqR3ucVPn31CvfvQ==
X-CSE-MsgGUID: Q7LaFUxcQ9yCA/tzbizbgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="257935908"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2026 12:23:11 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF view
 during migration
Date: Wed, 29 Apr 2026 19:22:59 +0000
Message-Id: <20260429192259.4009211-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

pf_migration_mmio_save() and pf_migration_mmio_restore() initialize a
local VF-specific MMIO view via xe_mmio_init_vf_view() but then pass
&gt->mmio (the PF base) to all xe_mmio_read32()/xe_mmio_write32()
calls instead of the local &mmio. This causes the PF own SW flag
registers to be saved/restored rather than the target VF registers,
silently corrupting migration state.

Use the VF MMIO view for all register accesses, matching the correct
pattern used in pf_clear_vf_scratch_regs().

Fixes: b7c1b990f719 ("drm/xe/pf: Handle MMIO migration data as part of PF control")
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 87a164efcc33..01fe03b9efe8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -385,10 +385,10 @@ static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf
 
 	if (xe_gt_is_media_type(gt))
 		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
-			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
+			regs[n] = xe_mmio_read32(&mmio, MED_VF_SW_FLAG(n));
 	else
 		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
-			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
+			regs[n] = xe_mmio_read32(&mmio, VF_SW_FLAG(n));
 
 	return 0;
 }
@@ -407,10 +407,10 @@ static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 
 	if (xe_gt_is_media_type(gt))
 		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
-			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
+			xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), regs[n]);
 	else
 		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
-			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
+			xe_mmio_write32(&mmio, VF_SW_FLAG(n), regs[n]);
 
 	return 0;
 }
-- 
2.43.0

