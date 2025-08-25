Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E6ECA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 03:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D0110E0E6;
	Mon, 25 Aug 2025 03:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8qU/qGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BDC10E0E6
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 03:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756093524; x=1787629524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SQ5zSOwl/J8xnv5+JEDEjjBK/VtBdp8R7FBNA39EZmY=;
 b=T8qU/qGA3ASSbGXSeV70HwuQLfO1kDvRCVv3VfKfW62uqNInJTAnzzJ1
 MhnlcnFAQjhaSt3pV6za606JKaUw1AOExzchbILx5LO3vw+dzephbiseI
 F83jYAmKpsdAWTCj1dr/K3xc1CCE2ISJ6ShpkvhwbffqtGDn6jEbfhB8o
 Xq93c6CcLtpm07lS5P3BYo4JlnkSZGF46iscdCLUmeD4rSkzQy4wAJIYx
 ilxVIQPJO6Vg9FGhlclzCGvyAMCS3sWNpJFsIJomlxRr+QuK1UQ+J5mkZ
 h026F/T36Zhb8uSfzB0XvWuUXue4RLg6y4tS1bf6I+fotlTW31jdcVn+K w==;
X-CSE-ConnectionGUID: hw7mEeE7TBSPKh6dVIW1fA==
X-CSE-MsgGUID: iti2mr59R6yGphC8Xv1dBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75751020"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75751020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 20:45:23 -0700
X-CSE-ConnectionGUID: Gi8E8kI1RB+ONTSWC/7SJg==
X-CSE-MsgGUID: uGr7+VarRKiko2hTiXO2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169108624"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 20:45:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH] drm/xe: Don't trigger rebind on initial dma-buf validation
Date: Sun, 24 Aug 2025 20:45:16 -0700
Message-Id: <20250825034516.3793098-1-matthew.brost@intel.com>
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

On the first validate of an imported dma-buf (initial bind), the device
has no GPU mappings, so a rebind is unnecessary. Rebinding here is
harmful in multi-GPU setups and for VMs using preempt-fence mode, as it
would evict in-flight GPU work.

Signed-off-by: Matthee Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 4 +++-
 drivers/gpu/drm/xe/xe_bo_types.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e..03d2b6af1d44 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -816,9 +816,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if (ttm_bo->type == ttm_bo_type_sg) {
-		ret = xe_bo_move_notify(bo, ctx);
+		if (bo->dma_buf_validated)
+			ret = xe_bo_move_notify(bo, ctx);
 		if (!ret)
 			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
+		bo->dma_buf_validated = true;
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index cf604adc13a3..fe12690a632e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -77,6 +77,9 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;
 
+	/** @dma_buf_validated: DMA-BUF has been validated at least once */
+	bool dma_buf_validated;
+
 	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
 	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 
-- 
2.34.1

