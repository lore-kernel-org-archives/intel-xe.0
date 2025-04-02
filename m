Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486A4C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 09:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E68D10E728;
	Wed,  2 Apr 2025 09:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jU+8vw/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D8110E72E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743586187; x=1775122187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HfUjn566KcCqNeeSGmDZXvxXlNpmAHWn/lun72k5N0=;
 b=jU+8vw/cDc66hdP+u7yb/wweY4vf8cwAd1wH7n9GIG5VAcBGJMOBcR7x
 +uuJqwWW0Hje40qaKAKulY5Acv95jioG8eJnjF5VDZuJnvQDj6WCIDkBL
 PyfRAJuj5LfJ4W0/fMGoVkIEEth+HOP8L08Avxah2EroRLdtgGYfudUuC
 OPYWbqnDaaP6mWMqzb80jUQnrMyT1BOqkx8Bn6pISck0ekADYlRAbcTxM
 FMKnam3gkTi+GvW6agTveEE7RqsbP9BiEk//uz1mCUmGUgOhPRRX8vodn
 G2rnrPkKxrL9UgFP07/SozRsWMV8PeJVTKEwIOy8xjBSouAbWJaJMspCc A==;
X-CSE-ConnectionGUID: dIXImR93RPWIjtndPtE/cw==
X-CSE-MsgGUID: gRBFVqRMQu2TwhpCsXezPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44824872"
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; d="scan'208";a="44824872"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:29:47 -0700
X-CSE-ConnectionGUID: Uv+eEF+DTIe1U19huqWdbw==
X-CSE-MsgGUID: h5k/jHH/QFKiyoAztYCADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; d="scan'208";a="126538412"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.252])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:29:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 7/7] drm/xe/sriov: support non-contig VRAM provisioning
Date: Wed,  2 Apr 2025 10:29:29 +0100
Message-ID: <20250402092921.79918-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402092921.79918-9-matthew.auld@intel.com>
References: <20250402092921.79918-9-matthew.auld@intel.com>
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
2.49.0

