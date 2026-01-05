Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C10C2A077
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F81C10E3A8;
	Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZLZCHZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371A410E1FF
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585764; x=1799121764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u8HZG976VYWn3UGvS+8941siQ0MwMkE0YsqxqKNOD/U=;
 b=WZLZCHZ019l8gSHSPuR9uLyGv1gAWjBCJcZhJgDytPdYgUmHVAkNO0ZL
 tmfp2BSn0+pTlqfmdQX6aT/vZ2bdjYhD7qPDIGb5iEnEU8LNb9QUUlveH
 SxZIt3TcaRbsv4TVrsPqOTLLHvj28JbgFu1jGLnDSx4+XJQICxPtVRVXK
 qv9nTycdr5VHZ5kzI53nMcu83/GFcA0KQ3AnWfpmSB2qxhPDB8Ti6+GPj
 XHsvI8hcifA1UwukusvC7aCSs9jWrYJDG5hbkIBjGJbk6hK/IC9gt4Jp7
 vR1g91WHjrmpdpQUR9XSu+m6b9JjqIsTa7vCfTcPuo0QEGAI5zc7XGuGw g==;
X-CSE-ConnectionGUID: E/pwNoAbTdSbCT78beqJ6g==
X-CSE-MsgGUID: SySWkjsdSI6BIpQyEUPI5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856257"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: xS7IqOmRQ6iiCf6EbMh0mw==
X-CSE-MsgGUID: mwk7u4vMSNOgUXWL6Zpx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060658"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 05/22] drm/xe: Export to_xe_hw_fence
Date: Sun,  4 Jan 2026 20:02:20 -0800
Message-Id: <20260105040237.1307873-6-matthew.brost@intel.com>
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

Allow other layers to operate on hardware fences.

v2:
 - Fix kernel doc (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 10 +++++++---
 drivers/gpu/drm/xe/xe_hw_fence.h |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 5995bf095843..2e7f52bac980 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -138,8 +138,6 @@ void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx)
 {
 }
 
-static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
-
 static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 {
 	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
@@ -200,7 +198,13 @@ static const struct dma_fence_ops xe_hw_fence_ops = {
 	.release = xe_hw_fence_release,
 };
 
-static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
+/**
+ * to_xe_hw_fence() - Convert dma-fence to Xe hardware fence
+ * @fence: dma-fence object
+ *
+ * Return: struct xe_hw_fence or NULL
+ */
+struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
 {
 	if (XE_WARN_ON(fence->ops != &xe_hw_fence_ops))
 		return NULL;
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 7a8678c881d8..4d5756681279 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -30,4 +30,7 @@ void xe_hw_fence_free(struct dma_fence *fence);
 
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 		      struct xe_exec_queue *q, struct iosys_map seqno_map);
+
+struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
+
 #endif
-- 
2.34.1

