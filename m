Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8324ED26D66
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474B310E8E4;
	Fri,  9 Jan 2026 15:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIUJbKq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9810E8E1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767971560; x=1799507560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6lF5tMNcFqhi5ynzjOP9bBWTYlwMMIDpUNA3X4gDN0=;
 b=YIUJbKq56v3jS4KGxlnBbUIlMpxfvZ6S2Sw4DsJnD3G86iohF6PAxoEW
 VILu/2X4qt34ltev4ZGAIKvXhN7GID+nAA8uhG2IKo8e1ntUeI3yjAMes
 xCMNWe+mx/eBCrlqIcLq4epj/ndatfQUQaOxcbwGrja78D4WI9Iqlntd5
 WAMc7VdpuKVC0oZpfx9ktuOqJ2poeFzEpRxuzJvSvHVZS1oeal5RIPq3d
 eNRZkX6cqHpCEuU6OhMMABV053l2uXM5ZlKde88cNGfXQq07+Otj6R8BA
 U+3G+t0BwFOBaZ7uBohzqPXaUpp9M76vyTmlHxm9CiTEuqIJcpLiOgiRI Q==;
X-CSE-ConnectionGUID: Eqo8Y4P3Q5upO3L7Q4pu5g==
X-CSE-MsgGUID: ThqVkTjlTtapFVporDCA6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79990720"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="79990720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:40 -0800
X-CSE-ConnectionGUID: RZEeN3c0TEiaviNmytdC/A==
X-CSE-MsgGUID: tOcbgx5+SAOcpJI50GpZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234687657"
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 4/5] drm/xe/mert: Use local mert variable to simplify the code
Date: Fri,  9 Jan 2026 16:12:18 +0100
Message-ID: <20260109151219.26206-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109151219.26206-1-michal.wajdeczko@intel.com>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
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

There is no need to always refer to MERT data using tile pointer.
Use of local mert pointer will simplify the code and make it look
like other existing MERT function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_mert.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index 5aea6f082bc0..d139663c45ce 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -53,6 +53,7 @@ int xe_mert_invalidate_lmtt(struct xe_device *xe)
 void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_mert *mert = &tile->mert;
 	unsigned long flags;
 	u32 reg_val;
 	u8 err;
@@ -70,13 +71,13 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
 	else if (err)
 		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
 
-	spin_lock_irqsave(&tile->mert.lock, flags);
-	if (tile->mert.tlb_inv_triggered) {
+	spin_lock_irqsave(&mert->lock, flags);
+	if (mert->tlb_inv_triggered) {
 		reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
 		if (!(reg_val & MERT_TLB_INV_DESC_A_VALID)) {
-			tile->mert.tlb_inv_triggered = false;
-			complete_all(&tile->mert.tlb_inv_done);
+			mert->tlb_inv_triggered = false;
+			complete_all(&mert->tlb_inv_done);
 		}
 	}
-	spin_unlock_irqrestore(&tile->mert.lock, flags);
+	spin_unlock_irqrestore(&mert->lock, flags);
 }
-- 
2.47.1

