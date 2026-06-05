Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F22CD6E7E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9845311ABC3;
	Fri,  5 Jun 2026 23:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnMkGCTZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5D11ABBE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701680; x=1812237680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BYh1nHVSTHSUmROD6XAvsC+lE0m/Pjdy1L4emaWBneA=;
 b=cnMkGCTZXuqtzkh9fb/+AtcdI8Yb4as9avF2ufsKr/OassTgaG3nwJmV
 kk68sXQrD3+dBXpdeRK0ZVnX1n7M4DuRndjTeJaxjhvf+HkafB0xAJC38
 MzxAXUw7tInHKA6aqHToo42lnfrdphBRC2x2JzFv0+xJoymiro1AfLk4d
 FuaQqIZFl1YdZe9WEVhLJsev25TpEt4oS4PpSZp5aiHj3j93POKdiOs7m
 xESUYgLI6a1/GduyCk/pkWZahewvl7sjk6QIvxFbqpfG+zBoBRsnSaVNU
 3IuDVrCO5m4ZPd4lBKXDEp/hh4cAJBz9gxsgzVRqnKlClafqf7x24k0XH Q==;
X-CSE-ConnectionGUID: ZGU1uVzeSpq7CshF0JhsXA==
X-CSE-MsgGUID: pT5ost+vRwW/B4B8GJZkpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449682"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
X-CSE-ConnectionGUID: JrjG9NbNQ4mcKh7MgifJbw==
X-CSE-MsgGUID: FnVzGmDnQAKiCYgutgz4ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018302"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:20 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
Date: Fri,  5 Jun 2026 23:21:14 +0000
Message-ID: <20260605232108.674580-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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
 drivers/gpu/drm/xe/xe_memirq.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..208f44436c66 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -447,18 +447,18 @@ static void memirq_assume_received(struct xe_memirq *memirq, const char *source,
 	memirq_debug(memirq, "ASSUME %s %s(%u)\n", source, status, offset);
 }
 
-static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
+static void memirq_dispatch_engine(struct xe_memirq *memirq,
 				   struct xe_hw_engine *hwe)
 {
-	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
+	memirq_debug(memirq, "dispatching engine %s\n", hwe->name);
 
 	/*
-	 * The programming note says to assume that GT_MI_USER_INTERRUPT is always
-	 * set. Check and clear related status byte just for a debug.
+	 * On MSI-X platforms hardware does not fill in the source and status
+	 * fields for engine-based interrupts (only GuC and VF interrupts have
+	 * a valid source/status). The dma-fence check for the fence completion
+	 * is opportunistic, unconditionally pass MI_USER_INTERRUPT to issue
+	 * that check.
 	 */
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ) &&
-	    !memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
-		memirq_assume_received(memirq, hwe->name, ilog2(GT_MI_USER_INTERRUPT), "USER");
 	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
 }
 
@@ -499,17 +499,7 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
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
+	memirq_dispatch_engine(memirq, hwe);
 }
 
 /**
-- 
2.43.0

