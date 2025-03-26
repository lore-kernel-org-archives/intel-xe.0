Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E9AC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75B910E1AA;
	Wed, 26 Mar 2025 18:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/FnrGXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABB810E770
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013181; x=1774549181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vJksmIaGScCcAG723lqZKU4Ah0x1TuimbGHMQZAppOk=;
 b=I/FnrGXIxbpfA2qdgvusLJyC/oFM5podMz3mhJ9EP38QmS2BCIhW1oKY
 +OWmt7Ny1i0/aha/RElZ1Gijq/AcApBDUHWkhTWlPUwLgXTQcFJTvtV5R
 B7pVvsUknNwP7JlIK1UfD95n62qokv+6ySxohCFDXgYZy6stU4rumRmqa
 QniwWWt/mQwb4JG8TBDqVJ7SopPcwZTmVv2Kd2xzacC+jz/oeSGACV9V1
 nsbUVZnuX+/IdAgch7btmdHxGs+zR7Y5t73L0nrLk/gLedTVY3jgemSfx
 /Ga8eWk7EWLPz4gRGveHfiY9PD4vGlnE8xdWNjf7OLF5g9c0PFhanbrU/ w==;
X-CSE-ConnectionGUID: o7EtTkGBSiq5n0wo6tviKQ==
X-CSE-MsgGUID: DSX3vg1+Qni/tkWF7Xx5AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213597"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44213597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:41 -0700
X-CSE-ConnectionGUID: WicPRDExQYextL5sr+O18w==
X-CSE-MsgGUID: OYQ0LH/bSMGplYt5I5R6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125383344"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 6/7] drm/xe: allow non-contig VRAM kernel BO
Date: Wed, 26 Mar 2025 18:19:15 +0000
Message-ID: <20250326181908.124082-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326181908.124082-9-matthew.auld@intel.com>
References: <20250326181908.124082-9-matthew.auld@intel.com>
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
index 6e69c9bff294..64136068fe6e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -189,11 +189,18 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 
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
2.48.1

