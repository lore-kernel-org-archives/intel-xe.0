Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9DE606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wruk0jjM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710D610F05C;
	Mon, 16 Nov 2026 19:22:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DFD10F406
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794856948; x=1826392948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5SzP6hptCdXa10Wi//bLmdM38aPhwA2MJGkoHMs50T8=;
 b=Wruk0jjM/0ouUYUNlX9fRmnt0pUA5FrMZU85Wb2keoh+WE1lZMRr4qIS
 r71JnK8mEi9VkCvRw8TOGVJCvZojWKF+kThz+8XGHBQdU7aM2++MqTMSF
 jtHfO6dfbh04ZjeNuKZpQyOIrhB0Mk7m0k1OSXLw9Alir45KLta21edJq
 lPHZZ+u4hd3ASoGI/kZHDyTHBM8iD9Nl6pzb8tdKqKnXekO7PLRZvxR5H
 KgIQLKj7ql78HPQEITvQ5GjD3LzL7GTekl4St89eyHZ+nxrsMCMswq24F
 a/bPb/j32HUwAiWkyprwxMu+pav6X4xlWNsAg++oSvb7QZBr2w2Q7q/pt A==;
X-CSE-ConnectionGUID: 8yDAPIL6Se2+I0mbOLFHIQ==
X-CSE-MsgGUID: jJ4N/3dJStCMbUap5N6UUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3712964"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3712964"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 11:22:23 -0800
X-CSE-ConnectionGUID: l9gZJXnNQ1usjG7TI4ZTeQ==
X-CSE-MsgGUID: hZI3C/IoRrGfTBkeb9neNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9642930"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 11:22:24 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 1/2] drm/xe/guc: Treat CT-disabled TLB invalidation as
 cancelled
Date: Mon, 16 Nov 2026 11:22:19 -0800
Message-ID: <20261116192220.3872267-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116192220.3872267-1-zongyao.bai@intel.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
 <20261116192220.3872267-1-zongyao.bai@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
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

Fixes: db16f9d90c1d ("drm/xe: Split TLB invalidation code in frontend and backend")
Cc: <stable@vger.kernel.org> # v6.18+
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
v2: Add Fixes tag and Cc stable, simplify the code comment (Shuicheng)

 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index dd38d95c6014..1a15ff652589 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -32,12 +32,22 @@
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
+	 * A disabled CT can't deliver the request, and the GuC is reloaded
+	 * with all TLBs invalid before the CT is enabled again, so there is
+	 * nothing left to invalidate. Report it as cancelled, like a stopped CT.
+	 */
+	if (ret == -ENODEV)
+		return -ECANCELED;
+
+	return ret;
 }
 
 #define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
-- 
2.43.0

