Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C0BCD98D3
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2ED10EC0A;
	Wed, 10 Jun 2026 21:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kj5XNA9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF47410EBFA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126920; x=1812662920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibAJdHJCcH0uB1baux9T3sUT1l7Q0SVryz3Dia9tiO8=;
 b=kj5XNA9bxNRnVf4IDWt8vZ9LxD2DeFVCC6n08fE4oRRq0AdyxN2xK4vL
 gam234hBGhDvHhEYpICSX41toVp6TP/t39jsrCUj6Ecc7oxJ7ULeH1RDj
 B49tX6WUTa+hpQvVfbz+2CdBPZhDqoAsk0xM1iaW7nv0qzDFlIGuRoybn
 PrZqK/lwbqz9ffQslIW69+NxmfZrWLsylLNmyeU8iZ5NMazqWxU27Hxp0
 GYBIpL5yxkwJ8dHQIsM6cCJ+hhXzDhByrWHdG4TPfPvlDHroab1kwTDkr
 R8sxmzGIGdaFXVRtMuvMY+lOHI+04poaPj0JisgMpb9gpOQKSdfVnFDYm g==;
X-CSE-ConnectionGUID: rDroshKqRYCcp78bBJ/cpw==
X-CSE-MsgGUID: +i/4y+hsSJmok2qkWMjaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934685"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934685"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:39 -0700
X-CSE-ConnectionGUID: oprywK15Q5mFzjxZNMo2UA==
X-CSE-MsgGUID: JxQwHaJKTtCQ6jT7rJRzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292063"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/11] drm/xe: Remove memirq status and source checks for
 engine interrupts
Date: Wed, 10 Jun 2026 21:28:38 +0000
Message-ID: <20260610212833.153366-19-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

For engine-specific, memory-based interrupts, hardware will not fill in
the source and status offsets, assuming that software will utilize the
vector ID to determine the destination for a particular interrupt.

GuC and VF based interrupts are still handled the same - explicitly
checking these offsets.

Bspec: 62316
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_memirq.c | 36 ++++++++++------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..96ab2c59c5d7 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -447,21 +447,6 @@ static void memirq_assume_received(struct xe_memirq *memirq, const char *source,
 	memirq_debug(memirq, "ASSUME %s %s(%u)\n", source, status, offset);
 }
 
-static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
-				   struct xe_hw_engine *hwe)
-{
-	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
-
-	/*
-	 * The programming note says to assume that GT_MI_USER_INTERRUPT is always
-	 * set. Check and clear related status byte just for a debug.
-	 */
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ) &&
-	    !memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
-		memirq_assume_received(memirq, hwe->name, ilog2(GT_MI_USER_INTERRUPT), "USER");
-	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
-}
-
 static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *status,
 				struct xe_guc *guc)
 {
@@ -499,17 +484,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
  */
 void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
-	struct iosys_map source =
-		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-				      XE_MEMIRQ_SOURCE_OFFSET(hwe->irq_page));
-
-	if (memirq_received(memirq, &source, hwe->irq_offset, "SRC")) {
-		struct iosys_map status =
-			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-					      XE_MEMIRQ_VECTOR_OFFSET(hwe->irq_page,
-								      hwe->irq_offset));
-		memirq_dispatch_engine(memirq, &status, hwe);
-	}
+	memirq_debug(memirq, "dispatching engine %s\n", hwe->name);
+
+	/*
+	 * On MSI-X platforms hardware does not fill in the source and status
+	 * fields for engine-based interrupts (only GuC and VF interrupts have
+	 * a valid source/status). The dma-fence check for the fence completion
+	 * is opportunistic, unconditionally pass MI_USER_INTERRUPT to issue
+	 * that check.
+	 */
+	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
 }
 
 /**
-- 
2.43.0

