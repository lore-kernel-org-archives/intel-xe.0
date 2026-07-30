Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055C6C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 23:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85EB10F0EE;
	Thu, 30 Jul 2026 23:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVcBCt1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91BA10F0EE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 23:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785454038; x=1816990038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjERshVdkMvpiAqkIGXEwZt2SVNvPHNGVRHuRD1m8iQ=;
 b=QVcBCt1z7wGrdU8Qpi3azAO0FZ+5Tr3ifhEkYkLooY9Udp29RgqLiCbg
 H/dM2DKKTewZI71SF12nJyzWCo28HSrYxtGkVZByzlYcl1HMfsGqW81sv
 fKDtQe6Lz4ks4iYIkrwg1OtxKvKjaaV+dT8UGl2KYWYfKU+sydHORDtkM
 NWdN2hZbmqQ7ybrIRpHnHAaXn3Wa2YDoUDzaSyFmG1Y/1sNpoNsWrmiTp
 BnAFZniwJyF1JGqGGsj0BBknT7IhgviMxFN/rNtiSrzyopmzFDcIDb9lu
 wTnm88DWLIrrCZjfO7gjUCFDX9r/oDyjs5gedLGg1KQrpAo7p/tSrs4/9 Q==;
X-CSE-ConnectionGUID: /FkZ1hUVTNezUKsslf2boA==
X-CSE-MsgGUID: IYRKIe8BS/WFkV1B3TTB0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89895254"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="89895254"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:27:17 -0700
X-CSE-ConnectionGUID: O6H27EKvQ6in5Me3hb4F+g==
X-CSE-MsgGUID: pjYQHPnISFuf25kM5847CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="283764156"
Received: from unknown (HELO DUT6094BMGFRD.fm.intel.com) ([10.80.55.54])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2026 16:27:18 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, gwan-gyeong.mun@intel.com, stable@vger.kernel.org,
 Jia Yao <jia.yao@intel.com>
Subject: [PATCH v5 3/3] drm/xe/guc_ads: use uncached mapping for UM queue BO
Date: Thu, 30 Jul 2026 23:27:12 +0000
Message-ID: <20260730232712.517989-4-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730232712.517989-1-jia.yao@intel.com>
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730232712.517989-1-jia.yao@intel.com>
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

The HW unit that writes fault descriptors into the UM queue ring buffer
may not be coherent with the CPU cache.  If a descriptor write is still
sitting in a GPU L3 cache line when GuC reads the slot, GuC sees the
stale (all-zero) content from DRAM and forwards an invalid descriptor to
the driver (Faulted Address = 0, ASID = 0).

Mark the UM queue BO as uncached (XE_BO_FLAG_NEEDS_UC) so that writes
bypass the cache and are immediately visible to GuC.

Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 57a0614dbf6d..0b4524a1f7b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -464,7 +464,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 			       XE_BO_FLAG_GGTT |
 			       XE_BO_FLAG_GGTT_INVALIDATE |
-			       XE_BO_FLAG_PINNED_NORESTORE;
+			       XE_BO_FLAG_PINNED_NORESTORE |
+			       XE_BO_FLAG_NEEDS_UC;
 
 		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
 		if (IS_ERR(bo))
-- 
2.43.0

