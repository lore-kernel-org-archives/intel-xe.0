Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B8C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE6A10E02F;
	Mon,  8 Jul 2024 21:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7QlfQ+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A639D10E02F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720472967; x=1752008967;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rtzyVDJeocESbdRo0smte8YgTzi41QaYauxmhMZkbJ0=;
 b=D7QlfQ+M7rLvlqyHrAl9xiIeunGDtcWqBGLnzrYToRv6J+aY1NoyZ3c3
 hoCAZC6CzFCfYiXPrwNKvOdSPfPxc/NbO0YFZR75VxR9b4ri2DwmWHhdF
 t/3aMSdeKejjIB98J/qIZkLq90TZVAo6Z3CBTAg217DONHTnCa0E0Wuuw
 o+zJyNXC5kdO3xCdwg7dGFtHWTAgpNvJbUOoaGlj8EduLGOdZ378Tumgg
 F7tj4vdUCjilvkeZuhnGvGbNwhEkCXptOhEKjE9zxs+bNdxD6YyCdL2Yn
 M5nXGECYdvYwN3RvwU8l4OnAPElMmy35sjkCgr9UbyaIEzN/SEd6ss9uB Q==;
X-CSE-ConnectionGUID: 7i4TxoMQQKKxfPInUa3UvA==
X-CSE-MsgGUID: c08zllgSRzavoUlK6RkNAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17530452"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17530452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:09:26 -0700
X-CSE-ConnectionGUID: uSyNhcCBSfKU287+H39GZA==
X-CSE-MsgGUID: lKccsxNoRA+pgwhon+9Edg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="48289070"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:09:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop trace_xe_hw_fence_free
Date: Mon,  8 Jul 2024 14:10:08 -0700
Message-Id: <20240708211008.956384-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

fence->ctx may be stale memory when trace_xe_hw_fence_free is called
resuling UAF bug when deriving the device name. This tracepoint is not
all that useful, so just drop it.

Fixes: 501c4255c409 ("drm/xe/trace: Print device_id in xe_trace events")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 1 -
 drivers/gpu/drm/xe/xe_trace.h    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 35c0063a831a..45a9789cf501 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -187,7 +187,6 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 
-	trace_xe_hw_fence_free(fence);
 	XE_WARN_ON(!list_empty(&fence->irq_link));
 	call_rcu(&dma_fence->rcu, fence_free);
 }
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 09ca1ad057b0..baba14fb1e32 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -341,11 +341,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
-	     TP_PROTO(struct xe_hw_fence *fence),
-	     TP_ARGS(fence)
-);
-
 TRACE_EVENT(xe_reg_rw,
 	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
 
-- 
2.34.1

