Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F7AE69186
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 18:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7E510E062;
	Fri, 22 Nov 2024 18:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP0/phL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1727310E062
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 18:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732298908; x=1763834908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=17B+9tElwen29sEB4GFLia7qnWQamcY9w/4r7vhQ94U=;
 b=LP0/phL9l0a/6+tT1fGYQ/dDRPRlxa7E7DranM2aSiMFf30c9Byc1f5b
 jqJY8fCMMDH8dmJ29iXZjTUHAPqhN+6cXC2+jC7mwdxR8lRS2Y/Fwm6h3
 TNI8tQnA3m7cNu7u1hpLFAtQNWbSGL9d0MJp9XZxQsYFh1qIJN7a6jqMS
 FUqa/ZzfvCbHHklmcWWa6pS48bRPszgLcJO5oVEZuqlm17wCYpO1c4l5P
 1+bnkK+vimdwS7sX3iKzfnA9ZHpYysZcBh9qSWCXUfQ40LKszv5RU3aYH
 KOcWk68/+nFmTa67RGeEn4FydIObCML7QrmX3ZRYr/dqBoSyv2I58fwP1 g==;
X-CSE-ConnectionGUID: Wr5TaSaRRmu2MjtX/jiAaQ==
X-CSE-MsgGUID: sefUFMCsTvmqCJjiod1ALg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32625030"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32625030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 10:08:27 -0800
X-CSE-ConnectionGUID: M1wdA6HTSdaWMdo+61N79w==
X-CSE-MsgGUID: PnzAY19yQcCy85kdIb/tVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="91065775"
Received: from dut4411lnl.fm.intel.com ([10.105.10.104])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 10:08:27 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 umesh.nerlige.ramappa@intel.com, john.c.harrison@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 ashutosh.dixit@intel.com
Subject: [PATCH v3] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Date: Fri, 22 Nov 2024 18:08:26 +0000
Message-ID: <20241122180826.7075-1-jonathan.cavitt@intel.com>
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

v3:
- Rebase

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Lucas de Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

