Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E03CCA472
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E85D10E344;
	Mon,  6 Oct 2025 10:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpOH9Sg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4210E313
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747491; x=1791283491;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zv6oftyTFvVpgHG1ZFb7gOYW44kAAOO+zXJNa9cDaqU=;
 b=FpOH9Sg7/4qoulB/Lfu2KSR+1sjDzD9kRbMCfjMCzZrSU7Wdp4s09xSl
 /A26wgDHH560GxxFm1OEbFftSnLoipr1O/tHbCFTDYAznUk4CMQ3Gatfu
 Jnc+yx/2jroKFrv3L4O/3kWbJI2J4UE27RZCRdOQtgK01Dyj4qE5bXPyx
 EIX0zzkvC6tdsXIZU744xyPwlXbRsURptzTM73GkecdKWoYg0MX21W5YF
 I2q9Gw5MOTrgbSzKAX+Gwp5E/BV+HawJ0fHMGq3chGTTtT9Us5Y7HBBj3
 CetDNF8+yK2m64BMV7v03YO+xP3ijz5KXxEh5+HSHs92DvhNU2R6/X4eA w==;
X-CSE-ConnectionGUID: qYiby4NbRaS7MC7aXexcRg==
X-CSE-MsgGUID: g3QpZegdRqyQB2+gicnlmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546313"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:50 -0700
X-CSE-ConnectionGUID: V2hXmWssSP2m9S762U5LTQ==
X-CSE-MsgGUID: QGEnIzzXRV2MjwwbR5TihQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589305"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 01/30] drm/xe: Add NULL checks to scratch LRC allocation
Date: Mon,  6 Oct 2025 03:44:16 -0700
Message-Id: <20251006104445.2210624-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 47e9df775072..9feca10837b0 100644
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

