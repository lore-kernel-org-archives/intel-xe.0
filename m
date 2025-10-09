Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AFECCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 23:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE95D10E045;
	Thu,  9 Oct 2025 23:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3uC8AZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674F610E045
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760051139; x=1791587139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BEhoPBnud9Cc5UPci6ds0oTr0EyhbXj1+dSfAh6uH2w=;
 b=g3uC8AZkNAZuSvsDMHZanx5hPamdvuukRktk+03iL9fZC9abqjrwBabK
 pCi623X8BVKeGKqY8IVvXOj6BEbTc8hB2l3dR1mR1mZt965Juxdcq2HHk
 RQvZSTeAGeymUQLaAor0V+ZubuGpzhWPt9draYtIJ7G85XBwpHca50Jc9
 vPX0cXJdl/LzjSZx7FOZir8csZHTkBIkTMjL4uJYmBDF2yxYE4QdPzD3M
 wfKrcsth/tvYZakKBaouwpYNEzTLqlOp8RZcfzDCdwflwe22brrNGqFRl
 kkmUgpDOlVGSWfJwJ/doCnW/3zw7H+ZVUHz3OUi2nHbNb4hTkmYhY7Bmx g==;
X-CSE-ConnectionGUID: zfd4biQdSJebza2yS6KxLQ==
X-CSE-MsgGUID: tGTFIMqzSD+hBbz34CO/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72884930"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="72884930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:05:24 -0700
X-CSE-ConnectionGUID: hYjn0hYrRCSrnR8z40jZ6w==
X-CSE-MsgGUID: dkofE4uPTVKmESvEoAU7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181601125"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2025 16:05:23 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Change return type of detect_bar2_dgfx() from
 s64 to u64
Date: Thu,  9 Oct 2025 23:02:30 +0000
Message-ID: <20251009230239.2830207-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251009230239.2830207-5-shuicheng.lin@intel.com>
References: <20251009230239.2830207-5-shuicheng.lin@intel.com>
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

The function never returns a negative value, and the return value is
assigned to a u64 variable. Use u64 for better type correctness
and clarity.

v2: add assert to catch theoretical negative or zero stolen size. (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 9b00bdc8ef1a..e368b2a36bac 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 	return wopcm_size;
 }
 
-static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
+static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
 	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
@@ -105,6 +105,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 		return 0;
 
 	stolen_size = tile_size - mgr->stolen_base;
+
+	xe_assert(xe, stolen_size > wopcm_size);
 	stolen_size -= wopcm_size;
 
 	/* Verify usage fits in the actual resource available */
-- 
2.49.0

