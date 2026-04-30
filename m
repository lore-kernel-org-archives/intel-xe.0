Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF25BCD13D9
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 07:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7D910F234;
	Thu, 30 Apr 2026 07:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrtoozap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0FE10F231
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777534020; x=1809070020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKglD+cWCtEZAaStrcSAAwDNjbeqnZ7VarJJloncM4A=;
 b=nrtoozapq/H8wcTg9ZBfvv1uDxwSNNpGaOAP/Vn/FP3pmMv0UA0rBWBs
 X6EviVnKQNwCHZYoMKxldrkJVWms+VqJVNI9Io9FGvqLdewI4Xbcw49HZ
 HTgklMWxFLwlN8MRt1frCwHO4Z9qc3BnWCdNT1UzY0ZR1EBq3aBcdeUPY
 aoKwktTGUlKSaDFgjLc3UttMi3CQWsJE23BBsRv4otDRk1/5tFPw8PFK/
 txNatMCCrhinb32GBj+H0Mi5fyWdQB4VEln1gvHW8cIXzboR5rXMg17mM
 FoOF7DXKiaJ3r55JGsRvShSvaZbuVh4kGLZxitjpqX0bpO8+6KYkegmsx g==;
X-CSE-ConnectionGUID: 40AC/4g9SVqnfwUduzih+A==
X-CSE-MsgGUID: 6pmocu6MQhaxQsxEU1vlmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78343807"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78343807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:26:55 -0700
X-CSE-ConnectionGUID: dg3sr6vQRDCTZU3Wa4yJpg==
X-CSE-MsgGUID: +vmFCArjS3mi3s0q1aTnBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231370614"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2026 00:26:54 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/1] drm/xe/guc: Skip LRC indirect ring state size in engine
 state size
Date: Thu, 30 Apr 2026 07:26:47 +0000
Message-ID: <20260430072645.3592885-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430072645.3592885-3-satyanarayana.k.v.p@intel.com>
References: <20260430072645.3592885-3-satyanarayana.k.v.p@intel.com>
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

The engine state size reported to GuC via ADS should only include the
engine state portion and should not include the indirect ring state page
that comes after it in the context image. The GuC uses this size to restore
only the engine state portion on watchdog resets.

Fixes: d6219e1cd5e3 ("drm/xe: Add Indirect Ring State support")
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c     | 10 ++++++++--
 drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ce651da6f318..1edcc8875d35 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -520,7 +520,7 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
 		 * on all engines).
 		 */
 		ads_blob_write(ads, ads.eng_state_size[guc_class],
-			       real_size - xe_lrc_skip_size(xe));
+			       real_size - xe_lrc_skip_size(gt));
 		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
 			       addr_ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9db914584347..b83810ff4ff2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -727,9 +727,15 @@ size_t xe_lrc_reg_size(struct xe_device *xe)
 		return 80 * sizeof(u32);
 }
 
-size_t xe_lrc_skip_size(struct xe_device *xe)
+size_t xe_lrc_skip_size(struct xe_gt *gt)
 {
-	return LRC_PPHWSP_SIZE + xe_lrc_reg_size(xe);
+	size_t size = LRC_PPHWSP_SIZE + xe_lrc_reg_size(gt_to_xe(gt));
+
+	/* Add indirect ring state page */
+	if (xe_gt_has_indirect_ring_state(gt))
+		size += LRC_INDIRECT_RING_STATE_SIZE;
+
+	return size;
 }
 
 static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7c975f9e2d9..96d5243b30e2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -130,7 +130,7 @@ u32 xe_lrc_parallel_ggtt_addr(struct xe_lrc *lrc);
 struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
 
 size_t xe_lrc_reg_size(struct xe_device *xe);
-size_t xe_lrc_skip_size(struct xe_device *xe);
+size_t xe_lrc_skip_size(struct xe_gt *gt);
 
 void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
-- 
2.43.0

