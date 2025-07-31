Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B8EC87FD2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A733D10E749;
	Thu, 31 Jul 2025 09:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcFx16LG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9310E744
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753954704; x=1785490704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1wtfPfWtCCd0g3G2ZdFYI0RkigPDS3V6NMhX8A9mEz8=;
 b=EcFx16LGDIVgwBQwmNwh/IfOOC814ZN0QiHrAK+dQdLTOB5+906mDEaY
 5AKhlR7J6JIR6R64Mgf1KJ3v+kooyXkmLl58rHrCcDvz37bh9dhgog+oO
 NoN55mT1E0UwiOuLPUaT3BgfPaF6mW9WzpnXOq2rCmNq/gaufuI5cPWHc
 J5MJ0D+wDvpWykbZXQUEr1dNpG0Wn+VtyvwCkAYSr9UOx5pgK1p+riG/L
 bu1gzQwIMho81sYyq39cxM58liFNLO11pNvDi7qoMhilaY+CkVeANSdXr
 Bg3rNDlTpZuJeSaDyT9fOXChe+3RI9M4VPCxIMcoLCGuR+6l5xVE5aD9L Q==;
X-CSE-ConnectionGUID: tNyDfbIWR1i1BrbMGyeFhA==
X-CSE-MsgGUID: fN9QVF8TTGyDEVqFCedX0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="43877061"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="43877061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:21 -0700
X-CSE-ConnectionGUID: KZG8XU75S7uzvdAOWPUJUA==
X-CSE-MsgGUID: XWK+iw7LSMOBomTp35xX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="194056860"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2 3/3] drm/xe/migrate: prevent potential UAF
Date: Thu, 31 Jul 2025 10:38:11 +0100
Message-ID: <20250731093807.207572-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731093807.207572-5-matthew.auld@intel.com>
References: <20250731093807.207572-5-matthew.auld@intel.com>
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

If we hit the error path, the previous fence (if there is one) has
already been put() prior to this, so doing a fence_wait could lead to
UAF. Tweak the flow to do to the put() until after we do the wait.

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 30f40e1201c4..084157e1a9e3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2063,9 +2063,6 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			current_bytes = min_t(int, current_bytes, S16_MAX * pitch);
 		}
 
-		if (fence)
-			dma_fence_put(fence);
-
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
 					  dma_addr + current_page,
@@ -2073,11 +2070,15 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 					  XE_MIGRATE_COPY_TO_VRAM :
 					  XE_MIGRATE_COPY_TO_SRAM);
 		if (IS_ERR(__fence)) {
-			if (fence)
+			if (fence) {
 				dma_fence_wait(fence, false);
+				dma_fence_put(fence);
+			}
 			fence = __fence;
 			goto out_err;
 		}
+
+		dma_fence_put(fence);
 		fence = __fence;
 
 		buf += current_bytes;
-- 
2.50.1

