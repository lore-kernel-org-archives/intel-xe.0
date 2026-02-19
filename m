Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8126E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 03:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A650310E66C;
	Thu, 19 Feb 2026 03:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0t1qC3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5C610E66C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 03:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771472394; x=1803008394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x9yzwOH+RH6poofeWUS+JyT/9ynlhLPGK2y/IYN5YLQ=;
 b=k0t1qC3nnUN2qkW7dGroUgtThu4j7jdtlmaKhpHKOsWWbFHVVFtKmNut
 VGhhEqmIOusr+PaLTFczLIP4ZkNGHS3VMour2g383iG0YL9EQiMuaPb0w
 /DYP6AFMyevQZi1kEMSzzQhJuaPn/MvDrflDGoIh6IC6ir0nNo3xlAvfc
 Riivqdqkxgorywl6EKAlwqZr6A3sHw9cH8tH45tU+183vFg+P/MeZBcCE
 /UyT/vdQnRCh7xoX6Pnzk02lydQaQqc8gQaty5JiYa2KL5KhBTQvSAwKe
 MHZoem1Hy221MhPmqFKW1+1rL0n+J1JWp+PbjPpmL1tHmSKEhZ78gOuQ1 w==;
X-CSE-ConnectionGUID: C/bvxeHUSmqIdqZrOr5wCA==
X-CSE-MsgGUID: FPwW3NKHTY2wMtUtCs2ZYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72598368"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72598368"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:39:53 -0800
X-CSE-ConnectionGUID: V6i7KSS7T+GeJdAZ1UcorQ==
X-CSE-MsgGUID: jmnW3kvZTaiFnvEHIHTxGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214252015"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 19:39:52 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Skip access counter guc ads initialization for CRI
Date: Thu, 19 Feb 2026 09:44:11 +0530
Message-Id: <20260219041411.4129401-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

The Crescent Island (CRI) platform does not support the ACCESS COUNTER.
Skip writing parameters for this queue in guc_um_init_params(), leaving
queue_params[2] zero-initialized to signal unavailability to the GuC.

The queue_params[] array layout is fixed by firmware ABI, so we
maintain the structure with queues 0 and 1 (page fault request/response)
always configured, and queue 2 conditionally skipped on CRI.

Cc: Stuart Summers <stuart.summers@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f4cbc030f4c8..51e142c8a4a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -818,6 +818,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 static void guc_um_init_params(struct xe_guc_ads *ads)
 {
 	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
+	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_guc *guc = ads_to_guc(ads);
 	u64 base_dpa;
 	u32 base_ggtt;
@@ -830,6 +831,15 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
 	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
 
 	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
+		/*
+		 * CRI platform supports USM but not access counters.
+		 * Skip ACCESS_COUNTER queue initialization for such platforms.
+		 * TODO: Add .has_access_counter flag if more platforms need this.
+		 */
+		if (i == GUC_UM_HW_QUEUE_ACCESS_COUNTER &&
+		    xe->info.platform == XE_CRESCENTISLAND)
+			continue;
+
 		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
 			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
 		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
-- 
2.34.1

