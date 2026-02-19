Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA76E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8B10E6D3;
	Thu, 19 Feb 2026 11:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0ijVkGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2023F10E6E1
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771501099; x=1803037099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UGLfWqo003T4T4mLUROXI59dq1dhGFutHpsre5EXp8=;
 b=l0ijVkGnYBTFuN9E5fPp+S65byLnbVJjovzXSDZyQxEku0fj3+E+lMzQ
 0/uVgMtkRz6E4dD9ukzqd9D8gwW2B7+rRJfXkijT3I6fMHYs6R3wRrhQX
 4BSJ4SebkrJ+EcSAc1KxC9+jScDubtF6yA3b1x8Ad/3UgYIX9mDWyqDcL
 guxFqLm59gsu49pbS6vlQ3Yomt23oHs7ibAZ1CvGLZ0ecHt37jCZC4oqC
 QYGE3sniglGz8eT5Wa9Ve6kQhhRy3ngpkvBblUljRsE3NXdLURonV4fpi
 165uCma7VujDCKGP0+PJTkR/B4udaitp8F/YVseO+aBQZLr9lEsH+Sz6X Q==;
X-CSE-ConnectionGUID: NTD88tkXTwiSJj/THEZChg==
X-CSE-MsgGUID: Gp7spUMCRn2DFnHlhN8rcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76199661"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76199661"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:19 -0800
X-CSE-ConnectionGUID: spGn3LnXS8CRjLXYbyp6sg==
X-CSE-MsgGUID: HvhPAIcES4a3xwAbZHV7aA==
X-ExtLoop1: 1
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:17 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 1/4] drm/xe/xe3p_lpg: flush shrinker bo cachelines manually
Date: Thu, 19 Feb 2026 17:07:45 +0530
Message-ID: <20260219113743.1588081-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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

XA, new pat_index introduced post xe3p_lpg, is memory shared between the
CPU and GPU is treated differently from other GPU memory when the Media
engine is power-gated.

XA is *always* flushed, like at the end-of-submssion (and maybe other
places), just that internally as an optimisation hw doesn't need to make
that a full flush (which will also include XA) when Media is
off/powergated, since it doesn't need to worry about GT caches vs Media
coherency, and only CPU vs GPU coherency, so can make that flush a
targeted XA flush, since stuff tagged with XA now means it's shared with
the CPU. The main implication is that we now need to somehow flush non-XA
before freeing system memory pages, otherwise dirty cachelines could be
flushed after the free (like if Media suddenly turns on and does a full flush)

V3(Thomas/MattA/MattR): Restrict userptr with non-xa, then no need to flush manually
V2(MattA): Expand commit description

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c     |  3 ++-
 drivers/gpu/drm/xe/xe_device.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6c2cb959cdd..d2ee9701eae6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 		if (!xe_vm_in_fault_mode(vm)) {
 			drm_gpuvm_bo_evict(vm_bo, true);
-			continue;
+			if (!xe_device_is_l2_flush_optimized(xe))
+				continue;
 		}
 
 		if (!idle) {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b68a2d55651..94c9f17da4b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_device_is_l2_flush_optimized - if L2 flush is optimized by HW
+ * @xe: The device to check.
+ *
+ * Return: true if the HW device optimizing L2 flush, false otherwise.
+ */
+bool xe_device_is_l2_flush_optimized(struct xe_device *xe)
+{
+	/* XA is *always* flushed, like at the end-of-submssion (and maybe other
+	 * places), just that internally as an optimisation hw doesn't need to make
+	 * that a full flush (which will also include XA) when Media is
+	 * off/powergated, since it doesn't need to worry about GT caches vs Media
+	 * coherency, and only CPU vs GPU coherency, so can make that flush a
+	 * targeted XA flush, since stuff tagged with XA now means it's shared with
+	 * the CPU. The main implication is that we now need to somehow flush non-XA before
+	 * freeing system memory pages, otherwise dirty cachelines could be flushed after the free
+	 * (like if Media suddenly turns on and does a full flush)
+	 */
+	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
+		return true;
+	return false;
+}
+
 void xe_device_l2_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 39464650533b..dfbf96e12d2e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
-- 
2.52.0

