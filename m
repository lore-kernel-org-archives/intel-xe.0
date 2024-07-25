Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAA4C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 23:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE3A10E1EF;
	Thu, 25 Jul 2024 23:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsRLeudd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02310E1EF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 23:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721949806; x=1753485806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FcaxKMpZmUigItnmvNiXA4/u0iztlRuBX+8Wq84ddRg=;
 b=fsRLeudduQUtxzI2nIGyzqzkwYHlaaW4LCLTe2BGw+sA6p/NmOwhWdFc
 Q8kxXKOuA08BP/GlS6hUVFkBGBQ4kD6/G8YNniyYsQxtakbMoNvWnijLl
 io8/4EpPqHk/r8joJWYwnWp5M/wPmqAar3ZltTAquIZDaCliOTWWCuE5h
 mHZXT4oHw8nscaFwohqGddv42LxNX5TFO3hNNVC1DcIg6Sbf/AV92A+Oa
 TVqQBk35N61L+zXXBlwWG9fKeH09DcW+qJaRZs3rzm76lzy8grVv3fZ8f
 tL6Nu9QaLyTf3ZUIXpG16DkKD9sUsEYsu35Dc1WCx4dJcRhVznQvBaitE g==;
X-CSE-ConnectionGUID: S2xE4TRnQved13Sk2XOMrA==
X-CSE-MsgGUID: rY/Q7TCZRFKagoHwCEtcTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19571365"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19571365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 16:23:26 -0700
X-CSE-ConnectionGUID: iRtRYtFSS3CQbSLz/PeomA==
X-CSE-MsgGUID: tPdK1FckS1i2Mx48S7kYrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="53693962"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 16:23:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/xe: Take ref to VM in delayed snapshot
Date: Thu, 25 Jul 2024 16:24:14 -0700
Message-Id: <20240725232414.1958243-1-matthew.brost@intel.com>
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

Kernel BO's don't take a ref to the VM, we need to the VM for the
delayed snapshot, so take a ref to the VM in delayed snapshot.

47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 94ff62e1d95e..9ef9b45a3596 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1634,6 +1634,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
+	xe_vm_get(lrc->bo->vm);
+
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
@@ -1653,12 +1655,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 {
 	struct xe_bo *bo;
+	struct xe_vm *vm;
 	struct iosys_map src;
 
 	if (!snapshot)
 		return;
 
 	bo = snapshot->lrc_bo;
+	vm = bo->vm;
 	snapshot->lrc_bo = NULL;
 
 	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
@@ -1678,6 +1682,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 	xe_bo_unlock(bo);
 put_bo:
 	xe_bo_put(bo);
+	xe_vm_put(vm);
 }
 
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
-- 
2.34.1

