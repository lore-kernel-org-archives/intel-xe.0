Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DCC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A410E772;
	Wed, 26 Mar 2025 18:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZcmNCcK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73610E770
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013182; x=1774549182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mWgXypW0Aq591O7YcZvMueJExbuavounJrjuN+6wYQ=;
 b=FZcmNCcK9nEjEOo/TnLpO0ehFRkKrkLHMNMKmGzIKRSqVqm+/r+ti57p
 agqz0YcRqK42/IBimsCT5ekYTHxJWp4mgXiiuymBSZd47Rljm1mjNOapI
 bxy1Ezw9ub7gEjc8ZgXwGro91ST4nJ86Y4YMJN3uX3eDhyRCBRxKaONrz
 nvdKxreC6VKei4sGz+HYm9EZuvFjAPGhYwO1CH+usJ1A7bs+5n06Im3KM
 fNdtWH8uxtI0yqFML3cNv4Xl3qT31yVsPEbYDmar1DkkVYSldxent4vcv
 Ns2L634xLT1Y33a3yG5BmZbFccv8kqrGOTxj9DTcHCzh4OiS2C9w99kL5 A==;
X-CSE-ConnectionGUID: kFCbMm/BRnGSR3AHsW6sUA==
X-CSE-MsgGUID: yCz2Jwf/TYKCEES8+MoZNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213602"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44213602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:42 -0700
X-CSE-ConnectionGUID: nax05t8OQdCAu0ZTUK3yUQ==
X-CSE-MsgGUID: w3itgiWvTqiFzajM/OvGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125383349"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 7/7] drm/xe/sriov: support non-contig VRAM provisioning
Date: Wed, 26 Mar 2025 18:19:16 +0000
Message-ID: <20250326181908.124082-16-matthew.auld@intel.com>
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

