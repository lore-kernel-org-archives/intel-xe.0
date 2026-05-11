Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855C7CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 17:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4648A10E83D;
	Mon, 11 May 2026 17:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEou8706";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F1A10E837
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520537; x=1810056537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nqP+7Z/cuBpyDNTRnirv0O5WTBtWfE04VqH9TGwyI2k=;
 b=fEou8706S3EG/ZnF5udQq1GkIzP/vKw7ACb2X25p371LC2sjG+M3WQa3
 QjHyWstTX7Dj2t7hg4qEqZO4hJKXV24itVzA1I3avqS7/x6BRW+m4QuY2
 avc5gs5ERmIwPd5RCzgc2WNwEZMvxXjTUr0oK1+1788FjQEm/bkbLeUWj
 G7qH74RYUm1IaLNtYiAG3hK3A8zqg0tB5oPL7q+LU1ORs1jofGGTj4Wy7
 MhzaE7di/bnej1xbPA4XM4wtcBJbPCGtbYSXGWpugCsQ9NHc9UuLIWagC
 mjw27Krd4Nb9IcyvRYbKKE8jkWLkN6XXxs4QVQfQFTPpgK920EfQEISuS Q==;
X-CSE-ConnectionGUID: vV8Xth2YTSG3jnkkdqjAGw==
X-CSE-MsgGUID: SWYJM9m/QESu0PIdQMePzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90001356"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90001356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:28:57 -0700
X-CSE-ConnectionGUID: Dn2MLNwVSgCy3tiSSLsZow==
X-CSE-MsgGUID: kzpc6Z1MSWOUfvk6g+cO9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="261256895"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:28:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 1/2] drm/xe/memirq: Update interrupt handler logic
Date: Mon, 11 May 2026 19:28:37 +0200
Message-ID: <20260511172838.2299-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511172838.2299-1-michal.wajdeczko@intel.com>
References: <20260511172838.2299-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

To workaround some corner case hardware limitations, new programming
note for the memory based interrupt handler suggests to assume that
some status bytes, like GT_MI_USER_INTERRUPT and GUC_INTR_GUC2HOST,
are always set. Update our interrupt handler to follow the new rules.

Bspec: 53672
Fixes: a6581ebe7685 ("drm/xe/vf: Introduce Memory Based Interrupts Handler")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 811e07136efb..579af47edc61 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -427,13 +427,25 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
 	return __memirq_received(memirq, vector, offset, name, true);
 }
 
+static void memirq_assume_received(struct xe_memirq *memirq, const char *source,
+				   u16 offset, const char *status)
+{
+	memirq_debug(memirq, "ASSUME %s %s(%u)\n", source, status, offset);
+}
+
 static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
 				   struct xe_hw_engine *hwe)
 {
 	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
 
-	if (memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
-		xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
+	/*
+	 * The programming note says to assume that GT_MI_USER_INTERRUPT is always
+	 * set. Check and clear related status byte just for a debug.
+	 */
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ) &&
+	    !memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
+		memirq_assume_received(memirq, hwe->name, ilog2(GT_MI_USER_INTERRUPT), "USER");
+	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
 }
 
 static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *status,
@@ -443,8 +455,14 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
 
 	memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, status->vaddr);
 
-	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
-		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
+	/*
+	 * The programming note says to assume that GUC_INTR_GUC2HOST is always
+	 * set. Check and clear related status byte just for a debug.
+	 */
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ) &&
+	    !memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
+		memirq_assume_received(memirq, name, ilog2(GUC_INTR_GUC2HOST), "GUC2HOST");
+	xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
 
 	/*
 	 * This is a software interrupt that must be cleared after it's consumed
-- 
2.47.1

