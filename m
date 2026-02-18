Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC40E9A04D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12B810E04A;
	Wed, 18 Feb 2026 23:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q68enkDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF74F10E643
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456654; x=1802992654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3c0HcRdgEbhuTaZdkL4O9z/5tzuSPoj67pYxMVfuwI4=;
 b=Q68enkDfNMBkOJ9ditzDLk3f0+7ApB96+dxYb0CFsJh6M9qUxo13ZHNU
 5zQswRQ+y5WG/gsW59TZVMZf3I9yWOLn0jPEoBA/rxEpBYyjIBWVeYmeZ
 AyM5E+85sI7TCRdmJ49XGxZj3eU7ogJ7S4ihDPUEPLyVpDg7ns4Uyzkmc
 Q8LEl+heqIxSdJP0GKkwZ6De/Or65AP2bHzgUoJXoTThccJbRF2HA8oV7
 e21CnBaI3twJoEQbQNaRybyY+mgh8BuoZqarwwF/eRRodO9v/aILeEJVm
 X00H+bPfBwhn9EE5G2kChrVKiGh3wx/1WTBLZ30H/DZHcgeLNgqQ/jGEj Q==;
X-CSE-ConnectionGUID: Xjim+RVeS8SFq+WfYEieSg==
X-CSE-MsgGUID: JOsaT5L9TD6XS287C/m2lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83260867"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83260867"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:17:34 -0800
X-CSE-ConnectionGUID: Md4wVd0zSjyqSPezUiFbfg==
X-CSE-MsgGUID: irjqEOh2QqGjNs2IVrPVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214200273"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 15:17:35 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 5/5] drm/xe/vf: Use marker to catch fixups during LRC
 creation
Date: Thu, 19 Feb 2026 00:21:58 +0100
Message-Id: <20260218232159.1726873-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260218232159.1726873-1-tomasz.lis@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
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

When LRC is created during fixups, it may have invalid state. Ensure
that all such situations are caught, so that LRC creation can be
repeated.

Due to VM having arbitrarly set amount of CPU cores, it is possible
to limit the amount to 1. In such case, there is a possibility that
kernel will switch CPU contexts in a way which makes previously used
detection methods miss a VF migration recovery running in parallel
(by simply not switching to the LRC creation thread during recovery).

This possibility is not only theoretical, it was revealed by testing
that in a small percentage of specially crafted test cases, the
resulting LRC is damaged and causes GPU hang.

With the additional atomic value increased after fixups, any VF
migration that avoided the usual detection during LRC creation will
be caught.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 6 +++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       | 1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 2 ++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2ebf25a35557..a8d26fece38a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -308,15 +308,19 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	 */
 	for (i = 0; i < q->width; ++i) {
 		struct xe_lrc *lrc;
+		int marker;
 
 		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
+		marker = xe_vf_migration_fixups_complete_count(q->gt);
+
 		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
 				    xe_lrc_ring_size(), q->msix_vec, flags);
 		if (IS_ERR(lrc)) {
 			err = PTR_ERR(lrc);
 			goto err_lrc;
 		}
-		if (!xe_gt_vf_valid_default_lrc(q->gt)) {
+		if (!xe_gt_vf_valid_default_lrc(q->gt) ||
+		    marker != xe_vf_migration_fixups_complete_count(q->gt)) {
 			xe_lrc_put(lrc);
 			i--;
 			continue;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index ff9fb9196486..240c53b07eb3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1254,6 +1254,11 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
 }
 
+int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
+{
+	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
+}
+
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
 	void *buf = gt->sriov.vf.migration.scratch;
@@ -1274,6 +1279,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	atomic_inc(&gt->sriov.vf.migration.fixups_complete);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 8c21b8ab2f16..4651c7f3335c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -41,5 +41,6 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
 bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt);
 void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
+int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 8be181bf3cf3..41d6199e3508 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @fixups_complete: Counts completed fixups stages */
+	atomic_t fixups_complete;
 	/** @debug: Debug hooks for delaying migration */
 	struct {
 		/**
-- 
2.25.1

