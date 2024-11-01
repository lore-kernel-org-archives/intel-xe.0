Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F862E6F077
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 18:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CF510E9ED;
	Fri,  1 Nov 2024 18:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIiSPQZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816910E9ED
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730484244; x=1762020244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cqx+xhODK3BJo4B1r1Ad0EafeABaWi7onp6FJdr/svI=;
 b=LIiSPQZ+dYPbPeTH8XFyYAuSQ7m0+8NmjP1O83bURdRHbhdQ1eOyG2eK
 GnOlu6Rx4fbY9fbGY0i1nJouT67z1uyH4qcYWC3BWvkDMH32teK2SqTfW
 Zoduy3n1fDI0t+Gd7KZj32slJNxWkzI6cxDicp6tRMN3a1uGCrWBGNE9l
 ijUsc3U4gIu7Vj+t5kDqkj+bZ3qdRfD0n15KUARnp9CXqAfjGfa1W+Tfe
 SljQD+pcTE41n5Nfj3asiWIJOXAkEW11J0n5goGvPuVTRHh2zhgI3CLVe
 iQhjART1CCh1AgJjuqsg3rDZdxqPFVpri2s3iOyxIPDAADY5NwiBF9NxZ A==;
X-CSE-ConnectionGUID: AU2WhoO1RgWS0no/DvBC3A==
X-CSE-MsgGUID: XXiJuVQaS4SdxVy9Q0Omzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40803154"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40803154"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 11:04:04 -0700
X-CSE-ConnectionGUID: eKj4x405SkCRHuymi5zOYQ==
X-CSE-MsgGUID: AOpwDvMfT8+m0Y0yytIt4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="82712590"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 11:04:03 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 umesh.nerlige.ramappa@intel.com, john.c.harrison@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 ashutosh.dixit@intel.com
Subject: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Date: Fri,  1 Nov 2024 18:04:03 +0000
Message-ID: <20241101180403.97272-1-jonathan.cavitt@intel.com>
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
whitelist registers.  Add them in.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Lucas de Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 943146e5b460..2fc6b1ccc8fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -239,9 +239,12 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	unsigned int count = 0;
 
-	for_each_hw_engine(hwe, gt, id)
+	for_each_hw_engine(hwe, gt, id) {
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
+		xa_for_each(&hwe->reg_whitelist.xa, sr_idx, sr_entry)
+			count++;
+	}
 
 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
 
@@ -727,6 +730,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 	xa_for_each(&hwe->reg_sr.xa, idx, entry)
 		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
 
+	i = 0;
+	xa_for_each(&hwe->reg_whitelist.xa, idx, entry)
+		guc_mmio_regset_write_one(ads, regset_map,
+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i++),
+					  count++);
+
 	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
 		if (e->skip)
 			continue;
-- 
2.43.0

