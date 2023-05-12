Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825FDC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 07:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E7C10E4BF;
	Fri, 12 May 2023 07:43:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AAA10E4BF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683877425; x=1715413425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CN369+3lFMjhPFs+RbBKn//29yGPokGrjyroS74NYKo=;
 b=B+t4UjGfhXE/OpOkG7tZak+tcUeFGqpRkYtJIhyUCyyOYArQFH5oPPk3
 M71eQ56Qt7o6lE7/pAaTipMeRoddU/MWkruMC+iIVxDbSWNLdf1ptYI2k
 cJlUrZYMBNceTn2lq6oPaUwkCe/0ll5+xQImmFYy6i+qlS7MWuZzhXu/6
 k9mujymYwrtFbkmAQWOmEy2sjme1mcM4Zv0vU3788ClWALoARrfYdI8U+
 5Kzd079qklePC1RtXm8pIMTgRh26mUnPM99B2q+Z34ncGaIe0/jD+5jSi
 2hEFMF8SHCxSelHGHj9z5yQMgYJZraELwV6rLvt694MmUQ33s2V38zB6X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330348790"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="330348790"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769687769"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="769687769"
Received: from mshimon1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.243])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:43:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 10:43:35 +0300
Message-Id: <20230512074335.1293293-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512074335.1293293-1-jani.nikula@intel.com>
References: <20230512074335.1293293-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915/gt: drop dependency on
 VLV_DISPLAY_BASE
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

CHV_FUSE_GT (0x182168) is purely about GT fuses, therefore belongs in
intel_gt_regs.h, is in the gcfgmmio unit, but is technically in the VLV
display base area.

Add VLV_GUNIT_BASE to drop dependency on VLV_DISPLAY_BASE and thus
display/intel_display_reg_defs.h in intel_gt_regs.h.

v2: Add VLV_GUNIT_BASE (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230511152153.986676-1-jani.nikula@intel.com
(cherry picked from commit 6e4e9fbd5ba01eed13cb086ea645f8513370761d)
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index af80d2fe739b..61ef9b2c8878 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -7,7 +7,8 @@
 #define __INTEL_GT_REGS__
 
 #include "i915_reg_defs.h"
-#include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
+
+#define VLV_GUNIT_BASE			0x180000
 
 /*
  * The perf control registers are technically multicast registers, but the
@@ -1469,7 +1470,7 @@
 #define GEN12_RCU_MODE				_MMIO(0x14800)
 #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
 
-#define CHV_FUSE_GT				_MMIO(VLV_DISPLAY_BASE + 0x2168)
+#define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
 #define   CHV_FGT_DISABLE_SS1			(1 << 11)
 #define   CHV_FGT_EU_DIS_SS0_R0_SHIFT		16
-- 
2.39.2

