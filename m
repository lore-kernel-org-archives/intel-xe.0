Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA0E9B250
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 11:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C110E29A;
	Tue, 24 Feb 2026 11:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxUAtPvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D61810E568
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771932748; x=1803468748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tjnRNC/MXwxOlqtUEkYaGr3eK5vgLCp0pC5930zvGfs=;
 b=MxUAtPvFfU0RiaJ3pN1BAXjB2sjU+9rFn/NbNVwYQhXQJn1vcIHov/V0
 fW9XrqbNneRxjmdWiPNC+IYxCvoPZRQfgmetlRPrxoNjKmzWEQqHgFEpM
 l3jwcPxk9PLq/17lZ+x+AK0LaxbMHVlILW5hfzp+jxBx0Be7uosVwm2Uc
 Zjqs0Og57rjDECqEhJR/GXW+97A4vV3uW+hbRgL3ux2pdyCt9E8/Be2ad
 deMl2XZzqf8/n78PFtOrkxVD8SfTg0GB9r6q44ql2bHX59fck1E+wmUTs
 T2NhFexVBQv7Zbm8xANi1h8ecPCt6U9B+/RrwEA3x2G3P8jlE0cUTRhut g==;
X-CSE-ConnectionGUID: 8YUaNaOkQXKzymnWbyrAyA==
X-CSE-MsgGUID: s4dOYrt1RSGPPuw89su+Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72918088"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72918088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:32:28 -0800
X-CSE-ConnectionGUID: CEPRKl+5RqKSURE1sxApxQ==
X-CSE-MsgGUID: zC6EqmSsTiqFp/j6vEVwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219972512"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:32:27 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4 1/4] drm/xe/xe3p_lpg: flush shrinker bo cachelines manually
Date: Tue, 24 Feb 2026 17:01:49 +0530
Message-ID: <20260224113147.1656939-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
References: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
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
flushed after the free (like if Media suddenly turns on and does a full
flush)

V3(Thomas/MattA/MattR): Restrict userptr with non-xa, then no need to
			flush manually
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

