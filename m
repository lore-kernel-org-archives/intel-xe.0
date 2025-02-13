Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB882C021A7
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 06:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904D610E1BF;
	Thu, 13 Feb 2025 06:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+Ro+2Yw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC5D10E1BF
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 06:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739426525; x=1770962525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G/9gFBk0n18py/M2CPRkXWPZz2XzVIHyTp33E2C4s+Q=;
 b=Q+Ro+2YwsFuG/Thq5nzv0+E11rWaYIjuj7HZ7eX5YIW6dpu6pSUVdHew
 c09GcEe6ihui5WQIwzrGwV3VvtDRjTi2OvoSQ78+HdiCQEkYnP+vhWnp5
 J6ufySqDmS76j4WIirCPy0xgD41LBzTPQKK+4o9M7PWnKLIk2wjErS8nb
 LXdlIdVs5YomQm3WOatx7RhHnJuv/JsQvEHQxiluOlsBO18quLkPFiZGi
 gB99Ty/JFBiPsnb09NaPjnhnqHGO53Re7x9+UrROFjxtgFGZXQXKnBnZu
 5vs5Eu5OuXNZsR8iYaPxvmjDc1hxMw7TKZkXIUR8sD1gddgmZAXVsCl6P A==;
X-CSE-ConnectionGUID: eO62eUKQSt20uESrY8krkw==
X-CSE-MsgGUID: KYFC7RAwQaWZWZfYF6WKGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50760801"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="50760801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 22:02:05 -0800
X-CSE-ConnectionGUID: yGMt1gXlT4yeIavs5xGvHA==
X-CSE-MsgGUID: 6dtEBvnzT7G0twFwIa2tBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150213585"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 22:02:04 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Fix typo in xe_job_ptrs
Date: Thu, 13 Feb 2025 11:38:38 +0530
Message-Id: <20250213060838.32493-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

%s/uinitialized/uninitialized/gc

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index d942b20a9f29..dbf260dded8d 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -18,9 +18,9 @@ struct dma_fence_chain;
  * struct xe_job_ptrs - Per hw engine instance data
  */
 struct xe_job_ptrs {
-	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
+	/** @lrc_fence: Pre-allocated uninitialized lrc fence.*/
 	struct dma_fence *lrc_fence;
-	/** @chain_fence: Pre-allocated ninitialized fence chain node. */
+	/** @chain_fence: Pre-allocated uninitialized fence chain node. */
 	struct dma_fence_chain *chain_fence;
 	/** @batch_addr: Batch buffer address. */
 	u64 batch_addr;
-- 
2.34.1

