Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BBDC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 10:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEF910E339;
	Wed, 23 Jul 2025 10:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JT/igRpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DB810E339
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753268199; x=1784804199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SxvTPiRw1y8n6zkQ8L/QCbFRUNPNKUNwTMfjF0ZJ8g0=;
 b=JT/igRpwRDroCjEhky71O5KNvQlaOinXnkNkBKyLm+CMlHEo3SEq633t
 mt01UyscstHx6nGaeo9+OVNOB06JguYtq8DeFuzBN/AUMIbE/KuvTjEhW
 4GXNgGxJOVEZPblrK/aNksABtfl0e+Yu9/df+0BbR2IVJODz8t1a5LOOI
 rUqLkxY5j7FDGJnjOD3NpESW6uFFAwlibEr0fwhunrr9nz7n7ZGSgj2sJ
 Ddb7sV4hqcLXuwnljhN8dWZNE0c7ZOz3fR3+mPlgolzi2Ov3qVS1bRlFg
 LEY+JLdVoQXsC1vludQrSrgf1BgRTN4RdAr5ccLWmWVPQIQiV/nztwDg5 g==;
X-CSE-ConnectionGUID: pZFSImR2TUKcVU0530N8ew==
X-CSE-MsgGUID: zIYqhjlCSsKWDoOg9YKNLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66616697"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66616697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:56:38 -0700
X-CSE-ConnectionGUID: a9p7KSzRSRmX1+iAesGdIA==
X-CSE-MsgGUID: oTmk2FSqSHyDLuO3bls3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164876068"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2025 03:56:38 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: [PATCH v2] drm/xe: Improve VF provision stability with fault injection
Date: Wed, 23 Jul 2025 16:43:25 +0530
Message-ID: <20250723111325.3680-1-satyanarayana.k.v.p@intel.com>
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

In unlikely event, due to PF malfunction or misconfiguration, VF may
receive incomplete or invalid configuration and it must be prepared
to handle such cases without causing a crash.

When simulating errors with the kernel's fault injection framework, crashes
were observed during device unbind. These crashes were primarily due to the
use of the XE_BO_FLAG_GGTT_INVALIDATE flag when creating buffer objects.

The GGTT is invalidated using CTB, which is allocated with the
XE_BO_FLAG_GGTT_INVALIDATE flag. However, the buffer object for CTB is
freed before GGTT invalidation completes, leading to crashes.

Similarly, for buffer objects allocated in memirq_alloc_pages() and
__xe_sa_bo_manager_init(), the CTB is already freed by the time GGTT
invalidation occurs, resulting in system crashes.

To prevent these issues, while invalidating ggtt, an additional check for
validity of ggtt is added which avoids sending CTB to GUC.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Summers Stuart <stuart.summers@intel.com>

---
V1 -> V2:
- An additional check for validity of ggtt is added in
xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
(Summers Stuart)
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 086c12ee3d9d..145b5f90e347 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -294,10 +294,12 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
  */
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
 
-	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
+	if (tile->mem.ggtt->scratch &&
+	    xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
 		struct xe_gt_tlb_invalidation_fence fence;
 		int ret;
-- 
2.43.0

