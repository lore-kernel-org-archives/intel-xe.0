Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEAACCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3447610E674;
	Tue,  7 Oct 2025 11:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBwKZ8Zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DC810E622
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836407; x=1791372407;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zRMWVz1uBzOO+c+7u+c3BPzlOO9bU1forizJQJDqwQA=;
 b=eBwKZ8ZmLoFrAoLmK1FOmv+2aJSBCwzTNFriR/wY+vb4mRsvfwGkD1la
 JnHJOTn0aWSA7n2tJJM+NAq6kgx2an2RAYdgY2uvBQl+60WBZvGA/SVdd
 1iBHMLiUvlJ0kafw6/ma8xzMUke4Gi62DJc9l81NTzjtq5g2grYJRKjSb
 wsDT7RICtwAQKP1aybP54hHFWxUYQLYBJoVq4mFpiNCXqYpwSsZlYYrhp
 osBy7diFXGRl8pYB8uQPYvUZUw8r8dIOYfbP5OT9Ce385Ib6B+4C1KIfU
 9cU83goTcx219bUofY2ExSDh2MfJdbDcJsyWGk+2nE9k4JOBFC6bOTkIZ Q==;
X-CSE-ConnectionGUID: EymDF2KFStuC4YM6vf3tOw==
X-CSE-MsgGUID: NLLuZs6iT0emIWDCCCHtqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660670"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660670"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:46 -0700
X-CSE-ConnectionGUID: B3D7gYakTOWQIp5/XIjHRQ==
X-CSE-MsgGUID: EqrNygu9TH2lR65K9QPzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180923985"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 01/32] drm/xe: Add NULL checks to scratch LRC allocation
Date: Tue,  7 Oct 2025 04:26:10 -0700
Message-Id: <20251007112641.2669655-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

kmalloc can fail, the returned value must have a NULL check. This should
be immediately after kmalloc for clarity.

v5:
 - Assert state->buffer in setup_bo if buffer is iomem (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index af09f70f6e78..2c6eae2de1f2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1214,8 +1214,7 @@ static int setup_bo(struct bo_setup_state *state)
 	ssize_t remain;
 
 	if (state->lrc->bo->vmap.is_iomem) {
-		if (!state->buffer)
-			return -ENOMEM;
+		xe_gt_assert(state->hwe->gt, state->buffer);
 		state->ptr = state->buffer;
 	} else {
 		state->ptr = state->lrc->bo->vmap.vaddr + state->offset;
@@ -1303,8 +1302,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	u32 *buf = NULL;
 	int ret;
 
-	if (lrc->bo->vmap.is_iomem)
+	if (lrc->bo->vmap.is_iomem) {
 		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
 
 	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
 
@@ -1347,8 +1349,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
 		return 0;
 
-	if (lrc->bo->vmap.is_iomem)
+	if (lrc->bo->vmap.is_iomem) {
 		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
+		if (!state.buffer)
+			return -ENOMEM;
+	}
 
 	ret = setup_bo(&state);
 	if (ret) {
-- 
2.34.1

