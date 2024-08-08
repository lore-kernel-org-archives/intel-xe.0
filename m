Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE55C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0410E7B8;
	Thu,  8 Aug 2024 17:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZC4peho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE53710E7BF
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138910; x=1754674910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luHKOv1hPc2ayC6x6RNS8lunkizmXySbVRCyTw6lSzs=;
 b=KZC4peho9PEWKHaY+0Vd6kwiuOr+c1yyiT7FHsHX5rRLAxdOiVhaTIwu
 mZS90x27ww7WV4PISn83do3I65vCqIuPXCOKHRZ7HR5/7Q3knDe2UPUi7
 MZwRHgPEs5K4bx4Nyy4JjR8D+BX4mmup/wDorwXn89bQmpHBlTq/OPePT
 iK0oBB2UlhvGIt7DcwpRu2s/2zRdP4ztK5PJoPg5iaj4ujylWYFkrx2Ib
 /cdmTeWbz6YyCeskjV/VKDNMLvTKQZ/4exdRaoisS72LBQlgHSiOH1SRu
 cAmKvk6IFeme7zZZ79SYcPZUUCO22qvRKsoM9wjL2cVRNrrQEqaNjpiP+ Q==;
X-CSE-ConnectionGUID: q0pUZgcxRWOyzabvfkcQaw==
X-CSE-MsgGUID: g9Lo/34dQqeFAyDqgEQh8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21256063"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21256063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
X-CSE-ConnectionGUID: Qb5j8Sg0Rwu+1igrT/L13g==
X-CSE-MsgGUID: NpSMMRtKR/mr5jdKyx/7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57850454"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 5/8] drm/xe/oa: Signal output fences
Date: Thu,  8 Aug 2024 10:41:36 -0700
Message-ID: <20240808174139.4027534-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
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

Complete 'struct xe_oa_fence' to include the dma_fence used to signal
output fences in the xe_sync array. The fences are signalled
asynchronously. When there are no output fences to signal, the OA
configuration wait is synchronously re-introduced into the ioctl.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 416e031ac454b..bc421cd0af6ba 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -96,6 +96,10 @@ struct xe_oa_config_bo {
 };
 
 struct xe_oa_fence {
+	/* @base: dma fence base */
+	struct dma_fence base;
+	/* @lock: lock for the fence */
+	spinlock_t lock;
 	/* @xe: pointer to xe device */
 	struct xe_device *xe;
 	/* @work: work to signal that OA configuration is applied */
@@ -953,9 +957,26 @@ static void xe_oa_fence_work_fn(struct work_struct *w)
 	/* Additional empirical delay needed for NOA programming after registers are written */
 	usleep_range(us, 2 * us);
 
-	kfree(ofence);
+	/* Now signal fence to indicate new OA configuration is active */
+	dma_fence_signal(&ofence->base);
+	dma_fence_put(&ofence->base);
 }
 
+static const char *xe_oa_get_driver_name(struct dma_fence *fence)
+{
+	return "xe_oa";
+}
+
+static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
+{
+	return "unbound";
+}
+
+static const struct dma_fence_ops xe_oa_fence_ops = {
+	.get_driver_name = xe_oa_get_driver_name,
+	.get_timeline_name = xe_oa_get_timeline_name,
+};
+
 static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fence *config_fence)
 {
 	struct xe_oa_fence *ofence;
@@ -967,6 +988,8 @@ static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fen
 	ofence->xe = xe;
 	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
 	ofence->config_fence = config_fence;
+	spin_lock_init(&ofence->lock);
+	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
 
 	return ofence;
 }
@@ -975,8 +998,8 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 {
 	struct xe_oa_config_bo *oa_bo;
 	struct xe_oa_fence *ofence;
+	int i, err, num_signal = 0;
 	struct dma_fence *fence;
-	int err;
 
 	/* Emit OA configuration batch */
 	oa_bo = xe_oa_alloc_config_buffer(stream, config);
@@ -989,13 +1012,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	if (err)
 		goto exit;
 
+	/* Initialize and set fence to signal */
 	ofence = xe_oa_fence_init(stream->oa->xe, fence);
 	if (IS_ERR(ofence)) {
 		err = PTR_ERR(ofence);
 		goto put_fence;
 	}
 
-	xe_oa_fence_work_fn(&ofence->work);
+	for (i = 0; i < stream->num_syncs; i++)
+		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
+
+	/* Schedule work to signal the fence */
+	queue_work(system_unbound_wq, &ofence->work);
+
+	/* If nothing needs to be signaled we wait synchronously */
+	for (i = 0; i < stream->num_syncs; i++)
+		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
+			num_signal++;
+	if (!num_signal)
+		flush_work(&ofence->work);
+
+	/* Done with syncs */
+	for (i = 0; i < stream->num_syncs; i++)
+		xe_sync_entry_cleanup(&stream->syncs[i]);
+	kfree(stream->syncs);
 
 	return 0;
 put_fence:
-- 
2.41.0

