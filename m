Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC81EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684AD10E05A;
	Fri, 16 Jun 2023 09:56:29 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8C010E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909387; x=1718445387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sIxZEHQKqM2iin+eJwt/ymz/BQMybVKLvb0uOC+qJwE=;
 b=TjH5sinZ7g30ROwOTyrNNiigTlRC7OJ7B6mX8fG8/+1O0cghNydZrPWN
 C+FghCkYx6kS9NVquk8Jl4YnLTb8Zg/jH2bTzqNzX9gBwNtPPb9zVmSoK
 442i5xn9ldQFE+RC3pwFESYzT+qz3cpaZdDu+IU88TQCAlUUjGjW0QsE7
 4sL5OB6DIfcYeSB2DUO85T68L1FVmGizojYwVgvRUMm0HKmPZq1+HxtKH
 4C4qpR7ZV+VIRnXYvyA35nXV5pAam1rJA/jpjPtfYKo74hYSwEMAlH8GZ
 7pe2cZfgNr66lM483g7vqhCYoNLfGAuR2NmfhS/sh/MtUqeKIUbNInhDI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343916709"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343916709"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959558013"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959558013"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:56:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 11:55:04 +0200
Message-Id: <20230616095504.17084-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/ttm: Don't shadow the operation context
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

ttm_bo_swapout() shadows the ttm operation context which may cause
major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
memory. Fix this by reusing the operation context argument to
ttm_bo_swapout().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd5dae4d1624..615d30c4262d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1154,7 +1154,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * Move to system cached
 	 */
 	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
-		struct ttm_operation_ctx ctx = { false, false };
 		struct ttm_resource *evict_mem;
 		struct ttm_place hop;
 
@@ -1164,7 +1163,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		if (unlikely(ret))
 			goto out;
 
-		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, &ctx, &hop);
+		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
 		if (unlikely(ret != 0)) {
 			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
 			goto out;
-- 
2.40.1

