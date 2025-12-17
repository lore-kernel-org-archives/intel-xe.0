Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5574DD65C47
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 13:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1671A10EBB9;
	Wed, 17 Dec 2025 13:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu6wwy8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913110E357
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765977959; x=1797513959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6Kw3bniN0gpFGWE8Eb+AOYElinwvTn3NM8j4fNu134=;
 b=Lu6wwy8MNjLhUhu3ZabieNJeZFLLxUlbD/zdEqUjyw9di2bpPQacyMan
 r0lyjLHgGUSUc3/KIDJoYLhUGaKbQ1u3ui4UERwuk53CVA3if1FIhZU6O
 fFzdNfeYxksXEEleGVxzVogCswZ/KAv/gdWcMDkvIy1H63Y97oWnRSJjl
 qDDir6NStyl7aRPF4ncV8ySCmGdgxAQGpskahENjCHyf160F5wpCr6mZ7
 9kd0G3okHYCZ0B2ciDNx0XW8HmIIO/tOT4560MSHNFCWRmBe0pNCXuAHL
 JNhPdG1Kt+HqXE5+UdVNDd1mCeOyLP0I79ngz39ddf5tBuxnNZms6ty4H A==;
X-CSE-ConnectionGUID: tA+heypeTo+hk7pPfCVH3g==
X-CSE-MsgGUID: E3zc6q3zRxaoUwTb9lcBjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67956176"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67956176"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:25:59 -0800
X-CSE-ConnectionGUID: 8qZZaAHjTxSC5rklFivsLQ==
X-CSE-MsgGUID: wRlIq3lhQ4alRE20Kcrz+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202681347"
Received: from abityuts-desk.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.245.124])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:25:57 -0800
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH v3] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
Date: Wed, 17 Dec 2025 15:24:12 +0200
Message-ID: <20251217132412.435755-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <6f9d860f-f95c-4b3b-9d5c-1a0c295bcdd6@intel.com>
References: <6f9d860f-f95c-4b3b-9d5c-1a0c295bcdd6@intel.com>
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

Helper function xe_sync_needs_wait expects sync->fence when accessing
flags, patch makes sure we call only when sync->fence exists.

v2: move null checking to xe_sync_needs_wait and make
    xe_sync_entry_wait utilize this helper (Matthew Auld)
v3: further simplify code (Matthew Auld)

Fixes NULL pointer dereference seen with Vulkan workloads:

[  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]

Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ee1344a880b9..c8fdcdbd6ae7 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -238,10 +238,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
  */
 int xe_sync_entry_wait(struct xe_sync_entry *sync)
 {
-	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
-		return 0;
-
-	return dma_fence_wait(sync->fence, true);
+	return xe_sync_needs_wait(sync) ?
+		dma_fence_wait(sync->fence, true) : 0;
 }
 
 /**
@@ -252,8 +250,8 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
  */
 bool xe_sync_needs_wait(struct xe_sync_entry *sync)
 {
-	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
-		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
+	return sync->fence &&
+	       !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
 }
 
 void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
-- 
2.52.0

