Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE88EA810A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 12:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504CA10E575;
	Tue, 10 Feb 2026 12:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1bQcLr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF33710E579
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770727961; x=1802263961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ZjdPf1TzY/0svvmY/Gl9DYqXmkfoLnKwgNUmx/NGXI=;
 b=S1bQcLr6b3s0/7j2/l66g8Vm8TonNSnFyw25k2IhP1/Xl+1pg0+wyxto
 pDcIP6+Ok+2tvj4YO3iV6P4toYhdij5rqNUIKAszJ4JKE9qNbHHeAcLGg
 QFrf1aSAtMPg1pn4mmfZ3wtmwQ/x8pLAqXcuSKGQ1Ut4rqQqqotirWucW
 2P1J9s260b9n+7g7MoFdBALTO+KabWGsLSchnDBKZJ97qQgFHYwtnSHkr
 1hYIA0vV2LGTFeV7HcZNugUXPOYOw8F+z7IZl9sZD01slLaNmwzHhC/km
 esumEYlcnLzlsJM3+1gYTgIGFuRb13uhGo84RxKRuKXRz68UdXI/X7jPQ A==;
X-CSE-ConnectionGUID: LJ4GSLTURiiULm1Tf5oCLw==
X-CSE-MsgGUID: GE6WVoToTbWbI5bnCF5Ysg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82492521"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82492521"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:52:39 -0800
X-CSE-ConnectionGUID: o19Qj8plS/WkK9NjFd8hIg==
X-CSE-MsgGUID: SA92btZJS+2QFNTLPjRnwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211989288"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:52:38 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines
 manually
Date: Tue, 10 Feb 2026 18:21:22 +0530
Message-ID: <20260210125120.1329411-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
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

"eXtended Architecture" (XA) tagged memory—memory shared between the CPU and GPU
is treated differently from other GPU memory when the Media engine is power-gated.

XA is *always* flushed, like at the end-of-submssion (and maybe other
places), just that internally as an optimisation hw doesn't need to make
that a full flush (which will also include XA) when Media is
off/powergated, since it doesn't need to worry about GT caches vs Media
coherency, and only CPU vs GPU coherency, so can make that flush a
targeted XA flush, since stuff tagged with XA now means it's shared with
the CPU. The main implication is that we now need to somehow flush non-XA before
freeing system memory pages, otherwise dirty cachelines could be flushed after the free
(like if Media suddenly turns on and does a full flush)

V2(MattA): Expand commit description

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h  |  1 +
 drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e9180b01a4e4..4455886b211e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 		if (!xe_vm_in_fault_mode(vm)) {
 			drm_gpuvm_bo_evict(vm_bo, true);
-			continue;
+			if (!xe_device_needs_cache_flush(xe))
+				continue;
 		}
 
 		if (!idle) {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 743c18e0c580..da2abed94bc0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_device_needs_cache_flush - Whether the cache needs to be flushed
+ * @xe: The device to check.
+ *
+ * Return: true if the device needs cache flush, false otherwise.
+ */
+bool xe_device_needs_cache_flush(struct xe_device *xe)
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
index 39464650533b..baf386e0e037 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+bool xe_device_needs_cache_flush(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index e120323c43bc..b435ea7f9b66 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm->xe)) &&
+	    userptr->initial_bind) {
 		err = xe_vm_invalidate_vma(vma);
 		XE_WARN_ON(err);
 	}
-- 
2.52.0

