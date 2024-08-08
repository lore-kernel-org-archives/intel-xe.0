Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A84C52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9F710E7C8;
	Thu,  8 Aug 2024 17:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSN6ACU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7072B10E7C8
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138909; x=1754674909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VqZqEjLVagYDgPnSiGl0xHMg7alq/DE6oUlotZze14=;
 b=BSN6ACU5j9EHXMl+8sICuvIZ8kvJP+Q9fpkTpirjw6Ta0PiNLGYkoZlk
 fzsysraKygiiXzl6B6CovnvEJ8n8gKiBZPlN1s8ccXf72kP3hvDtT3P/N
 lAUlj4MXDMi6zNhBDm2d/K5c/eDFXhaedVIbolTl945G8o/mfWygwwJi0
 xxSnnSvmfLua7WKPkJk3xVCJ7AT2zA7F1Pe/yhqVyumGiq2vP1zBH5X3u
 wJqSUzxF3baOSvN2K5fPzfF7rrta8pcv+REcwNtMnNBUcb+2W6HQdbS2X
 v4bas6nC+lxT2IEy3UVPafzCbSTMuMWeScZb2lTLwelQPJrQBN2Fo8IEx Q==;
X-CSE-ConnectionGUID: luvUPkrIQcyWB620RYyJxQ==
X-CSE-MsgGUID: 8jfFNQ9WSMmKLFCF2KgVng==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21256059"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21256059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
X-CSE-ConnectionGUID: R19MUNXLRKmzAr9OqOfUMw==
X-CSE-MsgGUID: fz+QJecyTCuCRxSehFgumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57850443"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 2/8] drm/xe/oa: Introduce 'struct xe_oa_fence'
Date: Thu,  8 Aug 2024 10:41:33 -0700
Message-ID: <20240808174139.4027534-3-ashutosh.dixit@intel.com>
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

Here we introduce 'struct xe_oa_fence' which will contain the fence used
for signalling xe_syncs (in a later patch). The struct also contains the
work struct used for signalling the fences. Otherwise, this patch is a
simple refactor of the previous patch. In this patch the work function is
executed synchronously.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 73 ++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d842c801fb9f1..f97d64ffb460f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -90,6 +90,15 @@ struct xe_oa_config_bo {
 	struct xe_bb *bb;
 };
 
+struct xe_oa_fence {
+	/* @xe: pointer to xe device */
+	struct xe_device *xe;
+	/* @work: work to signal that OA configuration is applied */
+	struct work_struct work;
+	/* @config_fence: dma fence for OA config to be applied */
+	struct dma_fence *config_fence;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -905,14 +914,51 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
 	return oa_bo;
 }
 
-static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
+static void xe_oa_fence_work_fn(struct work_struct *w)
 {
 #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
-	struct xe_oa_config_bo *oa_bo;
+	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work);
 	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
-	struct dma_fence *fence;
 	long timeout;
 
+	/* Wait till all previous batches have executed */
+	timeout = dma_fence_wait_timeout(ofence->config_fence, false, 5 * HZ);
+	dma_fence_put(ofence->config_fence);
+	if (timeout < 0)
+		err = timeout;
+	else if (!timeout)
+		err = -ETIME;
+	if (err)
+		drm_dbg(&ofence->xe->drm, "dma_fence_wait_timeout err %d\n", err);
+
+	/* Additional empirical delay needed for NOA programming after registers are written */
+	usleep_range(us, 2 * us);
+
+	kfree(ofence);
+}
+
+static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fence *config_fence)
+{
+	struct xe_oa_fence *ofence;
+
+	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
+	if (!ofence)
+		return ERR_PTR(-ENOMEM);
+
+	ofence->xe = xe;
+	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
+	ofence->config_fence = config_fence;
+
+	return ofence;
+}
+
+static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
+{
+	struct xe_oa_config_bo *oa_bo;
+	struct xe_oa_fence *ofence;
+	struct dma_fence *fence;
+	int err;
+
 	/* Emit OA configuration batch */
 	oa_bo = xe_oa_alloc_config_buffer(stream, config);
 	if (IS_ERR(oa_bo)) {
@@ -924,18 +970,17 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	if (err)
 		goto exit;
 
-	/* Wait till all previous batches have executed */
-	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
-	dma_fence_put(fence);
-	if (timeout < 0)
-		err = timeout;
-	else if (!timeout)
-		err = -ETIME;
-	if (err)
-		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
+	ofence = xe_oa_fence_init(stream->oa->xe, fence);
+	if (IS_ERR(ofence)) {
+		err = PTR_ERR(ofence);
+		goto put_fence;
+	}
 
-	/* Additional empirical delay needed for NOA programming after registers are written */
-	usleep_range(us, 2 * us);
+	xe_oa_fence_work_fn(&ofence->work);
+
+	return 0;
+put_fence:
+	dma_fence_put(fence);
 exit:
 	return err;
 }
-- 
2.41.0

