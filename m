Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDF9606A323
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 22:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjcggFsB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9A310E33B;
	Sun, 15 Nov 2026 22:57:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C4B10E33B
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794783460; x=1826319460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7G5zPFY7S61YO81BtSy8pwyAmSJSPLSqhlo6KnaQ5H8=;
 b=TjcggFsBFM3Rx4CW4ixjiIhGCML7nwiN8kwIwnoWBhYsGCJrj5zZ4wIo
 QHNEYPBFiW1/mOq6V+sFePgQ55aL9jASMgqZxpulvo60oxlPF9VnIGgNH
 EEF6ZVLix0cW+rYRpKK+uzOKhsxHRv0flUwAtwLYE865bdBg/6RuFE+Ho
 JK/3s0B06e0HNbOzvCKe1GRQCF8Ke+8hXSgjNz3fN7Eb85PUToFgyOMO4
 AtSvSNVxOdp0s0BEk5E6i99EpuJswteCOob+mgcFcVkdsre6KvwP1ZkR3
 wmi884WfJcgSEhpNgxxrxRwLiX1Sa3b6phu7X/26BeFQdrLP6jXcVK+F1 w==;
X-CSE-ConnectionGUID: kR1iL5pdQTifhLh3NlmLSQ==
X-CSE-MsgGUID: 3aHYCrVVTYmBE81NReEdww==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3432829"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3432829"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 14:57:34 -0800
X-CSE-ConnectionGUID: W6o943gISxuSIqFkUlsRng==
X-CSE-MsgGUID: jDQuVHRwTBOSgI0sgQRuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; d="scan'208";a="11298874"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa013.fm.intel.com with ESMTP; 15 Nov 2026 14:57:35 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Treat CT-disabled TLB invalidation as
 cancelled
Date: Sun, 15 Nov 2026 14:57:30 -0800
Message-ID: <20261115225731.3073489-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115225731.3073489-1-zongyao.bai@intel.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During a GT reset the GuC CT channel goes through two states before it
is enabled again:

  gt_reset_worker()
    xe_uc_stop()              ENABLED  -> STOPPED    send: -ECANCELED
    xe_tlb_inval_reset()
    do_gt_reset()
    do_gt_restart()
      xe_uc_sanitize_reset()  STOPPED  -> DISABLED   send: -ENODEV
      GuC load, CT enable     DISABLED -> ENABLED

xe_tlb_inval_issue() treats -ECANCELED as "undelivered, report done",
but -ENODEV is propagated to the caller. A userptr invalidation from an
MMU notifier (e.g. munmap() on a fault-mode VM) issued in the DISABLED
window thus trips the XE_WARN_ON() in xe_vma_userptr_do_inval() and
taints the kernel:

  Tile0: GT1: GT: reset started
  WARNING: drivers/gpu/drm/xe/xe_userptr.c:133 at xe_vma_userptr_do_inval+0x340/0x4a0 [xe]
  RAX: 00000000ffffffed
   xe_vma_userptr_invalidate_start+0x4b7/0x7c0 [xe]
   __mmu_notifier_invalidate_range_start+0x247/0x370
   unmap_vmas+0x1af/0x1c0
   unmap_region+0x91/0xf0
   ...

The TLB invalidation ops contract is that the backend returns
-ECANCELED when it is mid-reset. The reset invalidates all TLBs, so
there is nothing left to do. Map -ENODEV to -ECANCELED in
send_tlb_inval() so that every GuC TLB invalidation type handles it the
same way, instead of only send_tlb_inval_ggtt_full() as done so far.

The CT is also DISABLED across system suspend and runtime suspend. On
resume from system suspend the GuC is reloaded with all TLBs invalid, so
nothing is lost there either; user space and the MM kernel threads are
frozen by then, so such a request is not expected anyway. A request
issued while runtime suspended violates the PM rules and is still
reported by the "Missing outer runtime PM protection" warning in
xe_tlb_inval_fence_init().

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index dd38d95c6014..aa7436a1d1db 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -32,12 +32,32 @@
 static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
 
 	xe_gt_assert(gt, action[1]);	/* Seqno */
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
-	return xe_guc_ct_send(&guc->ct, action, len,
-			      G2H_LEN_DW_TLB_INVALIDATE, 1);
+	ret = xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_TLB_INVALIDATE, 1);
+
+	/*
+	 * CT state  Entered                    CT returns  Reported here
+	 * --------  -------------------------  ----------  -------------
+	 * STOPPED   xe_uc_stop()               -ECANCELED  -ECANCELED
+	 * DISABLED  before first GuC load,     -ENODEV     -ECANCELED
+	 *           xe_guc_sanitize(),
+	 *           runtime suspend
+	 *
+	 * In neither state can the request be delivered. A GT reset passes
+	 * through both, and the GuC is reloaded with all TLBs invalid before
+	 * the CT is enabled again, as it is on resume from system suspend, so
+	 * report it as cancelled rather than failed. Issuing one while runtime
+	 * suspended violates the PM rules and is already caught by
+	 * xe_tlb_inval_fence_init().
+	 */
+	if (ret == -ENODEV)
+		return -ECANCELED;
+
+	return ret;
 }
 
 #define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
-- 
2.43.0

