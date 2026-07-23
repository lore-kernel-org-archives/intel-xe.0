Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F98C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECB110E5C2;
	Thu, 23 Jul 2026 16:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fu0hF2BZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B332010E5C2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823364; x=1816359364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BO15+CYrI7AotF4A07+VemkoCW4L4QDw9so8XUibQtY=;
 b=fu0hF2BZ7bHNDKHDfCZqw4exhSbpZgX/ELkzQIp6A06o9iq0q3aGHFdr
 uOh5uu7LbWIuaDFd6+vTBzyX9vWl+x03+Lrp5iSZOZr7c4ZzF+GaK6SDS
 oau9k0CCBi+1gXkCG6uRSvG51H3jJ6GpQfrdZ093RdF3g2UY1bH6oWbpd
 LErk9b8p4fRLLqBL+UZSnZ/9Y7tpnLHyDqzLcbuSEuboTzq3XfnC5GbHf
 A/UKWfS7vOX/s/qGwbSceqYHmHLhfMbh0vCNrXwgJ4bRvd08CO/mJwtg7
 p0HKeSbocKQ2KmjANvf+ENEW0vsoiw2oA6VmAay96fKgkEm2F8XFPAonQ Q==;
X-CSE-ConnectionGUID: RXXlsneIQoaFUZIu4KzW9A==
X-CSE-MsgGUID: ByDX1wrmRHyOmBrauoRanA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96143906"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96143906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:16:04 -0700
X-CSE-ConnectionGUID: stRGl4TbTqK8uhvO/paHjQ==
X-CSE-MsgGUID: wGHLuLWNQJC5tA+iLlCXDw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.109])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:16:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2] drm/xe/bo: optimise TT population for DONTNEED BOs
Date: Thu, 23 Jul 2026 17:15:43 +0100
Message-ID: <20260723161542.1220276-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

When a VRAM buffer object is marked as DONTNEED, like in Mesa, the
driver skips migrating its contents to system memory and instead purges
the backing store during eviction (via xe_ttm_bo_purge).

However, xe_evict_flags() still returns tt_placement (XE_PL_TT) for VRAM
BOs even if they were marked DONTNEED.  This causes
ttm_bo_handle_move_mem() to always call ttm_bo_populate() to allocate
destination system pages, only for those pages to be immediately freed
right after when xe_bo_move() calls xe_ttm_bo_purge().

Fix this by changing xe_evict_flags() to return sys_placement
(XE_PL_SYSTEM) for DONTNEED BOs.  This causes TTM to skip the population
step while still ensuring that TTM calls xe_bo_move(), so
xe_ttm_bo_purge() still triggers.

v2 (Thomas):
  - Add a comment to highlight why sys_placement over purge_placement.

Assisted-by: Copilot:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..b1fdc802d27b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -341,6 +341,18 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	if (xe_bo_madv_is_dontneed(bo)) {
+		/*
+		 * We can't use purge_placement here, since we need to trigger
+		 * our own purge procedure at the start of xe_bo_move(), which
+		 * would otherwise be skipped. At the same time we don't want
+		 * ttm to then populate the tt with dst pages, before the move
+		 * callback, hence use sys_placement here.
+		 */
+		*placement = sys_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
-- 
2.55.0

