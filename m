Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFEAFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 09:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25610E617;
	Mon,  4 May 2026 09:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOSasfF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06A110E5FD
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777888178; x=1809424178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C7qSvRCG+uXtL7yuxvngnv7z6y6kMq1NHX8CIZVDmEc=;
 b=hOSasfF+yMm2KLkgPYi+Ei8soCbJ4AErnuoxNWi+0WCu19tsXpLXkjRa
 WG7ec4oBtTJkvuxlG3NkM7rIkl5R8o9pWqOJ9t7++o45PLgGll2JaH4jL
 /ylU+nwBNuCjAZPeurQyS6DhbWirUPc/5sstvIqzIfDQvMALPdfXEd9sD
 JNHrKvQv/pcHC5pWIRN2pwFg7dm6KT+X1fvozAPa6b0vC0II/GwumtK1z
 kGy1zdvu+ZauOcsa7/G/ywIrAUkyX8kqCPQ+d9kP9JYUA5CPlKcdMcHnn
 ZWOkU5FcYY/GT7TQfGOQJV5saMHMKsnh2FPReQXEnqvQKo53o05Unt63c g==;
X-CSE-ConnectionGUID: +HxRmwLwScilfg7C1zH4sg==
X-CSE-MsgGUID: D/7Z1ZRsSZq7wR1QdrcMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="104192926"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="104192926"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:49:37 -0700
X-CSE-ConnectionGUID: TrjOwTrQR1miYNVcKTht+Q==
X-CSE-MsgGUID: nXGBHbIbTpOTUgRUeO4Jag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="239783381"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa004.jf.intel.com with ESMTP; 04 May 2026 02:49:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/1] drm/xe/guc: Exclude indirect ring state page from ADS
 engine state size
Date: Mon,  4 May 2026 09:49:26 +0000
Message-ID: <20260504094924.3760713-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
References: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
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
that comes after it in the context image. The GuC uses this size to
overwrite the engine state in the LRC on watchdog resets and we don't
want it to overwrite the indirect ring state as well.

Fixes: d6219e1cd5e3 ("drm/xe: Add Indirect Ring State support")
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
V1 -> V2:
- Replaced xe_lrc_skip_size() with xe_lrc_engine_state_size().
- Updated commit message (Daniel).
---
 drivers/gpu/drm/xe/xe_guc_ads.c |  5 +----
 drivers/gpu/drm/xe/xe_lrc.c     | 11 +++++++++--
 drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ce651da6f318..b9bca6084a4f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -515,12 +515,9 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
 		 * that starts after the execlists LRC registers. This is
 		 * required to allow the GuC to restore just the engine state
 		 * when a watchdog reset occurs.
-		 * We calculate the engine state size by removing the size of
-		 * what comes before it in the context image (which is identical
-		 * on all engines).
 		 */
 		ads_blob_write(ads, ads.eng_state_size[guc_class],
-			       real_size - xe_lrc_skip_size(xe));
+			       xe_lrc_engine_state_size(gt, class));
 		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
 			       addr_ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9db914584347..fdfe2ed5f683 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -727,9 +727,16 @@ size_t xe_lrc_reg_size(struct xe_device *xe)
 		return 80 * sizeof(u32);
 }
 
-size_t xe_lrc_skip_size(struct xe_device *xe)
+/**
+ * xe_lrc_engine_state_size() - Get size of the engine state within LRC
+ * @gt: the &xe_gt struct instance
+ * @class: Hardware engine class
+ *
+ * Returns: Size of the engine state
+ */
+size_t xe_lrc_engine_state_size(struct xe_gt *gt, enum xe_engine_class class)
 {
-	return LRC_PPHWSP_SIZE + xe_lrc_reg_size(xe);
+	return xe_gt_lrc_hang_replay_size(gt, class) - xe_lrc_reg_size(gt_to_xe(gt));
 }
 
 static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7c975f9e2d9..5440663183f6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -130,7 +130,7 @@ u32 xe_lrc_parallel_ggtt_addr(struct xe_lrc *lrc);
 struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
 
 size_t xe_lrc_reg_size(struct xe_device *xe);
-size_t xe_lrc_skip_size(struct xe_device *xe);
+size_t xe_lrc_engine_state_size(struct xe_gt *gt, enum xe_engine_class class);
 
 void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
-- 
2.43.0

