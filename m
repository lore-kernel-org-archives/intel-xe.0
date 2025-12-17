Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA91D65559
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 12:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8FD10ECCB;
	Wed, 17 Dec 2025 12:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwwnZJnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009D210E2EE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765974837; x=1797510837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DTU1Ku1DFLvQZ0a3CJTs3TIrvKJgMmzqxwmcPE7mzmA=;
 b=ZwwnZJnzR6+rokNxOx+jQIX9IeErKz/MKrtLEGnr8S0rgy7Th2PJdau2
 6QpAdA2fy+PBi1PxTdtuu55DbXc8Tt3Ffn6YavnplFoGQR+Bms0MZDJeg
 5OJS16LWMP5wWFsg9MUjvorOFKls3081abUOYU4Tdz937MMV9diIPNWbL
 A2JHn3Oi3C3VdHYlghJdaoKiCnv/AmTe3kO2RrVV6YP09ZK+jhCr5zc+B
 l9QVrDg1DSWoOLgy9QcRgzIGcfV6Sd9J9g5f0xm7uDszF/wVQK/6z7QmB
 vVvxwzOUFc0VO/T+jCNUrkhZo2egN7O7wMyObeYhjRNK8/jJ+BojnNzeT g==;
X-CSE-ConnectionGUID: aR4zaw+tQPinfBtYsV/ZRQ==
X-CSE-MsgGUID: ac5ZOYEuQZ2xpeZvVVIbmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78548654"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="78548654"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:33:56 -0800
X-CSE-ConnectionGUID: xT51ldmKQCqVsoRISTtQUg==
X-CSE-MsgGUID: QGPfBxY8SeCD/0aMIkpmrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="199100403"
Received: from abityuts-desk.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.245.124])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:33:54 -0800
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH v2] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
Date: Wed, 17 Dec 2025 14:32:09 +0200
Message-ID: <20251217123209.430427-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
References: <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
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

Fixes NULL pointer dereference seen with Vulkan workloads:

[  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]

Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ee1344a880b9..2b6c2e2527ae 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -241,7 +241,8 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
 	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
 		return 0;
 
-	return dma_fence_wait(sync->fence, true);
+	return xe_sync_needs_wait(sync) ?
+		dma_fence_wait(sync->fence, true) : 0;
 }
 
 /**
@@ -252,7 +253,7 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
  */
 bool xe_sync_needs_wait(struct xe_sync_entry *sync)
 {
-	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
+	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) && sync->fence &&
 		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
 }
 
-- 
2.52.0

