Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CD1CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 09:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF5E1130AA;
	Mon,  1 Jun 2026 09:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6l/voAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13A1130AA
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780306828; x=1811842828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+RSiV4t9ZMPDIDecXW8eTPPICHYbj/MQhsKjjWhoYsQ=;
 b=T6l/voAiKBBAwYTC2983HeH1286gMa4dbgJM+Tnvl66spsv4hBgTWDPg
 1L/BYMkQen0FOoGrgsVnd98CmwLcM0oBGeHcCfWHeFSIATA88Iyl/j19Q
 ti8QTCnVPNMSY+qLnP1qtzOpbc4R9ZuRd353inEsMcj77SJbfpzQTbJP1
 ljhIPu4zHjMadQLgs+mQOVP6EFw2FzVpvHnq7OKjOMOU2HYxISiwjOm15
 RDCysszdnyKRHzDZi5XSwRRHNHvS7HYpLdgjjsqJirneXJh0iSzcdm/ft
 i8OyDwrh/qQqHISlg3BU4gPVAH8oiTMb+O8wA9xFXMwceiB5cQzMHIFeD A==;
X-CSE-ConnectionGUID: Ik7EMFSjQDqsE5fSapvHTg==
X-CSE-MsgGUID: wlXoj1E9R9efIXkDUtH/jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="68595817"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68595817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 02:40:28 -0700
X-CSE-ConnectionGUID: 9BJz7sp5Smmqb/5ZXjUfGg==
X-CSE-MsgGUID: b9cZHzXPTa29C6uRfpUttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="239344266"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 02:40:26 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, stable@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Fix UAF in xe_gem_prime_import() on attach failure
Date: Mon,  1 Jun 2026 15:45:37 +0530
Message-ID: <20260601101536.1333480-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

xe_dma_buf_create_obj() creates the importer BO with obj->resv
pointing at the exporter's dma_buf->resv. When dma_buf_dynamic_attach()
fails, no dma_buf reference is held so the exporter can be freed
immediately. Since ttm_bo_release() now always defers cleanup for
ttm_bo_type_sg BOs to the TTM workqueue, the worker later calls
dma_resv_lock() on the already-freed exporter resv, causing a UAF.

Reset obj->resv to the BO's private _resv before calling xe_bo_put()
in the error path. The BO is not yet published (attach failed) and
carries no fences, so the switch is safe.

Observed with igt@xe_live_ktest@xe_dma_buf_kunit on BMG (QEMU):

  Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b9c
  Workqueue: ttm ttm_bo_delayed_delete [ttm]
  RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0
  Call Trace:
   <TASK>
   ? __ww_mutex_lock.constprop.0+0x2dd/0x18e0
   ? ttm_bo_delayed_delete+0x41/0xc0 [ttm]
   ww_mutex_lock+0x3c/0xb0
   ttm_bo_delayed_delete+0x41/0xc0 [ttm]
   process_one_work+0x239/0x740
   worker_thread+0x200/0x3f0
   kthread+0x10d/0x150
   ret_from_fork+0x3bd/0x470
   ret_from_fork_asm+0x1a/0x30
   </TASK>

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed cleanup path for imported bos")
Cc: stable@vger.kernel.org # v6.8+
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 8a920e58245c..6d944bd4065c 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -384,6 +384,14 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 
 	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, obj);
 	if (IS_ERR(attach)) {
+		/*
+		 * The BO was created with resv = dma_buf->resv (exporter's
+		 * resv). Since attach failed, no dma_buf reference is held and
+		 * the exporter may be freed before TTM's delayed_delete worker
+		 * runs. Switch to the BO's own resv to prevent a UAF when
+		 * ttm_bo_delayed_delete() tries to lock the stale pointer.
+		 */
+		obj->resv = &obj->_resv;
 		xe_bo_put(gem_to_xe_bo(obj));
 		return ERR_CAST(attach);
 	}
-- 
2.50.1

