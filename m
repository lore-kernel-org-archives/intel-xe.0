Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EDC2A07E
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8426610E38A;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9HHIqzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C331210E27C
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJKO6KSvenGk6QITw0jgt+Hdz5m6mskWF7m7XQaEKZc=;
 b=e9HHIqzJopG16TYOwWVAXhsQogRJtHO6PsyOSVvQdHzxvKN+RFG5hQTh
 Jy0JffozGmu1TI4Giytl9xWI9Fh2QTg7RZ4RICjJ6RlvLTWQMBSJ3UeKB
 u+MGwBGUyqKeL1nZadQf1kx41Lt/rhi8IVmG3/B/GiOMlsTWzvAq/2WiB
 YN9/MKH3I6fH6eMm1twyU4Kbvy9fwUNo046laegZaLon7iMPER5cIvfwo
 RejmbQbMH7nc2AyeBBBAMjp5wZhyPEnRhMOVKuILS12Z+wqv2+M5RnDt+
 90zLJ+kGzD6N5hiDQBEI0HWSzYfM224sJfYcyHxke2/7NwkTKB2oBF1J/ w==;
X-CSE-ConnectionGUID: TorapsfjSEGyMGmjgRm5qQ==
X-CSE-MsgGUID: 0UiViFupR7+5/ZFMA5R1VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856263"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: 4BpmH2CrS7SacNIBKCLotA==
X-CSE-MsgGUID: EawH9kZUR++OmlQ32R9hpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060660"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 06/22] drm/xe: Export xe_hw_fence_signaled
Date: Sun,  4 Jan 2026 20:02:21 -0800
Message-Id: <20260105040237.1307873-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Allow other layers to determine if a Xe hardware fence is signaled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_hw_fence.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 2e7f52bac980..265e29e92c48 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -157,7 +157,13 @@ static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
 	return fence->name;
 }
 
-static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
+/**
+ * xe_hw_fence_signaled() - Xe hardware fence is signaled
+ * @dma_fence: dma-fence object
+ *
+ * Return: True if Xe hardware fence is signaled, False otherwise
+ */
+bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_device *xe = fence->xe;
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 4d5756681279..cf2f19127105 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -33,4 +33,6 @@ void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 
 struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
 
+bool xe_hw_fence_signaled(struct dma_fence *dma_fence);
+
 #endif
-- 
2.34.1

