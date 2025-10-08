Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8576CCD187
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B8D10E8A9;
	Wed,  8 Oct 2025 21:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dciz14In";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4AE10E883
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959940; x=1791495940;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zRMWVz1uBzOO+c+7u+c3BPzlOO9bU1forizJQJDqwQA=;
 b=dciz14InFTcTRM28t9aSQdr5/6I0i4Nnmwiosv+PUy8Ayo73Wl2lOQQJ
 6mRwWcsrGoRzGgxSW4LlGEclOPJYFtghI9dm1tplnmYdUg3ryTESb1PZ7
 YNTdsbPjG2JfZMBw4nTH8do5LV0jmt+NrU5EIWh44atMZDx69ROl9Jjo5
 84FcHBLVmiF1oAnePpLSrmVr8RVK5JPnvgpVsIYIt2T9m2nIqrHi7rpqT
 Pxwi3gFqfA3giAIdcXkPFyFH3PrM9i2zeDFS03UJhh9TY24x0TW0WBXVM
 Mw+gwV713yG7fYvxhZq1F9mTTPpadMJGU+CAhRIhIfUuwJnJHmrLs+5iZ w==;
X-CSE-ConnectionGUID: qTM84mYCRTOmhjqF7VVVmg==
X-CSE-MsgGUID: 8uN6OstlQUydUHxi5RtaHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726840"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:38 -0700
X-CSE-ConnectionGUID: WjVqQaMBSuqmnRPLfBhu1A==
X-CSE-MsgGUID: x0Lw/6a/QzmPsJ7o+DzcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635179"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 01/34] drm/xe: Add NULL checks to scratch LRC allocation
Date: Wed,  8 Oct 2025 14:44:59 -0700
Message-Id: <20251008214532.3442967-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

