Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A08C531CA
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 13:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FACC10E586;
	Thu, 23 Jul 2026 13:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrQViV+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61B110E586
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784813713; x=1816349713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MMs6aT2rYScWXOCNnVRxuzRAR5Oo0akRQoMpZfYOnTc=;
 b=LrQViV+zeSThIzWNhhy/HTfaO62OATt6mlJRD9EBC9AzJU2c9k1GAadF
 1G9yknUp0xbcJln6/gM+r6c63Nka0on+yMrKMJorIGFme0FfR7vBi40xn
 4xfj8Ib37bhNFyuZHoyYzr+9VGUDKp58cU0tQv5s8Y9q7HzM1fe7m4KNj
 WL+hXpggMFJy/itQ2d8ziLXIoa64ojr3+Wg4Hhv5kA9cwYPpVsXVjs7DT
 J52VRo+AwiH3QK6kwAYUoco3aNpTig5e0z+0zPzSfXnc/oQpYGM33MFPx
 4eaqYIvWU8sQHwHIX1okKthhzIY3t/AyBPPxFsiStIZTj7h7UNfBBk/LE g==;
X-CSE-ConnectionGUID: 7zQ4TRm2Qc63mO36mF8+hA==
X-CSE-MsgGUID: 7v21Md5ASAal2Ld2t1W5Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85318803"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85318803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:35:12 -0700
X-CSE-ConnectionGUID: qulu8zs+QfiCD/ZMTdF3Bw==
X-CSE-MsgGUID: tFV9mzXiS3en16RSkbz3pg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.109])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:35:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/bo: optimise TT population for DONTNEED BOs
Date: Thu, 23 Jul 2026 14:34:19 +0100
Message-ID: <20260723133418.1201717-2-matthew.auld@intel.com>
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
ttm_bo_handle_move_mem() to call always call ttm_bo_populate() to
allocate destination system pages, only for those pages to be
immediately freed right after when xe_bo_move() calls xe_ttm_bo_purge().

Fix this by changing xe_evict_flags() to return sys_placement
(XE_PL_SYSTEM) for DONTNEED BOs.  This causes TTM to skip the population
step while still ensuring that TTM calls xe_bo_move(), so
xe_ttm_bo_purge() still triggers.

Assisted-by: Copilot:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..1daa80079608 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -341,6 +341,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	if (xe_bo_madv_is_dontneed(bo)) {
+		*placement = sys_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
-- 
2.55.0

