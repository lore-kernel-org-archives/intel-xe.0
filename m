Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106D5D61013
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 12:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9418410E856;
	Thu, 29 Jan 2026 12:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzIFngGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D2110E856
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769691121; x=1801227121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xSgh4E49GCpBtC/hkMQA5yxxnPqjDSIrTW6Q+oCWTT0=;
 b=ZzIFngGKFeg/kcLVKeNCQcC/He54ZXSHDJnSgt06cD0YsKS/O/5Yo/8s
 HNcHKD3CL2Zr/a1XrSuSn33r9g7wBucb4AUxWqEnmJp1lvLtyKLNWderg
 lzZQOtUhjE7d6ZV1TPCujtoTIy9yqhf1BxJx8qb/iiVuU8XJWKW+J+brY
 V6KmNWmkgtjDci+iKBUcQInQy0g2buKt3L74iyOxA7Bs2kf2z1s9SMVYm
 WQNmYQDhNc/JaJa4FEoYQVAVx/iR/KWenUUDpBXrFh6OSB+YVEH7rncIO
 b8IYRjfZCCJEzRdZTHbIRAFG+vKsScM7ljqSuKhNbSBqGhZr5aAWU+blE g==;
X-CSE-ConnectionGUID: rp1APzd4TpuxwMwdwN1B9Q==
X-CSE-MsgGUID: ds9Bg1ThS++6o//Tqa7Zmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70129158"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70129158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:52:01 -0800
X-CSE-ConnectionGUID: kqVOBoWuSnWtG2LyH1orUg==
X-CSE-MsgGUID: wwq32jQcS2mdXAFRLANz6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208995094"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2026 04:51:59 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Fix fs_reclaim warning with CCS save/restore
 BB allocation
Date: Thu, 29 Jan 2026 12:51:43 +0000
Message-ID: <20260129125141.523087-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
References: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
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

CCS save/restore batch buffers are attached during BO allocation and
detached during BO teardown. The shrinker triggers xe_bo_move(), which is
used for both allocation and deletion paths.

When BO allocation and shrinking occur concurrently, a circular locking
dependency involving fs_reclaim and swap_guard can occur, leading to a
deadlock such as:

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------

      CPU0                    CPU1
      ----                    ----
 lock(fs_reclaim);
                              lock(&sa_manager->swap_guard);
                              lock(fs_reclaim);
 lock(&sa_manager->swap_guard);

 *** DEADLOCK ***
=====================================================

To avoid this, allocate CCS save/restore BB BOs using GFP_ATOMIC,
preventing reclaim from being invoked in this context.

Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b678297aaa2..355365625df9 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -62,7 +62,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
 {
-	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
+	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_ATOMIC);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_sa_manager *bb_pool;
 	int err;
@@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 	 */
 
 	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
-	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
+	bb->bo = __xe_sa_bo_new(bb_pool, 4 * (dwords + 1), GFP_ATOMIC);
 
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
-- 
2.43.0

