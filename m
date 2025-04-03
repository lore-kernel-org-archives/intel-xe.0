Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27D1C3601B
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB1A10E99A;
	Thu,  3 Apr 2025 10:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBGNBvR8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D24110E99F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675904; x=1775211904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aogr4B6tpyJ3PtOmi7p9ptTBsXdBdUXagl1d4SeylCM=;
 b=gBGNBvR8t7VoVfcRawkKuDc+dxRPFjkAICITwRTwf1Hr9vXLcHKTlfh6
 xIK0fhL1PhSvcxYYBxHxBaqSoYM4zOFWK8QwqBNugaHvIrnPFIe/TWgvq
 ikc3ADOh1gH07SJFUC4fkJved9BAl3vHCl9IHkRWl1tBFxtnSF8hV0Iw8
 gMHR207KKdcf4TfjCJT+QYLOTmPFn+1XKojnKQt8k3Z/uNu5QJQkbvV5a
 xx/aMSNjm4V7vheingp1HFCs4aEWar6rJkwIk6721UDeNHAOBknKxoC0p
 3Nn1HnWU+dHz4BgFZmfL6G/WgiQEcbinB260rEzGLCyVkNcFmHfgUtL4a A==;
X-CSE-ConnectionGUID: ffZ+bM5sQOKmqBE21UVdvw==
X-CSE-MsgGUID: 8ri0t2ozRN+azPdja8gPfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475469"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:25:02 -0700
X-CSE-ConnectionGUID: pbk1JT+mRNyFDJ50xuquRg==
X-CSE-MsgGUID: IaFA0szxR5C3bvy9OxJwNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132166817"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:25:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 6/7] drm/xe: allow non-contig VRAM kernel BO
Date: Thu,  3 Apr 2025 11:24:47 +0100
Message-ID: <20250403102440.266113-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403102440.266113-9-matthew.auld@intel.com>
References: <20250403102440.266113-9-matthew.auld@intel.com>
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

If the kernel bo doesn't care about vmap(), either directly or
indirectly with save/restore then we don't need to force contig for such
buffers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 29e5849a9ae3..c337790c81ae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -191,11 +191,18 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 
 static bool force_contiguous(u32 bo_flags)
 {
+	if (bo_flags & XE_BO_FLAG_STOLEN)
+		return true; /* users expect this */
+	else if (bo_flags & XE_BO_FLAG_PINNED &&
+		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
+		return true; /* needs vmap */
+
 	/*
 	 * For eviction / restore on suspend / resume objects pinned in VRAM
 	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
 	 */
-	return bo_flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+	return bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS &&
+	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
-- 
2.49.0

