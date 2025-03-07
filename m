Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D72C28B24
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769110E69D;
	Fri,  7 Mar 2025 18:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntDqkjbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B79B10E191
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372176; x=1772908176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mWgXypW0Aq591O7YcZvMueJExbuavounJrjuN+6wYQ=;
 b=ntDqkjbog4JNpHujmzRgJgGrjDGIQw3IZ6wIlKsjYVotfXLps1POSVR6
 Rm9mBPoFH3EaCf+tG5PtvOW5+APp77q83TWReGhMw0cU7jHMsHshJkjmA
 Sk/03ljJqyxzfsJJP2rnkOemXv+bolScC3IS4GGA9UykthTei3VHW1/MU
 jI7DjH4rChjQCWQz0jRw63MM/SDbX7uVajtmBfaD2J9sK2jD2aaqUG/CZ
 m/sQlsrhvFDKX2GqDbEJHosGUNN4qQWCfEJDVidE3GdR0IsHXkoCUz3l8
 0XeMxMhSaCut9X7WYRM+9+hJcOdqHTkdMvEr7bH6plt9dxvQTs3+G8zhv Q==;
X-CSE-ConnectionGUID: jxdbVxKgQs6m48MzpOQIng==
X-CSE-MsgGUID: BkBPEJt2TcGcUjY0TuWr4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639841"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:32 -0800
X-CSE-ConnectionGUID: +3ZobkbJRu6wnrS5T1hkLQ==
X-CSE-MsgGUID: zxrZRKrBRW+mO56WKGOlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 8/8] drm/xe/sriov: support non-contig VRAM provisioning
Date: Fri,  7 Mar 2025 18:29:05 +0000
Message-ID: <20250307182856.304850-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
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

Currently we can run into issues with provisioning VRAM region, due to
requiring contig VRAM BO underneath. We sometimes see that allocation
(multiple GB) can fail even when there is enough free space.  We don't
need CPU access to the buffer in the first place, so can forgo pin_map
and therefore also the contig requirement. Keep the same behavior with
save and restore during suspend/resume (which can now be done with
blitter).  We also need the VRAM to occupy the same pages so we don't
need to re-program the LMTT, so should still remain pinned (also we
don't want something to try evict it). With that covert over to plain
pinned kernel object.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 10be109bf357..2420a548cacc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1444,15 +1444,23 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		return 0;
 
 	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_NEEDS_2M |
-				  XE_BO_FLAG_PINNED);
+	bo = xe_bo_create_locked(xe, tile, NULL,
+				 ALIGN(size, PAGE_SIZE),
+				 ttm_bo_type_kernel,
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 XE_BO_FLAG_NEEDS_2M |
+				 XE_BO_FLAG_PINNED |
+				 XE_BO_FLAG_PINNED_LATE_RESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	err = xe_bo_pin(bo);
+	xe_bo_unlock(bo);
+	if (unlikely(err)) {
+		xe_bo_put(bo);
+		return err;
+	}
+
 	config->lmem_obj = bo;
 
 	if (xe_device_has_lmtt(xe)) {
-- 
2.48.1

