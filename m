Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF10E77187
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 22:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B77A10E2E9;
	Tue, 17 Dec 2024 22:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpTMKGM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E4E10E2E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 22:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734476393; x=1766012393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wxoKJ5LH5FoGvKwJwZaAGNZjrENW6jxQ4QO6huqSMTY=;
 b=HpTMKGM+vVBg67cnduMQNQKj8EbflMk7tilUMFxyHEbp6TpXhQcuD9OI
 DGxX7bRFfeaoJ3E8PZE/w48hYPXJkwJCwPolSKt3TmB0l0vQ4/gID8sbT
 kO9AEM3ER9BoD0hOSfCazJ8J17co4Zo/96p7QhheZTbd23h1cxboZyyMo
 sa9/tDJZJiJkMoOhoyDmNnGSBDmKLA3Wzqhd21z9LZjt52iq4tGhFkrDE
 SZuWCViIUXWv7KD08FfSiBA/imk+Pg8MsgMb5VEGjDDPeFgfYkAeJvxTk
 KFZRCNjNfimGWZ7N/lC/CQ//Ff8bEKfV1AMLbpv0eo9zkfPBLni21DZbd w==;
X-CSE-ConnectionGUID: yg0qQsDYQyeDn6s/73cl9Q==
X-CSE-MsgGUID: P8ARqdyLROGA+bWsmriv2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35072191"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35072191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:59:53 -0800
X-CSE-ConnectionGUID: 1yfE1mzVRo2+hm4eZnSqqQ==
X-CSE-MsgGUID: FafIGEw9Tpe1kVaDGJRTCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97900904"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:59:52 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe: Reject BO eviction if BO is bound to current VM
Date: Tue, 17 Dec 2024 18:13:58 -0500
Message-Id: <20241217231358.2361242-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This is a follow up fix for https://patchwork.freedesktop.org/patch/msgid/20241203021929.1919730-1-oak.zeng@intel.com
The overall goal is to fail vm_bind when there is memory pressure. See more
details in the commit message of above patch. Abbove patch fixes the issue
when user pass in a vm_id parameter during gem_create. If user doesn't pass
in a vm_id during gem_create, above patch doesn't help.

This patch further reject BO eviction (which could be triggered by bo validation)
if BO is bound to the current VM. vm_bind could fail due to the eviction failure.
The BO to VM reverse mapping structure is used to determine whether BO is bound
to VM.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 283cd02945708..abdeed1c325ea 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -664,6 +664,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
 	struct xe_migrate *migrate = NULL;
+	struct drm_gpuvm_bo *vm_bo;
 	struct dma_fence *fence;
 	bool move_lacks_source;
 	bool tt_has_data;
@@ -713,6 +714,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
+	if (evict) {
+		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
+			struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
+
+			if (xe_vm_resv(vm) == ctx->resv &&
+			    xe_vm_in_preempt_fence_mode(vm)) {
+				ret = -EBUSY;
+				goto out;
+			}
+		}
+	}
+
 	/*
 	 * Failed multi-hop where the old_mem is still marked as
 	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
-- 
2.26.3

